<?php
require_once './config.php';

class Mahasiswa
{
    protected $_config;

    function __construct()
    {
        if(!$this->_config) {
            $this->_config = new MainConfig();
        }
    }

    function Login($nim, $password)
    {
        $db = $this->_config
            ->getConnection();
        $predicate = array(
            ':nim'      => $nim,
            ':password' => sha1($password),
        );
        $q = "SELECT * FROM mahasiswa WHERE nim = :nim AND password = :password";
        $stmt = $db->prepare($q);
        $stmt->execute($predicate);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    function getRowMahasiswaByNIM($nim)
    {
        $db = $this->_config
            ->getConnection();
        $predicate = array(
            ':nim'  => $nim,
        );
        $q = "SELECT * FROM mahasiswa WHERE nim = :nim";
        $stmt = $db->prepare($q);
        $stmt->execute($predicate);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}
