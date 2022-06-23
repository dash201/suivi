<h3>Liste des appartements</h3>
<table>
    <tr><th>Nom appartement</th> <th>gestion locataire</th> <th>listes locataires désactivés</th></tr>
    <?php

 foreach($dt as $d):?>
        <tr><td><?=$d['designation']?></td> <td><a href="<?=WEBROOT?>proprietaire/locataire">gerer locataire</a></td> <td><a>voir</a></td></tr>
    <?php endForeach?>
</table>