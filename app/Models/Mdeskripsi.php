<?php

namespace App\Models;

use CodeIgniter\Model;

class Mdeskripsi extends Model
{
    protected $table            = 'deskripsi_kategori';
    protected $primaryKey       = 'id_deskripsi';
    protected $allowedFields    = ['id_kategori', 'isi_deskripsi'];

    public function getkategori()
    {
        $builder = $this->db->table('deskripsi_kategori');
        $builder->join('kategori_pengaduan', 'kategori_pengaduan.id_kategori = deskripsi_kategori.id_kategori');
        $query = $builder->get();
        return $query->getResultArray();
    }
}
