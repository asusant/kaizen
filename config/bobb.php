<?php

return [
    'map_privileges'    => array(
        'read' 		=> ['index','view','read'],
        'create' 	=> ['create','insert','store'],
		'update'	=> ['edit','update'],
		'delete'	=> ['delete','hapus'],
        'validate'	=> ['validate']
    ),
    'ref_bulan'	=> array(
        1=>'Januari',
        2=>'Februari',
        3=>'Maret',
        4=>'April',
        5=>'Mei',
        6=>'Juni',
        7=>'Juli',
        8=>'Agustus',
        9=>'September',
        10=>'Oktober',
        11=>'November',
        12=>'Desember'
    ),
    'ref_bulan_singkat'	=> array(
            1=>'Jan',
            2=>'Feb',
            3=>'Mar',
            4=>'Apr',
            5=>'Mei',
            6=>'Jun',
            7=>'Jul',
            8=>'Ags',
            9=>'Sep',
            10=>'Okt',
            11=>'Nov',
            12=>'Des'
    ),
    'hari'	=> array('Sun'=>'Minggu','Mon'=>'Senin','Tue'=>'Selasa','Wed'=>'Rabu','Thu'=>'Kamis','Fri'=>'Jumat','Sat'=>'Sabtu'),
    'ta'            => 21,
    'tahun'         => 2021,
    'bulan'         => 5,
    'unit'          => 1010,
    'unit_asli'     => 9008,
    'unit_sianggar' => 11001,
    'rev_sianggar'  => 1,
    'sts_valid'     => [
        0   => 'Ajuan',
        1   => 'Valid',
        2   => 'Ditolak'
    ],
    'sts_valid_rpd' => [
        0   => ['secondary', 'Ajuan'],
        1   => ['success', 'Valid'],
        2   => ['danger', 'Ditolak']
    ]
];
