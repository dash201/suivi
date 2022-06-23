<form action="<?=WEBROOT?>proprietaire/connexion" method="post">
    <input type="email" name="mail" placeholder="email"><br>
    <input type="password" name="mdp" placeholder="mot de passe"><br>
    <input type="submit" name="btn" value="se connecter">
</form>
<?=isset($msg)?$msg:''?>