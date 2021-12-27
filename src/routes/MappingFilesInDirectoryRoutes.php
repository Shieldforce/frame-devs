<?php

namespace Core\routes;

class MappingFilesInDirectoryRoutes
{

    public $directoryFiles = "../../mvc/routes";

    public function verifyIfFileExist($file)
    {
        if(file_exists($file))
        {
            return include_once $file;
        }
        return [];
    }

    public function mapping()
    {
        $directory = dir($this->directoryFiles);
        $arrayRoutes = [];
        while($file = $directory->read())
        {
            if($file!="." && $file!="..")
            {
                $type = explode(".", $file)[0];
                $arrayFile = $this->verifyIfFileExist($this->directoryFiles."/".$file);
                array_push($arrayRoutes, [$type=>$arrayFile]);
            }
        }
        $directory->close();
        return $arrayRoutes;
    }


}