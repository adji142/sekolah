<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class Dashboard extends Admin_Controller {

	/**
	 * Class Constructor
	 *
	 * @return Void
	 */
	public function __construct() {
		parent::__construct();
		$this->model->clear_expired_session();
		$this->load->model([
			'm_dashboard',
			'm_users',
			'm_post_comments',
		]);
		$this->load->library('user_agent');
		$this->load->helper(['form', 'blog']);
	}

	/**
	 * Index
	 * @return Void
	 */
	public function index() {
		$this->vars['title'] = 'Dashboard';
		$this->vars['dashboard'] = true;
		$this->vars['widget_box'] = $this->m_dashboard->widget_box();
		$this->vars['last_logged_in'] = $this->m_users->get_last_login();
		$this->vars['recent_comments'] = $this->m_post_comments->get_recent_comments(5);
		$this->vars['recaptcha_site_key'] = (NULL !== __session('recaptcha_site_key') && __session('recaptcha_site_key')) ? TRUE : FALSE;
		$this->vars['recaptcha_secret_key'] = (NULL !== __session('recaptcha_secret_key') && __session('recaptcha_secret_key')) ? TRUE : FALSE;
		$this->vars['sendgrid_api_key'] = (NULL !== __session('sendgrid_api_key') && __session('sendgrid_api_key')) ? TRUE : FALSE;
		$warning = FALSE;
		if (!$this->vars['recaptcha_site_key'] OR
			!$this->vars['recaptcha_secret_key'] OR
			!$this->vars['sendgrid_api_key']
		) {
			$warning = TRUE;
		}
		$this->vars['warning'] = $warning;
		$this->vars['content'] = 'dashboard';
		$this->load->view('backend/index', $this->vars);
	}

	/**
	 * Sidebar Collapse
	 */
	public function sidebar_collapse() {
		$collapse = __session('sidebar_collapse') ? false : true;
		$this->session->set_userdata('sidebar_collapse', $collapse);
	}

	/**
	 * Print All Sessions
	 */
	public function print_sessions() {
		if (__session('user_type') !== 'super_user') return redirect(base_url());
		echo '<pre>';
		print_r($this->session->userdata());
		echo '</pre>';
	}
}
