<?php

namespace Core\environments;

class StartingEnvironments
{
    private $path;
    private $file;

    public function __construct()
    {
        $this->path = "../../";
        $this->file = ".env";
    }

    public function starting()
    {
        return $this->readFileEnv();
    }

    private function readFileEnv()
    {
        $file = $this->path.$this->file;
        if(file_exists($file))
        {
            $lines = file($file);
            foreach ($lines as $line)
            {
                if(strpos($line, '=') !== false)
                {
                    putenv($line);
                }
            }
        }
        return true;
    }
}