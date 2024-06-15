<?php
include_once('./config.php');

if (isset($_POST['submit'])) {
    $name = trim($_POST['name']);
    $email = trim($_POST['email']);
    $address = trim($_POST['address']);
    $number = trim($_POST['number']);
    $pwd = trim($_POST['pwd']);
    $rpwd = trim($_POST['rpwd']);

    $sql = "SELECT * FROM customer WHERE customer_email = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        header("Location: ../signup.php?error=emailAlreadytaken");
        exit();
    }

    require_once './signupFn.inc.php';

    if (emptyInputSignup($name, $email, $number, $pwd, $rpwd, $address)) {
        header("Location: ../signup.php?error=emptyInput");
        exit();
    }

    if (invalidPhone($number)) {
        header("Location: ../signup.php?error=enterValidNumber");
        exit();
    }

    if (invalidEmail($email)) {
        header("Location: ../signup.php?error=invalidemail");
        exit();
    }

    if (!pwdMatch($pwd, $rpwd)) {
        header("Location: ../signup.php?error=pwdnotmatch");
        exit();
    }

    createUser($name, $email, $address, $pwd, $number);
} else {
    header("Location: ../signup.php");
    exit();
}
