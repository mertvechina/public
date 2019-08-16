<?php

if (isset($_POST['method'])) {

    require_once('../dbСonnection/database.php');
}

Class guestBook
{
    // получаем всех зарегистрированных пользователей
    public static function getAllUsers()
    {
        $query = "SELECT * FROM `user`";
        $user_row = pdo($query);

        // делаем так чтобы первым ключом стала единица
        // так можно будет на фронтенде обращаться к этому списку пользователей по ключу user_id
        $new_user_row = [];
        foreach ($user_row as $v => $k) {
            $v = $v + 1;
            $new_user_row[$v] = $k;
        }

        return $new_user_row;
    }

    // проверяем заняты ли ник или почта
    public static function getUserByEmailOrName(string $email, string $user_name): array
    {
        $query = "SELECT * FROM `user`";
        $row_user_info = pdo($query);

        foreach ($row_user_info as $v => $k) {
            if (mb_strtoupper($k['user_name']) == mb_strtoupper($user_name) || mb_strtoupper($k['email']) == mb_strtoupper($email)) {

                return $row_user_info[$v];
            }
        }

        return [];
    }

    // проверяем существует ли пользователь
    public static function getUserInfo(string $user_name_or_email, string $password): array
    {
        $query = "SELECT * FROM `user`";
        $user_info = pdo($query);

        // ищем нашего пользователя
        foreach ($user_info as $v => $k) {

            if (mb_strtoupper($k['user_name']) == mb_strtoupper($user_name_or_email)
                || mb_strtoupper($k['email']) == mb_strtoupper($user_name_or_email)
                && $k['password'] == $password) {

                return $user_info[$v];
            }
        }

        return [];
    }

    // регистрация нового пользователя
    public static function addUserInfo(string $email, string $password, string $user_name)
    {
        $now_time = time();

        $query = "INSERT INTO `user` (email, password, user_name, created_at, updated_at) VALUES ('{$email}', '{$password}', '{$user_name}', '{$now_time}', '{$now_time}')";
        pdo($query);
    }

    // меняем информацию о пользователе
    public static function changeUserInfo(int $user_id, string $email, string $password, string $user_name)
    {
        // получаем список атрибутов, в которых могут быть пустые значения - не изменялись пользователем
        // добавляем все в один массив и проверяем каждое значение
        $user_info = [
            'email' => $email,
            'password' => $password,
            'user_name' => $user_name,
        ];

        $new_user_info = [];
        foreach ($user_info as $v => $k) {

            // добавляем в массив не пустые значения
            if ($k != '') {
                $new_user_info[] = "$v = '{$k}'";
            }
        }

        // собираю "руками" в строку, лучше не придумал, сильно не бейте
        $new_user_info = implode(',', $new_user_info);
        $now_time = time();

        $query = "UPDATE `user` SET $new_user_info, updated_at = '{$now_time}' WHERE user_id = '{$user_id}'";
        pdo($query);
    }

    // получаем сообщения чата
    public static function getMessages(int $offset, int $count): array
    {
        $query = "SELECT * FROM `message` WHERE is_deleted = 0 ORDER BY message_id DESC LIMIT $count OFFSET $offset";
        $message_row = pdo($query);

        return $message_row;
    }

    // подгружаем старые сообщения сообщения по скроллу
    public static function loadMessage(int $last_message_id, int $count): array
    {
        $query = "SELECT * FROM `message` WHERE message_id < $last_message_id AND is_deleted = 0 ORDER BY message_id DESC LIMIT $count";
        $message_row = pdo($query);

        return $message_row;
    }

    // добавляем новое сообщение
    public static function addMessage(int $user_id, string $user_name, string $message_text): array
    {
        $now_time = time();
        $expired_time = $now_time + 300;

        $query = "INSERT INTO `message` (user_id, user_name, text, expired_at, created_at, updated_at) 
                     VALUES ('{$user_id}', '{$user_name}', '{$message_text}', '{$expired_time}', '{$now_time}', '{$now_time}')";
        pdo($query);

        // получаем message_id нового сообщения
        $query = "SELECT * FROM `message` WHERE user_id = '{$user_id}' ORDER BY message_id DESC LIMIT 1";
        $message = pdo($query);

        return $message[0];
    }

    // получаем сообщение по его ID
    public static function getMessage(int $message_id): array
    {
        $query = "SELECT * FROM `message` WHERE message_id = '{$message_id}'";
        $message = pdo($query);

        return $message[0];
    }

    // получаем новые сообщения
    public static function getNewMessages(int $message_id, int $count): array
    {
        $query = "SELECT * FROM `message` WHERE message_id > '{$message_id}' AND is_deleted = 0 ORDER BY message_id LIMIT $count";
        $message_row = pdo($query);

        return $message_row;
    }

    // меняем имя автора во всех его сообщениях, небходимо если пользователь сменил ник
    public static function changeAuthorMessage(int $user_id, string $user_name)
    {
        $query = "UPDATE `message` SET user_name = '{$user_name}' WHERE user_id = '{$user_id}'";
        pdo($query);
    }

    // меняем текст сообщения
    public static function editMessage(int $message_id, string $message_text): int
    {
        $now = time();
        $expired_at = $now + 300;

        $query = "UPDATE `message` SET text = '{$message_text}', updated_at = '{$now}', expired_at = '{$expired_at}' WHERE message_id = '{$message_id}'";
        pdo($query);

        return $now;
    }

    // помечаем сообщение как удаленное
    public static function deleteMessage(int $message_id)
    {
        $now = time();

        $query = "UPDATE `message` SET is_deleted = 1, updated_at = '{$now}' WHERE message_id = '{$message_id}'";
        pdo($query);
    }

    // убираем флаг удаления с сообщения
    public static function restoreMessage(int $message_id)
    {
        $now = time();
        $expired_at = $now + 300;

        $query = "UPDATE `message` SET is_deleted = 0, updated_at = '{$now}', expired_at = '{$expired_at}' WHERE message_id = '{$message_id}'";
        pdo($query);
    }

    // обновляем информацию об аватарке пользователя
    public static function changeAvatar(int $user_id, string $avatar)
    {
        $now = time();

        $query = "UPDATE `user` SET avatar = '{$avatar}', updated_at = '{$now}' WHERE user_id = '{$user_id}'";
        pdo($query);
    }

}