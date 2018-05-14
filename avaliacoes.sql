-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 15-Maio-2018 às 01:53
-- Versão do servidor: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `avaliacoes`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `artigos`
--

CREATE TABLE `artigos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `votos` int(11) NOT NULL,
  `pontos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `artigos`
--

INSERT INTO `artigos` (`id`, `titulo`, `votos`, `pontos`) VALUES
(1, 'Artigo 1', 3, 13),
(2, 'Artigo 2', 12, 39),
(3, 'Artigo 3', 9, 31),
(4, 'Artigo 4', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `historicovotos`
--

CREATE TABLE `historicovotos` (
  `idusuario` int(11) NOT NULL,
  `nota` int(11) NOT NULL,
  `idartigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `historicovotos`
--

INSERT INTO `historicovotos` (`idusuario`, `nota`, `idartigo`) VALUES
(0, 3, 2),
(1, 4, 3),
(2, 5, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artigos`
--
ALTER TABLE `artigos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `historicovotos`
--
ALTER TABLE `historicovotos`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `idartigo` (`idartigo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artigos`
--
ALTER TABLE `artigos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `historicovotos`
--
ALTER TABLE `historicovotos`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `historicovotos`
--
ALTER TABLE `historicovotos`
  ADD CONSTRAINT `historicovotos_ibfk_1` FOREIGN KEY (`idartigo`) REFERENCES `artigos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
