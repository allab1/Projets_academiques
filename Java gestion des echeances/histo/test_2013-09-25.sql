# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Hôte: localhost (MySQL 5.6.13)
# Base de données: test
# Temps de génération: 2013-09-25 10:29:52 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table banque
# ------------------------------------------------------------

DROP TABLE IF EXISTS `banque`;

CREATE TABLE `banque` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `adress` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`(20))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `banque` WRITE;
/*!40000 ALTER TABLE `banque` DISABLE KEYS */;

INSERT INTO `banque` (`id`, `nom`, `adress`)
VALUES
	(2,'populaire','kenitra'),
	(3,'BMCE','kenitra');

/*!40000 ALTER TABLE `banque` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table client
# ------------------------------------------------------------

DROP TABLE IF EXISTS `client`;

CREATE TABLE `client` (
  `id_client` int(11) unsigned NOT NULL,
  `nom` text NOT NULL,
  `prenom` text,
  `adress` text,
  `tel` text,
  `email` text,
  `solvab` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;

INSERT INTO `client` (`id_client`, `nom`, `prenom`, `adress`, `tel`, `email`, `solvab`)
VALUES
	(8,'driss','allab','kenitra','0394','allab.dd@',80),
	(12,'ahmad','djdddbf','derr','03948','omar@',120),
	(43,'erf','','','','',50);

/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table comptes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comptes`;

CREATE TABLE `comptes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_compte` int(11) unsigned NOT NULL,
  `solde` int(11) DEFAULT NULL,
  `banque` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_compte` (`id_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `comptes` WRITE;
/*!40000 ALTER TABLE `comptes` DISABLE KEYS */;

INSERT INTO `comptes` (`id`, `id_compte`, `solde`, `banque`)
VALUES
	(1,20,0,'populaire'),
	(4,33,6513,'BMCE');

/*!40000 ALTER TABLE `comptes` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table echeance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `echeance`;

CREATE TABLE `echeance` (
  `id-echeance` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` text,
  `id_p` int(11) DEFAULT NULL,
  `id_fact` int(11) DEFAULT NULL,
  `v` int(11) DEFAULT NULL,
  `pai` date DEFAULT NULL,
  `montant` int(11) DEFAULT NULL,
  `payage` date DEFAULT NULL,
  PRIMARY KEY (`id-echeance`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `echeance` WRITE;
/*!40000 ALTER TABLE `echeance` DISABLE KEYS */;

INSERT INTO `echeance` (`id-echeance`, `type`, `id_p`, `id_fact`, `v`, `pai`, `montant`, `payage`)
VALUES
	(8,'client',8,41,1,'2030-12-12',0,'2013-09-20'),
	(9,'client',12,42,0,'2020-12-12',1700,NULL);

/*!40000 ALTER TABLE `echeance` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table facture
# ------------------------------------------------------------

DROP TABLE IF EXISTS `facture`;

CREATE TABLE `facture` (
  `id_facture` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `montant` int(11) DEFAULT NULL,
  `date_act` date DEFAULT NULL,
  `date_paie` date DEFAULT NULL,
  `valider` int(1) DEFAULT NULL,
  `rest` int(11) DEFAULT NULL,
  `type` text,
  `id_perso` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_facture`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `facture` WRITE;
/*!40000 ALTER TABLE `facture` DISABLE KEYS */;

INSERT INTO `facture` (`id_facture`, `montant`, `date_act`, `date_paie`, `valider`, `rest`, `type`, `id_perso`)
VALUES
	(41,3000,'2013-09-19','2030-12-12',1,0,'client',8),
	(42,2000,'2013-09-20','2020-12-12',0,1700,'client',12);

/*!40000 ALTER TABLE `facture` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table fournisseur
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fournisseur`;

CREATE TABLE `fournisseur` (
  `id_fournisseur` int(11) unsigned NOT NULL,
  `nom` text,
  `prenom` text,
  `adress` text,
  `tel` text,
  `email` text,
  PRIMARY KEY (`id_fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `fournisseur` WRITE;
/*!40000 ALTER TABLE `fournisseur` DISABLE KEYS */;

INSERT INTO `fournisseur` (`id_fournisseur`, `nom`, `prenom`, `adress`, `tel`, `email`)
VALUES
	(43,'eeer','habibi','','','');

/*!40000 ALTER TABLE `fournisseur` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table mouvement
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mouvement`;

CREATE TABLE `mouvement` (
  `id_mouv` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `facture` int(11) NOT NULL,
  `compte` int(11) NOT NULL,
  `montant` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id_mouv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` text NOT NULL,
  `pass` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`(20))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `user`, `pass`)
VALUES
	(1,'driss','123'),
	(5,'kamal','e');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
