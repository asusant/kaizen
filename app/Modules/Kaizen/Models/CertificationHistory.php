<?php

namespace App\Modules\Kaizen\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class CertificationHistory extends Model
{
    use HasFactory;
    use SoftDeletes;
	protected $dates = ['deleted_at'];
	protected $table = 'certification_history';
	protected $primaryKey = 'cert_id';
    protected $fillable = ['employee_id', 'class_id', 'date_start', 'date_end', 'cert_desc', 'cert_pass', 'final_mark', 'publication_no', 'subgroup_name', 'personel_area', 'created_by', 'updated_by', 'deleted_by'];

    public static function validation_data($update_id = "NULL") {
        return [
	        'employee_id'   => 'required|numeric|exists:employee,employee_id',
	        'class_id'      => 'required|exists:certification_class,class_id',
	        'date_start'    => 'required|date',
	        'date_end'      => 'required|date',
	        'cert_desc'     => 'required|string|max:100',
	        'cert_pass'     => 'required|string|max:25',
	        'final_mark'    => 'required|int|max:100',
	        'publication_no'=> 'nullable|string|max:25',
	        'subgroup_name' => 'required|string|max:10',
	        'personel_area' => 'required|string|max:25'
        ];
    }

    public function getPrimaryKey()
    {
        return $this->primaryKey;
    }

    public function getData()
    {
        $t = $this->table;
        if(session()->has('filter-certhistory') && sizeof(session('filter-certhistory')) > 0)
        {
            extract(session('filter-certhistory'));
        }

        $q = self::join('certification_class as b', $t.'.class_id', 'b.class_id')
            ->join('employee as c', $t.'.employee_id', 'c.employee_id')
            ->select($t.'.*', 'b.key as class_desc', 'c.nip', 'c.full_name')
            ->whereNull('b.deleted_at')
            ->whereNull('c.deleted_at');

        return $q;
    }
}
