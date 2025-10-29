<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateHistoriPengaduanTable extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id_histori' => [
                'type'           => 'INT',
                'constraint'     => 11,
                'unsigned'       => true,
                'auto_increment' => true,
            ],
            'id_pengaduan' => [
                'type'       => 'INT',
                'constraint' => 11,
            ],
            'status' => [
                'type' => "ENUM('Diajukan','Terverifikasi','Dialokasi','Dalam Proses','Selesai','Ditolak')",
                'null' => true,
            ],
            'keterangan' => [
                'type' => 'TEXT',
                'null' => true,
            ],
            'created_at' => [
                'type' => 'TIMESTAMP',
                'null' => true,
            ],
        ]);

        $this->forge->addKey('id_histori', true);
        $this->forge->createTable('histori_pengaduan', true);
    }

    public function down()
    {
        $this->forge->dropTable('histori_pengaduan', true);
    }
}
