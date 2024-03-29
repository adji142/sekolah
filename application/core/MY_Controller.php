<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @version    v01
 * @author     yorkoo/satria | satriadirga12@gmail.com | 0857 4134 7609
 * @copyright  (c) 2014-2019
 * @link       https://koyor.web.id
 */

class MY_Controller extends CI_Controller {

	/**
	 * General Variable
	 * @var Array
	 */
	protected $vars = [];

	public function __construct() {
		parent::__construct();
		$timezone = NULL !== __session('timezone') ? __session('timezone') : 'Asia/Jakarta';
		date_default_timezone_set($timezone);
	}

	/**
	 * Date Format Check
	 * @param String $str
	 * @return Boolean
	 */
	public function date_format_check($date) {
       if ( ! _isValidDate($date)) {
            $this->form_validation->set_message('date_format_check', '{field} harus diisi dengan format YYYY-MM-DD');
            return FALSE;
      }
		return TRUE;
	}

	/**
	 * Identity Number Exists ?
	 * @param String $identity_number
	 * @param Integer $id
	 * @return Boolean
	 */
	public function identity_number_exists( $identity_number, $id = 0 ) {
		$this->load->model('m_students');
		$is_exists = $this->m_students->identity_number_exists($identity_number, $id);
		if ( $is_exists ) {
			$this->form_validation->set_message('identity_number_exists', _session('_identity_number') . ' sudah digunakan.');
			return FALSE;
		}
		return TRUE;
	}

	/**
	 * NISN Exists ?
	 * @param String $nisn
	 * @param Integer $id
	 * @return Boolean
	 */
	public function nisn_exists( $nisn, $id = 0 ) {
		$this->load->model('m_students');
		$is_exists = $this->m_students->nisn_exists($nisn, $id);
		if ( $is_exists ) {
			$this->form_validation->set_message('nisn_exists', 'Nomor Induk Siswa Nasional sudah digunakan.');
			return FALSE;
		}
		return TRUE;
	}

	/**
	 * NIK Exists ?
	 * @param String $nik
	 * @param Integer $id
	 * @return Boolean
	 */
	public function nik_exists( $nik, $id = 0 ) {
		$table = $this->uri->segment(2);
		if (__session('user_type') == 'student') $table = 'students';
		if (__session('user_type') == 'employee') $table = 'employees';
		$is_exists = $this->model->nik_exists($nik, $table, $id);
		if ( $is_exists ) {
			$this->form_validation->set_message('nik_exists', 'NIK sudah digunakan.');
			return FALSE;
		}
		return TRUE;
	}
}

require_once(APPPATH.'/core/Public_Controller.php');
require_once(APPPATH.'/core/Admin_Controller.php');
