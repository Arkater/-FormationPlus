-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 13 fév. 2020 à 19:49
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `formationplus`
--

-- --------------------------------------------------------

--
-- Structure de la table `attestation`
--

DROP TABLE IF EXISTS `attestation`;
CREATE TABLE IF NOT EXISTS `attestation` (
  `idAttestation` int(11) NOT NULL AUTO_INCREMENT,
  `message` text DEFAULT NULL,
  `etudiant` int(11) NOT NULL,
  `convention` int(11) NOT NULL,
  PRIMARY KEY (`idAttestation`),
  KEY `fk_convention_att` (`convention`),
  KEY `fk_etudiant_att` (`etudiant`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `attestation`
--

INSERT INTO `attestation` (`idAttestation`, `message`, `etudiant`, `convention`) VALUES
(5, ' \r\nBonjour Man Rey,\r\n	\r\n	\r\nVous avez suivi 10 heures de formation chez FormationPlus.\r\nPouvez-vous nous retourner ce mail avec la piÃ¨ce jointe signÃ©e.\r\n	\r\n	\r\n	\r\nCordialement,\r\nFormationPlus', 6, 3),
(4, ' \r\nBonjour Emare Jean,\r\n	\r\n	\r\nVous avez suivi 3 heures de formation chez FormationPlus.\r\nPouvez-vous nous retourner ce mail avec la piÃ¨ce jointe signÃ©e.\r\n	\r\n	\r\n	\r\nCordialement,\r\nFormationPlus', 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `convention`
--

DROP TABLE IF EXISTS `convention`;
CREATE TABLE IF NOT EXISTS `convention` (
  `idConvention` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) DEFAULT NULL,
  `nbHeur` int(11) DEFAULT NULL,
  PRIMARY KEY (`idConvention`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `convention`
--

INSERT INTO `convention` (`idConvention`, `nom`, `nbHeur`) VALUES
(1, 'Convention1', 3),
(2, 'Convention2', 34),
(3, 'Convention3', 10);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `idEtudiant` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) DEFAULT NULL,
  `prenom` varchar(40) DEFAULT NULL,
  `mail` varchar(40) DEFAULT NULL,
  `convention` int(11) NOT NULL,
  PRIMARY KEY (`idEtudiant`),
  KEY `fk_convention_etu` (`convention`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`idEtudiant`, `nom`, `prenom`, `mail`, `convention`) VALUES
(1, 'Rage', 'Jean', 'Jeanrage@mail.fr', 1),
(2, 'Emare', 'Jean', 'JeanMichel@mail.com', 1),
(5, 'Line', 'Fay', 'Fayline@Gmail.com', 2),
(6, 'Man', 'Rey', 'RayMan@ubisoft.fr', 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
