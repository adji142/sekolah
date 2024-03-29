<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */


class M_majors extends CI_Model {

	/**
	 * Primary key
	 * @var String
	 */
	public static $pk = 'id';

	/**
	 * Table
	 * @var String
	 */
	public static $table = 'majors';

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
		$this->db->select('id, major_name, major_short_name, is_active, is_deleted');
		if ( ! empty($keyword) ) {
			$this->db->like('major_name', $keyword);
			$this->db->or_like('major_short_name', $keyword);
		}
		if ( $return_type == 'count' ) return $this->db->count_all_results(self::$table);
		if ( $limit > 0 ) $this->db->limit($limit, $offset);
		return $this->db->get(self::$table);
	}

	/**
	 * Count Active Majors
	 * @return Boolean
	 */
	public function major_count() {
		$count = $this->db
			->where('is_deleted', 'false')
			->count_all_results(self::$table);
		return $count > 0;
	}

	/**
	 * Dropdown
	 * @return Array
	 */
	public function dropdown() {
		$query = $this->db
			->select('id, major_name')
			->where('is_deleted', 'false')
			->where('is_active', 'true')
			->get(self::$table);
		$dataset = [];
		if ($query->num_rows() > 0) {
			foreach($query->result() as $row) {
				$dataset[$row->id] = $row->major_name;
			}
		}
		return $dataset;
	}
}
