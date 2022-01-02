<?php

namespace Core\connections;

use ManagerUser\connection\SelectDriver;

class DB
{
    public static function driver()
    {
        return SelectDriver::driver();
    }

    public static function createTable($nameTable, ...$columns)
    {
        $class = new static();
        $pdo = $class::driver()->connection();
        $implode = implode(",", $columns[0]);
        $statement =
            "CREATE TABLE {$nameTable}({$implode});";
        return $pdo->exec($statement);
    }
}