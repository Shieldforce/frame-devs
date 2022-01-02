<?php

namespace Core\migrations;

use ManagerUser\connection\SelectDriver;

class Run
{

    protected $directoryFiles;

    public function __construct()
    {
        $this->directoryFiles = "../../managerUser/migrations";
    }

    public static function execute()
    {
        $class = new static();
        $directory = dir($class->directoryFiles);
        $arrayRoutes = [];
        while($file = $directory->read())
        {
            if($file!="." && $file!="..")
            {
                $stringClass = str_replace(".php", "", $file);
                $class = "ManagerUser\\migrations\\".$stringClass;
                $object = new $class(new SelectDriver);
                $object->execute();
            }
        }
        $directory->close();
        return $arrayRoutes;
    }
}