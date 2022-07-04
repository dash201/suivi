<?php if(empty($dt)):?>
    <form action="<?=WEBROOT?>proprietaire/ajouter_locataire" method="post">
        <input type="email" name="mail" placeholder="email locataire"><br>
        <input type="password" name="mdp" placeholder="mot de passe"><br>
        <input type="hidden" name="hide" value="<?=$apt?>">
        <input type="submit" name="btn" value="creer">
    </form>
<?php else:?>
    <div>
        <h3>configuration:</h3>
        <h5>Nom: <?=$dt['nom']?></h5>
        <h5>Prenom: <?=$dt['prenom']?></h5>
        <h5>email: <?=$dt['mail']?></h5>
        <h5>tel: <?=$dt['tel']?></h5>
        <h5>statut du compte: <?=$dt['statut_loc']?></h5>
    </div>
    <div>
        <form action="<?=WEBROOT?>proprietaire/modifier_echeance" method="post">
            <h3>Date echance de la location</h3>
            <input type="date" name="date" id=""><br>
            <input type="hidden" name="hide" value="<?=$dt['id_loc']?>"><br>
            <input type="submit" name="btn" value="valider">
        </form>
    </div>

    <a>editer une facture</a>
<?php endif?>