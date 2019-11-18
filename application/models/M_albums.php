<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class M_albums extends CI_Model {

	/**
	 * Primary key
	 * @var String
	 */
	public static $pk = 'id';

	/**
	 * Table
	 * @var String
	 */
	public static $table = 'albums';

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
		$this->db->select('id, album_title, album_description, album_cover, album_slug, is_deleted');
		if ( ! empty($keyword) ) {
			$this->db->like('album_title', $keyword);
			$this->db->or_like('album_description', $keyword);
			$this->db->or_like('album_slug', $keyword);
		}
		if ( $return_type == 'count' ) return $this->db->count_all_results(self::$table);
		if ( $limit > 0 ) $this->db->limit($limit, $offset);
		return $this->db->get(self::$table);
	}

	/**
	 * Get Albums
	 * @param Integer $limit
	 * @param Integer $offset
	 * @return Resource
	 */
	public function get_albums($limit = 0, $offset = 0) {
		$this->db->select("
			id
			, album_title
			, album_description
			, COALESCE(album_cover, 'no-image.png') AS album_cover
			, album_slug
		");
		$this->db->where('is_deleted', 'false');
		$this->db->order_by('created_at', 'DESC');
		if ( $limit > 0 ) $this->db->limit($limit, $offset);
		return $this->db->get(self::$table);
	}
}
