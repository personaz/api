<?php
require_once('abstract.php');

class MatkulMahasiswa extends DbAbstract
{
    /**
     * get all mata kuliah mahasiswa via semester id
     *
     * @param Int $idSmms
     * @return Array
     */
    public function getAllMatakuliahOnSemesterId($idSmms)
    {
        $predicate = array(
            ':id_smms' => $idSmms
        );
        $q = "SELECT mm.*, mk.* FROM matkul_mahasiswa mm LEFT JOIN mata_kuliah mk USING(kode_matkul) WHERE mm.id_smms = :id_smms";
        return $this->getAll($q, $predicate);
    }
}
