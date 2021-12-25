<?php

namespace ManagerUser\security\requests;

use Core\abstracts\security\requests\AbstractTypeSecurity;
use Core\starting\StartingShieldForce;

class AddSlashesCustom extends AbstractTypeSecurity
{
    public function execute() : StartingShieldForce
    {
        /**
         *  Implements you code
         */

        return $this->startingShieldForce;
    }
}