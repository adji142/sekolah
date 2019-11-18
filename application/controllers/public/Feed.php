<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class Feed extends Public_Controller {

	/**
	 * Class Constructor
	 *
	 * @return Void
	 */
	public function __construct() {
		parent::__construct();
		$this->load->model('public/m_posts');
		$this->load->helper(['xml', 'text']);
	}

	/**
	 * Index
	 * @return Void
	 */
	public function index() {
		$this->vars['feed_name'] = __session('website');
		$this->vars['encoding'] = 'utf-8';
		$this->vars['feed_url'] = base_url().'feed';
		$this->vars['page_description'] = __session('meta_description');
		$this->vars['page_language'] = 'en-en';
		$this->vars['creator_email'] = __session('email');
		$this->vars['posts'] = $this->m_posts->feed();
		header('Content-Type: text/xml; charset=utf-8', true);
		$this->load->view('feed', $this->vars);
	}
}
