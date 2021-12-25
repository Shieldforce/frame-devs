<?php

namespace Core\interfaces\starting\startingRequest;

use Core\interfaces\starting\startingShieldForce\InterfaceStartingShieldForce;

interface InterfaceStartingRequest
{
    public function starting(InterfaceStartingShieldForce $startingShieldForce);
}