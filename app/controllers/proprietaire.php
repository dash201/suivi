<?php 
namespace controllers;
use core\auth;
use core\controller;
use models\appartements;
use models\proprietaires;
use models\locataires;
use models\suivis;

class proprietaire extends controller{

    use auth;

    public function index(){
        $this->render('connexion');
    }

    public function conn($eco){
        $e = ['msg'=>$eco];
        $this->set($e);
        $this->render('connexion');
    }

    public function inscription(){
        $this->render('register');
    }

    public function register(){
        $model = new proprietaires();
        $req = $model->add('?,?,?,?,?', array($_POST['nom'],$_POST['prenom'],$_POST['tel'], $_POST['mail'],password_hash($_POST['mdp'], PASSWORD_DEFAULT)));
        header('location:'.WEBROOT.'proprietaire/index');
    }

    public function connexion(){
        $model = new proprietaires();
        if(isset($_POST['btn'])){
            $req = $model->findWhere('mail=?',[$_POST["mail"]]);
            $req = $req->fetch();
            if(password_verify($_POST['mdp'],$req['mdp'])){
                $_SESSION['id']=$req['id_pro'];
                header('location:'.WEBROOT.'proprietaire/dashboard');
            }else{
                header('location:'.WEBROOT.'proprietaire/conn/entrer_mot_passs');
            }
        }else{
            $this->render('connexion');
        }
    }

    public function dashboard(){
        if($this->connected()){
            $db = new appartements();
            $req = $db->findWhere('id_pro=?', [$_SESSION['id']]);
            $e["dt"] = $req->fetchAll();
            $this->set($e);
            $this->render('dashboard');
        }
    }

    public function appartement(){
        if($this->connected()){
            $this->render('appartement');
        }
    }

    public function ajouter_appartement(){
        if($this->connected()){
            $d = new appartements();
            $d->add('?,?,?,?,?,?,?,?', array($_POST['designation'],$_POST['chambre'],$_POST['douche'],$_POST['salon'],$_POST['cuisine'],$_POST['wc'],$_POST['info_sup'],$_SESSION['id']));
            header('location:'.WEBROOT.'proprietaire/dashboard');
        }
    }

    public function locataire(string $param){
        if($this->connected()){
            $model = new locataires();
            $dt = $model->findWhere('id_apt=? and statut_loc="activer"', [$param]);
            $e['dt']=$dt->fetch();
            $e['apt'] = $param;
            $this->set($e);
            $this->render('gestion_locataire');
        }
    }

    public function ajouter_locataire(){
        if($this->connected()){
            $model = new locataires(); $suivi = new suivis();
            $req = $model->add_loc('statut_loc,mail, mdp,id_pro,id_apt','?,?,?,?,?', ['activer',$_POST["mail"], password_hash($_POST["mdp"], PASSWORD_DEFAULT), $_SESSION["id"], $_POST["hide"]]);
            $suivi->add_suivi('date_deb, statut_svs, id_pro,id_loc','?,?,?,?',[date('Y-m-d'),'paye',$_SESSION['id'],$req]);
            header('location:'.WEBROOT.'proprietaire/locataire/'.$_POST['hide']);
        }
    }

    public function modifier_echeance(){
        if($this->connected()){
            $suivi = new suivis();
            $suivi->update('date_ech=?', 'id_loc=?', [$_POST['date'],$_POST['hide']]);
            header('location:'.WEBROOT.'proprietaire/dashboard');
        }
    }

    public function de(){
        $model = new appartements();
        echo $model->show_fields();
    }
}