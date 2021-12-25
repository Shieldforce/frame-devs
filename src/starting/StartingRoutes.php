<?php

namespace Core\starting;

use Core\interfaces\starting\startingRoutes\InterfaceStartingRoutes;
use Core\interfaces\starting\startingShieldForce\InterfaceStartingShieldForce;
use Core\routes\abstracts\AbstractRoute;
use Core\routes\MappingFilesInDirectoryRoutes;
use Core\routes\MappingOfTypeRoute;

class StartingRoutes implements InterfaceStartingRoutes
{
    public function starting(InterfaceStartingShieldForce $startingShieldForce, AbstractRoute $abstractRoute)
    {
        $mappingType = MappingOfTypeRoute::execute($startingShieldForce);
        $methodCurrency = strtolower($mappingType);
        $mappingFile = new MappingFilesInDirectoryRoutes();
        foreach ($mappingFile->mapping() as $index => $types)
        {
            foreach ($types as $indexType => $route)
            {
                foreach ($route as $indexAttribute => $attributes)
                {
                    $method = $attributes["method"];
                    $abstractRoute->setTypeRoute($indexType);
                    $abstractRoute->$method($indexAttribute, $attributes["action"]);
                }
            }
        }
        $abstractRoute->setRouteCurrency($startingShieldForce, $methodCurrency);
        return $this;
    }
}