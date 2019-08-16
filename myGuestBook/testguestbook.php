<?php

// я оооочень извиняюсь за вот это вот все
// но если это убрать то ответом в ajax получаю портянку с кучей ошибок о неправильном подключении
if (isset($_POST['method'])) {

    require_once('../dbСonnection/database.php');
    require_once('../controllers/guestbook.php');

} else {

    require_once('dbСonnection/database.php');
    require_once('controllers/guestbook.php');
}

class testGuestBook
{
    const MAX_MESSAGES_COUNT = 40;

    // попытка зарегистрировать нового пользователя
    public static function tryRegister(string $user_name, string $email, string $password): array
    {
        // проверям существует ли польззоватеть с именем - name
        $user_info = guestBook::getUserByEmailOrName($email, $user_name);

        // если нашли пользователя отдаем пустоту на фронтенд
        if (count($user_info) > 0) {

            return [];
        }

        // добавляем соль к паролю и хешируем пароль пользователя
        $password = sha1($password . SALT);

        // регистрируем нового пользователя
        guestBook::addUserInfo($email, $password, $user_name);

        // проверяем что зарегистрировали нового пользователя и получаем user_id пользователя
        $user_info = guestBook::getUserInfo($email, $password);

        // если нашли пользователя отдаем - ok
        if (count($user_info) > 0) {

            return $user_info;
        }

        return $user_info;
    }

    // попытка авторизации пользователя
    public static function tryLogIn(string $email, string $password): array
    {
        // добавляем соль к паролю и хешируем пароль пользователя
        $password = sha1($password . SALT);

        // проверям существует ли польззоватеть с именем - name
        $user_info = guestBook::getUserInfo($email, $password);

        return $user_info;

    }

    // меняем информацию о пользователе
    public static function changeUserInfo(string $user_name, string $email, string $password): array
    {

        // если пользователь хочет поменять пароль
        // добавляем соль к паролю и хешируем пароль пользователя
        if ($password != '') {
            $password = sha1($password . SALT);
        }

        // проверяем что нет пользователя с такими именем или почтой
        $user_info = guestBook::getUserByEmailOrName($email, $user_name);

        // если нашли пользователя отдаем пустоту на фронтенд
        if (count($user_info) > 0) {

            return [0, 'Name or Email already exist'];
        }

        // меняем информацию о пользователе
        guestBook::changeUserInfo($_SESSION['user_id'], $email, $password, $user_name);

        // если пользователь сменил имя, меняем имя автора у всех его сообщений
        if ($user_name != '') {
            guestBook::changeAuthorMessage($_SESSION['user_id'], $user_name);
        }

        return [1, 'User info successful change'];
    }

    // получаем сообщения чата
    public static function getMessages(int $offset, int $count = self::MAX_MESSAGES_COUNT): array
    {
        $message_row = guestBook::getMessages($offset, $count + 1);

        // если получили менее 50 сообщений передаем на фронтенд 0 - флаг запрета дальнейшей пагинации
        if (count($message_row) < 40) {

            return [0, $message_row];
        }

        // убираем 21ое сообщение
        unset($message_row[40]);

        return [1, $message_row];
    }

    // получаем старые сообщения чата
    public static function loadMessages(int $last_message_id, int $count = self::MAX_MESSAGES_COUNT): array
    {
        $message_row = guestBook::loadMessage($last_message_id, $count + 1);

        // если получили менее 50 сообщений передаем на фронтенд 0 - флаг запрета дальнейшей пагинации
        if (count($message_row) < 40) {

            return [0, $message_row];
        }

        // убираем 21ое сообщение
        unset($message_row[40]);

        return [1, $message_row];
    }

    // добавляем новое сообщение
    public static function addMessage(string $message_text): array
    {
        $message = guestBook::addMessage($_SESSION['user_id'], $_SESSION['user_name'], $message_text);

        return $message;
    }

    // получаем новые сообщения
    public static function getNewMessages(int $message_id, int $count = self::MAX_MESSAGES_COUNT)
    {
        $message_row = guestBook::getNewMessages($message_id, $count);

        return $message_row;
    }

    // восстанавливаем сообщение
    public static function restoreMessage(int $message_id)
    {

        guestBook::restoreMessage($message_id);

        // получаем информацию о восстановленном сообщении и отдаем на фронтенд
        $message = guestBook::getMessage($message_id);

        return $message;
    }

    // сохраняем аватар пользователя
    public static function uploadAvatar()
    {
        $upload_dir = '../avatar/';

        // создаем директорию для аватарок пользователей, если ее еще нет
        if (!is_dir($upload_dir)) {
            mkdir($upload_dir, 0700);
        }

        // полный путь расположения аватарки
        $upload_file = $upload_dir . basename($_FILES['avatar']['name']);

        // если не смогли скачать аватарку возвращаем пустой массив
        if (!move_uploaded_file($_FILES['avatar']['tmp_name'], $upload_file)) {
            return [];
        }

        // обновляем информацию о пользователе - новая аватарка
        guestBook::changeAvatar($_SESSION['user_id'], $_FILES['avatar']['name']);

        $_SESSION['avatar'] = $upload_file;

        // вернем на фронт путь до файла
        return $upload_file;
    }
}
