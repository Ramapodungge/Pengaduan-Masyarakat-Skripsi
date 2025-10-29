<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateAdminTable extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id_admin' => [
                'type'           => 'INT',
                'constraint'     => 11,
                'unsigned'       => true,
                'auto_increment' => true,
            ],
            'id_instansi' => [
                'type'       => 'INT',
                'constraint' => 11,
                'null'       => true, // sesuai permintaan: boleh NULL
            ],
            'nama_admin' => [
                'type'       => 'VARCHAR',
                'constraint' => 100,
            ],
            'username' => [
                'type'       => 'VARCHAR',
                'constraint' => 255,
            ],
            'password' => [
                'type'       => 'VARCHAR',
                'constraint' => 255,
            ],
            'level' => [
                'type' => "ENUM('Admin','Operator')",
                'null' => true,
            ],
            'created_at' => [
                'type' => 'TIMESTAMP',
                'null' => true,
            ],
            'updated_at' => [
                'type' => 'TIMESTAMP',
                'null' => true,
            ],
        ]);

        $this->forge->addKey('id_admin', true);
        $this->forge->createTable('admin', true);
    }

    public function down()
    {
        $this->forge->dropTable('admin', true);
    }
}
