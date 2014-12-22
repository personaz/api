<?php
require_once './config.php';

class SemesterMahasiswa
{
    private $_config;

    function __construct()
    {
        if(!$this->_config) {
            $this->_config = new MainConfig();
        }
    }

    function fetchAllSemesterByNIM($nim)
    {
        $db = $this->_config
            ->getConnection();
        $predicate = array(
            ':nim'  => $nim,
        );
        $q = "SELECT * FROM semester_mahasiswa WHERE nim = :nim";
        $stmt = $db->prepare($q);
        $stmt->execute($predicate);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    function fetchSemesterByType($nim, $type)
    {
        /**
         * if $type == 1, fetch all "Semeseter Ganjil",
         * $type == 2, fetch all "Semester Genap" for Mahasiswa
         */

        $db = $this->_config
            ->getConnection();
        $predicate = array(
            ':nim'              => $nim,
            ':type_semester'    => $type,
        );
        $q = "SELECT * FROM semester_mahasiswa WHERE nim = :nim AND type_semester = :type_semester";
        $stmt = $db->prepare($q);
        $stmt->execute($predicate);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
