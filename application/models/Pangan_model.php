<?php
// MODEL: application/models/Pangan_model.php
class Pangan_model extends CI_Model {

    public function get_all_pangan() {
        return $this->db->get('Pangan')->result_array();
    }

    public function insert_pangan($data) {
        return $this->db->insert('Pangan', $data);
    }

    public function get_pangan_by_id($id) {
        return $this->db->get_where('Pangan', ['ID_Pangan' => $id])->row_array();
    }

    public function update_pangan($id, $data) {
        $this->db->where('ID_Pangan', $id);
        return $this->db->update('Pangan', $data);
    }

    public function delete_pangan($id) {
        $this->db->where('ID_Pangan', $id);
        return $this->db->delete('Pangan');
    }
}
?>