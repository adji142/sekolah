<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class M_questions extends CI_Model {

	/**
	 * Primary key
	 * @var String
	 */
	public static $pk = 'id';

	/**
	 * Table
	 * @var String
	 */
	public static $table = 'questions';

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
		$this->db->select('id, question, is_active, is_deleted');
		if ( ! empty($keyword) ) $this->db->like('question', $keyword);
		if ( $return_type == 'count' ) return $this->db->count_all_results(self::$table);
		if ( $limit > 0 ) $this->db->limit($limit, $offset);
		return $this->db->get(self::$table);
	}

	/**
	 * Get Dropdown
	 * @return Array
	 */
	public function dropdown() {
		$this->db->select('id, question');
		$query = $this->db->get(self::$table);
		$dataset = [];
		foreach($query->result() as $row) {
			$dataset[$row->id] = $row->question;
		}
		return $dataset;
	}

	/**
	 * Get Active Question
	 * @return Resource
	 */
	public function get_active_question() {
		return $this->db
			->select('id, question')
			->where('is_active', 'true')
			->where('is_deleted', 'false')
			->limit(1)
			->get(self::$table)
			->row();
	}
}
