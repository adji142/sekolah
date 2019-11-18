<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class Logout extends CI_Controller {

	/**
	 * Class Constructor
	 *
	 * @return Void
	 */
	public function __construct() {
		parent::__construct();
		$this->load->model('m_users');
	}

	/**
	 * Index
	 * @return Void
	 */
	public function index() {
		if (!$this->auth->hasLogin())
			return redirect(base_url());
		$id = (int) __session('user_id');
		if (!empty($id)) {
			$this->session->sess_destroy();
			$this->m_users->reset_logged_in($id);
		}
		return redirect('gotoadmin', 'refresh');
	}
 }
