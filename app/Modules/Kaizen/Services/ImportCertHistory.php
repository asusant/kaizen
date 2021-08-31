<?php

namespace App\Modules\Kaizen\Services;

use Illuminate\Support\Collection;
use App\Modules\Kaizen\Models\CertificationHistory;
use App\Modules\Kaizen\Models\Employee;
use App\Modules\Kaizen\Models\CertificationClass;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\SkipsFailures;
use Maatwebsite\Excel\Concerns\SkipsOnFailure;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Maatwebsite\Excel\Concerns\WithBatchInserts;

class ImportCertHistory implements ToCollection, WithValidation, SkipsOnFailure, WithStartRow, WithBatchInserts, WithChunkReading
{
    use Importable, SkipsFailures;

    protected $map_index = [
        '0' => 'employee_id',
        '1' => 'full_name',
        '2' => 'date_start',
        '3' => 'date_end',
        '4' => 'cert_desc',
        '5' => 'cert_pass',
        '6' => 'final_mark',
        '7' => 'class_id',
        '8' => 'publication_no',
        '9' => 'subgroup_name',
        '10' => 'personel_area'
    ];

    protected $employee_map = [];
    protected $class_map = [];
    protected $ignore_index = [1];

    public function __construct()
    {
        $this->employee_map = Employee::pluck('employee_id', 'nip')->toArray();
        $this->class_map = CertificationClass::pluck('class_id', 'key')->toArray();
    }

    public function batchSize(): int
    {
        return 1000;
    }

    public function chunkSize(): int
    {
        return 1000;
    }

    public function startRow(): int
    {
        return 2;
    }

    public function prepareForValidation($data, $index)
    {
        $data['0'] = @$this->employee_map[$data['0']];
        $data['2'] = \PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($data['2'])->format('Y-m-d');
        $data['3'] = \PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($data['3'])->format('Y-m-d');
        $data['7'] = @$this->class_map[$data['7']];
        return $data;
    }

    public function rules(): array
    {
        $rules = (new CertificationHistory())->validation_data();

        $ret = [];
        foreach ($this->map_index as $key => $col)
        {
            if(in_array($key, $this->ignore_index))
                continue;
            $ret[$key] = $rules[$col];
        }
        # custom
        $ret['0'] = 'required|numeric';
        $ret['7'] = 'required|numeric';

        return $ret;
    }

    public function collection(Collection $rows)
    {
        foreach ($rows as $row)
        {
            $dt = [];
            foreach ($this->map_index as $key => $col)
            {
                if(in_array($key, $this->ignore_index))
                    continue;
                $dt[$col] = $row[$key];
            }

            // check if exists
            $cek = CertificationHistory::where('employee_id', $dt['employee_id'])->where('date_start', $dt['date_start'])->first();

            if($cek)
            {
                CertificationHistory::where('employee_id', $dt['employee_id'])->where('date_start', $dt['date_start'])->update($dt);
            }
            else
            {
                CertificationHistory::create($dt);
            }
        }
    }
}
