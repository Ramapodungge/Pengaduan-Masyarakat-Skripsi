<?php

namespace App\Models;

use CodeIgniter\Model;

class Minstansi extends Model
{
    protected $table            = 'instansi';
    protected $primaryKey       = 'id_instansi';
    protected $allowedFields    = ['nama_instansi'];
}
