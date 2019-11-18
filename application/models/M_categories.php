<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class M_categories extends CI_Model {

	/**
	 * Primary key
	 * @var String
	 */
	public static $pk = 'id';

	/**
	 * Table
	 * @var String
	 */
	public static $table = 'categories';

	/**
	 * Class Constructor
	 *
	 * @return Void
	 */
	public function __construct() {
		parent::__construct();
	}

	/**
	 * Get Categories
	 * @param String $category_type
	 * @param Integer $limit
	 * @return Resource
	 */
	public function get_categories($category_type = 'post', $limit = 0) {
		$this->db->select('id, category_name, category_description, category_slug');
		$this->db->where('category_type', $category_type);
		$this->db->where('is_deleted', 'false');
		$this->db->order_by('category_name', 'ASC');
		if ($limit > 0) $this->db->limit($limit);
		return $this->db->get(self::$table);
	}
}
