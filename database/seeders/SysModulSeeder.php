<?php

namespace Database\Seeders;

use App\Models\SysModul;
use Illuminate\Database\Seeder;

class SysModulSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $module = [
            [
                'id_modul_group'    => 1,
                'nm_modul'          => 'Menu Group',
                'icon_modul'        => 'bi bi-gear-wide-connected',
                'route_prefix'      => 'sys_menu_group',
                'urutan'            => 1,
                'is_tampil'         => 1,
                'created_by'        => 1
            ],
            [
                'id_modul_group'    => 1,
                'nm_modul'          => 'Module Group',
                'icon_modul'        => 'bi bi-gear-wide-connected',
                'route_prefix'      => 'sys_module_group',
                'urutan'            => 2,
                'is_tampil'         => 1,
                'created_by'        => 1
            ],
            [
                'id_modul_group'    => 1,
                'nm_modul'          => 'Module',
                'icon_modul'        => 'bi bi-gear-wide-connected',
                'route_prefix'      => 'sys_module',
                'urutan'            => 3,
                'is_tampil'         => 1,
                'created_by'        => 1
            ],
            [
                'id_modul_group'    => 2,
                'nm_modul'          => 'System Setting',
                'icon_modul'        => 'bi bi-gear-wide-connected',
                'route_prefix'      => 'sys_setting',
                'urutan'            => 1,
                'is_tampil'         => 1,
                'created_by'        => 1
            ],
            [
                'id_modul_group'    => 3,
                'nm_modul'          => 'Role User',
                'icon_modul'        => 'bi bi-person-bounding-box',
                'route_prefix'      => 'sys_role',
                'urutan'            => 1,
                'is_tampil'         => 1,
                'created_by'        => 1
            ],
            [
                'id_modul_group'    => 3,
                'nm_modul'          => 'App Setting',
                'icon_modul'        => 'bi bi-gear',
                'route_prefix'      => 'app_setting',
                'urutan'            => 1,
                'is_tampil'         => 1,
                'created_by'        => 1
            ],
            [
                'id_modul_group'    => 4,
                'nm_modul'          => 'User',
                'icon_modul'        => 'bi bi-person-badge-fill',
                'route_prefix'      => 'sys_user',
                'urutan'            => 1,
                'is_tampil'         => 1,
                'created_by'        => 1
            ],
        ];

        foreach ($module as $dt)
        {
            SysModul::create($dt);
        }
    }
}
