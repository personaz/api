<?php
require_once('./config.php');

class DbAbstract
{
    protected $_config;

    function __construct()
    {
        if(!$this->_config) {
            $this->_config = new MainConfig();
        }
    }

    /**
     * get pdo configuration
     *
     * @return Object PDO
     */
    function getConfig()
    {
        return $this->_config;
    }

    /**
     * fetch row data with query and predicate
     *
     * @param String $query
     * @param Array $predicate
     * @return Array
     */
    function getRow($query, $predicate)
    {
        $db = $this->getConfig()
            ->getConnection();
        $stmt = $db->prepare($query);
        $stmt->execute($predicate);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    /**
     * fetch all data with query and predicate
     *
     * @param String $query
     * @param Array $predicate
     * @return Array
     */
    function getAll($query, $predicate)
    {
        $db = $this->getConfig()
            ->getConnection();
        $stmt = $db->prepare($query);
        $stmt->execute($predicate);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
