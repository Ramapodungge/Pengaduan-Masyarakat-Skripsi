<?php

namespace App\Models;

use CodeIgniter\Model;

class Mhistori extends Model
{
    protected $table            = 'histori_pengaduan';
    protected $primaryKey       = 'id_histori';
    protected $allowedFields    = ['id_pengaduan', 'status', 'keterangan', 'created_att'];

    public function getHistoris($id_aduan)
    {
        $builder = $this->db->table('histori_pengaduan');
        $builder->select('pengaduan.judul, pengaduan.bukti, pengaduan.id_pengaduan, pengaduan.tipe_aduan, histori_pengaduan.status,  histori_pengaduan.keterangan, histori_pengaduan.created_att, pengaduan.foto, masyarakat.*, instansi.*');
        $builder->join('pengaduan', 'pengaduan.id_pengaduan = histori_pengaduan.id_pengaduan');
        $builder->join('masyarakat', 'masyarakat.nik = pengaduan.id_masyarakat');
        $builder->join('instansi', 'instansi.id_instansi = pengaduan.id_instansi');
        $builder->where('histori_pengaduan.id_pengaduan', $id_aduan);
        $query = $builder->get();
        return $query->getResultArray();
    }
}
