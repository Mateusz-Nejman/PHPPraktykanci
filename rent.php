<?php 
include "header.php";
require_once "utils.php";

$id = $_GET["id"];

$connection = mysqlConnect();

$query = "select * from books where id = {$id}";

$result = $connection->query($query);

$book = $result->fetch_assoc();

$countQuery = "select count(*) as total from userbooks where bookId = {$id}";

$countResult = $connection->query($countQuery);

$count = $countResult->fetch_assoc()["total"];

if(!$book)
{
    $book["name"] = "Nieznany";
    $book["author"] = "Nieznany";
    $book["isbn"] = "Nieznany";
    $book["genre"] = "Nieznany";
}

$userQuery = "select * from users";

$userResult = $connection->query($userQuery);

$users = [];

while($user = $userResult->fetch_assoc())
{
    $users[] = $user;
}

mysqlClose($connection);
?>

<table>
    <tr>
        <th><strong>Nazwa</strong></th>
        <th><strong>Autor</strong></th>
        <th><strong>ISBN</strong></th>
        <th><strong>Kategoria</strong></th>
        <th><strong>Wypożyczone</strong></th>
    </tr>

    <tr>
        <td><?= $book["name"]; ?></td>
        <td><?= $book["author"]; ?></td>
        <td><?= $book["isbn"]; ?></td>
        <td><?= $book["genre"]; ?></td>
        <td><?= $count; ?></td>
    </tr>
</table>

<div>
    <span>Istniejący użytkownik</span>

    <form action="rentNew.php" method="get" class = "formRent">
        <input type="hidden" name="mode" value="exists">
        <input type="hidden" name="book" value="<?= $id; ?>">
        <select name="user">
            <?php foreach($users as $user): ?>
                <option value="<?= $user["id"]; ?>"><?= $user["firstName"]." ".$user["lastName"]; ?></option>
            <?php endforeach; ?>
        </select>
        <input type="submit" value="Wypożycz">
    </form>
</div>

<div>
    <span>Nowy użytkownik</span>

    <form action="rentNew.php" method="get" class = "formRent">
        <input type="hidden" name="mode" value="new">
        <input type="hidden" name="book" value="<?= $id; ?>">
    <div>
            <span>Imię</span>
            <input type="text" name="firstName">
        </div>
        <div>
            <span>Nazwisko</span>
            <input type="text" name="lastName">
        </div>
        <div>
            <span>Adres</span>
            <input type="text" name="address">
        </div>
        
        <input type="submit" value="Wypożycz">
    </form>
</div>

<?php include "footer.php"; ?>