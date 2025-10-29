<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class SeedInstansi extends Seeder
{
    public function run()
    {
        $data = [
            ['nama_instansi' => 'Instansi A'],
            ['nama_instansi' => 'Instansi B'],
            ['nama_instansi' => 'Instansi C'],
            ['nama_instansi' => 'Instansi D'],
            ['nama_instansi' => 'Instansi E'],
        ];

        $this->db->table('instansi')->insertBatch($data);
    }
}
