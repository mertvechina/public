<?php

if (isset($_POST['method'])) {

    require_once('../config.php');
} else {

    require_once('config.php');
}

// подключение к базе данных
function pdo(string $query)
{
    $dsn = "mysql:host=" . HOST . "; dbname=" . DBNAME;
    $opt = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
        PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",
    ];

    // пробуем подключиться
    try {
        $dsh = new PDO($dsn, USER, PASSWORD, $opt);
    } catch (PDOException $e) {
        die('Не удалось подкючиться к базе данных - ' . $e->getMessage());
    }

    // подготавливаем запрос и запускаем выполнение
    $sth = $dsh->prepare($query);
    $sth->execute();

    // получим массив строк - результат запроса к базе
    $result = $sth->fetchAll();

    return $result;
}


