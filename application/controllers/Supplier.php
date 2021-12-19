<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Supplier extends CI_Controller {

	 function __construct()
    {
        parent::__construct();
        $this->load->model("supplier_model");
        $this->load->library('form_validation');
	}

	 function index()
	{
		$data['supplier'] = $this->supplier_model->getAll();
		$this->load->view('template/header');
		$this->load->view('supplier/index',$data);
		$this->load->view('template/footer');
	}

	 function create()
	{
		$this->load->view('template/header');
		$this->load->view('supplier/create');
		$this->load->view('template/footer');
	}

	 function save()
	{
		$this->form_validation->set_rules('NAMA_SUPPLIER','Nama Supplier','required');
		$this->form_validation->set_rules('ALAMAT','Alamat','required');
		$this->form_validation->set_rules('KOTA','Kota','required');
		$this->form_validation->set_rules('TELP','Telpon','required');
		if ($this->form_validation->run()==true)
        {
			$data['NAMA_SUPPLIER'] = $this->input->post('NAMA_SUPPLIER');
			$data['ALAMAT'] = $this->input->post('ALAMAT');
			$data['KOTA'] = $this->input->post('KOTA');
			$data['TELP'] = $this->input->post('TELP');
			$this->supplier_model->save($data);
			redirect('supplier');
		}
		else
		{
			$this->load->view('template/header');
			$this->load->view('supplier/create');
			$this->load->view('template/footer');
		}
	}

	function edit($KODE_SUPPLIER)
	{
		$data['supplier'] = $this->supplier_model->getById($KODE_SUPPLIER);
		$this->load->view('template/header');
		$this->load->view('supplier/edit',$data);
		$this->load->view('template/footer');
	}

	 function update()
	{
		$this->form_validation->set_rules('NAMA_SUPPLIER','Nama Supplier','required');
		$this->form_validation->set_rules('ALAMAT','Alamat','required');
		$this->form_validation->set_rules('KOTA','Kota','required');
		$this->form_validation->set_rules('TELP','Telpon','required');
		if ($this->form_validation->run()==true)
        {
		 	$KODE_SUPPLIER = $this->input->post('KODE_SUPPLIER');
			 $data['NAMA_SUPPLIER'] = $this->input->post('NAMA_SUPPLIER');
			 $data['ALAMAT'] = $this->input->post('ALAMAT');
			 $data['KOTA'] = $this->input->post('KOTA');
			 $data['TELP'] = $this->input->post('TELP');
			$this->supplier_model->update($data,$KODE_SUPPLIER);
			redirect('supplier');
		}
		else
		{
			$kd_suppllier = $this->input->post('kd_supplier');
			$data['supplier'] = $this->supplier_model->getById($kd_supplier);
			$this->load->view('template/header');
			$this->load->view('supplier/edit',$data);
			$this->load->view('template/footer');
		}
	}

	function delete($KODE_SUPPLIER)
	{
		$this->supplier_model->delete($KODE_SUPPLIER);
		redirect('supplier');
	}

}
