<?php

namespace ManagerUser\connection;

use Core\connections\drivers\Mysql;
use Core\connections\drivers\Postgre;

class SelectDriver
{
    public static function driver()
    {
        // Select Driver
        switch(envSystem("DB_DRIVER")) {
            case "pgsql":
                return new Postgre();
            default:
                return new Mysql();
        }
    }
}