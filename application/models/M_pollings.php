<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class M_pollings extends CI_Model {

	/**
	 * Primary key
	 * @var String
	 */
	public static $pk = 'id';

	/**
	 * Table
	 * @var String
	 */
	public static $table = 'pollings';

	/**
	 * Class Constructor
	 *
	 * @return Void
	 */
	public function __construct() {
		parent::__construct();
	}

	/**
	 * Insert
	 * @param Integer $answer_id
	 * @return Boolean
	 */
	public function insert($answer_id) {
		$count = $this->db
			->where('ip_address', get_ip_address())
			->where('LEFT(created_at, 10)=', date('Y-m-d'))
			->count_all_results(self::$table);
		if ($count === 0) {
			$this->db->set('answer_id', $answer_id);
			$this->db->set('ip_address', get_ip_address());
			$this->db->set('created_at', date('Y-m-d H:i:s'));
			$this->db->set('created_by', __session('user_id'));
			return $this->db->insert(self::$table);
		}
		return FALSE;
	}

	/**
	 * Polling Result
	 * @param Integer $question_id
	 * @return Resource
	 */
	public function get_pollings($question_id) {
		$this->db->select('x2.answer AS labels, COUNT(*) AS data');
		$this->db->join('answers x2', 'x1.answer_id = x2.id', 'LEFT');
		$this->db->where('x2.question_id', _toInteger($question_id));
		$this->db->group_by('x1.answer_id');
		$this->db->order_by('x1.answer_id', 'ASC');
		return $this->db->get(self::$table . ' x1');
	}
}
