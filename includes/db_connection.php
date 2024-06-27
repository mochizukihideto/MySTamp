<?php
$servername = "localhost";
$username = 'root';
$password = '';
$dbname = "lesson-management-system";

// データベース接続の作成
$conn = new mysqli($servername, $username, $password, $dbname);

// 接続チェック
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>