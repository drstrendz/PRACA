-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Maj 28, 2024 at 05:15 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `firma`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `budzet`
--

CREATE TABLE `budzet` (
  `id` int(11) NOT NULL,
  `typ` enum('miesięczny','roczny') NOT NULL,
  `kategoria` varchar(100) NOT NULL,
  `uzytkownik_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cele`
--

CREATE TABLE `cele` (
  `id` int(11) NOT NULL,
  `kwota_celu` decimal(10,2) NOT NULL,
  `obecna_kwota` decimal(10,2) DEFAULT 0.00,
  `nazwa` varchar(255) NOT NULL,
  `data_rozpoczecia` date NOT NULL,
  `data_zakonczenia` date NOT NULL,
  `uzytkownik_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dochody`
--

CREATE TABLE `dochody` (
  `id` int(11) NOT NULL,
  `zrodlo` varchar(100) NOT NULL,
  `data` date NOT NULL,
  `kwota` decimal(10,2) NOT NULL,
  `opis` varchar(100) DEFAULT NULL,
  `uzytkownik_id` int(11) DEFAULT NULL,
  `budzet_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dochody`
--

INSERT INTO `dochody` (`id`, `zrodlo`, `data`, `kwota`, `opis`, `uzytkownik_id`, `budzet_id`) VALUES
(45, 'dfsdfsf', '2024-06-09', 45464.00, '', 6, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `konta_bankowe`
--

CREATE TABLE `konta_bankowe` (
  `id` int(11) NOT NULL,
  `kod_konta` varchar(50) NOT NULL,
  `kwota` decimal(10,2) NOT NULL,
  `uzytkownik_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `transakcje_bankowe`
--

CREATE TABLE `transakcje_bankowe` (
  `id` int(11) NOT NULL,
  `konto_id` int(11) DEFAULT NULL,
  `uzytkownik_id` int(11) DEFAULT NULL,
  `data` date NOT NULL,
  `kwota` decimal(10,2) NOT NULL,
  `opis` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `imie` varchar(100) NOT NULL,
  `nazwisko` varchar(100) NOT NULL,
  `haslo` varchar(255) NOT NULL,
  `kod_dodatkowy` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uzytkownik`
--

INSERT INTO `uzytkownik` (`id`, `email`, `imie`, `nazwisko`, `haslo`, `kod_dodatkowy`) VALUES
(6, 'W@A', 'WWWWWAAAAWW', 'aaaAAAAAAA', 'aaa', '407469');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wydatki`
--

CREATE TABLE `wydatki` (
  `id` int(11) NOT NULL,
  `kategoria` varchar(100) NOT NULL,
  `kwota` decimal(10,2) NOT NULL,
  `opis` text DEFAULT NULL,
  `data` date NOT NULL,
  `uzytkownik_id` int(11) DEFAULT NULL,
  `budzet_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `budzet`
--
ALTER TABLE `budzet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- Indeksy dla tabeli `cele`
--
ALTER TABLE `cele`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- Indeksy dla tabeli `dochody`
--
ALTER TABLE `dochody`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`),
  ADD KEY `budzet_id` (`budzet_id`);

--
-- Indeksy dla tabeli `konta_bankowe`
--
ALTER TABLE `konta_bankowe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- Indeksy dla tabeli `transakcje_bankowe`
--
ALTER TABLE `transakcje_bankowe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `konto_id` (`konto_id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- Indeksy dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `wydatki`
--
ALTER TABLE `wydatki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`),
  ADD KEY `budzet_id` (`budzet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `budzet`
--
ALTER TABLE `budzet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cele`
--
ALTER TABLE `cele`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dochody`
--
ALTER TABLE `dochody`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `konta_bankowe`
--
ALTER TABLE `konta_bankowe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transakcje_bankowe`
--
ALTER TABLE `transakcje_bankowe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wydatki`
--
ALTER TABLE `wydatki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `budzet`
--
ALTER TABLE `budzet`
  ADD CONSTRAINT `budzet_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`id`);

--
-- Constraints for table `cele`
--
ALTER TABLE `cele`
  ADD CONSTRAINT `cele_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`id`);

--
-- Constraints for table `dochody`
--
ALTER TABLE `dochody`
  ADD CONSTRAINT `dochody_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`id`),
  ADD CONSTRAINT `dochody_ibfk_2` FOREIGN KEY (`budzet_id`) REFERENCES `budzet` (`id`);

--
-- Constraints for table `konta_bankowe`
--
ALTER TABLE `konta_bankowe`
  ADD CONSTRAINT `konta_bankowe_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`id`);

--
-- Constraints for table `transakcje_bankowe`
--
ALTER TABLE `transakcje_bankowe`
  ADD CONSTRAINT `transakcje_bankowe_ibfk_1` FOREIGN KEY (`konto_id`) REFERENCES `konta_bankowe` (`id`),
  ADD CONSTRAINT `transakcje_bankowe_ibfk_2` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`id`);

--
-- Constraints for table `wydatki`
--
ALTER TABLE `wydatki`
  ADD CONSTRAINT `wydatki_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`id`),
  ADD CONSTRAINT `wydatki_ibfk_2` FOREIGN KEY (`budzet_id`) REFERENCES `budzet` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
