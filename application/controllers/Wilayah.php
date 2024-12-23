<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Wilayah extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('WilayahModel');
    }

    public function index()
    {
        $data['wilayah'] = $this->WilayahModel->getAllWilayah();
        $this->load->view('template/header', $data);
        $this->load->view('template/sidebar', $data);
        $this->load->view('wilayah/index', $data);
        $this->load->view('template/topbar', $data);
        $this->load->view('template/footer', $data);
    }

    public function create()
    {
        $this->load->view('wilayah/create');
    }

    public function store()
    {
        $data = [
            'Nama_Wilayah' => $this->input->post('Nama_Wilayah'),
            'Provinsi' => $this->input->post('Provinsi')
        ];
        $this->WilayahModel->addWilayah($data);
        redirect('wilayah');
    }

    public function edit($id)
    {
        $data['wilayah'] = $this->WilayahModel->getWilayahById($id);
        $this->load->view('wilayah/edit', $data);
    }

    public function update($id)
    {
        $data = [
            'Nama_Wilayah' => $this->input->post('Nama_Wilayah'),
            'Provinsi' => $this->input->post('Provinsi')
        ];
        $this->WilayahModel->updateWilayah($id, $data);
        redirect('wilayah');
    }

    public function delete($id)
    {
        $this->WilayahModel->deleteWilayah($id);
        redirect('wilayah');
    }
}
