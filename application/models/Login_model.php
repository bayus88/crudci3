<?php
class Login_model extends CI_Model {
	public function __construct()
	{
		$this->load->database();
	}
 
	public function login() {
 
		$USERNAME = $this->input->POST('USERNAME', TRUE);
		$PASSWORD = md5($this->input->POST('PASSWORD', TRUE));
		$data = $this->db->query("SELECT * from admin where USERNAME='$USERNAME' and PASSWORD='$PASSWORD' LIMIT 1 ");
		return $data->row();
	}
 
}