<?php 
namespace controllers;
use core\controller;
use core\auth;

class Example extends controller{

    use auth;

    public function index(){
        $t['offre'] = $this->Offre->findAll();
        $this->set($t);
        $this->render('index');
    }
}