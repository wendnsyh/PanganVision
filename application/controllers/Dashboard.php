<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Pangan_model');
    }

    public function index() {
        // Ambil data dari model
        $data = [
            'judul' => 'Dashboard'
        ];
        
        // Load views dengan data
        $this->load->view('template/header', $data);
        $this->load->view('template/sidebar', $data);
        $this->load->view('template/topbar', $data);
        $this->load->view('template/footer', $data);
    }
    
}
