<?php

/*
 * Model database for Seo tables
 * 
 * @package OSClass
 * @subpackage Model
 * @since 3.0
 */

class ModelSeoPage extends DAO {
/*
 * It references to self object: ModelSeoPage.
 * It is used as a singleton
 * 
 * @access private
 * @since 3.0
 * @var ModelSeoPage
 */

private static $instance ;

/*
 * It creates a new ModelSeoPage object class ir if it has been created
 * before, it return the previous object
 * 
 * @access public
 * @since 3.0
 * @return ModelSeoPage
 */

public static function newInstance() {
  if( !self::$instance instanceof self ) {
    self::$instance = new self ;
  }
  return self::$instance ;
}

/*
 * Construct
 */

function __construct() {
  parent::__construct();
}
        
/*
 * Return table name products attributes
 * @return string
 */

public function getTable_SeoAttr() {
  return DB_TABLE_PREFIX.'t_pages_seo' ;
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
        
/*
 * Get products attributes given a item id 
 *
 * @param int $page_id
 * @return array
 */

public function getAttrByPageId( $page_id ) {
  $this->dao->select();
  $this->dao->from( $this->getTable_SeoAttr() );
  $this->dao->where('seo_page_id', $page_id );

  $result = $this->dao->get();
            
   if( !$result ) { return array(); }
            
  return $result->row();
}

/*
 * Insert products attributes
 *
 * @param int $page_id
 * @param string $make
 * @param string $model 
 */

public function insertAttr( $page_id, $title, $desc, $keywords ) {
  $aSet = array(
    'seo_title'  => $title,
    'seo_description'  => $desc,
    'seo_keywords' => $keywords,
    'seo_page_id' => $page_id
  );

  return $this->dao->insert( $this->getTable_SeoAttr(), $aSet);
}
        
/*
 * Update products attributes
 *
 * @param string $page_id
 * @param string $make
 * @param string $model 
 */

public function updateAttr( $page_id, $title, $desc, $keywords ) {
  $aSet = array(
    'seo_title'  => $title,
    'seo_description'  => $desc,
    'seo_keywords' => $keywords,
    'seo_page_id' => $page_id
  );

  $aWhere = array( 'seo_page_id' => $page_id);

  return $this->_update($this->getTable_SeoAttr(), $aSet, $aWhere);
}
        
/*
 * Delete house attributes given a item id
 * @param type $page_id 
 */

public function deletePage( $page_id ) {
  return $this->dao->delete($this->getTable_SeoAttr(), array('seo_page_id' => $page_id) ) ;
}
        
// update
function _update($table, $values, $where)   {
  $this->dao->from($table) ;
  $this->dao->set($values) ;
  $this->dao->where($where) ;
  return $this->dao->update() ;
}

// End of DAO Class
}
?>