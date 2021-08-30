<?php

namespace App\Modules\Epromosi\Controllers;

use PDF;
use App\Models\PItem;
use App\Bobb\Libs\BApp;
use App\Models\PKategori;
use Illuminate\Support\Str;
use App\Bobb\Helpers\Helper;
use App\Bobb\Services\BAuth;
use Illuminate\Http\Request;
use App\Bobb\Helpers\Helper as Help;
use App\Http\Controllers\Controller;
use App\Models\PItemImg;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Modules\Epromosi\Services\EPromosi;
use App\Models\PPromo;

class EpromosiController extends Controller
{
    /**
     * Fungsi-fungsi untuk Header Promo
     */

    public function promoIndex()
    {
        $data['data'] = PPromo::all();
        return view('Epromosi::promo.index', $data);
    }

    public function promoCreate()
    {
        $data['data'] = [];
        $data['form_route'] = ['p-promo.store'];
        return view('Epromosi::promo.form', $data);
    }

    public function promoStore(Request $req)
    {
        $this->validate($req, PPromo::validation_data());

        $dt = new PPromo();
		foreach ($dt->validation_data() as $col => $rule)
		{
			$dt->{$col} = $req->input($col);
        }
        $dt->img_promo = (new Helper)->saveFilePondUpload($req->input('img_promo'), 'promo');
		$dt->created_by = Auth::user()->id_user;
        $dt->save();

        BApp::log('Menambah data promo. id='.$dt->id_promo.'.', $dt);
        return redirect()->back()->with('alert', ['success', 'Data berhasil ditambah!']);
    }

    public function promoEdit($id)
    {
        $data['data'] = PPromo::findOrFail($id);
        $data['form_route'] = ['p-promo.update'];
        return view('Epromosi::promo.form', $data);
    }

    public function promoUpdate(Request $req)
    {
        $this->validate($req, PPromo::validation_data($req->input('id_promo')));

        $dt = PPromo::findOrFail($req->input('id_promo'));
        $dt->nm_promo = $req->input('nm_promo');
        $dt->desc_promo = $req->input('desc_promo');
        if($req->has('img_promo'))
        {
            $dt->img_promo = (new Helper)->saveFilePondUpload($req->input('img_promo'), 'promo');
        }
        $dt->updated_by = Auth::user()->id_user;

        BApp::log('Mengubah data Promo. id='.$dt->id_promo.'.', $dt->getOriginal(), $req->except('_token', 'img_promo'));
        $dt->save();

        return redirect()->back()->with('alert', ['success', 'Data berhasil diubah!']);
    }

    public function promoDelete($id)
    {
        $dt = PPromo::findOrFail($id);

        BApp::log('Menghapus data Promo. id='.$id.'.', $dt->getAttributes());
        $dt->deleted_by = Auth::user()->id_user;
        $dt->save();
        $dt->delete();

        return redirect()->back()->with('alert', ['success', 'Data berhasil dihapus!']);
    }

    /**
     * Fungsi-fungsi untuk Kategori
     */

    public function index()
    {
        $data['data'] = PKategori::all();
        return view('Epromosi::kategori.index', $data);
    }

    public function katCreate()
    {
        $data['data'] = [];
        $data['form_route'] = ['p-kategori.store'];
        return view('Epromosi::kategori.form', $data);
    }

    public function katStore(Request $req)
    {
        $this->validate($req, PKategori::validation_data());

        $dt = new PKategori();
		foreach ($dt->validation_data() as $col => $rule)
		{
			$dt->{$col} = $req->input($col);
        }
        $dt->img_kategori = (new Helper)->saveFilePondUpload($req->input('img_kategori'), 'kategori');
		$dt->created_by = Auth::user()->id_user;
        $dt->save();

        BApp::log('Menambah data Kategori. id='.$dt->id_kategori.'.', $dt);
        return redirect()->back()->with('alert', ['success', 'Data berhasil ditambah!']);
    }

    public function katEdit($id)
    {
        $data['data'] = PKategori::findOrFail($id);
        $data['form_route'] = ['p-kategori.update'];
        return view('Epromosi::kategori.form', $data);
    }

    public function katUpdate(Request $req)
    {
        $this->validate($req, PKategori::validation_data($req->input('id_kategori')));

        $dt = PKategori::findOrFail($req->input('id_kategori'));
        $dt->nm_kategori = $req->input('nm_kategori');
        $dt->desc_kategori = $req->input('desc_kategori');
        if($req->has('img_kategori'))
        {
            $dt->img_kategori = (new Helper)->saveFilePondUpload($req->input('img_kategori'), 'kategori');
        }
        $dt->updated_by = Auth::user()->id_user;

        BApp::log('Mengubah data Kategori. id='.$dt->id_kategori.'.', $dt->getOriginal(), $req->except('_token', 'img_kategori'));
        $dt->save();

        return redirect()->back()->with('alert', ['success', 'Data berhasil diubah!']);
    }

    public function katDelete($id)
    {
        $dt = PKategori::findOrFail($id);

        BApp::log('Menghapus data Kategori. id='.$id.'.', $dt->getAttributes());
        $dt->deleted_by = Auth::user()->id_user;
        $dt->save();
        $dt->delete();

        return redirect()->back()->with('alert', ['success', 'Data berhasil dihapus!']);
    }

    /**
     * Fungsi-fungsi untuk Item
     */

    public function itemIndex()
    {
        $data['data'] = (new EPromosi)->getItems();
        return view('Epromosi::item.index', $data);
    }

    public function itemCreate()
    {
        $data['data'] = [];
        $data['form_route'] = ['p-item.store'];
        $data['ref_kat'] = PKategori::get(['id_kategori', 'nm_kategori'])->pluck('nm_kategori', 'id_kategori')->toArray();
        return view('Epromosi::item.form', $data);
    }

    public function itemStore(Request $req)
    {
        $this->validate($req, PItem::validation_data());

        $dt = new PItem();
		foreach ($dt->validation_data() as $col => $rule)
		{
            if (strpos($col, 'img') === false)
			    $dt->{$col} = $req->input($col);
        }
        $dt->harga = (new Help)->fetchNominal($dt->harga);
		$dt->created_by = Auth::user()->id_user;
        $dt->save();

        foreach($req->input('img_item') as $img)
        {
            $im = new PItemImg();
            $im->id_item = $dt->id_item;
            $im->img_item = (new Helper)->saveFilePondUpload($img, 'item');
            $im->created_by = Auth::user()->id_user;
            $im->save();
        }

        BApp::log('Menambah data Item. id='.$dt->id_item.'.', $dt);
        return redirect()->back()->with('alert', ['success', 'Data berhasil ditambah!']);
    }

    public function itemEdit($id)
    {
        $data['data'] = PItem::findOrFail($id);
        $data['form_route'] = ['p-item.update'];
        $data['img_items'] = PItemImg::where('id_item', $id)->get();
        $data['ref_kat'] = PKategori::get(['id_kategori', 'nm_kategori'])->pluck('nm_kategori', 'id_kategori')->toArray();
        return view('Epromosi::item.form', $data);
    }

    public function itemUpdate(Request $req)
    {
        $this->validate($req, PItem::validation_data($req->input('id_item')));

        $dt = PItem::findOrFail($req->input('id_item'));
        foreach ($dt->validation_data() as $col => $rule)
		{
            if (strpos($col, 'img') === false)
			    $dt->{$col} = $req->input($col);
        }
        $dt->harga = (new Help)->fetchNominal($dt->harga);
        $dt->updated_by = Auth::user()->id_user;
        BApp::log('Mengubah data Item. id='.$dt->id_item.'.', $dt->getOriginal(), $req->except('_token', 'img_item', 'img_item.*'));
        $dt->save();

        // proses gambar
        $imgExisting = PItemImg::where('id_item', $dt->id_item)->get(['id_item_img', 'img_item'])->pluck('img_item', 'id_item_img')->toArray();
        $imgStay = [];
        $imgNew = [];
        foreach($req->input('img_item') as $k => $img)
        {
            $imgObj = json_decode($img);
            $ex = 0;
            $exId = 0;
            foreach($imgExisting as $im => $vm)
            {
                if (strpos($vm, $imgObj->name) !== false)
                {
                    $ex = 1;
                    $exId = $im;
                    continue;
                }
            }
            if($ex == 1)
            {
                $imgStay[] = $exId;
            }
            else
            {
                // insert new
                $imgNew[$k]['id_item'] = $dt->id_item;
                $imgNew[$k]['img_item'] = (new Helper)->saveFilePondUpload($img, 'item');
                $imgNew[$k]['created_at'] = date('Y-m-d H:i:s');
                $imgNew[$k]['created_by'] = Auth::user()->id_user;
            }
        }

        // delete 1st
        PItemImg::where('id_item', $dt->id_item)->whereNotIn('id_item_img', $imgStay)->update(['deleted_by' => Auth::user()->id]);
        PItemImg::where('id_item', $dt->id_item)->whereNotIn('id_item_img', $imgStay)->delete();

        // insert then
        PItemImg::insert($imgNew);

        return redirect()->back()->with('alert', ['success', 'Data berhasil diubah!']);
    }

    public function itemDelete($id)
    {
        $dt = PItem::findOrFail($id);

        BApp::log('Menghapus data Kategori. id='.$id.'.', $dt->getAttributes());
        $dt->deleted_by = Auth::user()->id_user;
        $dt->save();
        $dt->delete();

        return redirect()->back()->with('alert', ['success', 'Data berhasil dihapus!']);
    }

    /**
     * Front End
     */

    public function feIndex()
    {
        $data['p_kategori'] = PKategori::all();
        $data['p_item'] = (new EPromosi)->getItems();
        $data['p_promo'] = PPromo::all();
        return view('sample.fe-sample', $data);
    }
}
