<?php

namespace App\Modules\Kaizen\Services;

use Illuminate\Validation\Rule;
use Illuminate\Support\Collection;
use App\Modules\Kaizen\Models\Employee;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\SkipsFailures;
use Maatwebsite\Excel\Concerns\SkipsOnFailure;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Maatwebsite\Excel\Concerns\WithBatchInserts;

class ImportEmployee implements ToCollection, WithValidation, SkipsOnFailure, WithStartRow, WithBatchInserts, WithChunkReading
{
    use Importable, SkipsFailures;

    protected $map_index = [
        '0' => 'nip',
        '1' => 'full_name',
        '2' => 'gender',
        '3' => 'position_code',
        '4' => 'position_desc',
        '5' => 'date_of_birth',
        '6' => 'status',
        '7' => 'personel_area'
    ];

    public function startRow(): int
    {
        return 2;
    }

    public function batchSize(): int
    {
        return 1000;
    }

    public function chunkSize(): int
    {
        return 1000;
    }

    public function prepareForValidation($data, $index)
    {
        $data['5'] = \PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($data['5'])->format('Y-m-d');
        return $data;
    }

    public function rules(): array
    {
        $rules = (new Employee())->validation_data();

        $ret = [];
        foreach ($this->map_index as $key => $col)
        {
            $ret[$key] = $rules[$col];
        }
        # custom
        $ret['0'] = 'required|numeric';

        return $ret;
    }

    public function collection(Collection $rows)
    {
        foreach ($rows as $row)
        {
            $employee_dt = [];
            foreach ($this->map_index as $key => $col)
            {
                $employee_dt[$col] = $row[$key];
            }

            // check if exists
            $cek = Employee::where('nip', $employee_dt['nip'])->first();

            if($cek)
            {
                Employee::where('nip', $employee_dt['nip'])->update($employee_dt);
            }
            else
            {
                Employee::create($employee_dt);
            }
        }
    }
}
