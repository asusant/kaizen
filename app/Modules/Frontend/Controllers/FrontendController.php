<?php

namespace App\Modules\Frontend\Controllers;

use App\Bobb\Libs\BApp;
use App\Bobb\Helpers\Helper;
use App\Bobb\Services\BAuth;
use Illuminate\Http\Request;
use App\Bobb\Helpers\Helper as Help;
use App\Http\Controllers\Controller;

class FrontendController extends Controller
{
    /**
     * Front End
     */

    public function feIndex()
    {
        $data = [];
        return view('Frontend::home.index', $data);
    }
}
