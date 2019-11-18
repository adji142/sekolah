<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class M_students extends CI_Model {

	/**
	 * Primary key
	 * @var String
	 */
	public static $pk = 'id';

	/**
	 * Table
	 * @var String
	 */
	public static $table = 'students';

	/**
	 * Class Constructor
	 * @return Void
	 */
	public function __construct() {
		parent::__construct();
	}

	/**
	 * Search Students
	 * @param Int $academic_year_id
	 * @param Int $class_group_id
	 * @return Resource
	 */
	public function search_students($academic_year_id, $class_group_id) {
		$this->db->select("
			x1.id
		  , x2.identity_number
		  , x2.full_name
		  , IF(x2.gender = 'M', 'L', 'P') AS gender
		  , COALESCE(x2.birth_place, '') birth_place
		  , COALESCE(x2.birth_date, '') AS birth_date
		  , x2.photo
		");
		$this->db->join('students x2', 'x1.student_id = x2.id', 'LEFT');
		$this->db->where('x1.is_deleted', 'false');
		$this->db->where('x1.academic_year_id', (int) $academic_year_id);
		$this->db->where('x1.class_group_id', (int) $class_group_id);
		$this->db->order_by('x2.full_name', 'ASC');
		return $this->db->get('class_group_settings x1');
	}
}
