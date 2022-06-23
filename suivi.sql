-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 17 juin 2022 à 10:28
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `suivi`
--

-- --------------------------------------------------------

--
-- Structure de la table `appartements`
--

CREATE TABLE `appartements` (
  `id_apt` int(11) NOT NULL,
  `designation` varchar(20) NOT NULL,
  `nb_cmb` int(11) DEFAULT NULL,
  `nb_dch` int(11) DEFAULT NULL,
  `nb_sln` int(11) DEFAULT NULL,
  `nb_cuisine` int(11) DEFAULT NULL,
  `type_wc` text DEFAULT NULL,
  `info_sup` text DEFAULT NULL,
  `id_pro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `etat_des_lieux`
--

CREATE TABLE `etat_des_lieux` (
  `id_edl` int(11) NOT NULL,
  `designatiton` text DEFAULT NULL,
  `quantité` int(11) DEFAULT NULL,
  `etat_edl` text DEFAULT NULL,
  `id_pro` int(11) DEFAULT NULL,
  `id_apt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `factures`
--

CREATE TABLE `factures` (
  `id_fact` int(11) NOT NULL,
  `motif_fact` text DEFAULT NULL,
  `date_fact` date DEFAULT NULL,
  `montant_fact` int(11) DEFAULT NULL,
  `id_pro` int(11) DEFAULT NULL,
  `id_loc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `interventions`
--

CREATE TABLE `interventions` (
  `id_int` int(11) NOT NULL,
  `motif_int` text DEFAULT NULL,
  `description_int` text DEFAULT NULL,
  `date_int` date DEFAULT NULL,
  `id_loc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `locataires`
--

CREATE TABLE `locataires` (
  `id_loc` int(11) NOT NULL,
  `nom` text DEFAULT NULL,
  `prenom` text DEFAULT NULL,
  `statut_loc` text DEFAULT NULL,
  `tel` int(11) DEFAULT NULL,
  `mail` text DEFAULT NULL,
  `mdp` text DEFAULT NULL,
  `id_pro` int(11) NOT NULL,
  `id_apt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `plaintes`
--

CREATE TABLE `plaintes` (
  `id_plt` int(11) NOT NULL,
  `msg_plt` text DEFAULT NULL,
  `date_plt` date DEFAULT NULL,
  `statut_plt` text DEFAULT NULL,
  `id_loc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `proprietaires`
--

CREATE TABLE `proprietaires` (
  `id_pro` int(11) NOT NULL,
  `nom` text DEFAULT NULL,
  `prenom` text DEFAULT NULL,
  `tel` int(11) DEFAULT NULL,
  `mail` text DEFAULT NULL,
  `mdp` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `proprietaires`
--

INSERT INTO `proprietaires` (`id_pro`, `nom`, `prenom`, `tel`, `mail`, `mdp`) VALUES
(6, 'hjuj', 'jgkhkl', 545245, 'q@q.q', '$2y$10$mWugE3LPdv/lOIBdlsOkw.UwlQpBAa8LDmzwqeEs4cJjbK/KlAon.');

-- --------------------------------------------------------

--
-- Structure de la table `suivis`
--

CREATE TABLE `suivis` (
  `id_svs` int(11) NOT NULL,
  `date_deb` date DEFAULT NULL,
  `date_ech` date DEFAULT NULL,
  `statut_svs` text DEFAULT NULL,
  `id_pro` int(11) DEFAULT NULL,
  `id_loc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `appartements`
--
ALTER TABLE `appartements`
  ADD PRIMARY KEY (`id_apt`),
  ADD KEY `id_pro` (`id_pro`);

--
-- Index pour la table `etat_des_lieux`
--
ALTER TABLE `etat_des_lieux`
  ADD PRIMARY KEY (`id_edl`),
  ADD KEY `id_pro` (`id_pro`),
  ADD KEY `id_apt` (`id_apt`);

--
-- Index pour la table `factures`
--
ALTER TABLE `factures`
  ADD PRIMARY KEY (`id_fact`),
  ADD KEY `id_pro` (`id_pro`),
  ADD KEY `id_loc` (`id_loc`);

--
-- Index pour la table `interventions`
--
ALTER TABLE `interventions`
  ADD PRIMARY KEY (`id_int`),
  ADD KEY `id_loc` (`id_loc`);

--
-- Index pour la table `locataires`
--
ALTER TABLE `locataires`
  ADD PRIMARY KEY (`id_loc`),
  ADD KEY `id_pro` (`id_pro`),
  ADD KEY `id_apt` (`id_apt`);

--
-- Index pour la table `plaintes`
--
ALTER TABLE `plaintes`
  ADD PRIMARY KEY (`id_plt`),
  ADD KEY `id_loc` (`id_loc`);

--
-- Index pour la table `proprietaires`
--
ALTER TABLE `proprietaires`
  ADD PRIMARY KEY (`id_pro`);

--
-- Index pour la table `suivis`
--
ALTER TABLE `suivis`
  ADD PRIMARY KEY (`id_svs`),
  ADD KEY `id_pro` (`id_pro`),
  ADD KEY `id_loc` (`id_loc`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `appartements`
--
ALTER TABLE `appartements`
  MODIFY `id_apt` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `etat_des_lieux`
--
ALTER TABLE `etat_des_lieux`
  MODIFY `id_edl` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `factures`
--
ALTER TABLE `factures`
  MODIFY `id_fact` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `interventions`
--
ALTER TABLE `interventions`
  MODIFY `id_int` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `locataires`
--
ALTER TABLE `locataires`
  MODIFY `id_loc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `plaintes`
--
ALTER TABLE `plaintes`
  MODIFY `id_plt` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `proprietaires`
--
ALTER TABLE `proprietaires`
  MODIFY `id_pro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `suivis`
--
ALTER TABLE `suivis`
  MODIFY `id_svs` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartements`
--
ALTER TABLE `appartements`
  ADD CONSTRAINT `appartements_ibfk_1` FOREIGN KEY (`id_pro`) REFERENCES `proprietaires` (`id_pro`);

--
-- Contraintes pour la table `etat_des_lieux`
--
ALTER TABLE `etat_des_lieux`
  ADD CONSTRAINT `etat_des_lieux_ibfk_1` FOREIGN KEY (`id_pro`) REFERENCES `proprietaires` (`id_pro`),
  ADD CONSTRAINT `etat_des_lieux_ibfk_2` FOREIGN KEY (`id_apt`) REFERENCES `appartements` (`id_apt`);

--
-- Contraintes pour la table `factures`
--
ALTER TABLE `factures`
  ADD CONSTRAINT `factures_ibfk_1` FOREIGN KEY (`id_pro`) REFERENCES `proprietaires` (`id_pro`),
  ADD CONSTRAINT `factures_ibfk_2` FOREIGN KEY (`id_loc`) REFERENCES `locataires` (`id_loc`);

--
-- Contraintes pour la table `interventions`
--
ALTER TABLE `interventions`
  ADD CONSTRAINT `interventions_ibfk_1` FOREIGN KEY (`id_loc`) REFERENCES `locataires` (`id_loc`);

--
-- Contraintes pour la table `locataires`
--
ALTER TABLE `locataires`
  ADD CONSTRAINT `locataires_ibfk_1` FOREIGN KEY (`id_pro`) REFERENCES `proprietaires` (`id_pro`),
  ADD CONSTRAINT `locataires_ibfk_2` FOREIGN KEY (`id_apt`) REFERENCES `appartements` (`id_apt`);

--
-- Contraintes pour la table `plaintes`
--
ALTER TABLE `plaintes`
  ADD CONSTRAINT `plaintes_ibfk_1` FOREIGN KEY (`id_loc`) REFERENCES `locataires` (`id_loc`);

--
-- Contraintes pour la table `suivis`
--
ALTER TABLE `suivis`
  ADD CONSTRAINT `suivis_ibfk_1` FOREIGN KEY (`id_pro`) REFERENCES `proprietaires` (`id_pro`),
  ADD CONSTRAINT `suivis_ibfk_2` FOREIGN KEY (`id_loc`) REFERENCES `locataires` (`id_loc`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
