<?php

namespace App\Modules\Kaizen\Controllers;

use App\Bobb\Libs\BApp;
use App\Bobb\Services\BAuth;
use Illuminate\Support\Facades\Auth;
use App\Modules\Kaizen\Models\CertificationClass;
use App\Modules\Bobb\Controllers\BaseController;

class CertificationClassController extends BaseController
{
    public $title = 'Certification Class';
    public $subtitle = 'Manage Certification Class Data';
    public $base_route = 'certification_class';
    public $table_columns = [
        // {DB_Column} => {Table_Title}
        'key'       => 'Class Key',
        'desc'      => 'Class Description',
        'n_repeat'  => 'Repeat Every (Year)',
        'order'     => 'Class Order'
    ];
    public $dt_order = ['order', 'ASC'];
    public $add_header_right = '';
    public $use_datatable = false;

    public function __construct()
    {
        parent::__construct();
        $this->model = new CertificationClass;

        $this->form = [
            'key'  => [
                'Class Key',
                [
                    ['Form', 'text'],
                    ['key', NULL, ['class' => 'form-control', 'id' => 'key', 'placeholder' => 'LEVEL 2']]
                ]
            ],
            'desc' => [
                'Class Description',
                [
                    ['Form', 'text'],
                    ['desc', NULL, ['class' => 'form-control', 'id' => 'desc', 'placeholder' => 'Initiate Level 2']]
                ]
            ],
            'n_repeat' => [
                'Repeat Every (Year)',
                [
                    ['Form', 'number'],
                    ['n_repeat', NULL, ['class' => 'form-control', 'id' => 'n_repeat', 'placeholder' => '2']]
                ]
            ],
            'order' => [
                'Order',
                [
                    ['Form', 'number'],
                    ['order', NULL, ['class' => 'form-control', 'id' => 'order', 'placeholder' => '2']]
                ]
            ]
        ];
    }
}
