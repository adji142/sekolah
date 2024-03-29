<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class M_answers extends CI_Model {

	/**
	 * Primary key
	 * @var String
	 */
	public static $pk = 'id';

	/**
	 * Table
	 * @var String
	 */
	public static $table = 'answers';

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
		$this->db->select('x1.id, x2.question,	x1.answer, x1.is_deleted');
		$this->db->join('questions x2', 'x1.question_id = x2.id', 'LEFT');
		if ( ! empty($keyword) ) {
			$this->db->like('x2.question', $keyword);
			$this->db->or_like('x1.answer', $keyword);
		}
		if ( $return_type == 'count' ) return $this->db->count_all_results(self::$table . ' x1');
		if ( $limit > 0 ) $this->db->limit($limit, $offset);
		return $this->db->get(self::$table . ' x1');
	}

	/**
	 * Get All Answer By Question ID
	 * @param Integer $question_id
	 * @return Resource
	 */
	public function get_answers($question_id) {
		return $this->db
			->select('id, answer')
			->where('question_id', _toInteger($question_id))
			->where('is_deleted', 'false')
			->get('answers');
	}
}
