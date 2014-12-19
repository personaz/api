<?php

class MainConfig
{
    protected $_dsn;
    protected $_user;
    protected $_pass;

    function __construct()
    {
        $this->_dsn = 'mysql:host=localhost;dbname=university;charset=utf8';
        $this->_user = 'root';
        $this->_pass = '';
    }

    function getConnection()
    {
        $db = new PDO($this->_dsn, $this->_user, $this->_pass);
        return $db;
    }
}
