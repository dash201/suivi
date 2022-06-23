<form action="<?=WEBROOT?>proprietaire/ajouter_appartement" method="post">
    <input type="text" name="designation" placeholder="nom de l'appartement"><br>
    <input type="number" name="chambre" placeholder="nombre de chambre"><br>
    <input type="number" name="douche" placeholder="nombre de douche"><br>
    <input type="number" name="salon" placeholder="nombre de salon"><br>
    <input type="number" name="cuisine" placeholder="nombre de cuisine"><br>
    <select name="wc">
        <option value="sanitaire">sanitaire</option>
        <option value="non sanitaire/autre">non sanitaire/autre</option>
    </select><br>
    <textarea name="info_sup" cols="25%" rows="5%"></textarea><br>
    <input type="submit" name="btn_app" value="Ajouter"> 
</form>