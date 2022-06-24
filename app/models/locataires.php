<?php

namespace models;
use core\model;

class locataires extends model{
    protected $table = 'locataires';

    public function add_loc($data, $value, $array){
        $req = $this->db->prepare("INSERT INTO $this->table($data) Values ($value) ");
        $req->execute($array);
        return  $this->db->lastInsertId();
    }
}