<!doctype html>

<?php
$server = "localhost";
$db = "formationplus";
$user = "root";
$mdp = "";

try
{
	$bdd = new PDO('mysql:host='.$server.';dbname='.$db.'', $user, $mdp);
}
catch(Exception $e)
{
        die('Erreur : '.$e->getMessage());
}

$Etudiant = $bdd->query('SELECT * FROM Etudiant');
$EtudiantHTML = "";
while ($donnees = $Etudiant->fetch())
{
	$EtudiantHTML .= '<OPTION id="'.$donnees['idEtudiant'].'" value="'.$donnees['idEtudiant'].'">'. $donnees['prenom'].' '.$donnees['nom'] .'</OPTION>';
}
$Etudiant->closeCursor();


$Convention = $bdd->prepare('SELECT * FROM Convention WHERE idConvention = ( SELECT convention FROM Etudiant WHERE idEtudiant = ? )');
if (isset($_POST['nomEtu'])) {
	$Convention->execute(array( $username = $_POST['nomEtu'] ));}
$ConventionHTML = "";
while ($donnees = $Convention->fetch())
{
	$idConvention = $donnees['idConvention'];
	$ConventionHTML .= '<input type="text" name="convention" value="'.$donnees['nom'].'" disabled="disabled" />';
	$Heure = $donnees['nbHeur'];
}
$Convention->closeCursor();


$Message = $bdd->prepare('SELECT * FROM Etudiant WHERE idEtudiant = ?');
if (isset($_POST['nomEtu'])) {
	$Message->execute(array( $username = $_POST['nomEtu'] ));
	$idEtudiant = $_POST['nomEtu'];
}
$MessageHTML = "";
while ($donnees = $Message->fetch())
{
$MessageHTML .= '<textarea id="Message" name="Message" rows="12" cols="70"> 
Bonjour '.$donnees['nom'].' '.$donnees['prenom'].',
	
	
Vous avez suivi '.$Heure.' heures de formation chez FormationPlus.
Pouvez-vous nous retourner ce mail avec la pièce jointe signée.
	
	
	
Cordialement,
FormationPlus</textarea>
'.'<br>'.'
<input id="idEtudiant" name="idEtudiant" type="hidden" value="'.$idEtudiant.'">
<input id="idConvention" name="idConvention" type="hidden" value="'.$idConvention.'">
<input type="submit" name="submit" value="Générer le message">';
}

$Message->closeCursor();
?>

<html lang="fr">
<head>
    <title>Formulaire FormationPlus</title>
    <meta charset="utf-8">
</head>

<body>
<form method="post" action="Index.php">
    <SELECT name="nomEtu" size="1">
	<?php echo $EtudiantHTML ?>
	</SELECT>
	<input type="submit" value="Afficher les infos">
	<?php echo $ConventionHTML ?>
</form>
<form method="post" action="Index.php">
	<?php if (isset($_POST['nomEtu'])) {
		echo $MessageHTML;
	}?>
</form>
	<?php if(isset($_POST['submit'])) {
		$sql='INSERT INTO Attestation (etudiant,convention,message) VALUES ("'.$_POST['idEtudiant'].'","'.$_POST['idConvention'].'","'.$_POST['Message'].'")';
		$bdd->query($sql);
	}?>
</body>
</html>