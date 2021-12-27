<?php

namespace Core\connections;

use Core\connections\interfaces\InterfaceDriver;

class PDOConnection
{
    public function connection(InterfaceDriver $interfaceDriver)
    {
        return $interfaceDriver->connection();
    }
}