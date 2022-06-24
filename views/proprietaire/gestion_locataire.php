<form action="<?=WEBROOT?>proprietaire/ajouter_locataire" method="post">
    <input type="email" name="mail" placeholder="email locataire"><br>
    <input type="password" name="mdp" placeholder="mot de passe"><br>
    <input type="hidden" name="hide" value="<?=$apt?>">
    <input type="submit" name="btn" value="creer">
</form>