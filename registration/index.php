<?php
session_start();
require_once('../includes/db_connection.php');

$error = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = isset($_POST['name']) ? trim($_POST['name']) : '';
    $kana = isset($_POST['kana']) ? trim($_POST['kana']) : '';
    $age = isset($_POST['age']) ? intval($_POST['age']) : 0;
    $gender = isset($_POST['gender']) ? $_POST['gender'] : '';
    $address = isset($_POST['address']) ? trim($_POST['address']) : '';
    $email = isset($_POST['email']) ? trim($_POST['email']) : '';
    $phone = isset($_POST['phone']) ? trim($_POST['phone']) : '';
    $password = isset($_POST['password']) ? $_POST['password'] : '';

    // バリデーション
    if (empty($name) || empty($kana) || empty($age) || empty($gender) || empty($address) || empty($email) || empty($phone) || empty($password)) {
        $error = "すべてのフィールドを入力してください。";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = "有効なメールアドレスを入力してください。";
    } elseif ($age < 1 || $age > 120) {
        $error = "有効な年齢を入力してください。";
    } elseif (!in_array($gender, ['male', 'female', 'other'])) {
        $error = "有効な性別を選択してください。";
    } else {
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        $sql = "INSERT INTO users (name, kana, age, gender, address, email, phone, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        
        if ($stmt) {
            $stmt->bind_param("ssisssss", $name, $kana, $age, $gender, $address, $email, $phone, $hashed_password);
            
            if ($stmt->execute()) {
                $_SESSION['user_id'] = $stmt->insert_id;
                $_SESSION['username'] = $name;
                header("Location: ../stamp-creation/index.php");
                exit();
            } else {
                $error = "登録中にエラーが発生しました: " . $stmt->error;
            }
            $stmt->close();
        } else {
            $error = "準備中にエラーが発生しました: " . $conn->error;
        }
    }
}
?>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>会員登録</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>会員登録</h1>
        <?php if (!empty($error)) echo "<p class='error'>". htmlspecialchars($error) ."</p>"; ?>
        <form id="registrationForm" method="post">
            <input type="text" name="name" placeholder="名前" required value="<?php echo isset($_POST['name']) ? htmlspecialchars($_POST['name']) : ''; ?>">
            <input type="text" name="kana" placeholder="カナ" required value="<?php echo isset($_POST['kana']) ? htmlspecialchars($_POST['kana']) : ''; ?>">
            <input type="number" name="age" placeholder="年齢" required min="1" max="120" value="<?php echo isset($_POST['age']) ? htmlspecialchars($_POST['age']) : ''; ?>">
            <select name="gender" required>
                <option value="">性別を選択</option>
                <option value="male" <?php echo (isset($_POST['gender']) && $_POST['gender'] == 'male') ? 'selected' : ''; ?>>男性</option>
                <option value="female" <?php echo (isset($_POST['gender']) && $_POST['gender'] == 'female') ? 'selected' : ''; ?>>女性</option>
                <option value="other" <?php echo (isset($_POST['gender']) && $_POST['gender'] == 'other') ? 'selected' : ''; ?>>その他</option>
            </select>
            <input type="text" name="address" placeholder="住所" required value="<?php echo isset($_POST['address']) ? htmlspecialchars($_POST['address']) : ''; ?>">
            <input type="email" name="email" placeholder="メールアドレス" required value="<?php echo isset($_POST['email']) ? htmlspecialchars($_POST['email']) : ''; ?>">
            <input type="tel" name="phone" placeholder="電話番号" required value="<?php echo isset($_POST['phone']) ? htmlspecialchars($_POST['phone']) : ''; ?>">
            <input type="password" name="password" placeholder="パスワード" required>
            <button type="submit">登録</button>
        </form>
    </div>
    
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('registrationForm');

        form.addEventListener('submit', function(e) {
            e.preventDefault();

            const formData = new FormData(form);
            let userData = {};
            for (let [key, value] of formData.entries()) {
                if (key !== 'password') {
                    userData[key] = value;
                }
            }

            const confirmed = confirm('以下の情報で登録してよろしいですか？\n\n' + 
                Object.entries(userData).map(([key, value]) => `${key}: ${value}`).join('\n'));

            if (confirmed) {
                form.submit();
            }
        });
    });
    </script>
</body>
</html>