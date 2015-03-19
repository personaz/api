<?php
require_once('abstract.php');

class SemesterMahasiswa extends DbAbstract
{
    /**
     * get all semester for mahasiswa by nim
     *
     * @param String $nim
     * @return Array
     */
    function fetchAllSemesterByNIM($nim)
    {
        $predicate = array(
            ':nim'  => $nim,
        );
        $q = "SELECT * FROM semester_mahasiswa WHERE nim = :nim";
        return $this->getAll($q, $predicate);
    }

    /**
     * if $type == 1, fetch row "Semeseter Ganjil",
     * $type == 2, fetch row "Semester Genap" for Mahasiswa
     *
     * @param String $nim
     * @param Int $type
     * @return Array
     */
    function fetchSemesterByType($nim, $type)
    {
        $predicate = array(
            ':nim'              => $nim,
            ':type_semester'    => $type,
        );
        $q = "SELECT * FROM semester_mahasiswa WHERE nim = :nim AND type_semester = :type_semester";
        return $this->getRow($q, $predicate);
    }

    /**
     * get latest semester mahasiswa by nim
     *
     * @param String $nim
     * @return Array
     */
    function getLatestSemesterForNIM($nim)
    {
        $predicate = array(
            ':nim'  => $nim
        );
        $sq = "SELECT MAX(id_smms) FROM semester_mahasiswa WHERE nim = :nim";
        $mq = "SELECT * FROM semester_mahasiswa WHERE id_smms = ($sq)";
        return $this->getRow($mq, $predicate);
    }
}
