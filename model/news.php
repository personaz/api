<?php
require_once('abstract.php');

class News extends DbAbstract
{
    /**
     * get all news ordered by tanggalBerita desc
     *
     * @return Array
     */
    function getNotDeletedNewsOrderedLatestNews()
    {
        $predicate = array(
            ':deleted' => 1
        );
        $q = "SELECT * FROM news WHERE deleted != :deleted ORDER BY tanggalBerita DESC";
        return $this->getAll($q, $predicate);
    }
}
