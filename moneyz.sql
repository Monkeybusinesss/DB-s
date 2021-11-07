-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 06 nov 2021 om 16:00
-- Serverversie: 10.4.21-MariaDB
-- PHP-versie: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moneyz`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tblmoneyz`
--

CREATE TABLE `tblmoneyz` (
  `Id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Moneyz` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `tblmoneyz`
--

INSERT INTO `tblmoneyz` (`Id`, `User_id`, `Moneyz`) VALUES
(1, 1, 50),
(2, 3, 50);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tbluser`
--

CREATE TABLE `tbluser` (
  `Id` int(11) NOT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Created_at` datetime DEFAULT current_timestamp(),
  `Updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `tbluser`
--

INSERT INTO `tbluser` (`Id`, `Username`, `Password`, `Created_at`, `Updated_at`) VALUES
(1, 'Bjarne', '1234', '2021-04-26 23:14:15', '2021-04-26 23:14:15'),
(2, 'Bjarne2', '1234', '2021-04-26 23:14:37', '2021-04-26 23:14:37'),
(3, 'Bjarne3', '1234', '2021-04-26 23:14:48', '2021-04-26 23:14:48');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `tblmoneyz`
--
ALTER TABLE `tblmoneyz`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexen voor tabel `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `tblmoneyz`
--
ALTER TABLE `tblmoneyz`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `tblmoneyz`
--
ALTER TABLE `tblmoneyz`
  ADD CONSTRAINT `tblmoneyz_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `tbluser` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
