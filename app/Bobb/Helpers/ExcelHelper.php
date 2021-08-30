<?php

namespace App\Excel;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;

class ExcelHelper implements ToCollection
{
    public function collection(Collection $rows)
    {
        $data = array();
        foreach ($rows as $row)
        {
            $data[] = [

            ];
        }
    }
}
