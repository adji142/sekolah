<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class Readmore extends Public_Controller {

	/**
	 * Class Constructor
	 *
	 * @return Void
	 */
	public function __construct() {
		parent::__construct();
		$this->load->model([
			'public/m_posts'
			, 'm_post_comments'
		]);
	}

	/**
	 * Readmore
	 */
	public function index() {
		$this->load->helper(['text', 'form']);
		$id = _toInteger($this->uri->segment(2));
		if (_isNaturalNumber( $id )) {
			$this->vars['query'] = $this->model->RowObject('id', $id, 'posts');
			if (filter_var((string) $this->vars['query']->is_deleted, FILTER_VALIDATE_BOOLEAN)) {
				redirect(base_url(), 'refresh');
			}
			if ($this->vars['query']->post_status == 'draft') {
				redirect(base_url(), 'refresh');
			}
			if ($this->vars['query']->post_visibility == 'private' && ! $this->auth->hasLogin()) {
				redirect(base_url(), 'refresh');
			}
			$this->m_posts->set_post_counter($id);
			$this->vars['recaptcha_site_key'] = __session('recaptcha_site_key');
			$limit = __session('comment_per_page');
			$total_rows = $this->m_post_comments->get_post_comments($id)->num_rows();
			$this->vars['total_page'] = ceil(_toInteger($total_rows) / _toInteger($limit));
			$this->vars['post_comments'] = $this->m_post_comments->get_post_comments($id, $limit);
			$this->vars['page_title'] = $this->vars['query']->post_title;
			$this->vars['post_type'] = 'post';
			if ($this->vars['query']->post_type === 'page') {
				$this->vars['post_type'] = 'page';
			}
			$this->vars['post_author'] = $this->model->RowObject('id', $this->vars['query']->post_author, 'users')->user_full_name;
			$this->vars['content'] = 'themes/'.theme_folder().'/single-post';
			$this->load->view('themes/'.theme_folder().'/index', $this->vars);
		} else {
			show_404();
		}
	}
}
