<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class CreatePengaduanTable extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id_pengaduan' => [
                'type'           => 'INT',
                'constraint'     => 11,
                'unsigned'       => true,
                'auto_increment' => true,
            ],
            'id_masyarakat' => [
                'type'       => 'VARCHAR',
                'constraint' => '17',
                'null'       => true,
            ],
            'id_instansi' => [
                'type'       => 'INT',
                'constraint' => 11,
                'null'       => true,
            ],
            'id_kategori' => [
                'type'       => 'INT',
                'constraint' => 11,
                'null'       => true,
            ],
            'judul' => [
                'type'       => 'VARCHAR',
                'constraint' => 100,
            ],
            'isi' => [
                'type' => 'TEXT',
                'null' => true,
            ],
            'foto' => [
                'type' => 'VARCHAR',
                'constraint' => 255,
                'null' => true,
            ],
            'status' => [
                'type' => "ENUM('Diajukan','Terverifikasi','Dialokasi','Dalam Proses','Selesai','Ditolak')",
                'null' => true,
            ],
            'created_at' => [
                'type' => 'TIMESTAMP',
                'null' => true,
                'default' => null
            ],
            'updated_at' => [
                'type' => 'TIMESTAMP',
                'null' => true,
                'default' => null
            ],
            'bukti' => [
                'type' => 'VARCHAR',
                'constraint' => 255,
                'null' => true,
            ],
            'tipe_aduan' => [
                'type' => "ENUM('Umum','Anonim','Rahasia')",
                'null' => true,
            ],
        ]);

        $this->forge->addKey('id_pengaduan', true);
        $this->forge->createTable('pengaduan', true);
    }

    public function down()
    {
        $this->forge->dropTable('pengaduan', true);
    }
}
