<?php

namespace Core\interfaces\starting\startingApplication;

use Core\interfaces\starting\startingRequest\InterfaceStartingRequest;
use Core\interfaces\starting\startingRoutes\InterfaceStartingRoutes;
use Core\interfaces\starting\startingShieldForce\InterfaceStartingShieldForce;

interface InterfaceStartingApplication
{
    public static function startingClassesBootable(
        InterfaceStartingShieldForce $shieldForce,
        InterfaceStartingRequest $startingRequest,
        InterfaceStartingRoutes $startingRoutes
    );
}