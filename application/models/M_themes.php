<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class M_themes extends CI_Model {

	/**
	 * Primary key
	 * @var String
	 */
	public static $pk = 'id';

	/**
	 * Table
	 * @var String
	 */
	public static $table = 'themes';

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
		$this->db->select('id, theme_name, theme_folder, theme_author, is_active, is_deleted');
		if ( ! empty($keyword) ) {
			$this->db->like('theme_name', $keyword);
			$this->db->or_like('theme_folder', $keyword);
			$this->db->or_like('theme_author', $keyword);
		}
		$this->db->order_by('theme_name');
		if ( $return_type == 'count' ) return $this->db->count_all_results(self::$table);
		if ( $limit > 0 ) $this->db->limit($limit, $offset);
		return $this->db->get(self::$table);
	}

	/**
	 * get_active_themes
	 * @return String
	 */
	public function get_active_themes() {
		$query = $this->db
			->select('theme_folder')
			->where('is_active', 'true')
			->limit(1)
			->get(self::$table);
		if ($query->num_rows() === 1) {
			$result = $query->row();
			return $result->theme_folder;
		}
		return 'magazine';
	}

	/**
	 * Deactivate Themes
	 * @param Integer $id
	 * @return Boolean
	 */
	public function deactivate_themes($id = 0) {
		if ($id > 0) $this->db->where(self::$pk . ' !=', $id);
		return $this->db->update(self::$table, ['is_active' => 'false']);
	}
}
