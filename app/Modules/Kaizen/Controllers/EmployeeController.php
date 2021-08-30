<?php

namespace App\Modules\Kaizen\Controllers;

use App\Bobb\Libs\BApp;
use App\Bobb\Services\BAuth;
use Illuminate\Support\Facades\Auth;
use App\Modules\Kaizen\Models\Employee;
use App\Modules\Kaizen\Services\ImportEmployee;
use App\Modules\Bobb\Controllers\BaseController;
use App\Modules\Kaizen\Models\CertificationHistory;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

class EmployeeController extends BaseController
{
    public $title = 'Employee';
    public $subtitle = 'Manage Employee Data';
    public $base_route = 'employee';
    public $table_columns = [
        // {DB_Column} => {Table_Title}
        'nip'           => 'NIP',
        'full_name'     => 'Full Name',
        'gender'        => 'Gender',
        'position_code' => 'Position',
        'position_desc' => 'Position Name',
        'status'        => 'Employee Status',
        'personel_area' => 'Personel Area'
    ];
    public $dt_order = ['full_name', 'ASC'];
    public $add_header_right = '';
    public $use_datatable = true;

    public function __construct()
    {
        $this->add_header_right = '<a href="'.route($this->base_route.'.import.create').'" class="btn btn-success" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Import Employee Data"><span class="bi bi-upload"></span></a>';

        parent::__construct();
        $this->model = new Employee;

        $this->form = [
            'nip'  => [
                'NIP',
                [
                    ['Form', 'text'],
                    ['nip', NULL, ['class' => 'form-control', 'id' => 'nip', 'placeholder' => '5030656xxx']]
                ]
            ],
            'full_name' => [
                'Full Name',
                [
                    ['Form', 'text'],
                    ['full_name', NULL, ['class' => 'form-control', 'id' => 'full_name', 'placeholder' => 'John Doe']]
                ]
            ],
            'gender' => [
                'Gender',
                [
                    ['Form', 'select'],
                    ['gender', ['Male' => 'Male', 'Female' => 'Female'], NULL, ['class' => 'form-control', 'id' => 'gender', 'placeholder' => ':: Select Gender ::']]
                ]
            ],
            'position_code' => [
                'Position Code (Jabatan)',
                [
                    ['Form', 'text'],
                    ['position_code', NULL, ['class' => 'form-control', 'id' => 'position_code', 'placeholder' => 'S5 - DM']]
                ]
            ],
            'position_desc' => [
                'Position Desc/Name',
                [
                    ['Form', 'text'],
                    ['position_desc', NULL, ['class' => 'form-control', 'id' => 'position_desc', 'placeholder' => 'ADVISER CREDIT']]
                ]
            ],
            'date_of_birth' => [
                'Date of Birth',
                [
                    ['Form', 'text'],
                    ['date_of_birth', NULL, ['class' => 'form-control', 'id' => 'date_of_birth', 'placeholder' => 'YYYY-MM-DD', 'data-datepicker' => '', 'readonly' => 'true']]
                ]
            ],
            'status' => [
                'Employee Status',
                [
                    ['Form', 'select'],
                    ['status', ['Active employee' => 'Active employee', 'Inactive employee' => 'Inactive employee'], NULL, ['class' => 'form-control', 'id' => 'status', 'placeholder' => ':: Select Employee Status ::']]
                ]
            ],
            'personel_area' => [
                'Personel Area',
                [
                    ['Form', 'text'],
                    ['personel_area', NULL, ['class' => 'form-control', 'id' => 'status', 'placeholder' => 'KANTOR PUSAT']]
                ]
            ],
        ];
    }

    /**
     * Index / tampil data
     */
    public function index(Request $req)
    {
        // default data
        $data = $this->data;
        // tambahan data yang digunakan di view
        $data['table_columns'] = $this->table_columns;
        $data['use_validate'] = $this->use_validate;
        $data['model'] = $this->model;
        // main data
        if(is_array($this->data_method) && sizeof($this->data_method) == 2)
            $data['data'] = call_user_func_array(array($this->model, $this->data_method[0]), $this->data_method[1]);
        else
            $data['data'] = $this->model->orderBy($this->dt_order[0], $this->dt_order[1])->get();
        return view('Kaizen::employee.index', $data);
    }

    public function import()
    {
        $data = $this->data;
        $data['subtitle'] = 'Import Employee Data to '.cache('sys_setting')['sys_name'].' Database';
        return view('Kaizen::employee.import', $data);
    }

    public function doImport(Request $req)
    {
        $this->validate($req, [
            'employee-file' => 'required|file|mimes:xlsx,xls'
        ]);
        $import = new ImportEmployee();
        $import->import($req->file('employee-file'));
        $errors = [];
        foreach ($import->failures() as $failure)
        {
            $errors[] = 'NIP: '.$failure->values()[0].' at column no '.implode(' | ', $failure->errors());
            // $failure->row(); // row that went wrong
            // $failure->attribute(); // either heading key (if using heading row concern) or column index
            // $failure->errors(); // Actual error messages from Laravel validator
            // $failure->values(); // The values of the row that has failed.
        }

        if(sizeof($errors) > 0)
        {
            return redirect()->back()->withErrors($errors);
        }

        return redirect(route($this->base_route.'.read'))->with('alert', ['success', 'Success importing data!']);
    }

    public function certHistory($id)
    {
        // default data
        $data = $this->data;
        $data['title'] = 'Employees Certification History';
        $data['subtitle'] = 'List of All Employees Certification History';
        // tambahan data yang digunakan di view
        $data['table_columns'] = [
            // {DB_Column} => {Table_Title}
            'key'           => 'Cert. Class',
            'cert_desc'     => 'Cert. Desc / Name',
            'cert_pass'     => 'Cert. Pass',
            'final_mark'    => 'Final Mark',
            'date_start'    => 'Date Start',
            'date_end'      => 'Date End'
        ];
        $data['use_validate'] = $this->use_validate;
        $data['model'] = $this->model;
        // main data
        $data['employee'] = Employee::findOrFail($id);
        $data['data'] = CertificationHistory::join('certification_class as b', 'certification_history.class_id', 'b.class_id')
            ->join('employee as c', 'certification_history.employee_id', 'c.employee_id')
            ->where('certification_history.employee_id', $id)
            ->orderBy('date_end', 'desc')
            ->get();
        $data['use_datatable'] = true;
        return view('Kaizen::employee.cert-history', $data);
    }
}
