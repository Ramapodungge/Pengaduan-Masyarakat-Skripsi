<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class DummyPengaduanSeeder extends Seeder
{
    public function run()
    {
        $faker = \Faker\Factory::create('id_ID');

        // ENUM status sesuai database kamu
        $statusEnum = [
            'Diajukan',
            'Terverifikasi',
            'Dialokasi',
            'Dalam Proses',
            'Selesai',
            'Ditolak'
        ];

        // Ambil data masyarakat yg sudah ada
        $masyList = $this->db->table('masyarakat')->select('id_masyarakat')->get()->getResultArray();

        if (empty($masyList)) {
            echo "⚠ Tidak ada data masyarakat di database!";
            return;
        }

        foreach ($masyList as $m) {

            // Status random
            $finalStatus = $statusEnum[array_rand($statusEnum)];

            // Insert ke tabel pengaduan
            $this->db->table('pengaduan')->insert([
                'id_masyarakat' => $m['id_masyarakat'],
                'id_kategori'   => rand(1, 4),
                'id_instansi'   => rand(1, 4),
                'id_tipe'       => rand(1, 3),   // default 3 tipe
                'judul'         => $faker->sentence(4),
                'isi'           => $faker->paragraph(3),
                'foto'          => 'blank.jpg',
                'status'        => $finalStatus,
            ]);

            $idPengaduan = $this->db->insertID();

            // Generate histori status
            $statusProgress = [];

            foreach ($statusEnum as $st) {
                $statusProgress[] = $st;
                if ($st == $finalStatus) break;
            }

            foreach ($statusProgress as $s) {
                $this->db->table('histori_pengaduan')->insert([
                    'id_pengaduan' => $idPengaduan,
                    'status'       => $s,
                    'keterangan'   => 'Progress: ' . $s,
                ]);

                if ($finalStatus == 'Ditolak') break; // Stop jika status final penolakan
            }
        }

        echo "✅ Dummy Pengaduan + Histori berhasil dibuat!";
    }
}
