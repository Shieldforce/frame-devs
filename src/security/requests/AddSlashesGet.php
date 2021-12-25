<?php

namespace Core\security\requests;

use Core\abstracts\security\requests\AbstractTypeSecurity;
use Core\starting\StartingShieldForce;

class AddSlashesGet extends AbstractTypeSecurity
{
    public function execute() : StartingShieldForce
    {
        foreach ($this->startingShieldForce->get as $index => $line)
        {
            $this->startingShieldForce->get[$index] = addslashes($this->startingShieldForce->get[$index]);
        }
        return $this->startingShieldForce;
    }
}