<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class M_dashboard extends CI_Model {

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
	 * @return Resource
	 */
	public function widget_box() {
		$query = $this->db->query("
			SELECT (SELECT COUNT(*) FROM comments x1 WHERE x1.comment_type='message') AS messages
			, (SELECT COUNT(*) FROM comments x1 WHERE x1.comment_type='post') AS comments
			, (SELECT COUNT(*) FROM posts x1 WHERE x1.post_type='post') AS posts
			, (SELECT COUNT(*) FROM posts x1 WHERE x1.post_type='page') AS pages
			, (SELECT COUNT(*) FROM categories WHERE category_type='post') AS categories
			, (SELECT COUNT(*) FROM tags) AS tags
			, (SELECT COUNT(*) FROM links WHERE link_type = 'link') AS links
			, (SELECT COUNT(*) FROM quotes) AS quotes
		");
		return $query->row();
	}
}
