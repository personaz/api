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
        return $this->getRow($q, $predicate);
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
        $msCol = "ms.nim, ms.nama, ms.kelamin, ms.alamat, ms.tgl_lahir, ms.id_jurusan, ms.tgl_masuk";
        $jCol = "j.*";
        $q = "SELECT $msCol, $jCol FROM mahasiswa AS ms LEFT JOIN jurusan AS j ON ms.id_jurusan = j.id_jurusan WHERE ms.nim = :nim";
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

    /**
     * change old password with new password mahasiswa by nim
     * return array yes or no
     *
     * @param String $newPassword
     * @param String $nim
     * @return Int
     */
    function changePasswordForMahasiswaByNIM($newPassword, $nim)
    {
        $predicate = array(
            ':nim'      => $nim
        );

        $set = array(
            ':password' => $newPassword
        );

        $query = "UPDATE mahasiswa SET password = SHA1(:password) WHERE nim = :nim";
        $this->update($query, $set, $predicate);
    }
}
