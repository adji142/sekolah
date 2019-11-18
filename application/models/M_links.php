<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class M_links extends CI_Model {

	/**
	 * Primary key
	 * @var String
	 */
	public static $pk = 'id';

	/**
	 * Table
	 * @var String
	 */
	public static $table = 'links';

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
		$this->db->select('id, link_url, link_title, link_target, is_deleted');
		$this->db->where('link_type', 'link');
		if ( ! empty($keyword) ) {
			$this->db->group_start();
			$this->db->like('link_url', $keyword);
			$this->db->or_like('link_title', $keyword);
			$this->db->or_like('link_target', $keyword);
			$this->db->group_end();
		}
		if ( $return_type == 'count' ) return $this->db->count_all_results(self::$table);
		if ( $limit > 0 ) $this->db->limit($limit, $offset);
		return $this->db->get(self::$table);
	}

	/**
	 * Get All Link
	 * @param Integer $limit
	 * @return Resource
	 */
	public function get_links($limit = 0) {
		$this->db->select('id, link_title, link_url, link_target');
		$this->db->where('link_type', 'link');
		$this->db->where('is_deleted', 'false');
		if ( $limit > 0 ) $this->db->limit($limit);
		return $this->db->get(self::$table);
	}
}
