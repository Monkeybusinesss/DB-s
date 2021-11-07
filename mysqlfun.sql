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
-- Database: `mysqlfun`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klant`
--

CREATE TABLE `klant` (
  `Id` int(11) NOT NULL,
  `Naam` varchar(255) DEFAULT NULL,
  `Achternaam` varchar(255) DEFAULT NULL,
  `Adres_straatnaam` varchar(255) DEFAULT NULL,
  `Stad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `klant`
--

INSERT INTO `klant` (`Id`, `Naam`, `Achternaam`, `Adres_straatnaam`, `Stad`) VALUES
(1, 'Bram', 'Dijkstra', 'Pijlslaan 11', 'Haarlem'),
(2, 'Henk', 'Jansen', 'Molenbeekstraat 47', 'Utrecht'),
(3, 'Hans', 'van den Berg', 'Geulstraat 25', 'Amersfoort');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `orders`
--

CREATE TABLE `orders` (
  `Id` int(11) NOT NULL,
  `Klant_id` int(11) DEFAULT NULL,
  `Product` varchar(255) DEFAULT NULL,
  `Aantal` int(11) DEFAULT NULL,
  `Prijs` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `orders`
--

INSERT INTO `orders` (`Id`, `Klant_id`, `Product`, `Aantal`, `Prijs`) VALUES
(1, 1, 'Sokken', 1, '9.99'),
(2, 2, 'Broek', 1, '65.95'),
(3, 2, 'Trui', 1, '45.50'),
(4, 3, 'Sokken', 1, '9.99'),
(5, 3, 'Broek', 1, '65.95'),
(6, 3, 'Trui', 1, '45.50'),
(7, 3, 'Pet', 1, '15.95');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `klant`
--
ALTER TABLE `klant`
  ADD PRIMARY KEY (`Id`);

--
-- Indexen voor tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Klant_id` (`Klant_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `klant`
--
ALTER TABLE `klant`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Klant_id`) REFERENCES `klant` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
