<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class Token {

	/**
	 * Reference to CodeIgniter instance
	 *
	 * @var object
	 */
	protected $CI;

	/**
	 * @var token
	 * @access private
	 */
	private $token;

	/**
	 * @var old token
	 * @access private
	 */
	private $old_token;

	/**
	 * Class Constructor
	 *
	 * @return Void
	 */
	public function __construct() {
		$this->CI = &get_instance();
		if (NULL !== __session('token')) {
			$this->old_token = __session('token');
		}
	}

	/**
	 * Set Token
	 * @return String
	 */
	private function set_token() {
		$ip = $_SERVER['REMOTE_ADDR'];
		$uniqid = uniqid(mt_rand(), true);
		return md5($ip . $uniqid);
	}

	/**
	 * Get Token
	 * @return String
	 */
	public function get_token() {
		$this->token = $this->set_token();
		$this->CI->session->set_userdata('token', $this->token);
		return $this->token;
	}

	/**
	 * Token validated
	 * @return Boolean
	 */
	public function  is_valid_token($token) {
		return $token === $this->old_token;
	}
}
