<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class Backup_apps extends Admin_Controller {

	/**
	 * Class Constructor
	 *
	 * @return Void
	 */
   public function __construct() {
      parent::__construct();
      if (__session('user_type') !== 'super_user') return redirect(base_url());
   }

	/**
	 * Backup App
	 */
	public function index() {
		$this->load->library('zip');
		$this->zip->read_dir(FCPATH, false);
		$file_name = 'backup-app-on-'. date("Y-m-d-H-i-s") .'.zip';
		$this->zip->download($file_name);
	}
}
