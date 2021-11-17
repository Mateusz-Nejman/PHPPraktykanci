<?php 
include "header.php";
require_once "utils.php";

$connection = mysqlConnect();

$books = [];
$query = "";

if(isset($_GET["name"]) || isset($_GET["author"]) || isset($_GET["isbn"]) || isset($_GET["genre"]))
{
    $name = $_GET["name"];
    $author = $_GET["author"];
    $isbn = $_GET["isbn"];
    $genre = $_GET["genre"];

    $selects = [];

    if($name != null)
    {
        $selects["name"] = $name;
    }

    if($author != null)
    {
        $selects["author"] = $author;
    }

    if($isbn != null)
    {
        $selects["isbn"] = $isbn;
    }

    if($genre != null)
    {
        $selects["genre"] = $genre;
    }

    $where = implode(", ", array_map(
        function ($value, $key) {
            return "{$key} = \"{$value}\"";
        },
        $selects,
        array_keys($selects)
    ));

    $query = "select * from books where {$where}";
}
else
{
    $query = "select * from books";
}

$result = $connection->query($query);

$books = [];

if($result->num_rows > 0)
{
    while($book = $result->fetch_assoc())
    {
        $books[] = $book;
    }
}

mysqlClose($connection);
?>

<div>
    <span>Szukaj</span>

    <form action="books.php" method="get" class = "formSearch">
        <div>
            <span>Nazwa</span>
            <input type="text" name="name">
        </div>
        <div>
            <span>Autor</span>
            <input type="text" name="author">
        </div>
        <div>
            <span>ISBN</span>
            <input type="text" name="isbn">
        </div>
        <div>
            <span>Gatunek</span>
            <input type="text" name="genre">
        </div>
        <input type="submit" value="Szukaj">
    </form>
</div>

<table>
    <tr>
        <th><strong>Nazwa</strong></th>
        <th><strong>Autor</strong></th>
        <th><strong>ISBN</strong></th>
        <th><strong>Kategoria</strong></th>
        <th><strong>Dodaj</strong></th>
    </tr>

    <?php foreach($books as $book): ?>

        <tr>
            <td><?php echo $book["name"]; ?></td>
            <td><?php echo $book["author"]; ?></td>
            <td><?php echo $book["isbn"]; ?></td>
            <td><?php echo $book["genre"]; ?></td>
            <td><a href="rent.php?id=<?php echo $book["id"]; ?>">Wypożycz</a></td>
        </tr>

    <?php endforeach;?>
</table>
<?php include "footer.php"; ?>