<?php

$allow_magic = [
    'testGuestBook' => '../myGuestBook/testguestbook.php',
    'guestBook' => '../controllers/guestbook.php',
];

// если в запросе есть параметр с названием метода
if (isset($_POST['class']) && isset($_POST['method'])) {

    $class = $_POST['class'];
    unset($_POST['class']);

    require_once($allow_magic[$class]);

    $method = $_POST['method'];
    unset($_POST['method']);

    // я понимаю что это полный ..., но лучше не придумал D:
    $response = [];
    switch (count($_POST)) {
        case 0:
            $response = $class::$method();
            break;
        case 1:
            $response = $class::$method($_POST[0]);
            break;
        case 2:
            $response = $class::$method($_POST[0], $_POST[1]);
            break;
        case 3:
            $response = $class::$method($_POST[0], $_POST[1], $_POST[2]);
            break;
        case 4:
            $response = $class::$method($_POST[0], $_POST[1], $_POST[2], $_POST[3]);
            break;
        case 5:
            $response = $class::$method($_POST[0], $_POST[1], $_POST[2], $_POST[3], $_POST[4]);
            break;
        case 6:
            $response = $class::$method($_POST[0], $_POST[1], $_POST[2], $_POST[3], $_POST[4], $_POST[5]);
            break;
        case 7:
            $response = $class::$method($_POST[0], $_POST[1], $_POST[2], $_POST[3], $_POST[4], $_POST[5], $_POST[6]);
            break;
    }

    // если получили массив, то нужно его перевести в строку для js
    if (is_array($response)) {
        $response = json_encode($response);
    }

    print_r($response);
}


