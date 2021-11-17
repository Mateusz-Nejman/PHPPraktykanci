<?php 

include "header.php";

$isSuccess = isset($_GET["success"]) && $_GET["success"] == true;

echo ($isSuccess ? 'Pomyślnie wypożyczono. <a href="/index.php">Wróć</a>' : 'Wystąpił błąd podczas wypożyczania. <a href="/index.php">Wróć</a>');
include "footer.php";

?>