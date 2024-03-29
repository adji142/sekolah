<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class M_scholarships extends CI_Model {

	/**
	 * Primary key
	 * @var String
	 */
	public static $pk = 'id';

	/**
	 * Table
	 * @var String
	 */
	public static $table = 'scholarships';

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
		$this->db->select('id, scholarship_type, scholarship_description, scholarship_start_year, scholarship_end_year, is_deleted');
		if (__session('user_type') === 'student') $this->db->where('student_id', __session('user_profile_id'));
		if ( ! empty($keyword) ) {
			$this->db->group_start();
			$this->db->like('scholarship_type', $keyword);
			$this->db->or_like('scholarship_description', $keyword);
			$this->db->or_like('scholarship_start_year', $keyword);
			$this->db->or_like('scholarship_end_year', $keyword);
			$this->db->group_end();
		}
		if ( $return_type == 'count' ) return $this->db->count_all_results(self::$table);
		if ( $limit > 0 ) $this->db->limit($limit, $offset);
		return $this->db->get(self::$table);
	}

	/**
	 * Get By Student ID
	 * @param Integer $student_id
	 * @return Resource
	 */
	public function get_by_student_id($student_id = 0) {
		$this->db->select('id, scholarship_type, scholarship_description, scholarship_start_year, scholarship_end_year, is_deleted');
		$this->db->where('student_id', $student_id);
		$this->db->where('is_deleted', 'false');
		return $this->db->get(self::$table);
	}
}
