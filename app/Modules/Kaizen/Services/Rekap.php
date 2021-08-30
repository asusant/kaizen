<?php

namespace App\Modules\Kaizen\Services;

use App\Modules\Kaizen\Models\CertificationClass;
use App\Modules\Kaizen\Models\CertificationHistory;
use App\Modules\Kaizen\Models\Employee;
use DB;

class Rekap
{
    protected $t1 = 'certification_history';
    public function getLvlCount()
    {
        $emp = Employee::all();
        $cls = CertificationClass::groupBy('group')->get();
        $data = [];
        foreach ($cls as $k => $r)
        {
            $data[$r->group] = 0;
        }

        $t1 = $this->t1;
        foreach ($emp as $r)
        {
            # get last
            $last = CertificationHistory::join('certification_class as b', $t1.'.class_id', 'b.class_id')
                ->where($t1.'.employee_id', $r->employee_id)
                ->orderBy('b.order', 'desc')
                ->first();

            if($last)
            {
                if(!isset($data[$last->group]))
                    $data[$last->group] = 0;
                $data[$last->group]++;
            }
        }

        return $data;
    }

    public function getPerYear()
    {
        $t1 = $this->t1;
        return CertificationHistory::join('certification_class as b', $t1.'.class_id', 'b.class_id')
            ->whereRaw('YEAR(date_start) >= '.(date('Y') - 7))
            ->where('key', 'like', 'LEVEL%')
            ->groupBy(DB::raw('YEAR(date_start)'))
            ->get([
                DB::raw('YEAR(date_start) as year'),
                DB::raw('COUNT(cert_id) as num')
            ])->pluck('num', 'year')->toArray();
    }

    public function getPassCount()
    {
        return CertificationHistory::groupBy('cert_pass')
            ->get([
                'cert_pass',
                DB::raw('COUNT(cert_id) as num')
            ])->pluck('num', 'cert_pass')->toArray();
    }
}
