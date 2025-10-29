<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class SeedKategori extends Seeder
{
    public function run()
    {
        $data = [
            ['nama_kategori' => 'Layanan Publik'],
            ['nama_kategori' => 'Pelayanan Pemerintah'],
            ['nama_kategori' => 'Infrastruktur dan Fasilitas Umum'],
            ['nama_kategori' => 'Pendidikan'],
            ['nama_kategori' => 'Kesehatan'],
            ['nama_kategori' => 'Keamanan dan Ketertiban'],
        ];

        $this->db->table('kategori_pengaduan')->insertBatch($data);
    }
}
