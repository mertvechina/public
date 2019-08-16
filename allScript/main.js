var user_row;
var user_id;
// получаем список пользователей и новые сообщения
// проверка времени редактирования сообщения
function update_info(id) {
    user_id = id;
    // получаем пользователей
    $.ajax({
        url: 'magic/startMagick.php',
        type: 'POST',
        data: {
            class: 'guestBook',
            method: 'getAllUsers',
        },
        success: function (response) {
            user_row = JSON.parse(response);
        }
    });
    var stranger_message = $('.flex_row');
    var stranger_message_id = stranger_message.prop('id');
    // если первичная подгрузка с серва выдала сообщения только текущего пользователя
    if (typeof stranger_message_id === "undefined") {
        // подгрузим пачку старых сообщений
        // запустим функцию заново
        setTimeout(function () { return loadMessage(); }, 1000);
        return;
    }
    var last_message = $('.main_box_area_chat_message_item');
    var last_message_id = last_message.prop('id');
    var sub = last_message_id - stranger_message_id;
    // если последнее сообщение наше, то будем подгружать новые сообщения по id последнего чужого сообщения
    // костыль из-за подгрузки по таймеру, чтобы не потерять чужие сообщения
    if (stranger_message_id < last_message_id) {
        last_message_id = stranger_message_id;
    }
    // так как сообщения подгружаются пачками по 20шт
    // если пользователь успел наспамить 20+ сообщений подряд и больше никто не писал
    // подгружаем больше чем 20 сообщений
    // если пользователь продолжит спамить то это число так и будет расти, не знаю что с этим делать
    var message_count = 20;
    if ((sub / 20) >= 1) {
        var count = Math.floor(sub / 20);
        message_count = message_count * (count + 1);
    }
    // получаем новые сообщения
    $.ajax({
        url: 'magic/startMagick.php',
        type: 'POST',
        data: {
            class: 'testGuestBook',
            method: 'getNewMessages',
            0: last_message_id,
            1: message_count,
        },
        success: function (response) {
            response = JSON.parse(response);
            // если нет новых сообщений выходим
            if (response[sub] === undefined) {
                return;
            }
            var message_item;
            $('div#message_row:lt(' + sub + ')').remove();
            $(response).each(function (index, message_info) {
                var dt = new Date(message_info['created_at'] * 1000);
                var hours = dt.getHours();
                var minutes = dt.getMinutes();
                // фиксим отрисовку времени(часы) xDD
                if (hours < 10) {
                    hours = '0' + hours;
                }
                // фиксим отрисовку времени(минуты) xDD
                if (minutes < 10) {
                    minutes = '0' + minutes;
                }
                var time = hours + ":" + minutes;
                var avatar = '';
                if (user_row[message_info['user_id']]['avatar'] != '') {
                    avatar = "background-image: url('../avatar/" + user_row[message_info['user_id']]['avatar'] + "')";
                }
                var edit;
                // если время на редактирование еще не закончилось отображаем элементы редактирования
                if (message_info['expired_at'] > Date().valueOf()) {
                    edit = '<div class="main_box_area_chat_message_edit_area" id="edit_pannel_' + message_info['message_id'] + '">' +
                        '<div class="main_box_area_chat_message_delete" onclick="deleteMessage(' + message_info['message_id'] + ',' + message_info['expired_at'] + ')"></div>' +
                        '<div class="main_box_area_chat_message_edit" onclick="editMessage(' + message_info['message_id'] + ',' + message_info['expired_at'] + ')"></div>' +
                        '</div>';
                }
                if (user_id == message_info['user_id']) {
                    message_item = $('<div class="main_box_area_chat_message_row flex_row_reverse" id="message_row_' + message_info['message_id'] + '">' +
                        '<div class="main_box_area_chat_message_item flex_row_reverse"' +
                        'id="' + message_info['message_id'] + '">' +
                        '<div class="main_box_item_avatar avatar50px" id="message_avatar_' + user_id + '"' +
                        'style=\"' + avatar + '\">' +
                        '</div>' +
                        '<div class="main_box_area_chat_message">' +
                        '<div class="main_box_area_chat_message_info flex_row_reverse">' +
                        '<div class="main_box_area_chat_message_user_name">' + message_info['user_name'] + '</div>' +
                        '<div class="main_box_area_chat_message_time">' + time + '</div>' +
                        edit +
                        '</div>' +
                        '<div class="main_box_area_chat_message_area message_text_margin_right"' +
                        'id="message_' + message_info['message_id'] + '">' + message_info['text'] + '</div>' +
                        '</div></div></div>');
                }
                else {
                    message_item = $('<div class="main_box_area_chat_message_row" id="message_row_' + message_info['message_id'] + '">' +
                        '<div class="main_box_area_chat_message_item flex_row"' +
                        'id="' + message_info['message_id'] + '">' +
                        '<div class="main_box_item_avatar avatar50px" id="message_avatar"' +
                        'style=\"' + avatar + '\">' +
                        '</div>' +
                        '<div class="main_box_area_chat_message">' +
                        '<div class="main_box_area_chat_message_info flex_row">' +
                        '<div class="main_box_area_chat_message_user_name ">' + message_info['user_name'] + '</div>' +
                        '<div class="main_box_area_chat_message_time">' + time + '</div>' +
                        edit +
                        '</div>' +
                        '<div class="main_box_area_chat_message_area message_text_margin_left"' +
                        'id="message_' + message_info['message_id'] + '">' + message_info['text'] + '</div>' +
                        '</div></div></div>');
                }
                message_item.insertBefore('div.main_box_area_chat_message_row:first');
            });
        }
    });
}
// запрос на изменение информации о пользователе
function changeUserInfo() {
    $('#user_name_error').html('');
    $('#user_name').removeClass('input_error_style');
    $('#email_error').html('');
    $('#email').removeClass('input_error_style');
    $('#password_error').html('');
    $('#password').removeClass('input_error_style');
    $('#confirm_password_error').html('');
    $('#confirm_password').removeClass('input_error_style');
    var user_name = $('#user_name').val();
    var email = $('#email').val();
    var password = $('#password').val();
    user_name = user_name.replace(/\s+/g, "").trim();
    email = email.replace(/\s+/g, "").trim();
    password = password.replace(/\s+/g, "").trim();
    // если поля не были измененены
    if (user_name == '' && email == '' && password == '') {
        // если в подтверждении пароля что-то есть
        if ($('#confirm_password').val() != '') {
            $('#confirm_password_error').html('Your confirm password is not match password!');
            $('#confirm_password').addClass('input_error_style');
            $('#confirm_password').val('');
            return;
        }
        return;
    }
    // если введенное имя больше 40 символов
    if (user_name.length > 40) {
        $('#user_name_error').html('User Name Max lenght is 40 characters!');
        $('#user_name').addClass('input_error_style');
        return;
    }
    // если пользователь ввел пароль менее 6 символов
    if (password != '' && password.length < 6) {
        $('#password_error').html('Password should contain at least 6 characters!');
        $('#password').addClass('input_error_style');
        $('#password').val('');
        return;
    }
    // если введенные пароли не совпадают
    if (password != $('#confirm_password').val()) {
        $('#confirm_password_error').html('Your confirm password is not match password!');
        $('#confirm_password').addClass('input_error_style');
        return;
    }
    // если все ок отправляем запрос
    $.ajax({
        url: 'magic/startMagick.php',
        type: 'POST',
        data: {
            class: 'testGuestBook',
            method: 'changeUserInfo',
            0: user_name,
            1: email,
            2: password,
        },
        success: function (response) {
            response = JSON.parse(response);
            $('#user_name_error').html(response[1]);
            if (response[0] != 1) {
                $('#user_name').addClass('input_error_style');
                $('#email').addClass('input_error_style');
            }
            else {
                $('#user_name').val('');
                $('#email').val('');
                if (user_name != '') {
                    $('#user_name').prop('placeholder', user_name);
                }
                if (email != '') {
                    $('#email').prop('placeholder', email);
                }
            }
        }
    });
}
// устанавливаем аватарку пользователю
function sendFiles(files) {
    var maxFileSize = 5242880;
    var Data = new FormData();
    $(files).each(function (index, file) {
        if ((file.size > maxFileSize) || (file.type != 'image/jpeg')) {
            return;
        }
        Data.append('avatar', file);
    });
    Data.append('class', 'testGuestBook');
    Data.append('method', 'uploadAvatar');
    $.ajax({
        url: 'magic/startMagick.php',
        type: 'POST',
        processData: false,
        contentType: false,
        data: Data,
        success: function (response) {
            var avatar = document.getElementById('user_avatar');
            avatar.style.backgroundImage = 'url("' + response + '")';
            var message_avatar = $('#message_avatar_' + user_id + '*');
            message_avatar.css('background-image', 'url("' + response + '")');
        }
    });
}
// отправка сообщения пользователя
function sendMessage() {
    var new_message_text = $('#new_message').val();
    if (new_message_text == '') {
        return;
    }
    new_message_text = new_message_text.replace(/\s+/g, " ").trim();
    $('#new_message').val('');
    $.ajax({
        url: 'magic/startMagick.php',
        type: 'POST',
        data: {
            class: 'testGuestBook',
            method: 'addMessage',
            0: new_message_text,
        },
        success: function (response) {
            response = JSON.parse(response);
            var dt = new Date(response['created_at']);
            var time = dt.getHours() + ":" + dt.getMinutes();
            var avatar = '';
            if (user_row[user_id]['avatar'] != '') {
                avatar = "background-image: url('../avatar/" + user_row[user_id]['avatar'] + "')";
            }
            var edit = '<div class="main_box_area_chat_message_edit_area" id="edit_pannel_' + response['message_id'] + '">' +
                '<div class="main_box_area_chat_message_delete" onclick="deleteMessage(' + response['message_id'] + ',' + response['expired_at'] + ')"></div>' +
                '<div class="main_box_area_chat_message_edit" onclick="editMessage(' + response['message_id'] + ',' + response['expired_at'] + ')"></div>' +
                '</div>';
            var message_item = $('<div class="main_box_area_chat_message_row flex_row_reverse" id="message_row_' + response['message_id'] + '">' +
                '<div class="main_box_area_chat_message_item flex_row_reverse"' +
                'id="' + response['message_id'] + '">' +
                '<div class="main_box_item_avatar avatar50px" id="message_avatar_' + user_id + '"' +
                'style=\"' + avatar + '\">' +
                '</div>' +
                '<div class="main_box_area_chat_message">' +
                '<div class="main_box_area_chat_message_info flex_row_reverse">' +
                '<div class="main_box_area_chat_message_user_name">' + response['user_name'] + '</div>' +
                '<div class="main_box_area_chat_message_time">' + time + '</div>' +
                edit +
                '</div>' +
                '<div class="main_box_area_chat_message_area"' +
                'id="message_' + response['message_id'] + '">' + response['text'] + '</div>' +
                '</div></div></div>');
            message_item.insertBefore('div.main_box_area_chat_message_row:first');
        }
    });
}
// подгружаем старые сообщения
function loadMessage() {
    var allow_scroll = 1;
    var last_message = $('.main_box_area_chat_message_item').last();
    var last_message_id = last_message.prop('id');
    $.ajax({
        url: 'magic/startMagick.php',
        type: 'POST',
        data: {
            class: 'testGuestBook',
            method: 'loadMessages',
            0: last_message_id,
        },
        success: function (response) {
            response = JSON.parse(response);
            var message_item;
            $(response[1]).each(function (index, message_info) {
                var dt = new Date(message_info['created_at'] * 1000);
                var hours = dt.getHours();
                var minutes = dt.getMinutes();
                // фиксим отрисовку времени xDD
                if (hours < 10) {
                    hours = '0' + hours;
                }
                // фиксим отрисовку времени xDD
                if (minutes < 10) {
                    minutes = '0' + minutes;
                }
                var time = hours + ":" + minutes;
                var avatar = '';
                if (user_row[message_info['user_id']]['avatar'] != '') {
                    avatar = "background-image: url('../avatar/" + user_row[message_info['user_id']]['avatar'] + "')";
                }
                var edit;
                // если время на редактирование еще не закончилось отображаем элементы редактирования
                if (message_info['expired_at'] > Date().valueOf()) {
                    edit = '<div class="main_box_area_chat_message_edit_area" id="edit_pannel_' + message_info['message_id'] + '">' +
                        '<div class="main_box_area_chat_message_delete" onclick="deleteMessage(' + message_info['message_id'] + ',' + message_info['expired_at'] + ')"></div>' +
                        '<div class="main_box_area_chat_message_edit" onclick="editMessage(' + message_info['message_id'] + ',' + message_info['expired_at'] + ')"></div>' +
                        '</div>';
                }
                if (user_id == message_info['user_id']) {
                    message_item = $('<div class="main_box_area_chat_message_row flex_row_reverse" id="message_row_' + message_info['message_id'] + '">' +
                        '<div class="main_box_area_chat_message_item flex_row_reverse"' +
                        'id="' + message_info['message_id'] + '">' +
                        '<div class="main_box_item_avatar avatar50px" id="message_avatar_' + user_id + '"' +
                        'style=\"' + avatar + '\">' +
                        '</div>' +
                        '<div class="main_box_area_chat_message">' +
                        '<div class="main_box_area_chat_message_info flex_row_reverse">' +
                        '<div class="main_box_area_chat_message_user_name">' + message_info['user_name'] + '</div>' +
                        '<div class="main_box_area_chat_message_time">' + time + '</div>' +
                        edit + '</div>' +
                        '<div class="main_box_area_chat_message_area message_text_margin_right"' +
                        'id="message_' + message_info['message_id'] + '">' + message_info['text'] + '</div>' +
                        '</div></div></div>');
                }
                else {
                    message_item = $('<div class="main_box_area_chat_message_row" id="message_row_' + message_info['message_id'] + '">' +
                        '<div class="main_box_area_chat_message_item flex_row"' +
                        'id="' + message_info['message_id'] + '">' +
                        '<div class="main_box_item_avatar avatar50px" id="message_avatar"' +
                        'style=\"' + avatar + '\">' +
                        '</div>' +
                        '<div class="main_box_area_chat_message">' +
                        '<div class="main_box_area_chat_message_info flex_row">' +
                        '<div class="main_box_area_chat_message_user_name ">' + message_info['user_name'] + '</div>' +
                        '<div class="main_box_area_chat_message_time">' + time + '</div></div>' +
                        '<div class="main_box_area_chat_message_area message_text_margin_left"' +
                        'id="message_' + message_info['message_id'] + '">' + message_info['text'] + '</div>' +
                        '</div></div></div>');
                }
                message_item.insertAfter('div.main_box_area_chat_message_row:last');
            });
            allow_scroll = response[0];
        }
    });
}
// меняет текст у сообщения
function sendEditedMessage(message_id, expired_at) {
    var new_message_text = $('#new_message').val();
    // если новое сообщение пустое удаляем его
    if (new_message_text.length < 1) {
        deleteMessage(message_id, expired_at);
        return;
    }
    $('#message_' + message_id).html(new_message_text);
    $('#new_message').val('');
    var message_button = $('<button class="send_button" id="new_message_button"' +
        'onclick="sendMessage()">SEND</button>');
    $('button.send_button').replaceWith(message_button);
    $.ajax({
        url: 'magic/startMagick.php',
        type: 'POST',
        data: {
            class: 'guestBook',
            method: 'editMessage',
            0: message_id,
            1: new_message_text,
        },
        success: function (response) {
            var dt = new Date(response * 1000);
            var hours = dt.getHours();
            var minutes = dt.getMinutes();
            // фиксим отрисовку времени xDD
            if (hours < 10) {
                hours = '0' + hours;
            }
            // фиксим отрисовку времени xDD
            if (minutes < 10) {
                minutes = '0' + minutes;
            }
            var time = hours + ":" + minutes;
            var old_time = $('div#time_' + message_id);
            old_time.html(time);
        }
    });
}
// меняем кнопку отправки сообщения на кнопку изменения сообщения
function editMessage(message_id, expired_at) {
    var dt = new Date();
    var time = dt.valueOf();
    // если время редактирования истекло - убираем панель редактирования
    if (user_row[user_id]['user_role'] == 1 && expired_at * 1000 < time) {
        $('div#edit_pannel_' + message_id).remove();
        alert('Sorry, message change time expired');
        return;
    }
    var message = $('#message_' + message_id).html();
    $('#new_message').val(message);
    var new_message_button = $('<button class="send_button" id="new_message_button"' +
        'onclick="sendEditedMessage(' + message_id + ')">SEND</button>');
    $('button.send_button').replaceWith(new_message_button);
}
// помечаем сообщение удаленным
function deleteMessage(message_id, expired_at) {
    var dt = new Date();
    var time = dt.valueOf();
    // если время для редактирования сообщения истекло - убираем панель редактирования
    if (user_row[user_id]['user_role'] == 1 && expired_at * 1000 < time) {
        $('div#edit_pannel_' + message_id).remove();
        alert('Sorry, message change time expired');
        return;
    }
    $.ajax({
        url: 'magic/startMagick.php',
        type: 'POST',
        data: {
            class: 'guestBook',
            method: 'deleteMessage',
            0: message_id,
        },
        success: function () {
            // оставляем возможность восстановить сообщение
            var restor_message = $('<div class="restor_message" id="restore_' + message_id + '">' +
                '<div class="restor_button" onclick="restoreMessage(' + message_id + ')">Restore</div>' +
                'Message deleted.</div>');
            $('div#message_row_' + message_id).replaceWith(restor_message);
        }
    });
}
// восстанавливаем сообщение из удаленных
function restoreMessage(message_id) {
    $.ajax({
        url: 'magic/startMagick.php',
        type: 'POST',
        data: {
            class: 'testGuestBook',
            method: 'restoreMessage',
            0: message_id,
        },
        success: function (response) {
            response = JSON.parse(response);
            var dt = new Date(response['updated_at'] * 1000);
            var hours = dt.getHours();
            var minutes = dt.getMinutes();
            // фиксим отрисовку времени xDD
            if (hours < 10) {
                hours = '0' + hours;
            }
            // фиксим отрисовку времени xDD
            if (minutes < 10) {
                minutes = '0' + minutes;
            }
            var time = hours + ":" + minutes;
            var avatar = '';
            if (user_row[response['user_id']]['avatar'] != '') {
                avatar = "background-image: url('../avatar/" + user_row[response['user_id']]['avatar'] + "')";
            }
            var edit = '<div class="main_box_area_chat_message_edit_area" id="edit_pannel_' + response['message_id'] + '">' +
                '<div class="main_box_area_chat_message_delete" onclick="deleteMessage(' + response['message_id'] + ',' + response['expired_at'] + ')"></div>' +
                '<div class="main_box_area_chat_message_edit" onclick="editMessage(' + response['message_id'] + ',' + response['expired_at'] + ')"></div>' +
                '</div>';
            // восстанавливаем сообщение
            var restored_message = $('<div class="main_box_area_chat_message_row flex_row_reverse" id="message_row_' + response['message_id'] + '">' +
                '<div class="main_box_area_chat_message_item flex_row_reverse"' +
                'id="' + response['message_id'] + '">' +
                '<div class="main_box_item_avatar avatar50px" id="message_avatar_' + user_id + '"' +
                'style=\"' + avatar + '\">' +
                '</div>' +
                '<div class="main_box_area_chat_message">' +
                '<div class="main_box_area_chat_message_info flex_row_reverse">' +
                '<div class="main_box_area_chat_message_user_name">' + response['user_name'] + '</div>' +
                '<div class="main_box_area_chat_message_time">' + time + '</div>' +
                edit + '</div>' +
                '<div class="main_box_area_chat_message_area message_text_margin_right"' +
                'id="message_' + response['message_id'] + '">' + response['text'] + '</div>' +
                '</div></div></div>');
            $('div#restore_' + message_id).replaceWith(restored_message);
        }
    });
}
