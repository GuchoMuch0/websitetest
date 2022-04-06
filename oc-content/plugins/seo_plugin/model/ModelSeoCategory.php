<?php

/*
 * Model database for Seo tables
 * 
 * @package OSClass
 * @subpackage Model
 * @since 3.0
 */

class ModelSeoCategory extends DAO {
/*
 * It references to self object: ModelSeoCategory.
 * It is used as a singleton
 * 
 * @access private
 * @since 3.0
 * @var ModelSeoCategory
 */

private static $instance ;

/*
 * It creates a new ModelSeoCategory object class ir if it has been created
 * before, it return the previous object
 * 
 * @access public
 * @since 3.0
 * @return ModelSeoCategory
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
  return DB_TABLE_PREFIX.'t_categories_seo' ;
}
        
/*
 * Import sql file
 * @param type $file 
 */

public function import($file) {
  $path = osc_plugin_resource($file) ;
  $sql = file_get_contents($path);

  if(! $this->dao->importSQL($sql) ){
    throw new Exception( "Error importSQL::ModelSeoCategory<br>".$file ) ;
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
 * @param int $category_id
 * @return array
 */

public function getAttrByCategoryId( $category_id ) {
  $this->dao->select();
  $this->dao->from( $this->getTable_SeoAttr() );
  $this->dao->where('seo_category_id', $category_id );

  $result = $this->dao->get();
            
   if( !$result ) { return array(); }
            
  return $result->row();
}

/*
 * Insert products attributes
 *
 * @param int $category_id
 * @param string $make
 * @param string $model 
 */

public function insertAttr( $category_id, $title, $desc, $keywords ) {
  $aSet = array(
    'seo_title'  => $title,
    'seo_description'  => $desc,
    'seo_keywords' => $keywords,
    'seo_category_id' => $category_id
  );

  return $this->dao->insert( $this->getTable_SeoAttr(), $aSet);
}
        
/*
 * Update products attributes
 *
 * @param string $category_id
 * @param string $make
 * @param string $model 
 */

public function updateAttr( $category_id, $title, $desc, $keywords ) {
  $aSet = array(
    'seo_title'  => $title,
    'seo_description'  => $desc,
    'seo_keywords' => $keywords,
    'seo_category_id' => $category_id
  );

  $aWhere = array( 'seo_category_id' => $category_id);

  return $this->_update($this->getTable_SeoAttr(), $aSet, $aWhere);
}
        
/*
 * Delete house attributes given a item id
 * @param type $category_id 
 */

public function deleteCategory( $category_id ) {
  return $this->dao->delete($this->getTable_SeoAttr(), array('seo_category_id' => $category_id) ) ;
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