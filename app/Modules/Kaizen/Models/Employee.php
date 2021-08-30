<?php

namespace App\Modules\Kaizen\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Employee extends Model
{
    use HasFactory;
    use SoftDeletes;
	protected $dates = ['deleted_at'];
	protected $table = 'employee';
	protected $primaryKey = 'employee_id';
    protected $fillable = ['nip', 'full_name', 'gender', 'position_code', 'position_desc', 'date_of_birth', 'status', 'personel_area', 'created_by', 'updated_by', 'deleted_by'];
    protected $casts = [
        'nip' => 'string',
    ];

    public static function validation_data($update_id = "NULL") {
        return [
	        'nip'       => 'required|numeric|unique:employee,nip,'.$update_id.',employee_id,deleted_at,NULL',
	        'full_name' => 'required|string|max:150',
	        'gender'    => 'required|in:Male,Female',
			'position_code' => 'required|string|max:10',
			'position_desc' => 'required|string|max:50',
			'date_of_birth' => 'nullable|date',
			'status'    => 'required|in:Active employee,Inactive employee',
			'personel_area' => 'required|string|max:50',
        ];
    }

    public function getPrimaryKey()
    {
        return $this->primaryKey;
    }

    public function scopeActive($query)
    {
        return $query->where('status', 'Active employee');
    }
}
