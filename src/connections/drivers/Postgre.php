<?php

namespace Core\connections\drivers;

use Core\connections\interfaces\InterfaceDriver;
use ManagerUser\connection\SelectDriver;
use PDO;

class Postgre implements InterfaceDriver
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
        $this->charset = envSystem("DB_CHARSET");
        $this->dns = "{$this->driver}:host={$this->host};dbname={$this->db};port={$this->port};";
    }

    public function connection()
    {

        $pdo = new PDO($this->dns, $this->user, $this->password, [
            PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES \'UTF8\'',
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        ]);
        return $pdo;

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
        $select = $pdo->prepare('SELECT * FROM users WHERE id = :id');
        $select->bindValue(":{$primaryKeyTable}", $primary_key_value );
        $select->execute();
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
        $primaryKey = $pdo->lastInsertId();
        return $class->find($table, $primaryKey);
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

    public static function delete(string $table, string $id)
    {
        $class = new static();
        $pdo = $class->connection();
        $primaryKeyTable = $class->primaryKeyTable($table);
        $insert = $pdo->prepare("DELETE FROM {$table} WHERE {$primaryKeyTable}=:{$primaryKeyTable};");
        $array[$primaryKeyTable] = $id;
        return $insert->execute($array);
    }

    public static function all($table, string $columns="*", array $binds = [])
    {
        $class = new static();
        $pdo = $class->connection();
        $select = $pdo->prepare("SELECT {$columns} FROM {$table};");
        $select->execute($binds);
        return $select->fetchAll(PDO::FETCH_ASSOC);
    }

    public function primaryKeyTable($table)
    {
        $array = [];
        foreach ($this->keysTable($table) as $column)
        {
            if(strpos($column["column_default"], "nextval(") !== false)
            {
                $array[] = $column["column_name"];
            }
        }
        return $array[0] ?? null;
    }

    public function keysTable($table)
    {
        $class = new static();
        $pdo = $class->connection();
        $sql = "SELECT * FROM information_schema.columns WHERE table_name = '{$table}';";
        $prepare = $pdo->prepare($sql);
        $prepare->execute();
        return $prepare->fetchAll();
    }

    public function namesColumns($table)
    {
        $array = [];
        foreach ($this->keysTable($table) as $column)
        {
            $array[] = $column["column_name"];
        }
        return $array;
    }
}