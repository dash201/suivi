<?php

namespace models;
use core\model;

class suivis extends model{
    protected $table = 'suivis';

    public function add_suivi($data, $value, $array){
        $req = $this->db->prepare("INSERT INTO $this->table($data) Values ($value) ");
        $req->execute($array);
        return  $this->db->lastInsertId();
    }
}