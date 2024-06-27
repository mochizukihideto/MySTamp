-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2024 年 6 月 27 日 03:18
-- サーバのバージョン： 10.4.28-MariaDB
-- PHP のバージョン: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `lesson-management-system`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `CREATE TABLE IF NOT EXISTS stamps`
--

CREATE TABLE `CREATE TABLE IF NOT EXISTS stamps` (
  `id` int(11) NOT NULL,
  `hobby` varchar(255) NOT NULL,
  `shape` varchar(50) NOT NULL,
  `font` varchar(50) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `CREATE TABLEstamps`
--

CREATE TABLE `CREATE TABLEstamps` (
  `id` int(11) NOT NULL,
  `hobby` varchar(255) NOT NULL,
  `shape` varchar(50) NOT NULL,
  `font` varchar(50) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `registration`
--

CREATE TABLE `registration` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `kana` varchar(100) NOT NULL,
  `age` int(3) NOT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `address` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `stamps`
--

CREATE TABLE `stamps` (
  `id` int(11) NOT NULL,
  `hobby` varchar(255) NOT NULL,
  `shape` varchar(50) NOT NULL,
  `font` varchar(50) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `stamps`
--

INSERT INTO `stamps` (`id`, `hobby`, `shape`, `font`, `image_path`, `created_at`, `user_id`) VALUES
(1, 'KUMON', 'circle', 'Dancing Script', '../assets/images/generated_stamps/stamp_1719193108.png', '2024-06-24 01:38:28', NULL),
(2, 'KUMON', 'cloud', 'Fredoka One', '/lesson-management-system/assets/images/generated_stamps/stamp_1719194499_6678d3830d4cc.png', '2024-06-24 02:01:39', NULL),
(3, 'ダンス', 'circle', 'Bebas Neue', '/assets/images/generated_stamps/stamp_1719197700_6678e004a46df.png', '2024-06-24 02:55:00', NULL),
(4, 'KUMON', 'cloud', 'Bebas Neue', '/assets/images/generated_stamps/stamp_1719217365_66792cd5455f7.png', '2024-06-24 08:22:45', NULL),
(5, 'KUMON', 'cloud', 'Bebas Neue', '/assets/images/generated_stamps/stamp_1719217378_66792ce242905.png', '2024-06-24 08:22:58', NULL),
(6, 'KUMON', 'star', 'Indie Flower', '/assets/images/generated_stamps/stamp_1719217863_66792ec703b80.png', '2024-06-24 08:31:03', NULL),
(7, 'daiet', 'cloud', 'Fredoka One', '/assets/images/generated_stamps/stamp_1719218013_66792f5d0e22d.png', '2024-06-24 08:33:33', NULL),
(8, 'KUMON', 'heart', 'Roboto', '/assets/images/generated_stamps/stamp_1719218071_66792f974a84e.png', '2024-06-24 08:34:31', NULL),
(9, 'KUMON', 'circle', 'Indie Flower', '/assets/images/generated_stamps/stamp_1719218203_6679301b52e58.png', '2024-06-24 08:36:43', NULL),
(10, 'ダンス', 'heart', 'Indie Flower', '/assets/images/generated_stamps/stamp_1719218253_6679304d93ad1.png', '2024-06-24 08:37:33', NULL),
(11, 'ダンス', 'cloud', 'Fredoka One', '/assets/images/generated_stamps/stamp_1719218386_667930d281fa6.png', '2024-06-24 08:39:46', NULL),
(12, 'KUMON', 'star', 'Permanent Marker', '/assets/images/generated_stamps/stamp_1719218556_6679317c0124f.png', '2024-06-24 08:42:36', NULL),
(13, 'KUMON', 'cloud', 'Fredoka One', '/assets/images/generated_stamps/stamp_1719229922_66795de237a7d.png', '2024-06-24 11:52:02', NULL),
(14, 'ダンス', 'circle', 'Bebas Neue', '/assets/images/generated_stamps/stamp_1719279613_667a1ffdd1b01.png', '2024-06-25 01:40:13', NULL),
(15, 'KUMON', 'star', 'Fredoka One', '/assets/images/generated_stamps/stamp_1719279933_667a213d7f374.png', '2024-06-25 01:45:33', NULL),
(16, '水泳', 'circle', 'Bebas Neue', '/assets/images/generated_stamps/stamp_1719280121_667a21f9f37e6.png', '2024-06-25 01:48:42', NULL),
(17, '英語', 'star', 'Permanent Marker', '/assets/images/generated_stamps/stamp_1719280590_667a23ce40d9d.png', '2024-06-25 01:56:30', NULL),
(18, 'KUMON', 'circle', 'Permanent Marker', '/assets/images/generated_stamps/stamp_1719280743_667a24677c867.png', '2024-06-25 01:59:03', NULL),
(19, 'ダンス', 'circle', 'Indie Flower', '/assets/images/generated_stamps/stamp_1719280910_667a250ec5fd6.png', '2024-06-25 02:01:50', NULL),
(20, 'ダンス', 'circle', 'Pacifico', '/assets/images/generated_stamps/stamp_1719280931_667a25238e300.png', '2024-06-25 02:02:11', NULL),
(21, 'ダンス', 'circle', 'Permanent Marker', '/assets/images/generated_stamps/stamp_1719280947_667a2533535f4.png', '2024-06-25 02:02:27', NULL),
(22, 'ダンス', 'circle', 'Roboto', '/assets/images/generated_stamps/stamp_1719280961_667a2541cf940.png', '2024-06-25 02:02:41', NULL),
(23, 'KUMON', 'cloud', 'Permanent Marker', '/assets/images/generated_stamps/stamp_1719281287_667a2687312d7.png', '2024-06-25 02:08:07', NULL),
(24, 'KUMON', 'circle', 'Permanent Marker', '/assets/images/generated_stamps/stamp_1719281343_667a26bf3cea4.png', '2024-06-25 02:09:03', NULL),
(25, 'ダンス', 'circle', 'Permanent Marker', '/assets/images/generated_stamps/stamp_1719281356_667a26ccc8328.png', '2024-06-25 02:09:16', NULL),
(26, 'daiet', 'circle', 'Permanent Marker', '/assets/images/generated_stamps/stamp_1719281395_667a26f3197fd.png', '2024-06-25 02:09:55', NULL),
(27, 'KUMON', 'circle', 'Pacifico', '/assets/images/generated_stamps/stamp_1719281455_667a272fd9999.png', '2024-06-25 02:10:56', NULL),
(28, 'KUMON', 'circle', 'Roboto', '/assets/images/generated_stamps/stamp_1719281480_667a274837c96.png', '2024-06-25 02:11:20', NULL),
(29, 'KUMON', 'circle', 'Indie Flower', '/assets/images/generated_stamps/stamp_1719281556_667a279422de1.png', '2024-06-25 02:12:36', NULL),
(30, 'KUMON', 'circle', 'Pacifico', '/assets/images/generated_stamps/stamp_1719281569_667a27a1bf7c4.png', '2024-06-25 02:12:49', NULL),
(31, 'KUMON', 'circle', 'Permanent Marker', '/assets/images/generated_stamps/stamp_1719281584_667a27b065996.png', '2024-06-25 02:13:04', NULL),
(32, 'daiet', 'circle', 'Roboto', '/assets/images/generated_stamps/stamp_1719281600_667a27c0e970e.png', '2024-06-25 02:13:21', NULL),
(33, 'KUMON', 'circle', 'Indie Flower', '/assets/images/generated_stamps/stamp_1719281630_667a27dec07c7.png', '2024-06-25 02:13:50', NULL),
(34, 'ダンス', 'circle', 'Indie Flower', '/assets/images/generated_stamps/stamp_1719281663_667a27ff7cd01.png', '2024-06-25 02:14:23', NULL),
(35, 'HIIT', 'heart', 'Pacifico', '/assets/images/generated_stamps/stamp_1719282403_667a2ae3e4b53.png', '2024-06-25 02:26:44', NULL),
(36, 'KUMON', 'circle', 'Bebas Neue', '/assets/images/generated_stamps/stamp_1719305635_667a85a3aa665.png', '2024-06-25 08:53:55', NULL),
(37, 'KUMON', 'circle', 'Bebas Neue', '/assets/images/generated_stamps/stamp_1719305904_667a86b07eac1.png', '2024-06-25 08:58:24', NULL),
(38, 'KUMON', 'circle', 'Dancing Script', '/assets/images/generated_stamps/stamp_1719305915_667a86bb9b4c0.png', '2024-06-25 08:58:35', NULL),
(39, 'KUMON', 'cloud', 'Dancing Script', '/assets/images/generated_stamps/stamp_1719305930_667a86ca45818.png', '2024-06-25 08:58:50', NULL),
(40, 'KUMON', 'circle', 'Fredoka One', '/assets/images/generated_stamps/stamp_1719305943_667a86d7de8b1.png', '2024-06-25 08:59:04', NULL),
(41, 'ダンス', 'circle', 'Bebas Neue', '/assets/images/generated_stamps/stamp_1719305954_667a86e23c9c3.png', '2024-06-25 08:59:14', NULL),
(42, 'ダンス', 'circle', 'Bebas Neue', '/assets/images/generated_stamps/stamp_1719306505_667a890980f3b.png', '2024-06-25 09:08:25', NULL),
(43, 'ダンス', 'circle', 'Bebas Neue', '/assets/images/generated_stamps/stamp_1719306521_667a8919505cb.png', '2024-06-25 09:08:41', NULL),
(44, 'ダンス', 'circle', 'Bebas Neue', '/assets/images/generated_stamps/stamp_1719312579_667aa0c3a5a3f.png', '2024-06-25 10:49:39', NULL),
(45, 'ダンス', 'circle', 'Bebas Neue', '/assets/images/generated_stamps/stamp_1719316129_667aaea10958a.png', '2024-06-25 11:48:49', NULL),
(46, 'ダンス', 'circle', 'Bebas Neue', '/assets/images/generated_stamps/stamp_1719317010_667ab212b8cc1.png', '2024-06-25 12:03:30', NULL),
(47, 'ダンス', 'circle', 'BebasNeue', '/assets/images/generated_stamps/stamp_1719318428_667ab79ce1b59.png', '2024-06-25 12:27:09', NULL),
(48, 'ダンス', 'circle', 'DancingScript', '/assets/images/generated_stamps/stamp_1719318456_667ab7b87f05f.png', '2024-06-25 12:27:36', NULL),
(49, 'ダンス', 'circle', 'BebasNeue', '/assets/images/generated_stamps/stamp_1719318479_667ab7cfba917.png', '2024-06-25 12:27:59', NULL),
(50, 'ダンス', 'circle', 'BebasNeue', '/assets/images/generated_stamps/stamp_1719318655_667ab87fbf25b.png', '2024-06-25 12:30:55', NULL),
(51, 'ダンス', 'circle', 'BebasNeue', '/assets/images/generated_stamps/stamp_1719318662_667ab8863bbaa.png', '2024-06-25 12:31:02', NULL),
(52, 'HIIT', 'circle', 'PermanentMarker', '/assets/images/generated_stamps/stamp_1719364734_667b6c7ed8765.png', '2024-06-26 01:18:55', NULL),
(53, 'HIIT', 'circle', 'PermanentMarker', '/assets/images/generated_stamps/stamp_1719364737_667b6c81a1e77.png', '2024-06-26 01:18:57', NULL),
(54, 'KUMON', 'cloud', 'Pacifico', '/assets/images/generated_stamps/stamp_1719365252_667b6e84914b2.png', '2024-06-26 01:27:32', NULL),
(55, 'daiet', 'heart', 'PermanentMarker', '/assets/images/generated_stamps/stamp_1719365473_667b6f6158251.png', '2024-06-26 01:31:13', NULL),
(56, 'HIIT', 'star', 'BebasNeue', '/assets/images/generated_stamps/stamp_1719365639_667b7007cf7fe.png', '2024-06-26 01:33:59', NULL),
(57, 'KUMON', 'circle', 'DancingScript', '/assets/images/generated_stamps/stamp_1719365682_667b703298f5a.png', '2024-06-26 01:34:42', NULL),
(58, 'KUMON', 'square', 'PermanentMarker', '/assets/images/generated_stamps/stamp_1719365928_667b7128d52be.png', '2024-06-26 01:38:48', NULL),
(59, '英語', 'heart', 'DancingScript', '/assets/images/generated_stamps/stamp_1719366550_667b7396e303c.png', '2024-06-26 01:49:11', NULL),
(60, 'HIIT', 'cloud', 'Pacifico', '/assets/images/generated_stamps/stamp_1719367341_667b76ad1a62c.png', '2024-06-26 02:02:21', NULL),
(61, 'ダンス', 'circle', 'BebasNeue', '/assets/images/generated_stamps/stamp_1719401211_667bfafbcee3b.png', '2024-06-26 11:26:51', NULL),
(62, 'ダンス', 'circle', 'DancingScript', '/assets/images/generated_stamps/stamp_1719450691_667cbc4391a1d.png', '2024-06-27 01:11:31', 4);

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `kana` varchar(100) NOT NULL,
  `age` int(3) NOT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `address` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `name`, `kana`, `age`, `gender`, `address`, `email`, `phone`, `password`, `created_at`) VALUES
(1, 'Hideto Mochizuki', 'ッ', 8, 'female', '南長崎6-14-13', 'mochizukihideto02@yahoo.co.jp', '08050006102', '$2y$10$LmqylThh1tceDL1ezlDfWe3yJT/TecjiDeSIMwcFNTW5RkVnlG272', '2024-06-23 07:28:32'),
(2, '田中　太郎', 'タナカ　タロウ', 7, 'male', '福岡県糟屋郡１−１−１', '1234567@gmail.com', '08011111111', '$2y$10$UdEYUrNva8oyRiYu/XwWb.YzKA69mLiog4ZmYFNuaunl5xrhMpvjm', '2024-06-25 02:07:34'),
(3, '三村', 'ミムラ', 12, 'male', '福岡県糟屋郡１−１−１3', '33333@gmail.com', '08011111113', '$2y$10$xtDsoDpG5lNC6Or8F54t1.CVMIaeD9txobkPy7Yeip/ek6YGJcDXa', '2024-06-26 09:06:30'),
(4, '佐藤さん', 'サトウ', 15, 'male', '福岡県糟屋郡１−１−１4', '7777777@gmail.com', '08011111114', '$2y$10$ZhItvoOmEgOywVZVFNZLRuB8fzK5Gfn7jZ2tSACn.708AfOYqr6UK', '2024-06-26 11:52:25');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `CREATE TABLE IF NOT EXISTS stamps`
--
ALTER TABLE `CREATE TABLE IF NOT EXISTS stamps`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `CREATE TABLEstamps`
--
ALTER TABLE `CREATE TABLEstamps`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- テーブルのインデックス `stamps`
--
ALTER TABLE `stamps`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `CREATE TABLE IF NOT EXISTS stamps`
--
ALTER TABLE `CREATE TABLE IF NOT EXISTS stamps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `CREATE TABLEstamps`
--
ALTER TABLE `CREATE TABLEstamps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `stamps`
--
ALTER TABLE `stamps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
