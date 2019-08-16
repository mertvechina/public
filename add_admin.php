<?php

header('location: /index.php');

/*
 *  Для регистрации нового админа введите имя и пароль которые он будет использовать при входе
 */

$name = '';         // имя админа
$password = '';     // пароль

$now_time = time();

$query = "INSERT INTO `user` (user_role, email, password, user_name, created_at, updated_at) VALUES (0, '|', '{$password}', '{$name}', '{$now_time}', '{$now_time}')";
pdo($query);

print_r('DONE');