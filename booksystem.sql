-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 17 Lis 2021, 21:11
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `booksystem`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8_polish_ci NOT NULL,
  `author` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `isbn` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `genre` varchar(100) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `books`
--

INSERT INTO `books` (`id`, `name`, `author`, `isbn`, `genre`) VALUES
(1, 'Diablo III: Nawałnica światła', 'Nate Kenyon', '9788363944407', 'Fantasy'),
(2, 'Ja inkwizytor: Głód i pragnienie', 'Jacek Piekara', '9788375749731', 'Fantasy'),
(3, 'Ja inkwizytor: Dotyk zła', 'Jacek Piekara', '9788375749496', 'Fantasy'),
(4, 'Ołowiany świt', 'Michał Gołkowski', '9788375748598', 'Fantasy'),
(5, 'Zapach szkła, część I', 'Andrzej Ziemiański', '9788381173438', 'Fantasy'),
(6, 'Sybirpunk, vol 3', 'Michał Gołkowski', '9788379645916', 'Fantasy'),
(7, 'Łowca z Lasu', 'Andriej Lewicki', '9788379640249', 'Fantasy'),
(8, 'Ja inkwizytor: Miecz Aniołów', 'Jacek Piekara', '9788379640072', 'Fantasy'),
(9, 'Ja inkwizytor: Łowcy Dusz', 'Jacek Piekara', '9788379640089', 'Fantasy'),
(10, 'Ja inkwizytor: Sługa boży', 'Jacek Piekara', '9788379640058', 'Fantasy'),
(11, 'Powrót', 'Michał Gołkowski', '9788379643202', 'Fantasy'),
(12, 'Future', 'Dmitry Glukhovsky', '9788363944483', 'Fantasy'),
(13, 'Ja inkwizytor: Młot na czarownice', 'Jacek Piekara', '9788379640065', 'Fantasy'),
(14, 'O północy w Czarnobylu', 'Adam Higginbotham', '9788381295611', 'Reportaż'),
(15, 'Sztywny', 'Michał Gołkowski', '9788379640645', 'Fantasy'),
(16, 'Sybirpunk, vol 1', 'Michał Gołkowski', '9788379645381', 'Fantasy'),
(17, 'Sybirpunk, vol 2', 'Michał Gołkowski', '9788379645688', 'Fantasy'),
(18, 'Ja inkwizytor: Kościany Galeon', 'Jacek Piekara', '9788379640157', 'Fantasy'),
(19, 'Wedle zasług', 'Sławomir Nieściur', '9788379641857', 'Fantasy'),
(20, 'Bastion', 'Stephen King', '9788381253888', 'Horror'),
(21, 'Władca pierścieni: Drużyna pierścienia', 'J.R.R. Tolkien', '9788324137862', 'Fantasy'),
(22, 'Władca pierścieni: Powrót Króla', 'J.R.R. Tolkien', '9788324137930', 'Fantasy'),
(23, 'Władca pierścieni: Dwie wieże', 'J.R.R. Tolkien', '9788324137923', 'Fantasy'),
(24, 'Ślepa plama', 'Wiktor Noczkin', '9788375747720', 'Fantasy'),
(25, 'Droga donikąd', 'Michał Gołkowski', '9788375745016', 'Fantasy'),
(26, 'Do zobaczenia w piekle', 'Sławomir Nieściur', '9788379643509', 'Fantasy'),
(27, 'Drugi brzeg', 'Michał Gołkowski', '9788375749939', 'Fantasy'),
(28, 'Metro 2033', 'Dmitry Glukhovsky', '9788365315014', 'Fantasy'),
(29, 'Metro 2034', 'Dmitry Glukhovsky', '9788365315038', 'Fantasy'),
(30, 'Uniwersum Metro 2033: Echo zgasłego świata', 'Dmitry Glukhovsky', '9788365315359', 'Fantasy'),
(31, '7 Kroków do własnej firmy', 'Tadeusz Bisewski', '9788377885857', 'Biznes'),
(32, 'Sztuka podstępu', 'Kevin Mitnick', '9788328331372', 'Bezpieczeństwo'),
(33, 'Stalowe szczury: Konigsberg', 'Michał Gołkowski', '9788379642021', 'Historyczne'),
(34, 'Droga szamana, Etap pierwszy: początek', 'Wasilij Machanienko', '9788366071032', 'Fantasy'),
(35, 'Metro 2035', 'Dmitry Glukhovsky', '9788365315052', 'Fantasy'),
(36, 'Hel 3', 'Jarosław Grzędowicz', '9788379642045', 'Fantasy'),
(37, 'Odważyli się wrócić', 'Patrick K. oDonnell', '9788379430901', 'Historyczne'),
(38, 'Cyfrak', 'Krzysztof Haladyn', '9788379643387', 'Fantasy'),
(39, 'Zombie2.pl', 'Robert Cichowlas', '9788381160711', 'Fantasy'),
(40, 'Uniwersum Metro 2033: Prawo do użycia siły', 'Dmitry Glukhovsky', '9788365315229', 'Fantasy'),
(41, 'Gra Geralda', 'Stephen King', '9788382156898', 'Fantasy');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `userbooks`
--

CREATE TABLE `userbooks` (
  `id` int(11) NOT NULL,
  `userId` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `bookId` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `date` varchar(100) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `lastName` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `address` varchar(256) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `userbooks`
--
ALTER TABLE `userbooks`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT dla tabeli `userbooks`
--
ALTER TABLE `userbooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
