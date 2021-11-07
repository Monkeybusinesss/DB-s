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
-- Database: `sterrenstelsel`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `planeten`
--

CREATE TABLE `planeten` (
  `naam` varchar(255) NOT NULL,
  `diameter` int(11) NOT NULL,
  `afstand` int(11) NOT NULL,
  `massa` int(11) NOT NULL,
  `bezoekdatum` datetime DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `planeten`
--

INSERT INTO `planeten` (`naam`, `diameter`, `afstand`, `massa`, `bezoekdatum`, `id`) VALUES
('Zon', 1392000, 0, 332946, NULL, 1),
('Mercurius', 4880, 57910000, 0, NULL, 2),
('Venus', 12104, 108208930, 1, NULL, 3),
('Aarde', 12756, 14957870, 1, NULL, 4),
('Mars', 6794, 227936640, 0, NULL, 5);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `planeten`
--
ALTER TABLE `planeten`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `planeten`
--
ALTER TABLE `planeten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
