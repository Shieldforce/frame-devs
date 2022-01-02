<?php

namespace ManagerUser\migrations;

use Core\connections\DB;
use ManagerUser\connection\SelectDriver;

class Authors
{
    protected  SelectDriver $db;

    public function __construct(SelectDriver $db)
    {
        $this->db = $db;
    }

    public function execute()
    {
        /*$columns =
            [
                "author_id INT AUTO_INCREMENT",
                "first_name VARCHAR(100) NOT NULL",
                "middle_name VARCHAR(50) NULL",
                "last_name VARCHAR(100) NULL",
                "PRIMARY KEY(author_id)"
            ];*/

        //$this->db->driver()->migrations->string("first_name", 191)->nullable($this);
        //$this->db->driver()->migrations->string($this,"middle_name", 50);


        /*echo "<pre>";
        var_dump($this->db->driver()->migrations->arrayColumns);
        echo "<pre>";
        die;*/
        //DB::createTable("authors", $this->arrayColumns);
    }
}