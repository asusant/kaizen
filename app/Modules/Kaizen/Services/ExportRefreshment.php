<?php

namespace App\Modules\Kaizen\Services;

use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;

class ExportRefreshment implements WithMapping, WithHeadings, FromCollection
{
    protected $dt;

    function __construct($dt)
    {
        $this->dt = $dt;
    }

    public function headings(): array
    {
        return [
            'NIP',
            'Full Name',
            'Level / Cert. Class',
            'Position Name',
            'Personel Area',
            'Due Date'
        ];
    }

    public function map($dt): array
    {
        return [
            $dt['employee']->nip,
            $dt['employee']->full_name,
            $dt['last_cert']->group,
            $dt['employee']->position_desc,
            $dt['employee']->personel_area,
            $dt['due_date']
        ];
    }

    public function collection()
    {
        return $this->dt;
    }
}
