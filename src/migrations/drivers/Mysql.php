<?php

namespace Core\migrations\drivers;

use ManagerUser\connection\SelectDriver;

class Mysql
{
    protected $connection;
    public $arrayColumns;

    public function __construct(SelectDriver $driver)
    {
        $this->connection = $driver->driver()->connection();
        $this->arrayColumns = [];
    }

    public function string($migration, $nameColumn, $amount=191)
    {
        $migration->arrayColumns[] = "{$nameColumn} VARCHAR($amount)";
        return $this;
    }

    public function integer($migration, $nameColumn, $amount=10)
    {
        $migration->arrayColumns[] = "{$nameColumn} VARCHAR($amount)";
        return $this;
    }

    public function nullable($migration)
    {
        $migration->arrayColumns[] .= "gfgfdgdfgdf";
    }
}