<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class Search extends Public_Controller {

	/**
	 * Class Constructor
	 *
	 * @return Void
	 */
	public function __construct() {
		parent::__construct();
		$this->load->helper('text');
		$this->load->model('public/m_posts');
	}

	/**
	 * Index
	 * @return Void
	 */
	public function index() {
		if ($_POST) {
			$this->load->library('form_validation');
			$this->form_validation->set_rules('keyword', 'Kata Kunci Pencarian', 'trim|required|max_length[100]');
			if (FALSE === $this->form_validation->run()) {
				$this->session->unset_userdata('keyword');
				$this->vars['query'] = FALSE;
				$this->vars['page_title'] = validation_errors();
			} else {
				$keyword = trim(strip_tags($this->input->post('keyword', true)));
				$this->session->set_userdata('keyword', $keyword);
				$this->vars['page_title'] = 'Hasil pencarian dengan kata kunci "'.$this->session->keyword.'"';
				$this->vars['query'] = $this->m_posts->search($keyword);
			}
			$this->vars['content'] = 'themes/'.theme_folder().'/search-results';
			$this->load->view('themes/'.theme_folder().'/index', $this->vars);
		} else {
			return redirect(base_url());
		}
	}
}
