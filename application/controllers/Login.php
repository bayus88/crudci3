<?php
class Login extends CI_Controller {
 
	public function __construct()
	{
		parent::__construct();
		$this->load->helper("url");
		$this->load->model('login_model');
	}
 
	public function index() 
	{
		$this->load->view("login");
	}
 
	public function user()
	{
		$data['login'] = $this->login_model->login();
		redirect(base_url('Supplier/index'));
	}
}