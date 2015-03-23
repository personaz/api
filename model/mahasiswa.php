<?php
require_once('abstract.php');

class Mahasiswa extends DbAbstract
{
    /**
     * get row mahasiswa via nim and password, used for login
     * and check existance of mahasiswa
     *
     * @param String $nim
     * @param String $password
     * @return Bool
     */
    function Login($nim, $password)
    {
        $predicate = array(
            ':nim'      => $nim,
            ':password' => sha1($password),
        );
        $q = "SELECT * FROM mahasiswa WHERE nim = :nim AND password = :password";
        $ret = array();
        if ($this->getRow($q, $predicate)) {
            $ret['available'] = 'YES';
        } else {
            $ret['available'] = 'NO';
        }
        return $ret;
    }

    /**
     * get row mahasiswa by nim
     *
     * @param String $nim
     * @return Array
     */
    function getRowMahasiswaByNIM($nim)
    {
        $predicate = array(
            ':nim'  => $nim,
        );
        $q = "SELECT * FROM mahasiswa WHERE nim = :nim";
        return $this->getRow($q, $predicate);
    }

    /**
     * get mahasiswa data from mahasiswa join with jurusan via nim
     *
     * @param String $nim
     * @return Array
     */
    function getAllDetailMahasiswaByNIM($nim)
    {
        $predicate = array(
            ':nim'  => $nim,
        );
        $qm = "SELECT m.*, j.* FROM mahasiswa m LEFT JOIN jurusan j USING(id_jurusan) WHERE m.nim = :nim";
        $ms = $this->getRow($qm, $predicate);

        $qs = "SELECT sm.* FROM semester_mahasiswa sm WHERE sm.nim = :nim";
        $semester = $this->getAll($qs, $predicate);
        $ms['semester_mahasiswa'] = $semester;
        return $ms;
    }
}
