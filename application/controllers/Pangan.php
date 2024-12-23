<?php
class Pangan extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Pangan_model');
        $this->load->helper(['url', 'form']);
        $this->load->library('form_validation');
    }

    public function index()
    {
        $data['pangan'] = $this->Pangan_model->get_all_pangan();
        $this->load->view('template/header', $data);
        $this->load->view('template/sidebar', $data);
        $this->load->view('Pangan/index', $data);
        $this->load->view('template/topbar', $data);
     
        $this->load->view('template/footer', $data);
        
    }

    public function add()
    {
        $this->form_validation->set_rules('jenis_pangan', 'Jenis Pangan', 'required');

        if ($this->form_validation->run() === FALSE) {
            $data = [
                'judul' => 'Tambah Pangan'
            ];
            $this->load->view('template/header', $data);
            $this->load->view('template/sidebar', $data);
            $this->load->view('Pangan/add');
            $this->load->view('template/topbar', $data);
           
            $this->load->view('template/footer', $data);
            
        } else {
            $data = [
                'Jenis_Pangan' => $this->input->post('jenis_pangan')
            ];

            $this->Pangan_model->insert_pangan($data);
            redirect('pangan');
        }
    }

    public function edit($id)
    {
        $data['pangan'] = $this->Pangan_model->get_pangan_by_id($id);

        $this->form_validation->set_rules('jenis_pangan', 'Jenis Pangan', 'required');

        if ($this->form_validation->run() === FALSE) {
            $data = [
                'judul' => 'Edit'
            ];
            
            $this->load->view('template/header', $data);
            $this->load->view('template/sidebar', $data);
            $this->load->view('Pangan/edit', $data);
            $this->load->view('template/topbar', $data);
            
            $this->load->view('template/footer', $data);
        } else {
            $update_data = [
                'Jenis_Pangan' => $this->input->post('jenis_pangan')
            ];

            $this->Pangan_model->update_pangan($id, $update_data);
            redirect('pangan');
        }
    }

    public function delete($id)
    {
        $this->Pangan_model->delete_pangan($id);
        redirect('pangan');
    }
}
