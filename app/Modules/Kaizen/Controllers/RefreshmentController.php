<?php

namespace App\Modules\Kaizen\Controllers;

use App\Modules\Bobb\Controllers\BaseController;
use App\Modules\Kaizen\Models\CertificationClass;
use App\Modules\Kaizen\Models\CertificationHistory;
use App\Modules\Kaizen\Services\ImportCertHistory;
use App\Modules\Kaizen\Services\Refreshment;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class RefreshmentController extends BaseController
{
    public $title = 'Refreshment';
    public $subtitle = 'Finding Refreshment Data for Employees Certifications';
    public $base_route = 'refreshment';
    public $table_columns = [
        // {DB_Column} => {Table_Title}
    ];
    public $dt_order = ['date_start', 'ASC'];
    public $add_header_right = '';
    public $use_datatable = true;

    public function __construct()
    {
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
        $data['cert_class'] = CertificationClass::groupBy('group')->pluck('group', 'group')->toArray();
        $data['filters'] = [];
        return view('Kaizen::refreshment.index', $data);
    }

    public function findRefreshment(Request $req)
    {
        // dd($req->input());
        $this->validate($req, [
            'year'     => 'required|numeric|min:'.date('Y'),
            'class'    => 'nullable',
            'class.*'  => 'exists:certification_class,group'
        ]);

        // default data
        $data = $this->data;
        // tambahan data yang digunakan di view
        $data['table_columns'] = $this->table_columns;
        $data['use_validate'] = $this->use_validate;
        $data['model'] = $this->model;
        $data['filters'] = $req->only('year', 'class');
        $data['data'] = (new Refreshment)->findRefreshment($data['filters']);
        $data['cert_class'] = CertificationClass::groupBy('group')->pluck('group', 'group')->toArray();
        $data['use_datatable'] = true;
        return view('Kaizen::refreshment.index', $data);
    }
}
