<?php

namespace App\Models;

use CodeIgniter\Model;

class Mmasyarakat extends Model
{
    protected $table            = 'masyarakat';
    protected $primaryKey       = 'nik';
    protected $useAutoIncrement = false;
    protected $allowedFields    = ['nik', 'nama_pengadu', 'email', 'password', 'reset_token', 'token_expired', 'alamat', 'tgl_lahir', 'no_telpon', 'jenis_kelamin', 'pekerjaan', 'kampus', 'jurusan', 'instansi', 'jabatan', 'level', 'created_at'];
}
