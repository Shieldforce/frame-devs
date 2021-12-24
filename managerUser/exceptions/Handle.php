<?php

namespace ManagerUser\exceptions;

use Core\interfaces\errors\InterfaceInstancesErrors;
use Core\interfaces\exceptions\InterfaceExceptionHandle;
use Core\starting\StartingException;

class Handle implements InterfaceExceptionHandle
{
    private $startingException;

    public function __construct(StartingException $startingException)
    {
        $this->startingException  = $startingException;
    }

    public function customException(InterfaceInstancesErrors $instanceErrorClass) : StartingException
    {
        $this->startingException->setThrowable(new $instanceErrorClass(
            $instanceErrorClass->message,
            $instanceErrorClass->code,
            $instanceErrorClass->file,
            $instanceErrorClass->line,
        ));
        return $this->startingException;
    }

}