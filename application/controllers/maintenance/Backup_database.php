<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class Backup_database extends Admin_Controller {

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
	 * Backup Database
	 */
	public function index() {
		$this->load->dbutil();
		$prefs = [
			'format'   => 'zip',
			'filename' => 'backup-database-on-'.date("Y-m-d H-i-s").'.sql'
		];
		$backup =& $this->dbutil->backup($prefs);
		$file_name = 'backup-database-on-'. date("Y-m-d-H-i-s") .'.zip';
		$this->zip->download($file_name);
	}
}
