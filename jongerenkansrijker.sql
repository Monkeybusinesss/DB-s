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
-- Database: `jongerenkansrijker`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `activiteit`
--

CREATE TABLE `activiteit` (
  `activiteitcode` int(11) NOT NULL,
  `activiteit` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `instituut`
--

CREATE TABLE `instituut` (
  `instituutcode` int(11) NOT NULL,
  `instituut` varchar(40) NOT NULL,
  `instituuttelefoon` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jongere`
--

CREATE TABLE `jongere` (
  `jongerecode` int(11) NOT NULL,
  `roepnaam` varchar(20) NOT NULL,
  `tussenvoegsel` varchar(7) DEFAULT NULL,
  `achternaam` varchar(25) NOT NULL,
  `inschrijFdatum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jongereactiviteit`
--

CREATE TABLE `jongereactiviteit` (
  `jongereactiviteitcode` int(11) NOT NULL,
  `jongerecode` int(11) NOT NULL,
  `activiteitcode` int(11) NOT NULL,
  `startdatum` date DEFAULT NULL,
  `afgerond` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jongereinstituut`
--

CREATE TABLE `jongereinstituut` (
  `jongereinstituutcode` int(11) NOT NULL,
  `jongerecode` int(11) NOT NULL,
  `instituutcode` int(11) NOT NULL,
  `startdatum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `medewerker`
--

CREATE TABLE `medewerker` (
  `medewerkercode` int(11) NOT NULL,
  `medewerkernaam` varchar(40) NOT NULL,
  `medewerkertussenvoegsel` varchar(40) DEFAULT NULL,
  `medewerkerachternaam` varchar(40) NOT NULL,
  `medewerkergebruikersnaam` varchar(255) DEFAULT NULL,
  `medewerkerwachtwoord` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `medewerker`
--

INSERT INTO `medewerker` (`medewerkercode`, `medewerkernaam`, `medewerkertussenvoegsel`, `medewerkerachternaam`, `medewerkergebruikersnaam`, `medewerkerwachtwoord`) VALUES
(1, 'Jan', 'van', 'Loon', 'JvLoon', '1234'),
(2, 'Bjarne', 'b', 'Zeeman', 'bzeeman', '4444'),
(4, 'Bjarne', 'bb', 'Zeeman', 'bbzeeman', '4444'),
(5, 'Bjarne', 'bbb', 'Zeeman', 'bbbzeeman', '4444'),
(6, 'Bjarne', 'bbbb', 'Zeeman', 'bbbbzeeman', '4321'),
(8, 'Bjarne', 'b', 'Zeeman', 'bzzeeman', '4444');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `activiteit`
--
ALTER TABLE `activiteit`
  ADD PRIMARY KEY (`activiteitcode`);

--
-- Indexen voor tabel `instituut`
--
ALTER TABLE `instituut`
  ADD PRIMARY KEY (`instituutcode`);

--
-- Indexen voor tabel `jongere`
--
ALTER TABLE `jongere`
  ADD PRIMARY KEY (`jongerecode`);

--
-- Indexen voor tabel `jongereactiviteit`
--
ALTER TABLE `jongereactiviteit`
  ADD PRIMARY KEY (`jongereactiviteitcode`),
  ADD KEY `jongerecode` (`jongerecode`),
  ADD KEY `activiteitcode` (`activiteitcode`);

--
-- Indexen voor tabel `jongereinstituut`
--
ALTER TABLE `jongereinstituut`
  ADD PRIMARY KEY (`jongereinstituutcode`),
  ADD KEY `jongerecode` (`jongerecode`),
  ADD KEY `instituutcode` (`instituutcode`);

--
-- Indexen voor tabel `medewerker`
--
ALTER TABLE `medewerker`
  ADD PRIMARY KEY (`medewerkercode`),
  ADD UNIQUE KEY `medewerkergebruikersnaam` (`medewerkergebruikersnaam`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `activiteit`
--
ALTER TABLE `activiteit`
  MODIFY `activiteitcode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `instituut`
--
ALTER TABLE `instituut`
  MODIFY `instituutcode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `jongere`
--
ALTER TABLE `jongere`
  MODIFY `jongerecode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `jongereactiviteit`
--
ALTER TABLE `jongereactiviteit`
  MODIFY `jongereactiviteitcode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `jongereinstituut`
--
ALTER TABLE `jongereinstituut`
  MODIFY `jongereinstituutcode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `medewerker`
--
ALTER TABLE `medewerker`
  MODIFY `medewerkercode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `jongereactiviteit`
--
ALTER TABLE `jongereactiviteit`
  ADD CONSTRAINT `jongereactiviteit_ibfk_1` FOREIGN KEY (`jongerecode`) REFERENCES `jongere` (`jongerecode`),
  ADD CONSTRAINT `jongereactiviteit_ibfk_2` FOREIGN KEY (`activiteitcode`) REFERENCES `activiteit` (`activiteitcode`);

--
-- Beperkingen voor tabel `jongereinstituut`
--
ALTER TABLE `jongereinstituut`
  ADD CONSTRAINT `jongereinstituut_ibfk_1` FOREIGN KEY (`jongerecode`) REFERENCES `jongere` (`jongerecode`),
  ADD CONSTRAINT `jongereinstituut_ibfk_2` FOREIGN KEY (`instituutcode`) REFERENCES `instituut` (`instituutcode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
