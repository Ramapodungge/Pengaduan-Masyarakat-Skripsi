<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateMasyarakatTable extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'nik' => [
                'type'       => 'VARCHAR',
                'constraint' => '17',
            ],
            'nama_pengadu' => [
                'type'       => 'VARCHAR',
                'constraint' => '200',
                'null'       => true,
            ],
            'email' => [
                'type'       => 'VARCHAR',
                'constraint' => '200',
                'null'       => true,
            ],
            'password' => [
                'type'       => 'VARCHAR',
                'constraint' => '255',
                'null'       => true,
            ],
            'alamat' => [
                'type' => 'TEXT',
                'null' => true,
            ],
            'tgl_lahir' => [
                'type' => 'DATE',
                'null' => true,
            ],
            'no_telpon' => [
                'type' => 'VARCHAR',
                'constraint' => '15',
                'null' => true,
            ],
            'jenis_kelamin' => [
                'type' => "ENUM('L','P')",
                'null' => true,
            ],
            'pekerjaan' => [
                'type' => "ENUM('Pelajar/Mahasiswa/Akademisi','Profesional','Wirausaha','Pemerintahan','Petani','Nelayan','Lainnya')",
                'null' => true,
            ],
            'kampus' => [
                'type' => 'VARCHAR',
                'constraint' => '100',
                'null' => true,
            ],
            'jurusan' => [
                'type' => 'VARCHAR',
                'constraint' => '100',
                'null' => true,
            ],
            'instansi' => [
                'type' => 'VARCHAR',
                'constraint' => '100',
                'null' => true,
            ],
            'jabatan' => [
                'type' => 'VARCHAR',
                'constraint' => '100',
                'null' => true,
            ],
            'level' => [
                'type' => "ENUM('warga','tamu')",
                'null' => true,
            ],
            'created_at' => [
                'type' => 'TIMESTAMP',
                'null' => true,
                'default' => null,
            ],
            'updated_at' => [
                'type' => 'TIMESTAMP',
                'null' => true,
                'default' => null,
            ],
        ]);

        $this->forge->addKey('nik', true);
        $this->forge->createTable('masyarakat', true);
    }

    public function down()
    {
        $this->forge->dropTable('masyarakat', true);
    }
}
