<?php

namespace App\Modules\Kaizen\Controllers;

use App\Modules\Bobb\Controllers\BaseController;
use App\Modules\Kaizen\Models\CertificationHistory;
use Illuminate\Http\Request;

class CertificationController extends BaseController
{
    public $title = 'Certification';
    public $subtitle = 'Certification subtitle';
    public $base_route = 'certification';
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
        return view('Kaizen::cert.index', $data);
    }
}
