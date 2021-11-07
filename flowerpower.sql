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
-- Database: `flowerpower`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `artikel`
--

CREATE TABLE `artikel` (
  `artikelcode` int(11) NOT NULL,
  `artikel` varchar(255) DEFAULT NULL,
  `prijs` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bestelling`
--

CREATE TABLE `bestelling` (
  `artikelcode` int(11) DEFAULT NULL,
  `winkelcode` int(11) DEFAULT NULL,
  `aantal` int(11) DEFAULT NULL,
  `klantcode` int(11) DEFAULT NULL,
  `medewerkerscode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `factuur`
--

CREATE TABLE `factuur` (
  `factuurnummer` int(11) NOT NULL,
  `factuurdatum` date DEFAULT NULL,
  `klantcode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `factuurregel`
--

CREATE TABLE `factuurregel` (
  `factuurnummer` int(11) DEFAULT NULL,
  `artikelcode` int(11) DEFAULT NULL,
  `aantal` int(11) DEFAULT NULL,
  `prijs` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klant`
--

CREATE TABLE `klant` (
  `klantcode` int(11) NOT NULL,
  `voorletters` varchar(10) DEFAULT NULL,
  `tussenvoegsels` varchar(50) DEFAULT NULL,
  `achternaam` varchar(255) DEFAULT NULL,
  `adres` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `woonplaats` varchar(255) DEFAULT NULL,
  `geboortedatum` date DEFAULT NULL,
  `gebruikersnaam` varchar(255) DEFAULT NULL,
  `wachtwoord` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `medewerker`
--

CREATE TABLE `medewerker` (
  `medewerkerscode` int(11) NOT NULL,
  `voorletters` varchar(10) DEFAULT NULL,
  `tussenvoegsels` varchar(50) DEFAULT NULL,
  `achternaam` varchar(255) DEFAULT NULL,
  `gebruikersnaam` varchar(255) DEFAULT NULL,
  `wachtwoord` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `medewerker`
--

INSERT INTO `medewerker` (`medewerkerscode`, `voorletters`, `tussenvoegsels`, `achternaam`, `gebruikersnaam`, `wachtwoord`) VALUES
(1, 'B', NULL, 'Zeeman', 'Bjarne', 'bjznfp');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `winkel`
--

CREATE TABLE `winkel` (
  `winkelcode` int(11) NOT NULL,
  `winkelnaam` varchar(255) DEFAULT NULL,
  `winkeladres` varchar(255) DEFAULT NULL,
  `winkelpostcode` varchar(255) DEFAULT NULL,
  `vestigingsplaats` varchar(255) DEFAULT NULL,
  `telefoonnummer` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`artikelcode`);

--
-- Indexen voor tabel `bestelling`
--
ALTER TABLE `bestelling`
  ADD KEY `artikelcode` (`artikelcode`),
  ADD KEY `winkelcode` (`winkelcode`),
  ADD KEY `klantcode` (`klantcode`),
  ADD KEY `medewerkerscode` (`medewerkerscode`);

--
-- Indexen voor tabel `factuur`
--
ALTER TABLE `factuur`
  ADD PRIMARY KEY (`factuurnummer`),
  ADD KEY `klantcode` (`klantcode`);

--
-- Indexen voor tabel `factuurregel`
--
ALTER TABLE `factuurregel`
  ADD KEY `factuurnummer` (`factuurnummer`),
  ADD KEY `artikelcode` (`artikelcode`);

--
-- Indexen voor tabel `klant`
--
ALTER TABLE `klant`
  ADD PRIMARY KEY (`klantcode`);

--
-- Indexen voor tabel `medewerker`
--
ALTER TABLE `medewerker`
  ADD PRIMARY KEY (`medewerkerscode`);

--
-- Indexen voor tabel `winkel`
--
ALTER TABLE `winkel`
  ADD PRIMARY KEY (`winkelcode`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `artikel`
--
ALTER TABLE `artikel`
  MODIFY `artikelcode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `factuur`
--
ALTER TABLE `factuur`
  MODIFY `factuurnummer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `klant`
--
ALTER TABLE `klant`
  MODIFY `klantcode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `medewerker`
--
ALTER TABLE `medewerker`
  MODIFY `medewerkerscode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `winkel`
--
ALTER TABLE `winkel`
  MODIFY `winkelcode` int(11) NOT NULL AUTO_INCREMENT;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `bestelling`
--
ALTER TABLE `bestelling`
  ADD CONSTRAINT `bestelling_ibfk_1` FOREIGN KEY (`artikelcode`) REFERENCES `artikel` (`artikelcode`),
  ADD CONSTRAINT `bestelling_ibfk_2` FOREIGN KEY (`winkelcode`) REFERENCES `winkel` (`winkelcode`),
  ADD CONSTRAINT `bestelling_ibfk_3` FOREIGN KEY (`klantcode`) REFERENCES `klant` (`klantcode`),
  ADD CONSTRAINT `bestelling_ibfk_4` FOREIGN KEY (`medewerkerscode`) REFERENCES `medewerker` (`medewerkerscode`);

--
-- Beperkingen voor tabel `factuur`
--
ALTER TABLE `factuur`
  ADD CONSTRAINT `factuur_ibfk_1` FOREIGN KEY (`klantcode`) REFERENCES `klant` (`klantcode`);

--
-- Beperkingen voor tabel `factuurregel`
--
ALTER TABLE `factuurregel`
  ADD CONSTRAINT `factuurregel_ibfk_1` FOREIGN KEY (`factuurnummer`) REFERENCES `factuur` (`factuurnummer`),
  ADD CONSTRAINT `factuurregel_ibfk_2` FOREIGN KEY (`artikelcode`) REFERENCES `artikel` (`artikelcode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
