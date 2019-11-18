<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class Under_construction extends CI_Controller {

	/**
	 * Class Constructor
	 *
	 * @return Void
	 */
	public function __construct() {
		parent::__construct();
		$site_maintenance = __session('site_maintenance');
		if (NULL !== $site_maintenance && ! filter_var((string) $site_maintenance, FILTER_VALIDATE_BOOLEAN)) {
			redirect(base_url(), 'refresh');
		}
	}

	/**
	 * Index
	 */
	public function index() {
		$this->load->view('under_construction');
	}
}
