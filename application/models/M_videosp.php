<?php defined('BASEPATH') ;

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class M_videosp extends CI_Model {

	/**
	 * Primary key
	 * @var String
	 */
	public static $pk = 'id';

	/**
	 * Table
	 * @var String
	 */
	public static $table = 'posts';

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
		$this->db->select('id, post_title, post_content, is_deleted');
		$this->db->where('post_type', 'videoprofile');
		if ( ! empty($keyword) ) {
			$this->db->group_start();
			$this->db->like('post_title', $keyword);
			$this->db->group_end();
		}
		if ( $return_type == 'count' ) return $this->db->count_all_results(self::$table);
		if ( $limit > 0 ) $this->db->limit($limit, $offset);
		return $this->db->get(self::$table);
	}

	/**
	 * Get Videos
	 * @param Integer $limit
	 * @param Integer $offset
	 * @return Resource
	 */
	public function get_videosp($limit = 0, $offset = 0) {
		$this->db->select('id, post_title, post_content');
		$this->db->where('post_type', 'videoprofile');
		$this->db->where('is_deleted', 'false');
		$this->db->order_by('created_at', 'DESC');
		if ( $limit > 0 ) $this->db->limit($limit, $offset);
		return $this->db->get(self::$table);
	}

	
}
