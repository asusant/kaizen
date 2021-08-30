<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Models\SysSetting;
use App\Models\AppSetting;
// use App\Models\Sikeu\Unit as UnitSikeu;
use Illuminate\Support\Facades\Auth;
use DB;

class GlobalVariable
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if(!cache('app_setting') || !cache('sys_setting') || !cache('ref_unit_sikeu'))
        {
            $app_setting = AppSetting::pluck('content', 'key')->toArray();
            $sys_setting = SysSetting::pluck('content', 'key')->toArray();
            // $ref_unit_sikeu = UnitSikeu::get([
            //     DB::raw('CONCAT(unit_id, " - ", unit_nama) as unit_nama'),
            //     'unit_id'
            // ])->pluck('unit_nama', 'unit_id')->toArray();
            cache(['app_setting' => $app_setting], now()->addHour());
            cache(['sys_setting' => $sys_setting], now()->addHour());
            // cache(['ref_unit_sikeu' => $ref_unit_sikeu], now()->addHour());
        }

        return $next($request);
    }
}
