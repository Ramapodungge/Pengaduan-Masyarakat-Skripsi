<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateDeskripsiKategoriTable extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id_deskripsi' => [
                'type'           => 'INT',
                'constraint'     => 11,
                'unsigned'       => true,
                'auto_increment' => true,
            ],
            'id_kategori' => [
                'type'       => 'INT',
                'constraint' => 11,
            ],
            'isi_deskripsi' => [
                'type' => 'TEXT',
                'null' => true,
            ],
        ]);

        $this->forge->addKey('id_deskripsi', true);
        $this->forge->createTable('deskripsi_kategori', true);
    }

    public function down()
    {
        $this->forge->dropTable('deskripsi_kategori', true);
    }
}
