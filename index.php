<?php

require_once('myGuestBook/testguestbook.php');

if (!isset($_SESSION['user_id'])) {
    header('location: /sign_up.php');
}

$message_row = testGuestBook::getMessages(0);
$user_row = guestBook::getAllUsers();

$_SESSION['user_name'] = $user_row[$_SESSION['user_id']]['user_name'];
$_SESSION['email'] = $user_row[$_SESSION['user_id']]['email'];
$_SESSION['user_role'] = $user_row[$_SESSION['user_id']]['user_role'];

?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Guest Book</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/main.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="allScript/main.js"></script>
</head>
<body>
<div class="main_box_area">
    <div class="main_box_area_user_info">
        <div class="main_box_user_info">
            <div class="register_box_item">
                <div class="register_box_error" id="user_name_error"></div>
                <input class="register_box_input" type="text" id="user_name" title="Enter new User Name"
                       required="" placeholder="<?php print_r($_SESSION['user_name']); ?>" value="">
            </div>
            <div class="register_box_item">
                <div class="register_box_error" id="email_error"></div>
                <input class="register_box_input" type="text" id="email" title="Enter new Email"
                       required="" placeholder="<?php print_r($_SESSION['email']); ?>" value="">
            </div>
            <div class="register_box_item">
                <div class="register_box_error" id="password_error"></div>
                <input class="register_box_input" type="password" id="password" title="Enter new Password" required=""
                       placeholder="Password">
            </div>
            <div class="register_box_item">
                <div class="register_box_error" id="confirm_password_error"></div>
                <input class="register_box_input" type="password" id="confirm_password" title="Confirm new Password"
                       required="" placeholder="Confirm password">
            </div>
            <div class="main_box_item_avatar hover_opacity9 avatar100px" id="user_avatar"
                 style="<?php if (mb_strlen($_SESSION['avatar']) > 0) {
                     print_r("background-image: url('{$_SESSION['avatar']}')");
                 } ?>">
                <input class="file_input" type="file" id="avatar" name="avatar" title="Download avatar"
                       accept="image/jpeg" multiple
                       onchange="sendFiles(this.files)">
            </div>
        </div>
        <div class="main_box_area_user_info_button_area">
            <input class="register_box_submit" type="submit" value="Log out" onclick="redirect()">
            <input class="register_box_submit" type="submit" value="Change user info" onclick="changeUserInfo()">
        </div>
    </div>
    <div class="main_box_area_chat_area">
        <div class="main_box_area_chat_screen" id="message_area">
            <?php if (count($message_row[1]) > 0): ?>
                <?php foreach ($message_row[1] as $v): ?>
                    <?php if ($v['user_id'] == $_SESSION['user_id']): ?>
                        <div class="main_box_area_chat_message_row flex_row_reverse"
                             id="message_row_<?php print_r($v['message_id']) ?>">
                            <div class="main_box_area_chat_message_item flex_row_reverse"
                                 id="<?php print_r($v['message_id']) ?>">
                                <div class="main_box_item_avatar avatar50px"
                                     id="message_avatar_<?php print_r($_SESSION['user_id']) ?>"
                                     style="<?php if (mb_strlen($_SESSION['avatar']) > 0) {
                                         print_r("background-image: url('../avatar/{$_SESSION['avatar']}')");
                                     } ?>">
                                </div>
                                <div class="main_box_area_chat_message">
                                    <div class="main_box_area_chat_message_info flex_row_reverse">
                                        <div class="main_box_area_chat_message_user_name"><?php print_r($v['user_name']) ?></div>
                                        <div class="main_box_area_chat_message_time"
                                             id="time_<?php print_r($v['message_id']) ?>">
                                            <?php print_r(date('H:i', $v['created_at'])) ?></div>
                                        <?php if ($v['expired_at'] > time() || $_SESSION['user_role'] == 0): ?>
                                            <div class="main_box_area_chat_message_edit_area"
                                                 id="edit_pannel_<?php print_r($v['message_id']) ?>">
                                                <div class="main_box_area_chat_message_delete" id="delete"
                                                     onclick="deleteMessage(<?php print_r($v['message_id']) ?>, <?php print_r($v['expired_at']) ?>)"></div>
                                                <div class="main_box_area_chat_message_edit" id="edit"
                                                     onclick="editMessage(<?php print_r($v['message_id']) ?>, <?php print_r($v['expired_at']) ?>)"></div>
                                            </div>
                                        <?php endif; ?>
                                    </div>
                                    <div class="main_box_area_chat_message_area message_text_margin_right"
                                         id="message_<?php print_r($v['message_id']) ?>"><?php print_r($v['text']) ?></div>
                                </div>
                            </div>
                        </div>
                    <?php else: ?>
                        <div class="main_box_area_chat_message_row" id="message_row_<?php print_r($v['message_id']) ?>">
                            <div class="main_box_area_chat_message_item flex_row"
                                 id="<?php print_r($v['message_id']) ?>">
                                <div class="main_box_item_avatar avatar50px" id="message_avatar"
                                     style="<?php if (mb_strlen($user_row[$v['user_id']]['avatar']) > 0) {
                                         print_r("background-image: url('../avatar/{$user_row[$v['user_id']]['avatar']}')");
                                     } ?>">
                                </div>
                                <div class="main_box_area_chat_message">
                                    <div class="main_box_area_chat_message_info flex_row">
                                        <div class="main_box_area_chat_message_user_name"><?php print_r($v['user_name']) ?></div>
                                        <div class="main_box_area_chat_message_time"
                                             id="time_<?php print_r($v['message_id']) ?>">
                                            <?php print_r(date('H:i', $v['created_at'])) ?></div>
                                        <?php if ($_SESSION['user_role'] == 0): ?>
                                            <div class="main_box_area_chat_message_edit_area flex_row_reverse"
                                                 id="edit_pannel_<?php print_r($v['message_id']) ?>">
                                                <div class="main_box_area_chat_message_delete" id="delete"
                                                     onclick="deleteMessage(<?php print_r($v['message_id']) ?>, <?php print_r($v['expired_at']) ?>)"></div>
                                                <div class="main_box_area_chat_message_edit" id="edit"
                                                     onclick="editMessage(<?php print_r($v['message_id']) ?>, <?php print_r($v['expired_at']) ?>)"></div>
                                            </div>
                                        <?php endif; ?>
                                    </div>
                                    <div class="main_box_area_chat_message_area message_text_margin_left"
                                         id="message_<?php print_r($v['message_id']) ?>"><?php print_r($v['text']) ?></div>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>
        <div class="main_box_area_chat_input" id="new_message_area" title="">
            <textarea class="main_box_area_chat_input_text_area" id="new_message" autofocus title=""
                      placeholder="Write a message..." maxlength="200"></textarea>
            <button class="send_button" id="new_message_button" onclick="sendMessage()">SEND</button>
        </div>
    </div>
</div>
</body>
</html>

<script>

    update_info(<?php print_r($_SESSION['user_id']); ?>);

    setInterval(() => update_info(<?php print_r($_SESSION['user_id']); ?>), 5000);

    $(document).ready(() => {

            $("#new_message").keypress(function (event) {
                if (event.keyCode === 13) {
                    $("#new_message_button").click();
                    event.preventDefault();
                }
            });

            $('#message_area').scroll(function () {
                if ($('#message_area').scrollTop() + $('#message_area').height() <= 900) {
                    loadMessage();
                }
            });
        }
    )

    function redirect() {
        window.location = 'sign_up.php';
    }
</script>



