<?php

namespace Core\security\requests;

use Core\abstracts\security\requests\AbstractTypeSecurity;
use Core\starting\StartingShieldForce;

class AddSlashesServer extends AbstractTypeSecurity
{
    public function execute() : StartingShieldForce
    {
        foreach ($this->startingShieldForce->server as $index => $line)
        {
            $this->startingShieldForce->server[$index] = addslashes($this->startingShieldForce->server[$index]);
        }
        return $this->startingShieldForce;
    }
}