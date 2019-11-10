<?php 


class Mahasiswa extends CI_Controller{

	public function tambahmhs()
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('nama','nama','required');


		if (!$this->form_validation->run()==false) {
			$this->M_mhs->tambah_mhs();
			redirect('Cmhs/');
		}else {
			redirect('Cmhs/tambahmhs');
		}
	}
	public function editmhs()
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('nama','nama','required');

		if ($this->form_validation->run()!=false) {
			$this->M_mhs->edit_mhs();
			redirect('Cmhs');
		}else{
			redirect('Cmhs/editmhs');
		}
	}

	public function hapusmhs($id) {
		if ($id != ""){
			$this->M_mhs->hapus_mhs($id);
			redirect('Cmhs');
		}else{
			redirect('Cmhs');
		}
	}
	
}

