<?php

namespace App\Modules\Kaizen\Services;

use App\Modules\Kaizen\Models\CertificationHistory;
use App\Modules\Kaizen\Models\Employee;

class Refreshment
{
    public function findRefreshment($filters)
    {
        extract($filters);

        $employee = Employee::active()->get();

        $res = [];
        foreach ($employee as $row)
        {
            $pass = false;
            # get last refreshment
            $q = CertificationHistory::join('certification_class as b', 'certification_history.class_id', 'b.class_id')
                ->where('employee_id', $row->employee_id)
                ->orderBy('date_end', 'desc')
                ->first();

            if($q)
            {
                # thn dia harus mengikuti sertifikasi selanjutnya
                $year_b = date('Y', strtotime($q->date_end.' +'.$q->n_repeat.' year'));
                if($year_b == $year)
                {
                    $pass = true;
                }
                else
                {
                    $pass = false;
                }

                if($pass && isset($months) && is_array($months) && sizeof($months) > 0)
                {
                    if( in_array( date('n', strtotime($q->date_start)), $months) )
                    {
                        $pass = true;
                    }
                    else
                    {
                        $pass = false;
                    }
                }

                if($pass == true && isset($class) && is_array($class) && sizeof($class) > 0)
                {
                    if(in_array($q->group, $class))
                    {
                        $pass = true;
                    }
                    else
                    {
                        $pass = false;
                    }
                }
            }

            if($pass == true)
            {
                // masuk ke certifikasi thn ini
                $res[] = array(
                    'employee'  => $row,
                    'last_cert' => $q,
                    'due_date'  => date('Y-m-d', strtotime($q->date_end.' +'.$q->n_repeat.'year'))
                );
            }
        }

        return $res;
    }
}
