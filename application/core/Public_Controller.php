<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class Public_Controller extends MY_Controller {

	/**
	 * General Variable
	 * @var Array
	 */
	protected $vars = [];

	/**
	 * Class Constructor
	 *
	 * @return Void
	 */
	public function __construct() {
		parent::__construct();

		// Load Text Helper
		$this->load->helper(['text', 'blog_helper']);

		// Load Token Library
		$this->load->library('token');

		// CSRF Token
		$session_data['csrf_token'] = $this->token->get_token();

		// set session data
		$this->session->set_userdata($session_data);

		// redirect if under construction

		if (filter_var((string) __session('site_maintenance'), FILTER_VALIDATE_BOOLEAN) &&
			__session('site_maintenance_end_date') >= date('Y-m-d') &&
			$this->uri->segment(1) !== 'login') {
			redirect('under-construction');
		}

		//  cache file
		if (filter_var((string) __session('site_cache'), FILTER_VALIDATE_BOOLEAN) && (int) __session('site_cache_time') > 0) {
			$this->output->cache(__session('site_cache_time'));
		}
	}
}
