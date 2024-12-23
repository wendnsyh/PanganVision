<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class WilayahModel extends CI_Model {
    public function getAllWilayah() {
        return $this->db->get('wilayah')->result();
    }

    public function getWilayahById($id) {
        return $this->db->get_where('wilayah', ['ID_Wilayah' => $id])->row();
    }

    public function addWilayah($data) {
        return $this->db->insert('wilayah', $data);
    }

    public function updateWilayah($id, $data) {
        return $this->db->where('ID_Wilayah', $id)->update('wilayah', $data);
    }

    public function deleteWilayah($id) {
        return $this->db->where('ID_Wilayah', $id)->delete('wilayah');
    }
}
?>