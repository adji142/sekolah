<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class M_class_group_students extends CI_Model {

	/**
	 * Primary key
	 * @var String
	 */
	public static $pk = 'id';

	/**
	 * Table
	 * @var String
	 */
	public static $table = 'class_group_students';

	/**
	 * Class Constructor
	 * @return Void
	 */
	public function __construct() {
		parent::__construct();
	}
	/**
	 * Get Students
	 * @param Int $academic_year_id
	 * @param Int $class_group_id
	 * @return Resource
	 */
	public function get_students($academic_year_id, $class_group_id) {
		$this->db->select("
			x1.id
			, x3.identity_number
			, x3.nisn
			, x3.full_name
			, x3.birth_place
			, x3.birth_date
			, IF(x3.gender = 'M', 'Laki-laki', 'Perempuan') AS gender
			, x3.photo
		");
		$this->db->join("class_group_settings x2", "x1.class_group_setting_id = x2.id", "LEFT");
		$this->db->join("students x3", "x1.student_id = x3.id", "LEFT");
		$this->db->where("x1.is_deleted", "false");
		$this->db->where("x2.academic_year_id", (int) $academic_year_id);
		$this->db->where("x2.class_group_id", (int) $class_group_id);
		$this->db->order_by("x3.full_name", 'ASC');
		return $this->db->get(self::$table . ' x1');
	}
}
