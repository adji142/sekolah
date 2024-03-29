<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class M_user_students extends CI_Model {

	/**
	 * Primary key
	 * @var String
	 */
	public static $pk = 'id';

	/**
	 * Table
	 * @var String
	 */
	public static $table = 'users';

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
         x1.id
         , x1.user_name
         , x2.full_name AS user_full_name
         , x2.email AS user_email
         , x1.is_deleted
      ');
      $this->db->join('students x2', 'x1.user_profile_id = x2.id', 'LEFT');
      $this->db->where('x1.user_type', 'student');
		if ( ! empty($keyword) ) {
			$this->db->group_start();
	      $this->db->like('x1.user_name', $keyword);
	      $this->db->or_like('x2.full_name', $keyword);
	      $this->db->or_like('x2.email', $keyword);
	      $this->db->group_end();
		}
      if ( $return_type == 'count' ) return $this->db->count_all_results(self::$table . ' x1');
		if ( $limit > 0 ) $this->db->limit($limit, $offset);
		return $this->db->get(self::$table . ' x1');
	}
}
