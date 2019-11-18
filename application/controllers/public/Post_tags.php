<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class Post_tags extends Public_Controller {

	/**
	 * Class Constructor
	 *
	 * @return Void
	 */
	public function __construct() {
		parent::__construct();
		$this->load->model('public/m_posts');
	}

	/**
	 * Index
	 * @return Void
	 */
	public function index() {
		$tag = $this->uri->segment(2);
		if (alpha_dash($tag)) {
			$this->vars['page_title'] = '#' . ucwords(str_replace('-', ' ', $tag));
			$total_rows = $this->m_posts->get_post_tags($tag)->num_rows();
			$this->vars['total_page'] = ceil($total_rows / __session('post_per_page'));
			$this->vars['query'] = $this->m_posts->get_post_tags($tag, __session('post_per_page'), 0);
			$this->vars['content'] = 'themes/'.theme_folder().'/loop-posts';
			$this->load->view('themes/'.theme_folder().'/index', $this->vars);
		} else {
			show_404();
		}
	}

	/**
	 * Get Posts
	 * @return Object
	 */
	public function get_posts() {
		if ($this->input->is_ajax_request()) {
			$tag = $this->input->post('tag', true);
			$page_number = _toInteger($this->input->post('page_number', true));
			$offset = ($page_number - 1) * __session('post_per_page');
			if (alpha_dash($tag)) {
				$query = $this->m_posts->get_post_tags($tag, __session('post_per_page'), $offset);
				$this->vars['rows'] = $query->result();
			}
			$this->output
				->set_content_type('application/json', 'utf-8')
				->set_output(json_encode($this->vars, JSON_HEX_APOS | JSON_HEX_QUOT))
				->_display();
			exit;
		}
	}
}
