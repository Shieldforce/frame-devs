<?php

namespace Core\instancesErrors;

use Core\interfaces\errors\InterfaceInstancesErrors;

class Error implements InterfaceInstancesErrors
{
    public $code;
    public $file;
    public $line;
    public $message;

    public function __construct($message, $code = null, $file = null, $line = null)
    {
        $this->message = $message;
        $this->code = $code;
        $this->file = $file;
        $this->line = $line;
    }

    public function getMessage()
    {
        return $this->message;
    }

    public function getCode()
    {
        return $this->code;
    }

    public function getFile()
    {
        return $this->file;
    }

    public function getLine()
    {
        return $this->line;
    }
}