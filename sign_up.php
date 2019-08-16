<?php

require_once('myGuestBook/testguestbook.php');

$_SESSION = [];

$error = [];
if (count($_POST) > 0) {

    if ($_POST['user_name_or_email'] == '') {
        $error['user_name_or_email'] = 'Please enter User Name';
    }
    if ($_POST['password'] == '') {
        $error['password'] = 'Please enter password';
    }
    if (mb_strlen($_POST['user_name_or_email']) > 40) {
        $error['user_name_or_email'] = 'User Name or Email Max lenght is 40 characters';
    }
    if (mb_strlen($_POST['password']) < 6) {
        $error['password'] = 'Password should contain at least 6 characters';
    }

    if (count($error) < 1) {

        $response = testGuestBook::tryLogIn($_POST['user_name_or_email'], $_POST['password']);

        // проверяем есть ли пользователь с подобными именем или почтой
        // если нет - регистрируем нового пользователя
        if (count($response) < 1) {
            $error['user_name_or_email'] = 'Wrong Name/Email or Password';
        } else {
            $_SESSION['user_id'] = $response['user_id'];
            $_SESSION['user_name'] = $response['user_name'];
            $_SESSION['email'] = $response['email'];
            $_SESSION['password'] = $response['password'];
            $_SESSION['avatar'] = $response['avatar'];

            // если у пользователя есть аватарка
            if ($response['avatar'] != '') {
                $_SESSION['avatar'] = '../avatar/' . $response['avatar'];
            }

            header("location: /index.php");
        }
    }
}

?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Guest Book</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<form class="register_box" method="post">
    <div class="sign_up_box_input_box">
        <div class="register_box_item margin_top10">
            <div class="register_box_error">
                <?php if (isset($error['user_name_or_email'])) : ?>
                    <?php print_r($error['user_name_or_email']) ?>
                <?php endif ?>
            </div>
            <input class="register_box_input" type="text" autofocus name="user_name_or_email"
                   title="Enter User Name or Email" required=""
                   placeholder="User Name or Email"
                <?php if (isset($error['user_name_or_email'])) {
                    print_r(' style="border: 2px solid rgb(255 95 103)" ');
                } ?>
                   value="<?php print_r(isset($_POST['user_name_or_email']) ? $_POST['user_name_or_email'] : '') ?>">
        </div>
        <div class="register_box_item">
            <div class="register_box_error">
                <?php if (isset($error['password'])) : ?>
                    <?php print_r($error['password']) ?>
                <?php endif ?>
            </div>
            <input class="register_box_input" type="password" name="password" title="Enter Password" required=""
                <?php if (isset($error['password']) || isset($error['user_name_or_email'])) {
                    print_r(' style="border: 2px solid rgb(255 95 103)" ');
                } ?>
                   placeholder="Password">
        </div>
        <div class="register_box_item margin_bottom10">
            <input class="register_box_submit" type="submit" value="Submit">
        </div>
    </div>
    <div class="register_box_title_box">
        <div class="register_box_title_sign_up" style="cursor: default;">SIGN UP</div>
        <div class="register_box_title_registration register_box_title_inactive" onclick="redirect()">
            CREATE ACCOUNT
        </div>
    </div>
</form>
</body>
</html>

<script>
    function redirect() {
        window.location = 'registration.php';
    }
</script>
