<?php

namespace Core\connections\drivers;

use Core\connections\interfaces\InterfaceDriver;
use ManagerUser\connection\SelectDriver;
use PDO;

class Mssql implements InterfaceDriver
{
    protected $host;
    protected $port;
    protected $db;
    protected $user;
    protected $password;
    protected $driver;
    protected $dns;
    protected $charset;

    public function __construct()
    {
        $this->host = envSystem("DB_HOST");
        $this->port = envSystem("DB_PORT");
        $this->db = envSystem("DB_NAME");
        $this->user = envSystem("DB_USER");
        $this->password = envSystem("DB_PASSWORD");
        $this->driver = envSystem("DB_DRIVER");
        $this->dns = "{$this->driver}:Server={$this->host},{$this->port};Database={$this->db};";
    }

    public function connection()
    {
        try {

            $pdo = new PDO($this->dns, $this->user, $this->password);
            $pdo->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
            return $pdo;

        } catch (\PDOException $exception) {

            $message = "Drivers available: " . implode(",", PDO::getAvailableDrivers());
            $message .= "\nError: " . $exception->getMessage();

            $render = new \Core\renderErrors\Render();
            $render->view("errors.main.throwableDefault", [
                "code" => $exception->getCode(),
                "message" => $message,
                "file" => $exception->getFile(),
                "line" => $exception->getLine(),
            ]);
            die;
        }

    }

    public static function selectCore(string $query, array $binds = [])
    {
        $class = new static();
        $pdo = $class->connection();
        $select = $pdo->prepare($query);
        $select->execute($binds);
        return $select->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function select(string $columns, $table,array $binds = [])
    {
        $class = new static();
        $pdo = $class->connection();
        $select = $pdo->prepare("SELECT {$columns} FROM {$table};");
        $select->execute($binds);
        return $select->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function find($table, $primary_key_value)
    {
        $class = new static();
        $pdo = $class->connection();
        $primaryKeyTable = $class->primaryKeyTable($table);
        $select = $pdo->prepare("SELECT * FROM {$table} WHERE {$primaryKeyTable} = :{$primaryKeyTable} ;");
        $select->execute([ ":{$primaryKeyTable}" => $primary_key_value ]);
        return $select->fetch(PDO::FETCH_ASSOC);
    }

    public static function insert(string $table, array $array = [])
    {
        $class = new static();
        $pdo = $class->connection();
        $columns = implode(",", array_keys($array));
        $names = [];
        foreach ($array as $index => $item)
        {
            $names[] = ":{$index} ";
        }
        $mountNames = implode(",", $names);
        $insert = $pdo->prepare("INSERT INTO {$table} ({$columns}) VALUES ({$mountNames});");
        $insert->execute($array);
        $lastId = $pdo->lastInsertId();
        return $class->find($table, $lastId);
    }

    public static function edit(string $table, string $id, array $array = [])
    {
        $class = new static();
        $pdo = $class->connection();
        $binds = [];
        foreach ($array as $index => $item)
        {
            $binds[] = "{$index}=:{$index}";
        }
        $mountBinds = implode(",", $binds);
        $primaryKeyTable = $class->primaryKeyTable($table);
        $insert = $pdo->prepare("UPDATE {$table} SET {$mountBinds} WHERE {$primaryKeyTable}=:{$primaryKeyTable};");
        $array[$primaryKeyTable] = $id;
        $insert->execute($array);
        return $class->find($table, $id);
    }

    public static function all($table, string $columns="*", array $binds = [])
    {
        $class = new static();
        $pdo = $class->connection();
        $select = $pdo->prepare("SELECT {$columns} FROM {$table};");
        $select->execute($binds);
        return $select->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function delete(string $table, string $id)
    {
        $class = new static();
        $pdo = $class->connection();
        $primaryKeyTable = $class->primaryKeyTable($table);
        $insert = $pdo->prepare("DELETE FROM {$table} WHERE {$primaryKeyTable}=:{$primaryKeyTable};");
        $array[$primaryKeyTable] = $id;
        return $insert->execute($array);
    }

    public function primaryKeyTable($table)
    {
        $class = new static();
        $pdo = $class->connection();
        $sql = "SELECT 
                KEYS.table_schema, KEYS.table_name, KEYS.column_name, KEYS.ORDINAL_POSITION 
                FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE keys
                INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS CONS 
                    ON cons.TABLE_SCHEMA = keys.TABLE_SCHEMA 
                    AND cons.TABLE_NAME = keys.TABLE_NAME 
                    AND cons.CONSTRAINT_NAME = keys.CONSTRAINT_NAME
                WHERE cons.CONSTRAINT_TYPE = 'PRIMARY KEY'";
        $prepare = $pdo->prepare($sql);
        $prepare->execute();
        foreach ($prepare->fetchAll() as $value)
        {
            if($value["table_name"]==$table)
            {
                return $value["column_name"];
            }
        }
        return false;
    }

    public function keysTable($table)
    {
        $class = new static();
        $pdo = $class->connection();
        $sql = "SELECT COLUMN_NAME 
                FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_NAME = '{$table}'";
        $prepare = $pdo->prepare($sql);
        $prepare->execute();
        return $prepare->fetchAll();
    }

    public function namesColumns($table)
    {
        $array = [];
        foreach ($this->keysTable($table) as $column)
        {
            $array[] = $column["COLUMN_NAME"];
        }
        return $array;
    }
}