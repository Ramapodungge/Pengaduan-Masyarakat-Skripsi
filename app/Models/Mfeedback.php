<?php

namespace App\Models;

use CodeIgniter\Model;

class Mfeedback extends Model
{
    protected $table            = 'feedback';
    protected $primaryKey       = 'id_feedback';
    protected $allowedFields    = ['id_pengaduan', 'feedback', 'created_at'];

    public function getFeedback($id_aduan)
    {
        $builder = $this->db->table('feedback');
        $builder->select('feedback.*, pengaduan.id_pengaduan, pengaduan.tipe_aduan, masyarakat.*');
        $builder->join('pengaduan', 'pengaduan.id_pengaduan = feedback.id_pengaduan');
        $builder->join('masyarakat', 'masyarakat.nik = pengaduan.id_masyarakat');
        $builder->where('feedback.id_pengaduan', $id_aduan);
        $query = $builder->get();
        return $query->getResultArray();
    }
}
