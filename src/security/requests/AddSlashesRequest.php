<?php

namespace Core\security\requests;

use Core\abstracts\security\requests\AbstractTypeSecurity;
use Core\starting\StartingShieldForce;

class AddSlashesRequest extends AbstractTypeSecurity
{
    public function execute() : StartingShieldForce
    {
        foreach ($this->startingShieldForce->request as $index => $line)
        {
            $this->startingShieldForce->request[$index] = addslashes($this->startingShieldForce->request[$index]);
        }
        return $this->startingShieldForce;
    }
}