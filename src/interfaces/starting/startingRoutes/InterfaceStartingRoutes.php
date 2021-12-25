<?php

namespace Core\interfaces\starting\startingRoutes;

use Core\interfaces\starting\startingShieldForce\InterfaceStartingShieldForce;
use Core\routes\abstracts\AbstractRoute;

interface InterfaceStartingRoutes
{
    public function starting(InterfaceStartingShieldForce $startingShieldForce, AbstractRoute $abstractRoute);
}