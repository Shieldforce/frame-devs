<?php

namespace Core\security\requests;

use Core\abstracts\security\requests\AbstractTypeSecurity;
use Core\starting\StartingShieldForce;

class AddSlashesPost extends AbstractTypeSecurity
{
    public function execute() : StartingShieldForce
    {
        foreach ($this->startingShieldForce->post as $index => $line)
        {
            $this->startingShieldForce->post[$index] = addslashes($this->startingShieldForce->post[$index]);
        }
        return $this->startingShieldForce;
    }
}