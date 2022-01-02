<?php

namespace Core\security\requests;

use Core\abstracts\security\requests\AbstractTypeSecurity;
use Core\starting\StartingShieldForce;

class AddSlashesServer extends AbstractTypeSecurity
{
    public function execute() : StartingShieldForce
    {
        /*echo "<pre>";
        var_dump($this->startingShieldForce->server);
        echo "<pre>";
        die;*/


        foreach ($this->startingShieldForce->server as $index => $line)
        {
            //$this->startingShieldForce->server[$index] = addslashes($this->startingShieldForce->server[$index]);
            $this->startingShieldForce->server["REQUEST_URI"] = addslashes($this->startingShieldForce->server["REQUEST_URI"]);
        }
        return $this->startingShieldForce;
    }
}