<?php 
include "header.php";
require_once "utils.php";

$connection = mysqlConnect();

$users = [];
$query = "select * from users";
$result = $connection->query($query);

if($result->num_rows > 0)
{
    while($user = $result->fetch_assoc())
    {
        $userBookResult = $connection->query("select count(*) as total from userbooks where userId = {$user["id"]}");
        $userBookCount = $userBookResult->fetch_assoc()["total"];

        $user["count"] = $userBookCount;
        $users[] = $user;
    }
}

mysqlClose($connection);
?>
<table>
    <tr>
        <th><strong>Imię</strong></th>
        <th><strong>Nazwisko</strong></th>
        <th><strong>Adres</strong></th>
        <th><strong>Wypożyczone książki</strong></th>
    </tr>

    <?php foreach($users as $user): ?>

        <tr>
            <td><?php echo $user["firstName"]; ?></td>
            <td><?php echo $user["lastName"]; ?></td>
            <td><?php echo $user["address"]; ?></td>
            <td><?php echo $user["count"]; ?></td>
        </tr>

    <?php endforeach;?>
</table>
<?php include "footer.php"; ?>