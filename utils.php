<?php

function mysqlConnect()
{
    $connection = new mysqli("localhost", "root", "", "booksystem");

    if($connection->connect_error)
    {
        return null;
    }

    return $connection;
}

function mysqlClose($connection)
{
    $connection->close();
}