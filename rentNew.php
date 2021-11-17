<?php
require_once "utils.php";

$connection = mysqlConnect();
$mode = $_GET["mode"];
$bookId = $_GET["book"];
$userId = $_GET["user"];

if($mode == "new")
{
    $firstName = $_GET["firstName"];
    $lastName = $_GET["lastName"];
    $address = $_GET["address"];

    $result = $connection->query("insert into users (firstName, lastName, address) values('{$firstName}','{$lastName}','{$address}')");

    $userQuery = $connection->query("select id from users where firstName = '{$firstName}' and lastName = '{$lastName}' and address='{$address}'");

    $user = $userQuery->fetch_assoc();

    if($user !== null)
    {
        $userId = $user["id"];
    }
}

if($userId !== null && $bookId !== null)
{
    $result = $connection->query("insert into userbooks (userId, bookId, date) values ('{$userId}', '{$bookId}', '".date('Y-m-d H:i:s')."')");
}

if($result) {
    header("Location:/rentResult.php?success=true");
    exit();
}
    
header("Location:/rentResult.php?success=false");
exit();

mysqlClose($connection);
?>