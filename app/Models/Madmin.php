<?php

namespace App\Models;

use CodeIgniter\Model;

class Madmin extends Model
{
    protected $table            = 'admin';
    protected $primaryKey       = 'id_admin';
    protected $allowedFields    = ['id_instansi', 'nama_admin', 'username', 'password', 'level'];

    public function getoperator()
    {
        $builder = $this->db->table('admin');
        $builder->join('instansi', 'instansi.id_instansi = admin.id_instansi');
        $query = $builder->get();
        return $query->getResultArray();
    }
}
