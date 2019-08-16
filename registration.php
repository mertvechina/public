<?php

require_once('myGuestBook/testguestbook.php');

$error = [];
if (count($_POST) > 0) {
    if ($_POST['user_name'] == '') {
        $error['user_name'] = 'Please enter User Name';
    }
    if ($_POST['email'] == '') {
        $error['email'] = 'Please enter Email';
    }
    if ($_POST['password'] == '') {
        $error['password'] = 'Please enter password';
    }
    if ($_POST['confirm_password'] == '') {
        $error['confirm_password'] = 'Please confirm password';
    }
    if (mb_strlen($_POST['user_name']) > 40) {
        $error['user_name'] = 'User Name Max lenght is 40 characters';
    }
    if (mb_strlen($_POST['password']) < 6) {
        $error['password'] = 'Password should contain at least 6 characters';
    }
    if ($_POST['password'] != $_POST['confirm_password']) {
        $error['confirm_password'] = 'Your confirm password is not match password';
    }

    if (count($error) < 1) {

        $response = testGuestBook::tryRegister($_POST['user_name'], $_POST['email'], $_POST['password']);

        // проверяем есть ли пользователь с подобными именем или почтой
        // если нет - регистрируем нового пользователя
        if (count($response) < 1) {
            $error['user_name'] = 'User with this name or email already registered';
        } else {
            $_SESSION['user_id'] = $response['user_id'];
            $_SESSION['user_name'] = $response['user_name'];
            $_SESSION['email'] = $response['email'];
            $_SESSION['password'] = $response['password'];
            $_SESSION['avatar'] = $response['avatar'];
            header('location: /index.php');
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
    <div class="register_box_input_box">
        <div class="register_box_item">
            <div class="register_box_error">
                <?php if (isset($error['user_name'])) : ?>
                    <?php print_r($error['user_name']) ?>
                <?php endif ?>
            </div>
            <input class="register_box_input" type="text" autofocus name="user_name" title="Enter User Name" required=""
                   placeholder="User Name"
                <?php if (isset($error['user_name'])) {
                    print_r(' style="border: 2px solid rgb(255 95 103)" ');
                } ?>
                   value="<?php print_r(isset($_POST['user_name']) ? $_POST['user_name'] : '') ?>">
        </div>
        <div class="register_box_item">
            <div class="register_box_error">
                <?php if (isset($error['email'])) : ?>
                    <?php print_r($error['email']) ?>
                <?php endif ?>
            </div>
            <input class="register_box_input" type="text" name="email" title="Enter Email" required=""
                   placeholder="User Email"
                <?php if (isset($error['email'])) {
                    print_r(' style="border: 2px solid rgb(255 95 103)" ');
                } ?>
                   value="<?php print_r(isset($_POST['email']) ? $_POST['email'] : '') ?>">
        </div>
        <div class="register_box_item">
            <div class="register_box_error">
                <?php if (isset($error['password'])) : ?>
                    <?php print_r($error['password']) ?>
                <?php endif ?>
            </div>
            <input class="register_box_input" type="password" name="password" title="Enter Password" required=""
                <?php if (isset($error['password'])) {
                    print_r(' style="border: 2px solid rgb(255 95 103)" ');
                } ?>
                   placeholder="Password">
        </div>
        <div class="register_box_item">
            <div class="register_box_error">
                <?php if (isset($error['confirm_password'])) : ?>
                    <?php print_r($error['confirm_password']) ?>
                <?php endif ?>
            </div>
            <input class="register_box_input" type="password" name="confirm_password" title="Confirm Your Password"
                   required=""
                <?php if (isset($error['confirm_password'])) {
                    print_r(' style="border: 2px solid rgb(255 95 103)" ');
                } ?>
                   placeholder="Confirm password">
        </div>
        <div class="register_box_item">
            <input class="register_box_submit" type="submit" value="Submit">
        </div>
    </div>
    <div class="register_box_title_box">
        <div class="register_box_title_sign_up register_box_title_inactive" onclick="redirect()">SIGN UP</div>
        <div class="register_box_title_registration" style="cursor: default;">CREATE ACCOUNT</div>
    </div>
</form>
</body>
</html>

<script>
    function redirect() {
        window.location = 'sign_up.php';
    }
</script>
