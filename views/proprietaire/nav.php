<?php
    if($this->connected()):
?>
        <ul>
            <li><a href="<?=WEBROOT?>proprietaire/appartement">ajouter un appartement</a></li>
            <li><a href="<?=WEBROOT?>proprietaire/suivi">suivi des paiements</a></li>
            <li><a href="<?=WEBROOT?>proprietaire/disconnect">Deconnexion</a></li>
        </ul>
<?php
    else:
?>
        <ul>
            <li><a href="<?=WEBROOT?>proprietaire/inscription">inscription</a></li>
            <li><a href="<?=WEBROOT?>proprietaire/connexion">connexion</a></li>
            <li><a href="<?=WEBROOT?>proprietaire/disconnect">Deconnexion</a></li>
        </ul>
<?php
    endif
?>