<?php

/*
 * Model database for Seo tables
 * 
 * @package OSClass
 * @subpackage Model
 * @since 3.0
 */

class ModelSeo extends DAO {
/*
 * It references to self object: ModelSeo.
 * It is used as a singleton
 * 
 * @access private
 * @since 3.0
 * @var ModelSeo
 */

private static $instance ;

/*
 * It creates a new ModelSeo object class ir if it has been created
 * before, it return the previous object
 * 
 * @access public
 * @since 3.0
 * @return ModelSeo
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
  return DB_TABLE_PREFIX.'t_item_seo';
}
        
/*
 * Import sql file
 * @param type $file 
 */

public function import($file) {
  $path = osc_plugin_resource($file) ;
  $sql = file_get_contents($path);
  if(!$this->dao->importSQL($sql)){ throw new Exception("Error importSQL::ModelSeo<br>".$file.'<br>'.$path.'<br><br>Please check your database for tables oc_t_item_seo, oc_t_pages_seo, oc_t_categories_seo, oc_t_region_seo, oc_t_city_seo and oc_t_home_seo. <br>If any of those tables exists in your database, delete them!');}
}

/*
 *  Remove data and tables related to the plugin.
 */

public function uninstall() {
  $this->dao->query('DROP TABLE '.$this->getTable_SeoAttr());
}
        
/*
 * Get products attributes given a item id 
 *
 * @param int $item_id
 * @return array
 */

public function getAttrByItemId( $item_id ) {
  $this->dao->select();
  $this->dao->from( $this->getTable_SeoAttr() );
  $this->dao->where('seo_item_id', $item_id );

  $result = $this->dao->get();
  if( !$result ) { return array(); }
            
  return $result->row();
}

/*
 * Insert products attributes
 *
 * @param int $item_id
 * @param string $make
 * @param string $model 
 */

public function insertAttr( $item_id, $title, $desc, $keywords ) {
  $aSet = array(
    'seo_title'  => $title,
    'seo_description'  => $desc,
    'seo_keywords' => $keywords,
    'seo_item_id' => $item_id
  );

  return $this->dao->insert( $this->getTable_SeoAttr(), $aSet);
}
        
/*
 * Update products attributes
 *
 * @param string $item_id
 * @param string $make
 * @param string $model 
 */

public function updateAttr( $item_id, $title, $desc, $keywords ) {
  $aSet = array(
    'seo_title'  => $title,
    'seo_description'  => $desc,
    'seo_keywords' => $keywords,
    'seo_item_id' => $item_id
  );

  $aWhere = array( 'seo_item_id' => $item_id);

  return $this->_update($this->getTable_SeoAttr(), $aSet, $aWhere);
}
        
/*
 * Delete house attributes given a item id
 * @param type $item_id 
 */

public function deleteItem( $item_id ) {
  return $this->dao->delete($this->getTable_SeoAttr(), array('seo_item_id' => $item_id) );
}
        
// update
function _update($table, $values, $where) {
  $this->dao->from($table);
  $this->dao->set($values);
  $this->dao->where($where);
  return $this->dao->update();
}

// End of DAO Class
}
?>