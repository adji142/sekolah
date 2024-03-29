<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class M_file_categories extends CI_Model {

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
	 * Get Data
	 * @param String $keyword
	 * @param String $return_type
	 * @param Integer $limit
	 * @param Integer $offset
	 * @return Resource
	 */
	public function get_where($keyword = '', $return_type = 'count', $limit = 0, $offset = 0) {
		$this->db->select('
			id
			, category_name
			, category_description
			, category_slug
			, is_deleted
		');
		$this->db->where('category_type', 'file');
		if ( ! empty($keyword) ) {
			$this->db->group_start();
			$this->db->like('category_name', $keyword);
			$this->db->or_like('category_description', $keyword);
			$this->db->or_like('category_slug', $keyword);
			$this->db->group_end();
		}
		if ( $return_type == 'count' ) return $this->db->count_all_results(self::$table);
		if ( $limit > 0 ) $this->db->limit($limit, $offset);
		return $this->db->get(self::$table);
	}

	/**
	 * Get all data
	 * @return Resource
	 */
	public function get_file_categories() {
		return $this->db
			->select('id, category_name, category_description, category_slug')
			->where('category_type', 'file')
			->where('is_deleted', 'false')
			->get(self::$table);
	}

	/**
	 * Dropdown
	 * @return Array
	 */
	public function dropdown() {
		$query = $this->db
			->select('id, category_name')
			->where('category_type', 'file')
			->where('is_deleted', 'false')
			->get(self::$table);
		$dataset = [];
		if ($query->num_rows() > 0) {
			foreach($query->result() as $row) {
				$dataset[$row->id] = $row->category_name;
			}
		}
		return $dataset;
	}
}
