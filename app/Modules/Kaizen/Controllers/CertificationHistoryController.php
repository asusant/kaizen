<?php

namespace App\Modules\Kaizen\Controllers;

use App\Bobb\Libs\BApp;
use App\Bobb\Services\BAuth;
use Illuminate\Support\Facades\Auth;
use App\Modules\Kaizen\Services\ImportEmployee;
use App\Modules\Bobb\Controllers\BaseController;
use App\Modules\Kaizen\Models\CertificationHistory;
use App\Modules\Kaizen\Services\ImportCertHistory;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
use Yajra\DataTables\Facades\DataTables;

class CertificationHistoryController extends BaseController
{
    public $title = 'Certification History';
    public $subtitle = 'Manage Certification History of All Employee';
    public $base_route = 'certification_history';
    public $table_columns = [
        // {DB_Column} => {Table_Title}
        'nip'           => 'NIP',
        'full_name'     => 'Full Name',
        'class_desc'    => 'Cert. Class',
        'cert_desc'     => 'Cert. Desc / Name',
        'cert_pass'     => 'Cert. Pass',
        'final_mark'    => 'Final Mark',
        'date_start'    => 'Date Start',
        'date_end'      => 'Date End'
    ];
    public $datatable_columns = [
        // {DB_Column} => {Table_Title}
        'nip'           => 'c.nip',
        'full_name'     => 'c.full_name',
        'class_desc'    => 'b.key',
        'cert_desc'     => 'cert_desc',
        'cert_pass'     => 'cert_pass',
        'final_mark'    => 'final_mark',
        'date_start'    => 'date_start',
        'date_end'      => 'date_end'
    ];

    public $dt_order = ['date_start', 'ASC'];
    public $add_header_right = '';
    public $use_datatable = true;

    public function __construct()
    {
        $this->add_header_right = '<a href="'.route($this->base_route.'.import.create').'" class="btn btn-success" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Import Certification Data"><span class="bi bi-upload"></span></a>';
        parent::__construct();
        $this->model = new CertificationHistory();
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
        $data['datatable_columns'] = $this->datatable_columns;
        return view('Kaizen::cert_history.index', $data);
    }

    public function getData(Request $request)
    {
        $data = (new CertificationHistory)->getData();
        return DataTables::of($data)
            ->addIndexColumn()
            ->rawColumns(['action'])
            ->make(true);
    }

    public function import()
    {
        $data = $this->data;
        $data['subtitle'] = 'Import Certification History Data to '.cache('sys_setting')['sys_name'].' Database';
        return view('Kaizen::cert_history.import', $data);
    }

    public function doImport(Request $req)
    {
        $this->validate($req, [
            'history-file' => 'required|file|mimes:xlsx,xls'
        ]);
        ini_set('memory_limit', -1);
        ini_set('max_execution_time', -1);

        $import = new ImportCertHistory();
        $import->import($req->file('history-file'));
        $errors = [];
        foreach ($import->failures() as $failure)
        {
            $errors[] = 'Employee ID: '.$failure->values()[0].' at row no '.$failure->row().' - '.implode(' | ', $failure->errors());
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
}
