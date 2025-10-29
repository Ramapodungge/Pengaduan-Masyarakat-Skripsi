<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateFeedbackTable extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id_feedback' => [
                'type'           => 'INT',
                'constraint'     => 11,
                'unsigned'       => true,
                'auto_increment' => true,
            ],
            'id_pengaduan' => [
                'type'       => 'INT',
                'constraint' => 11,
            ],
            'feedback' => [
                'type' => 'TEXT',
                'null' => true,
            ],
            'created_at' => [
                'type' => 'TIMESTAMP',
                'null' => true,
            ],
        ]);

        $this->forge->addKey('id_feedback', true);
        $this->forge->createTable('feedback', true);
    }

    public function down()
    {
        $this->forge->dropTable('feedback', true);
    }
}
