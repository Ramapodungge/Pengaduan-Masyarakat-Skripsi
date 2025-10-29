<?php

namespace App\Models;

use CodeIgniter\Model;

class Mkategori extends Model
{
    protected $table            = 'kategori_pengaduan';
    protected $primaryKey       = 'id_kategori';
    protected $allowedFields    = ['nama_kategori'];
}
