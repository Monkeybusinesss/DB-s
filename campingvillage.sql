-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 06 nov 2021 om 15:59
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
-- Database: `campingvillage`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `activiteiten`
--

CREATE TABLE `activiteiten` (
  `naam` varchar(255) NOT NULL,
  `activiteit` varchar(255) NOT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `activiteiten`
--

INSERT INTO `activiteiten` (`naam`, `activiteit`, `datum`) VALUES
('Bjarne', 'Mountainbiken', '2021-04-14'),
('Bjarne', 'Water Aerobics', '2021-04-18'),
('Bjarne', 'Water Aerobics', '2021-04-18'),
('Bjarne', 'Jeu de Boele wedstrijd', '2021-04-22'),
('Bjarne', 'Mountainbiken', '2021-04-12'),
('hgffgf', 'Mountainbiken', '2021-11-16');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `medewerkers`
--

CREATE TABLE `medewerkers` (
  `id` int(11) NOT NULL,
  `naam` varchar(255) NOT NULL,
  `wachtwoord` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `medewerkers`
--

INSERT INTO `medewerkers` (`id`, `naam`, `wachtwoord`) VALUES
(1, 'Bjarne', 'bjtestdb');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `reserveren`
--

CREATE TABLE `reserveren` (
  `id` int(11) NOT NULL,
  `naam` varchar(255) NOT NULL,
  `adres` varchar(255) NOT NULL,
  `datum` date NOT NULL,
  `aantal_dagen` int(11) NOT NULL,
  `tent_of_caravan` varchar(255) NOT NULL,
  `aantal_personen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `reserveren`
--

INSERT INTO `reserveren` (`id`, `naam`, `adres`, `datum`, `aantal_dagen`, `tent_of_caravan`, `aantal_personen`) VALUES
(1, 'Bjarne Zeeman', 'teststraat 66', '2021-04-20', 14, 'Tent', 4),
(2, 'Bjarne Zeeman', 'teststraat 89', '2021-04-19', 18, 'Caravan', 3),
(3, 'Bjarne', 'jnhbgfvdcas', '2021-11-02', 5, 'Tent', 4);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `medewerkers`
--
ALTER TABLE `medewerkers`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `reserveren`
--
ALTER TABLE `reserveren`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `medewerkers`
--
ALTER TABLE `medewerkers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `reserveren`
--
ALTER TABLE `reserveren`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
