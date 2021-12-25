<?php

namespace Core\interfaces\starting\startingRequest;

use Core\interfaces\starting\startingRoutes\InterfaceStartingRoutes;

interface InterfaceStartingRequest
{
    public function starting(InterfaceStartingRoutes $interfaceStartingRoutes);
}