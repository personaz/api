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

    /**
     * insert new data with query and value
     * return bool
     *
     * @param String $query
     * @param Array $values
     * @return Bool
     */
    function insert($query, $values)
    {
        $db = $this->getConfig()
            ->getConnection();
        $stmt = $db->prepare($query);
        return $stmt->execute($values);
    }

    /**
     * update data by query on set with predicate
     *
     * @param String $query
     * @param Array $set
     * @param Array $predicate
     */
    function update($query, $set, $predicate)
    {
        $db = $this->getConfig()
            ->getConnection();
        $where = array_merge($set, $predicate);
        $stmt = $db->prepare($query);
        return $stmt->execute($where);
    }
}
