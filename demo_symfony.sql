-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 14 juin 2022 à 16:38
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de données : `demo_symfony`
--

-- --------------------------------------------------------

--
-- Structure de la table `actor`
--

CREATE TABLE `actor` (
  `id` int(11) NOT NULL,
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `death` date DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `actor`
--

INSERT INTO `actor` (`id`, `nationality`, `firstname`, `birthday`, `death`, `lastname`, `photo`) VALUES
(1, 'American', 'Anthony', '1937-12-31', NULL, 'Hopkins', 'AnthonyHopkins-1655110511.jpg'),
(2, 'American', 'Brad', '1963-12-18', NULL, 'Pitt', 'Brad_Pitt_2019_by_Glenn_Francis-1655131336.jpg'),
(3, 'American', 'Tom', '1962-07-03', NULL, 'Cruise', '220px-Tom_Cruise_(34797273596)-1655131369.webp');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `title`, `slug`) VALUES
(1, 'Horreur', 'horreur'),
(2, 'Romance', 'romance'),
(3, 'Action', 'action');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220608093313', '2022-06-08 14:39:56', 536),
('DoctrineMigrations\\Version20220608131745', '2022-06-08 15:20:26', 57),
('DoctrineMigrations\\Version20220608132217', '2022-06-08 15:22:21', 55),
('DoctrineMigrations\\Version20220608134340', '2022-06-08 15:43:55', 384),
('DoctrineMigrations\\Version20220613075706', '2022-06-13 09:57:21', 45),
('DoctrineMigrations\\Version20220613083355', '2022-06-13 10:34:10', 62),
('DoctrineMigrations\\Version20220613085219', '2022-06-13 10:52:42', 39),
('DoctrineMigrations\\Version20220614070706', '2022-06-14 09:07:24', 196);

-- --------------------------------------------------------

--
-- Structure de la table `movie`
--

CREATE TABLE `movie` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `affiche` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `movie`
--

INSERT INTO `movie` (`id`, `title`, `year`, `affiche`) VALUES
(1, 'Hannibal', 2001, 'Hannibal-1655191003.jpg'),
(2, 'Rencontre avec Joe Black', 1998, 'rencontre-avec-joe-black-1655193079.jpg'),
(3, 'Top Gun : Maverick', 2022, 'top-gun-maverick-1655193156.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `movie_actor`
--

CREATE TABLE `movie_actor` (
  `movie_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `movie_actor`
--

INSERT INTO `movie_actor` (`movie_id`, `actor_id`) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `movie_category`
--

CREATE TABLE `movie_category` (
  `movie_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `movie_category`
--

INSERT INTO `movie_category` (`movie_id`, `category_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `pseudo`) VALUES
(1, 'admin@gmail.com', '[\"ROLE_USER\",\"ROLE_ADMIN\"]', '$2y$13$x1ibVhv9HsQC6eJuzev2OugLyCkQ/hAxk5r85YTNwqQRsNwC1XXiu', 'admin'),
(2, 'coco@gmail.com', '[]', '$2y$13$M5XwvVyP1Mo.VGyzMafHjOq9pxzCQl1AQOfDdINnZ5M2lrNWOK1We', 'coco');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `movie_actor`
--
ALTER TABLE `movie_actor`
  ADD PRIMARY KEY (`movie_id`,`actor_id`),
  ADD KEY `IDX_3A374C658F93B6FC` (`movie_id`),
  ADD KEY `IDX_3A374C6510DAF24A` (`actor_id`);

--
-- Index pour la table `movie_category`
--
ALTER TABLE `movie_category`
  ADD PRIMARY KEY (`movie_id`,`category_id`),
  ADD KEY `IDX_DABA824C8F93B6FC` (`movie_id`),
  ADD KEY `IDX_DABA824C12469DE2` (`category_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `actor`
--
ALTER TABLE `actor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `movie_actor`
--
ALTER TABLE `movie_actor`
  ADD CONSTRAINT `FK_3A374C6510DAF24A` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_3A374C658F93B6FC` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `movie_category`
--
ALTER TABLE `movie_category`
  ADD CONSTRAINT `FK_DABA824C12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DABA824C8F93B6FC` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE;
COMMIT;
