<?php
namespace core;

trait auth{
    public function connected(){
        if(isset($_SESSION['id'])){
            return True;
        }else{
            return False;
        }
    }

    public function disconnect(){
        session_destroy();
        header('location:'.WEBROOT.'proprietaire/index');
    }
}