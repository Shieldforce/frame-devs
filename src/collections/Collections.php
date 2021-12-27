<?php

namespace Core\collections;

class Collections extends AbstractArrayAccess
{
    public $array;
    public $object;

    public function __construct(array $data = [])
    {
        $this->array = $data;
        $this->object = (object)$data;
    }

    public function offsetExists($offset) :bool
    {
        return isset($this->array[$offset]);
    }

    public function offsetGet($offset) : mixed
    {
        return $this->array[$offset] ?? null;
    }

    public function offsetSet($offset, $value) :void
    {
        $this->array[$offset] = $value;
    }

    public function offsetUnset($offset) :void
    {
        unset($this->array[$offset]);
    }
}