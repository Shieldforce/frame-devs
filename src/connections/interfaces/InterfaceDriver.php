<?php

namespace Core\connections\interfaces;

interface InterfaceDriver
{
    public function __construct();
    public function connection();
    public static function selectCore(string $query, array $binds = []);
    public static function select(string $columns, $table,array $binds = []);
    public static function find($table, $primary_key_value);
    public static function insert(string $table, array $array = []);
    public static function edit(string $table, string $id, array $array = []);
    public static function delete(string $table, string $id);
    public static function all($table, string $columns="*", array $binds = []);
    public function primaryKeyTable($table);
    public function keysTable($table);
    public function namesColumns($table);
}