-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 01 sep. 2023 à 14:28
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hockey`
--
CREATE DATABASE IF NOT EXISTS `hockey` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hockey`;

-- --------------------------------------------------------

--
-- Structure de la table `equipes`
--

CREATE TABLE `equipes` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `equipes`
--

INSERT INTO `equipes` (`id`, `nom`, `ville`, `image`) VALUES
(2, 'Pittsburgh Penguins', 'pittsburgh', 'Champions_Hockey_League_New_Logo.jpg'),
(3, '\r\nChicken Fried', 'Montreal', 'Logo_GRAYS_Hockey.jpg'),
(4, '\r\nFoetus d\'Ours', 'Saint-jerome', 'telechargement1.png'),
(5, '\r\nMighty Ducks', 'nashville', 'telechargement2.png'),
(6, '\r\nBoys Blues Band', 'vancouver', 'telechargement3.png'),
(7, '\r\nSnipeCity', 'laval', 'telechargement.png');

-- --------------------------------------------------------

--
-- Structure de la table `joueurs`
--

CREATE TABLE `joueurs` (
  `id` int(11) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `numero` int(11) NOT NULL,
  `position` varchar(255) NOT NULL,
  `but` int(11) NOT NULL,
  `passe` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `equipe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `joueurs`
--

INSERT INTO `joueurs` (`id`, `prenom`, `nom`, `numero`, `position`, `but`, `passe`, `image`, `equipe_id`) VALUES
(1, 'Heavan', 'Krap', 41, 'joueur', 84, 654, '8481540.jpg', 7),
(122, 'Mario', 'Richard', 1, 'joueur', 5, 700, '8473473.jpg', 6),
(123, 'Janelle', 'Richard', 2, 'gardien', 25, 300, '8474709.jpg', 2),
(124, 'Prunelle ', 'Lajoie', 3, 'joueur', 36, 280, '8474884.jpg', 2),
(125, 'Marion', 'Beaulieu', 4, 'joueur', 10, 600, '8475160.jpg', 2),
(126, 'Futelle', 'Larochelle', 1, 'joueur', 35, 600, '8475413.jpg', 3),
(127, 'Johny', 'Martel', 2, 'gardien', 50, 900, '8475714.jpg', 3),
(128, 'Goeffrey', 'Marcotte', 3, 'joueur', 34, 400, '8476867.jpg', 3),
(129, 'Nathan', 'Lo', 26, 'joueur', 50, 250, '8477392.jpg', 3),
(130, 'Boby', 'Martel', 2, 'joueur', 36, 400, '8477479.jpg', 4),
(131, 'Lara', 'Chiore', 28, 'jouer', 20, 300, '8477887.jpg', 4),
(132, 'Portel', 'Lajoie', 11, 'gardien', 12, 131, '8478439.jpg', 4),
(133, 'Pablo', 'Citel', 45, 'joueur', 34, 1000, '8478445.jpg', 4),
(134, 'Shadow', 'Lake', 89, 'joueur', 25, 360, '8479322.jpg', 5),
(135, 'Boby', 'No', 47, 'joueur', 44, 500, '8479526.jpg', 5),
(136, 'Pablo', 'Sanchez', 63, 'joueur', 56, 154, '8480018.jpg', 5),
(137, 'Label', 'Marto', 27, 'gardien', 30, 555, '8480032.jpg', 5),
(138, 'Hoke', 'Pouda', 52, 'gardien', 26, 123, '8480068.jpg', 6),
(139, 'Mario', 'Chicouane', 99, 'joueur', 23, 954, '8480797.jpg', 6),
(140, 'René', 'Richelle', 59, 'joueur', 84, 369, '8480838.jpg', 6),
(141, 'Romeo', 'Sallo', 123, 'gardien', 78, 254, '8480995.jpg', 6),
(142, 'Marion', 'Chartel', 26, 'joueur', 23, 896, '8481523.jpg', 7),
(144, 'Vero', 'Shoula', 75, 'joueur', 12, 124, '8481556.jpg', 7),
(146, 'Marion', 'Chicouanno', 555, 'gardien', 31, 600, '8481690.jpg', 7);

-- --------------------------------------------------------

--
-- Structure de la table `parties`
--

CREATE TABLE `parties` (
  `id` int(11) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `heure` time NOT NULL,
  `equipe1_id` int(11) NOT NULL,
  `equipe2_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `parties`
--

INSERT INTO `parties` (`id`, `ville`, `date`, `heure`, `equipe1_id`, `equipe2_id`) VALUES
(1, 'Montreal', '2023-10-31', '09:59:59', 6, 5),
(2, 'Laval', '2023-10-29', '08:55:55', 6, 3),
(3, 'Laval', '2023-10-27', '12:16:16', 5, 6),
(4, 'Montreal', '2023-11-29', '12:16:16', 5, 3),
(5, 'Brio', '2023-10-20', '12:16:16', 7, 2),
(6, 'Montreal', '2023-10-17', '12:16:16', 4, 5);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `equipes`
--
ALTER TABLE `equipes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `joueurs`
--
ALTER TABLE `joueurs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipe_id` (`equipe_id`);

--
-- Index pour la table `parties`
--
ALTER TABLE `parties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipe1_id` (`equipe1_id`),
  ADD KEY `equipe2_id` (`equipe2_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `equipes`
--
ALTER TABLE `equipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `joueurs`
--
ALTER TABLE `joueurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT pour la table `parties`
--
ALTER TABLE `parties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `joueurs`
--
ALTER TABLE `joueurs`
  ADD CONSTRAINT `joueurs_ibfk_1` FOREIGN KEY (`equipe_id`) REFERENCES `equipes` (`id`);

--
-- Contraintes pour la table `parties`
--
ALTER TABLE `parties`
  ADD CONSTRAINT `parties_ibfk_1` FOREIGN KEY (`equipe1_id`) REFERENCES `equipes` (`id`),
  ADD CONSTRAINT `parties_ibfk_2` FOREIGN KEY (`equipe2_id`) REFERENCES `equipes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
