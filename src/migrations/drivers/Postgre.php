<?php

namespace Core\migrations\drivers;

use ManagerUser\connection\SelectDriver;

class Postgre
{
    protected $connection;

    public function __construct(SelectDriver $driver)
    {
        $this->connection = $driver->driver()->connection();
    }
}