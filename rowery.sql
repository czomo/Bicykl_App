-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 10 Sty 2018, 17:57
-- Wersja serwera: 10.1.26-MariaDB
-- Wersja PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `rowery`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `fos_user`
--

CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`) VALUES
(1, '11', '11', '1@vp.pl', '1@vp.pl', 1, NULL, '$2y$13$U/J1AJ43QeXWuI456RcLUejLELXjHf9RLUHApISh.ZQOKOpa6CGVq', '2018-01-10 17:54:10', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}'),
(2, '22', '22', '22@vp.pl', '22@vp.pl', 1, NULL, '$2y$13$Yv9vic4xpcb9Mbrz.DbknOvFCC/NHHnbbWHg9YLtc3102YqVlsz.e', '2018-01-10 17:15:39', NULL, NULL, 'a:0:{}'),
(3, 'tom', 'tom', 'tomi65@vp.pl', 'tomi65@vp.pl', 1, NULL, '$2y$13$DP/nf99G4UAsuqODzZe9huAq8sEOxEiquqHV4QtZsKf4fNlA3I.v6', '2018-01-08 15:20:55', NULL, NULL, 'a:0:{}'),
(5, 'kom', 'kom', 'kom@vp.pl', 'kom@vp.pl', 1, NULL, '$2y$13$ITRgU53RY/UofWHHAIn.ce5fe9kC3B7sWfvTak96q8EeNrvkuMADG', '2018-01-08 15:16:37', NULL, NULL, 'a:0:{}'),
(6, 'komputer', 'komputer', 'komputer@vp.pl', 'komputer@vp.pl', 1, NULL, '$2y$13$cC..PB4zZhHeRpgXgJEO7uAzI6q0WYv6bDtjoy2uWUuk.10amIdC2', '2018-01-09 19:40:51', NULL, NULL, 'a:0:{}'),
(7, 'komp', 'komp', 'komp@vp.pl', 'komp@vp.pl', 1, NULL, '$2y$13$h85.fhXROEiDUFpYtNmEaOUlYlBzwEwlDLL9RBGeyXM/VjSmBOz.i', '2018-01-09 19:50:08', NULL, NULL, 'a:0:{}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `todo`
--

CREATE TABLE `todo` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `desciption` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `year` date NOT NULL,
  `add_date` datetime NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `todo`
--

INSERT INTO `todo` (`id`, `name`, `category`, `desciption`, `price`, `year`, `add_date`, `amount`) VALUES
(7, 'Kuba', 'szosa', 'Naprawiony+', 110, '2018-01-01', '2018-01-10 17:39:53', 1),
(9, 'Adam', 'szosa', 'Naprawiony', 1, '2019-01-01', '2018-01-08 15:58:15', 1),
(10, 'Tomasz', 'naprawa', 'łańcuch,koło', 40, '2018-01-08', '2018-01-10 17:18:33', 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `fos_user`
--
ALTER TABLE `fos_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`);

--
-- Indexes for table `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `fos_user`
--
ALTER TABLE `fos_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
