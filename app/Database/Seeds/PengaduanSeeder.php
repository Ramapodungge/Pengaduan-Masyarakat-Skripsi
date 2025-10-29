<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class PengaduanSeeder extends Seeder
{
    public function run()
    {
        $faker = \Faker\Factory::create('id_ID');

        // ENUM status sesuai tabel
        $statusEnum = [
            'Diajukan',
            'Terverifikasi',
            'Dialokasi',
            'Dalam Proses',
            'Selesai',
            'Ditolak'
        ];

        // ENUM tipe_aduan sesuai tabel
        $tipeEnum = [
            'Umum',
            'Anonim',
            'Rahasia'
        ];

        // Ambil seluruh data masyarakat
        $masyList = $this->db->table('masyarakat')->select('nik')->get()->getResultArray();
        $totalMasyarakat = count($masyList);

        if ($totalMasyarakat == 0) {
            echo "❌ Data masyarakat tidak tersedia. Seeder dihentikan!\n";
            return;
        }

        for ($i = 1; $i <= 200; $i++) {

            // random masyarakat & status
            $masy = $masyList[array_rand($masyList)];
            $finalStatus = $statusEnum[array_rand($statusEnum)];
            $tipeAduan = $tipeEnum[array_rand($tipeEnum)];

            // Insert pengaduan
            $this->db->table('pengaduan')->insert([
                'id_masyarakat' => $masy['nik'],
                'id_kategori'   => rand(1, 6),
                'id_instansi'   => rand(1, 6),
                'judul'         => $faker->sentence(4),
                'isi'           => $faker->paragraph(),
                'foto'          => 'blank.jpg',
                'status'        => $finalStatus,
                'tipe_aduan'    => $tipeAduan,
            ]);

            $idPengaduan = $this->db->insertID();

            // histori progres status
            $statusProgress = [];
            foreach ($statusEnum as $st) {
                $statusProgress[] = $st;
                if ($st == $finalStatus || $finalStatus == 'Ditolak') break;
            }

            foreach ($statusProgress as $s) {
                $this->db->table('histori_pengaduan')->insert([
                    'id_pengaduan' => $idPengaduan,
                    'status'       => $s,
                    'keterangan'   => 'Status ' . $s,
                ]);
            }
        }

        echo "✅ 200 Data Pengaduan + Histori berhasil dibuat dengan tipe acak!";
    }
}
