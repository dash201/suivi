<?php
namespace core;

abstract class controller{
    var $vars = [];
    var $layout = 'default';

    public function set($tab){
        $this->vars = array_merge($this->vars,$tab);
    }

    public function render(string $filename){
        extract($this->vars);
        ob_start();
        $dir_name = get_class($this);
        $dir_name = explode('\\', $dir_name); 
        require(ROOT.'views/'.end($dir_name).'/'.$filename.'.php');
        $content = ob_get_clean();
        if($this->layout == false){
            echo $content;
        }else{
            require(ROOT.'views/layout/'.$this->layout.'.php'); 
        }
    }

    public function loadModel($name){
        require_once(ROOT.'models/'.strtolower($name).'.php');
        $this->$name = new $name();
    }

}