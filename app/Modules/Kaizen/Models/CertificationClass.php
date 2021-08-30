<?php

namespace App\Modules\Kaizen\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class CertificationClass extends Model
{
    use HasFactory;
    use SoftDeletes;
	protected $dates = ['deleted_at'];
	protected $table = 'certification_class';
	protected $primaryKey = 'class_id';
    protected $fillable = ['key', 'desc', 'n_repeat', 'created_by', 'updated_by', 'deleted_by'];

    public static function validation_data($update_id = "NULL") {
        return [
	        'key'       => 'required|string|max:15|unique:certification_class,key,'.$update_id.',class_id,deleted_at,NULL',
	        'desc'      => 'required|string|max:50',
	        'n_repeat'  => 'required|numeric|min:1',
            'order'     => 'required|numeric|unique:certification_class,order,'.$update_id.',class_id,deleted_at,NULL'
        ];
    }

    public function getPrimaryKey()
    {
        return $this->primaryKey;
    }
}
