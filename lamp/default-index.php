<?php
//LOGIN
$user='hats';
$password='Eeshies6Ee';
//COnnection
$datab=$user;
$dsn="mysql:host=localhost;charset=UTF8;dbname=$datab";
//Connectionopen
$pdo=new PDO($dsn, $user, $password);
$pdoStat=$pdo->prepare('SELECT * FROM superhats;');
$pdoStat->execute();
$hits=$pdoStat->fetchAll();
foreach($hits as $row) {
 echo "<p>".$row['id']." ".$row['name']." ".$row['color']. "</p>\n";
}
?>

