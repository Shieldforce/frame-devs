<?php

namespace Core\instancesErrors;

use Core\interfaces\errors\InterfaceInstancesErrors;

class Exception implements InterfaceInstancesErrors
{
    public $code;
    public $file;
    public $line;
    public $message;

    public function __construct($message, $code=null, $file=null, $line=null)
    {
        $this->message = $message;
        $this->code =  $code;
        $this->file =  $file;
        $this->line =  $line;
    }
}