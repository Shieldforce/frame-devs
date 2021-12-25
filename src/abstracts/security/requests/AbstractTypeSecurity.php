<?php

namespace Core\abstracts\security\requests;

use Core\starting\StartingShieldForce;

abstract class AbstractTypeSecurity
{
    protected StartingShieldForce $startingShieldForce;

    public function __construct(StartingShieldForce $startingShieldForce)
    {
        $this->startingShieldForce = $startingShieldForce;
    }

    public function execute() : StartingShieldForce
    {
        // Implements code --------------
        // Implements code --------------
        // Implements code --------------
        // Implements code --------------

        return $this->startingShieldForce;
    }
}