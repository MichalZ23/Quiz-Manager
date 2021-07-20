-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 20, 2021 at 04:17 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quizmanager`
--

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer_a` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer_b` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer_c` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct_answer` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `quiz_id`, `content`, `answer_a`, `answer_b`, `answer_c`, `correct_answer`) VALUES
(17, 97, 'Pytanie 1 (a)', 'odp a', 'odp b', 'odp c', 'a'),
(18, 97, 'Pytanie 2 (b)', 'eqwe', 'qweq', 'qwe', 'b'),
(19, 97, 'Pytanie 3 (c)', 'ddd', 'sss', 'dasd', 'c'),
(20, 97, 'Pytanie 4 (c)', 'zxczx', 'zxcz', 'zxcxz', 'c'),
(21, 97, 'Pytanie 5 (a)', 'zxc', 'zxc', 'xxx', 'a'),
(22, 98, 'Jak miał na imię Adam Małysz?', 'Adam', 'Nie Adam', 'Nie miał imienia', 'a'),
(23, 98, 'Najczęściej występujące słowo w tekstach piosenek', 'Kalorymetr', 'lalalala', 'Wiadro', 'b'),
(24, 98, 'Która liczba jest najmniejsza?', '2', '-2', '-dużo', 'c'),
(25, 98, 'Ile to jest 3+3', '3', 'Nie 3', '12', 'b'),
(26, 98, 'Jak miał na imię Adam Mickiewicz? (b => z ŚWK)', 'Adam', 'Stanisław', 'Janusz', 'b'),
(32, 103, 'Pyt 1 a', 'a', 'b', 'c', 'a'),
(33, 103, 'pyt 2 b', 'AA', 'BB', 'CC', 'b'),
(34, 103, 'pyt 3 c', 'aaa', 'bbb', 'ccc', 'c'),
(35, 103, 'pyt 4 b', 'aaaa', 'bbbb', 'cccc', 'b'),
(36, 103, 'pyt 5 a', 'aaaaaaaa', 'b', ' .', 'a'),
(46, 109, 'Zaznacz b', 'niepoprawna', 'poprawna', 'niepop', 'b'),
(47, 109, 'Która odpowiedź jest poprawna?', 'ta', 'ta nie', 'ta też nie', 'a'),
(48, 109, 'Jan coś nie jest cacy, to jakie jest', 'a', 'be', 'ce', 'b'),
(49, 109, 'nie wiem o co pytać to wybierz c', '\'asa\'asasa@\"\"asd', 'asd', 'c', 'c'),
(50, 109, 'Która odpowiedź to a?', 'ta', 'ta', 'ta', 'a'),
(52, 112, '2+2', '2', '3', '4', 'c'),
(53, 112, '3+3', '3', '6', 'wtorek', 'b'),
(54, 112, 'uelerlerlelrle', 'eeee makarena!', 'bunkier', '!', 'a'),
(55, 112, 'Którą literą alfabetu jest y?', 'nie pamiętam', '7', '1', 'a'),
(56, 112, 'Kto się urodził w 1623 roku?', 'Robert Lewandowski', 'Leszek Miller', 'Ktoś na pewno', 'c'),
(57, 114, 'jw.', '11', '22', '33', 'c'),
(58, 114, 'też', '9', '7', 'h', 'c'),
(59, 114, 'nic', 'sdfsdf', 'sdf', 'aa', 'c'),
(60, 114, 'ce', 'a', 'b', 'c', 'c'),
(61, 114, 'zaznacz c', 'n', 'i', 'c', 'c'),
(62, 115, '666>667', 'tak', 'nie', 'piątek', 'a'),
(63, 115, 'po czwartku jest', 'wtorek', 'wszystkie odp są poprawne', 'sobota', 'b'),
(64, 115, 'Ile masz lat?', '23', '36', 'to zależy, kiedy wysyłam ten formularz', 'c'),
(65, 115, 'Dlaczego woda w morzu jest słona?', 'bo zawiera sól', 'wcale nie jest', 'bo tak', 'a'),
(66, 115, 'Czy przechodzi się na zielonym świetle?', 'nie', 'nie', 'tak', 'c');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `name`) VALUES
(97, 'Test Quiz'),
(98, 'Quiz o id 98'),
(103, 'New Quiz'),
(109, 'test2'),
(111, 'Pusty quiz'),
(112, 'Nowy quiz'),
(114, 'Quiz: zaznacz C'),
(115, 'Quiz 666');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `quiz_id`, `user_id`, `date`, `points`) VALUES
(1, 112, 2, '2021-07-19 16:52:40', 1),
(2, 97, 3, '2021-07-19 17:23:50', 0),
(3, 103, 8, '2021-07-19 17:28:50', 0),
(4, 98, 8, '2021-07-19 17:29:14', 2),
(5, 109, 2, '2021-07-19 19:34:26', 3),
(6, 109, 3, '2021-07-19 20:05:14', 2),
(7, 98, 3, '2021-07-19 20:05:43', 1),
(8, 103, 3, '2021-07-19 20:06:03', 3),
(9, 112, 3, '2021-07-19 20:06:20', 0),
(10, 114, 6, '2021-07-19 20:08:39', 2),
(11, 97, 6, '2021-07-19 20:08:53', 2),
(12, 98, 6, '2021-07-19 20:09:10', 2),
(13, 98, 6, '2021-07-19 20:09:29', 1),
(14, 98, 6, '2021-07-19 20:10:17', 3),
(15, 109, 6, '2021-07-19 20:10:30', 1),
(16, 103, 6, '2021-07-19 20:10:46', 0),
(17, 112, 14, '2021-07-19 21:34:16', 2),
(18, 115, 3, '2021-07-19 22:29:42', 1),
(19, 103, 89, '2021-07-19 22:31:11', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`) VALUES
(2, 'adam', '[]', '$2y$13$pXrqB4WbXy.GJE5IVIlacu6k1jcP/I2aogyKw8S3zIMJQKq.zBl6C'),
(3, 'admin', '{\"ROLES\":\"ROLE_ADMIN\"}', '$2y$13$gQsvlwvCjOJU7zx/YJ9yhOEM1xerBvLJWK252a7vRH3avB2p1FCrS'),
(4, 'janusz', '[]', '$2y$13$avneWdFdvV6tvebVgKVImeTqofC.0M7BHXsxYIvHqpnjyLX2e37ze'),
(5, 'test', '[]', '$2y$13$1WLlIo85ngZHqBOxm0qBwO7zIIPA/K3oDiBB8QCrGviUOSJNg4/PK'),
(6, '3spacjeikropka', '[]', '$2y$13$EgtrZc96obH/v2K0NssanufLSN7uZlOKDIyK6rfPbQlNjaGmY92ru'),
(7, '7spacji', '[]', '$2y$13$RSVsy3AmNL5xeukRu804H.Kill7q48QBl68RyAZFSKhvKRMbDJUqO'),
(8, 'root', '[]', '$2y$13$6ai6FUi/la0C/ZoOJvJJz.HHMGnaSbYHCCSf50OvSvZJF3A9SavVi'),
(14, 'User_5_old', '[]', '$2y$13$51nY5.KMXZPvnNMzurhc/erBhNpd4srJ/6ci3Wy11W/GRmFHs9zN6'),
(79, 'User_0', '[]', '$2y$13$az712SvzAkH7nDafeuh9le33DO5.9XL78x9Sl5BS2J4eFjjyWtZ9G'),
(80, 'User_1', '[]', '$2y$13$PR5TQ0ZmHHcqmLDDTM9yHuhExgMkQ7nG5C5npvACfdFzPWXPx4vwy'),
(81, 'User_2', '[]', '$2y$13$cQrv31RCROzYJ790XPvM/.Do45rVMPFUcZI3XAF/m2BUGBjjQFSxG'),
(82, 'User_3', '[]', '$2y$13$4A4ptZ/U8OZ3xKZbiUGXd.q/L7r3lKSQe4cOEN6LAmzvjxexhia.W'),
(83, 'User_4', '[]', '$2y$13$ccV5OTk58XLsR2ThBVDm6.A/tTNpdSliOCS6HKKsPrXPgXAz1tfP6'),
(84, 'User_5', '[]', '$2y$13$7ONhHLSpJzXAZ9JCu8vJE.M1.qzo5v6H/c38ZeJF1gV2Rzf23MuxG'),
(85, 'User_6', '[]', '$2y$13$.2OTBjyR9fhqTdSKC5KfluC6hdp7qzkaStrFmEKmpuzgCZf2CFaxC'),
(86, 'User_7', '[]', '$2y$13$NeqetOyY26Z1p2ANsOl.Cu3EiIkxmwsCh8abkxGOPfX28Q/9yuyXK'),
(87, 'User_8', '[]', '$2y$13$jTaDWtwVnjF63WfYv2raZ.yNY9CJrfxlDvdR3kYF37WcuKfHr3QGO'),
(88, 'User_9', '[]', '$2y$13$tic75dER.7om274CJgBbAuhEf4T5EQpL/kK2VdWeHUD2k2VRWNbgK'),
(89, 'Jacek', '[]', '$2y$13$rvbTVcoqjd8VbnkZD9XFIOUP3hVZQLciMcHA6UbIiz9pDX4nLzwsS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B6F7494E853CD175` (`quiz_id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_136AC113853CD175` (`quiz_id`),
  ADD KEY `IDX_136AC113A76ED395` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FK_B6F7494E853CD175` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`);

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `FK_136AC113853CD175` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`),
  ADD CONSTRAINT `FK_136AC113A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
