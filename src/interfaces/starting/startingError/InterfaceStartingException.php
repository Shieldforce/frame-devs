<?php

namespace Core\interfaces\starting\startingError;

interface InterfaceStartingException
{
    public function __construct($exception);
    public function getThrowable();
    public function setThrowable($throwable);
}