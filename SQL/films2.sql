-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le :  mar. 03 mars 2020 à 08:13
-- Version du serveur :  5.7.26
-- Version de PHP :  7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `films`
--

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `annee` int(11) NOT NULL,
  `nbSpectateurs` int(11) NOT NULL,
  `idRealisateur` int(11) DEFAULT NULL,
  `idGenre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`id`, `titre`, `annee`, `nbSpectateurs`, `idRealisateur`, `idGenre`) VALUES
(1, 'Le discours d\'un roi', 2010, 100000, 1, 2),
(2, 'Inception', 2010, 1000000, 4, 1),
(3, 'Virgin Suicides', 1999, 300000, 2, 3),
(4, 'Into The Wild', 2007, 5456433, 3, 3),
(5, 'Les petits mouchoirs', 2010, 5553342, 5, 3),
(6, 'Le Convoyeur', 2004, 532134, NULL, 4),
(7, 'Brice de Nice', 2005, 9804352, 8, 2),
(8, 'OSS117: Rio ne répond plus', 2009, 7453453, 8, 2),
(9, 'Ensemble c\'est tout', 2004, 1323963, 5, 3),
(10, 'Mon Idole', 2001, 543278, 5, 3),
(11, 'La mome', 2007, 4356743, NULL, 3),
(12, 'On se calme et on boit frais à Saint tropez', 1987, 34564, 12, 2),
(13, 'Deux enfoirés à Saint Tropez', 1986, 3432, 12, 2),
(14, 'Mieux vaut être riche et bien portant que pauvre et fauché', 1980, 10023, 12, 2),
(15, 'Bienvenus chez les ch\'tis', 2008, 16034567, 9, 2),
(16, 'La vie de Chantier', 2004, 435255, 9, 2),
(17, 'Mystic River', 2003, 45345, 13, 3),
(18, 'Gran Torino', 2008, 232123, 13, 3),
(19, 'Le parrain', 1972, 1232344, 2, 4),
(20, 'Memento', 2003, 32567, 4, 1),
(21, 'Shutter Island', 2010, 2143789, 16, 1),
(22, 'Aviator', 2004, 245893, 16, 3),
(23, 'Les infiltrés', 2006, 897345, 16, 4),
(24, 'Gilbert Grape', 1993, 653456, NULL, 3),
(25, 'La plage', 2000, 89999, 14, 3),
(27, 'Enfermés Dehors', 2006, 132890, 17, 2),
(28, 'Dikkenek', 2006, 49000, NULL, 2),
(29, 'Les affranchis', 1990, 123445, 16, 1),
(31, 'Rien à Declarer', 2011, 5200111, 9, 2),
(32, 'The dark knight rises', 2012, 1233331, 4, 5),
(33, 'Radiostars', 2012, 300111, NULL, 2),
(34, 'J. Edgar', 2011, 9000, 13, 1),
(35, 'The artist', 2011, 9000000, NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id`, `type`) VALUES
(1, 'thriller'),
(2, 'comédie'),
(3, 'drame'),
(4, 'policier'),
(5, 'aventure'),
(6, 'tragedie');

-- --------------------------------------------------------

--
-- Structure de la table `joue`
--

CREATE TABLE `joue` (
  `idActeur` int(11) NOT NULL,
  `idFilm` int(11) NOT NULL,
  `salaire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `joue`
--

INSERT INTO `joue` (`idActeur`, `idFilm`, `salaire`) VALUES
(3, 4, 550277),
(3, 17, 203603),
(5, 9, 681292),
(5, 10, 947373),
(5, 25, 256672),
(6, 2, 315458),
(6, 5, 275854),
(6, 11, 646975),
(6, 28, 339434),
(6, 32, 5123401),
(7, 2, 778395),
(7, 21, 432064),
(7, 22, 983860),
(7, 23, 450022),
(7, 24, 404078),
(7, 25, 676262),
(7, 34, 12500000),
(8, 5, 582474),
(8, 6, 199675),
(8, 7, 809877),
(8, 8, 244183),
(8, 35, 500000),
(9, 15, 508215),
(9, 16, 202113),
(9, 31, 1000000),
(10, 9, 313368),
(11, 7, 484741),
(11, 33, 123456),
(13, 18, 280837),
(15, 24, 69282),
(17, 6, 498255),
(17, 27, 158210),
(24, 8, 708903),
(24, 28, 561401),
(24, 31, 1000),
(25, 31, 100000);

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `prenom` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pays` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `naissance` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`id`, `nom`, `prenom`, `pays`, `naissance`) VALUES
(1, 'Hooper', 'Tom', 'Angleterre', '1972-03-03'),
(2, 'Copolla', 'Sofia', 'Etats-Unis', '1971-05-14'),
(3, 'Penn', 'Sean', 'Etats-Unis', '1960-08-17'),
(4, 'Nolan', 'Christopher', 'Etats-Unis', '1970-07-30'),
(5, 'Canet', 'Guillaume', 'France', '1973-04-10'),
(6, 'Cotillard', 'Marion', 'France', '1975-09-30'),
(7, 'Di Caprio', 'Leonardo', 'Etats-Unis', '1974-11-11'),
(8, 'Dujardin', 'Jean', 'France', '1972-06-19'),
(9, 'Boon', 'Dany', 'France', '1966-06-26'),
(10, 'Tautou', 'Audrey', 'France', '1976-08-09'),
(11, 'Cornillac', 'Clovis', 'France', '1967-08-16'),
(12, 'Pecas', 'Max', 'France', '1925-04-25'),
(13, 'Eastwood', 'Clint', 'France', '1930-05-31'),
(14, 'Boyle', 'Danny', 'Etats-Unis', '1956-10-20'),
(15, 'Depp', 'Johnny', 'Etats-Unis', '1963-06-09'),
(16, 'Scorcesse', 'Martin', 'Etats-Unis', '1942-11-17'),
(17, 'Dupontel', 'Albert', 'France', '1964-01-11'),
(18, 'Cassel', 'Vincent', 'France', '1966-11-23'),
(19, 'Cassel', 'Jean-Pierre', 'France', '1932-10-27'),
(20, 'Copolla', 'Francis-Ford', 'Etats-Unis', '1939-04-07'),
(21, 'Seigner', 'Mathilde', 'France', '1968-01-17'),
(22, 'Seigner', 'Emmanuelle', 'France', '1966-06-22'),
(23, 'Berri', 'Claude', 'France', '1934-01-12'),
(24, 'Damiens', 'François', 'Belgique', '1973-01-17'),
(25, 'Poelvoorde', 'Benoit', 'Belgique', '1964-09-22');

-- --------------------------------------------------------

--
-- Structure de la table `realisateur`
--

CREATE TABLE `realisateur` (
  `idRealisateur` int(11) NOT NULL,
  `nomR` varchar(30) NOT NULL,
  `prenomR` varchar(30) NOT NULL,
  `paysR` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `realisateur`
--

INSERT INTO `realisateur` (`idRealisateur`, `nomR`, `prenomR`, `paysR`) VALUES
(1, 'Martin', 'Scorcesse', 'USA'),
(2, 'Tom', 'Hanks', 'USA'),
(3, 'Patrick', 'Jane', 'USA'),
(4, 'Syllvester', 'Stalone', 'USA'),
(5, 'Will', 'Smith', 'USA'),
(6, 'Bruce', 'Willis', 'USA'),
(7, 'Gérard', 'Depardieu', 'FR'),
(8, 'Jean', 'Renaud', 'FR'),
(9, 'Sara', 'Miller', 'BE'),
(10, 'Corona', 'Virus', 'USA'),
(11, 'William', 'Hanna', 'USA'),
(12, 'ABC', 'ABC', 'USA'),
(13, 'ABC', 'ABC', 'USA'),
(14, 'ABC', 'ABC', 'USA'),
(15, 'ABC', 'ABC', 'USA'),
(16, 'ABC', 'ABC', 'USA'),
(17, 'ABC', 'ABC', 'USA'),
(18, 'ABC', 'ABC', 'USA'),
(19, 'ABC', 'ABC', 'USA'),
(20, 'ABC', 'ABC', 'USA');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idGenre` (`idGenre`),
  ADD KEY `idRealisateur` (`idRealisateur`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `joue`
--
ALTER TABLE `joue`
  ADD PRIMARY KEY (`idActeur`,`idFilm`),
  ADD KEY `idFilm` (`idFilm`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `realisateur`
--
ALTER TABLE `realisateur`
  ADD PRIMARY KEY (`idRealisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `personne`
--
ALTER TABLE `personne`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `realisateur`
--
ALTER TABLE `realisateur`
  MODIFY `idRealisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `film_ibfk_1` FOREIGN KEY (`idGenre`) REFERENCES `genre` (`id`),
  ADD CONSTRAINT `film_ibfk_2` FOREIGN KEY (`idRealisateur`) REFERENCES `realisateur` (`idRealisateur`);

--
-- Contraintes pour la table `joue`
--
ALTER TABLE `joue`
  ADD CONSTRAINT `joue_ibfk_1` FOREIGN KEY (`idActeur`) REFERENCES `personne` (`id`),
  ADD CONSTRAINT `joue_ibfk_2` FOREIGN KEY (`idFilm`) REFERENCES `film` (`id`);
