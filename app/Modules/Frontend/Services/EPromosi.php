<?php

namespace App\Modules\EPromosi\Services;

use DB;
use App\Models\PKategori;
use App\Models\PItem;
use App\Bobb\Helpers\Helper;

class Epromosi
{
    public function getItems($filters = array())
    {
        extract($filters);

        $q = PItem::leftJoin('p_kategori as b', 'p_item.id_kategori', '=', 'b.id_kategori')
            ->leftJoin('p_item_img as c', 'p_item.id_item', '=', 'c.id_item');

        if(isset($kategori) && $kategori)
        {
            $q->where('id_kategori', $kategori);
        }
        $q = $q->whereNull('b.deleted_at')
            ->whereNull('c.deleted_at')
            ->orderBy('p_item.nm_item')
            ->groupBy('p_item.id_item')
            ->get([
                'p_item.*',
                'b.nm_kategori',
                'b.desc_kategori',
                DB::raw('GROUP_CONCAT(c.img_item SEPARATOR ";") as imgs_item')
            ]);

        return $q;
    }
}
