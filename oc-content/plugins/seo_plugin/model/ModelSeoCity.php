<?php
/**
 * Created by JetBrains PhpStorm.
 */

class ModelSeoCity extends DAO {


    private static $instance ;


    public static function newInstance() {
        if( !self::$instance instanceof self ) {
            self::$instance = new self ;
        }
        return self::$instance ;
    }



    function __construct() {
        parent::__construct();
    }

    /*
     * Return table name products attributes
     * @return string
     */

    public function getTable_SeoAttr() {
        return DB_TABLE_PREFIX.'t_city_seo' ;
    }


    public function getAttrCity() {
        $this->dao->select();
        $this->dao->from( $this->getTable_SeoAttr());
        $this->dao->where('seo_city_id', 1 );

        $result = $this->dao->get();

        if( !$result ) { return array(); }

        return $result->row();
    }

    /*
     * Import sql file
     * @param type $file
     */

    public function import($file) {
        $path = osc_plugin_resource($file) ;
        $sql = file_get_contents($path);

        if(! $this->dao->importSQL($sql) ){
            throw new Exception( "Error importSQL::ModelSeoPage<br>".$file ) ;
        }
    }

    /*
     *  Remove data and tables related to the plugin.
     */

    public function uninstall() {
        $this->dao->query('DROP TABLE '. $this->getTable_SeoAttr());
    }


    public function insertAttr( $city_id, $title, $desc, $keywords ) {
        $aSet = array(
            'seo_title'  => $title,
            'seo_description'  => $desc,
            'seo_keywords' => $keywords,
            'seo_city_id' => $city_id
        );

        return $this->dao->insert( $this->getTable_SeoAttr(), $aSet);
    }

    public function updateAttr( $city_id, $title, $desc, $keywords ) {
        $aSet = array(
            'seo_title'  => $title,
            'seo_description'  => $desc,
            'seo_keywords' => $keywords,
            'seo_city_id' => $city_id
        );

        $aWhere = array( 'seo_city_id' => $city_id);

        return $this->_update($this->getTable_SeoAttr(), $aSet, $aWhere);
    }



    public function deletePage( $city_id ) {
        return $this->dao->delete($this->getTable_SeoAttr(), array('seo_city_id' => $city_id) ) ;
    }


    function _update($table, $values, $where)   {
        $this->dao->from($table) ;
        $this->dao->set($values) ;
        $this->dao->where($where) ;
        return $this->dao->update() ;
    }

// End of DAO Class
}
?>