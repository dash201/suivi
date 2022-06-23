<h3>Liste tes appartements</h3>
<table>
    <th>Nom appartement</th> <th>gestion locataire</th> <th>listes locataires désactivés</th>
    <?php while($dt):?>
        <td><?=$dt['designation']?></td> <td><a>gerer locataire</a></td> <td><a>voir</a></td>
    <?php endWhile?>
</table>