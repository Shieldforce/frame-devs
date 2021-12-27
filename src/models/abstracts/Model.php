<?php

namespace Core\models\abstracts;

use Core\collections\Collections;
use Core\connections\DB;

class Model
{
    protected $table;
    protected $driver;

    public function __construct()
    {
        $this->driver = DB::driver();
    }

    public function find($id)
    {
        $class = new static();
        $execute = $class->driver->find($class->table, $id);
        $collection = $execute!=false ? new Collections($execute) : null;
        return $collection;
    }

    public static function create(array $array)
    {
        $class = new static();
        $arrayVerify = $class->columnsVerify($array);
        $execute = $class->driver->insert($class->table, $arrayVerify);
        $collection = $execute!=false ? new Collections($execute) : null;
        return $collection;
    }

    public static function edit(string $id, array $array)
    {
        $class = new static();
        $arrayVerify = $class->columnsVerify($array);
        $execute = $class->driver->edit($class->table, $id, $arrayVerify);
        $collection = $execute!=false ? new Collections($execute) : null;
        return $collection;
    }

    public static function delete(string $id)
    {
        $class = new static();
        $execute = $class->driver->delete($class->table, $id);
        return $execute;
    }

    public static function all($columns = "*", $returnColumns = [])
    {
        $class = new static();
        $execute = $class->driver->all($class->table, $columns, $returnColumns);
        $collection = $execute!=false ? new Collections($execute) : null;
        return $collection;
    }

    public function columnsVerify(array $array) : array
    {
        $class = new static();
        $columnsTable = $class->driver->namesColumns($class->table);
        $newArray = [];
        foreach ($columnsTable as $index => $column)
        {
            if($array[$column])
            {
                $newArray[$column] = $array[$column];
            }
        }
        return $newArray ?? [];
    }

}