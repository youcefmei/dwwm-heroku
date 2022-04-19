-- MariaDB dump 10.19  Distrib 10.4.22-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: ecoweb
-- ------------------------------------------------------
-- Server version	10.4.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `firstname` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_880E0D76A76ED395` (`user_id`),
  CONSTRAINT `FK_880E0D76A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (6,32,'admin','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer_correct`
--

DROP TABLE IF EXISTS `answer_correct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_correct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_correct`
--

LOCK TABLES `answer_correct` WRITE;
/*!40000 ALTER TABLE `answer_correct` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_correct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer_wrong`
--

DROP TABLE IF EXISTS `answer_wrong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_wrong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BCFF74491E27F6BF` (`question_id`),
  CONSTRAINT `FK_BCFF74491E27F6BF` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_wrong`
--

LOCK TABLES `answer_wrong` WRITE;
/*!40000 ALTER TABLE `answer_wrong` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_wrong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `is_published` tinyint(1) NOT NULL,
  `image` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `image_size` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_169E6FB9989D9B62` (`slug`),
  UNIQUE KEY `UNIQ_169E6FB92B36786B` (`title`),
  KEY `IDX_169E6FB941807E1D` (`teacher_id`),
  CONSTRAINT `FK_169E6FB941807E1D` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (9,'HTML','html','<p>Le HyperText Markup Language, g&eacute;n&eacute;ralement abr&eacute;g&eacute; HTML ou, dans sa derni&egrave;re version, HTML5, est le langage de balisage con&ccedil;u pour repr&eacute;senter les pages web.</p>','2022-03-22 23:38:53',1,'html5-logo-512-6257efae51b17462718922.png','2022-04-18 11:17:16',8562,5,'2022-04-18 11:17:16'),(10,'CSS3','css3','<div>Les feuilles de style en cascade1, g&eacute;n&eacute;ralement appel&eacute;es CSS de l&#39;anglais Cascading Style Sheets, forment un langage informatique qui d&eacute;crit la pr&eacute;sentation des documents HTML et XML.</div>','2022-03-22 23:50:08',1,'css3-logo-and-wordmark-svg-6257eff99f13d361631928.png','2022-04-16 17:28:23',11770,5,'2022-04-16 17:28:23'),(11,'Python','python','<div>Python (prononc&eacute; /pi.tɔ̃/) est un langage de programmation interpr&eacute;t&eacute;, multi-paradigme et multiplateformes. Il favorise la programmation imp&eacute;rative structur&eacute;e, fonctionnelle et orient&eacute;e objet.</div>','2022-03-23 07:57:25',1,'python-powered-h-140x182-6257f04caec13001302634.png','2022-04-15 12:31:12',9930,5,'2022-04-15 12:31:12'),(12,'JavaScript','javascript','<div>JavaScript est un langage de programmation de scripts principalement employ&eacute; dans les pages web interactives et &agrave; ce titre est une partie essentielle des applications web.</div>','2022-03-23 10:09:10',1,'js-6258008db1036254059390.png','2022-04-18 13:43:13',10238,6,'2022-04-18 13:43:13'),(13,'TypeScript','typescript','<div>TypeScript est un langage de programmation libre et open source d&eacute;velopp&eacute; par Microsoft qui a pour but d&#39;am&eacute;liorer et de s&eacute;curiser la production de code JavaScript.<a href=\"https://www.typescriptlang.org/docs/\">TypeScript: The starting point for learning TypeScript (typescriptlang.org)</a></div>','2022-04-02 17:17:02',1,'typescript-512x512-624868ee87330651820544.png','2022-04-16 16:42:34',16956,5,'2022-04-16 16:42:34'),(14,'Go','go','<div>Go est un langage de programmation compil&eacute; et concurrent inspir&eacute; de C et Pascal. Ce langage a &eacute;t&eacute; d&eacute;velopp&eacute; par Google6 &agrave; partir d&rsquo;un concept initial de Robert Griesemer, Rob Pike et Ken Thompson. Go poss&egrave;de deux impl&eacute;mentations</div>','2022-04-07 10:42:15',1,'go-512x512-624ea3e7d4ce0777046645.png','2022-04-16 16:43:06',29317,5,'2022-04-16 16:43:06');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_student`
--

DROP TABLE IF EXISTS `course_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `joined_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `progress` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BFE0AADF591CC992` (`course_id`),
  KEY `IDX_BFE0AADFCB944F1A` (`student_id`),
  CONSTRAINT `FK_BFE0AADF591CC992` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_BFE0AADFCB944F1A` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_student`
--

LOCK TABLES `course_student` WRITE;
/*!40000 ALTER TABLE `course_student` DISABLE KEYS */;
INSERT INTO `course_student` VALUES (3,9,7,'2022-04-15 17:59:48',50),(4,12,7,'2022-04-18 19:20:46',100);
/*!40000 ALTER TABLE `course_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20220315100833','2022-03-15 11:08:52',380),('DoctrineMigrations\\Version20220315190643','2022-03-15 20:07:26',241),('DoctrineMigrations\\Version20220315190824','2022-03-15 20:08:35',95),('DoctrineMigrations\\Version20220316113338','2022-03-16 12:33:50',432),('DoctrineMigrations\\Version20220316113612','2022-03-16 12:36:19',221),('DoctrineMigrations\\Version20220316113800','2022-03-16 12:38:11',121),('DoctrineMigrations\\Version20220316114658','2022-03-16 12:47:05',165),('DoctrineMigrations\\Version20220316121418','2022-03-16 13:14:23',98),('DoctrineMigrations\\Version20220316124725','2022-03-16 13:47:31',77),('DoctrineMigrations\\Version20220316125202','2022-03-16 13:52:10',100),('DoctrineMigrations\\Version20220316130914','2022-03-16 14:09:26',89),('DoctrineMigrations\\Version20220316135443','2022-03-16 14:54:49',230),('DoctrineMigrations\\Version20220316135625','2022-03-16 14:56:31',104),('DoctrineMigrations\\Version20220316135923','2022-03-16 14:59:29',94),('DoctrineMigrations\\Version20220316172906','2022-03-16 18:29:15',415),('DoctrineMigrations\\Version20220317115201','2022-03-17 12:52:09',417),('DoctrineMigrations\\Version20220317115423','2022-03-17 12:54:29',92),('DoctrineMigrations\\Version20220317115445','2022-03-17 12:56:29',76),('DoctrineMigrations\\Version20220318171618','2022-03-18 18:16:29',204),('DoctrineMigrations\\Version20220318172415','2022-03-18 18:24:25',150),('DoctrineMigrations\\Version20220318172640','2022-03-18 18:26:47',161),('DoctrineMigrations\\Version20220318172759','2022-03-18 18:29:07',102),('DoctrineMigrations\\Version20220318172859','2022-03-18 18:29:07',1),('DoctrineMigrations\\Version20220318174115','2022-03-18 18:41:26',139),('DoctrineMigrations\\Version20220318174353','2022-03-18 18:44:03',77),('DoctrineMigrations\\Version20220318174802','2022-03-18 18:49:30',101),('DoctrineMigrations\\Version20220318174921','2022-03-18 18:49:30',1),('DoctrineMigrations\\Version20220318175905','2022-03-18 18:59:21',167),('DoctrineMigrations\\Version20220318180838','2022-03-18 19:08:46',126),('DoctrineMigrations\\Version20220318203158','2022-03-18 21:32:08',119),('DoctrineMigrations\\Version20220318203743','2022-03-18 21:37:50',82),('DoctrineMigrations\\Version20220318205259','2022-03-18 21:53:13',502),('DoctrineMigrations\\Version20220318205428','2022-03-18 21:55:10',110),('DoctrineMigrations\\Version20220318205628','2022-03-18 21:56:36',115),('DoctrineMigrations\\Version20220318212144','2022-03-18 22:21:55',99),('DoctrineMigrations\\Version20220318212233','2022-03-18 22:22:39',79),('DoctrineMigrations\\Version20220318213531','2022-03-18 22:37:33',242),('DoctrineMigrations\\Version20220318213901','2022-03-18 22:41:37',105),('DoctrineMigrations\\Version20220318214012','2022-03-18 22:41:37',1),('DoctrineMigrations\\Version20220318214104','2022-03-18 22:41:37',1),('DoctrineMigrations\\Version20220318214205','2022-03-18 22:42:10',69),('DoctrineMigrations\\Version20220318214230','2022-03-18 22:42:37',87),('DoctrineMigrations\\Version20220318214255','2022-03-18 22:43:00',77),('DoctrineMigrations\\Version20220319074813','2022-03-19 08:48:24',180),('DoctrineMigrations\\Version20220319075936','2022-03-19 08:59:52',176),('DoctrineMigrations\\Version20220319081038','2022-03-19 09:10:46',142),('DoctrineMigrations\\Version20220319114326','2022-03-19 12:43:35',1377),('DoctrineMigrations\\Version20220319114745','2022-03-19 12:48:03',105),('DoctrineMigrations\\Version20220323210253','2022-03-23 22:03:29',1798),('DoctrineMigrations\\Version20220403144324','2022-04-03 16:43:34',990),('DoctrineMigrations\\Version20220403150952','2022-04-03 17:10:02',197),('DoctrineMigrations\\Version20220403154938','2022-04-03 17:49:49',245),('DoctrineMigrations\\Version20220403160203','2022-04-03 18:02:10',99),('DoctrineMigrations\\Version20220407075950','2022-04-07 09:59:58',59),('DoctrineMigrations\\Version20220407083201','2022-04-07 10:39:47',105);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `is_published` tinyint(1) NOT NULL DEFAULT 1,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `media` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `section_title_idx` (`title`,`section_id`),
  KEY `IDX_F87474F3D823E37A` (`section_id`),
  KEY `IDX_F87474F341807E1D` (`teacher_id`),
  CONSTRAINT `FK_F87474F341807E1D` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FK_F87474F3D823E37A` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (9,25,'<p>Here is a single JavaScript statement, which creates a pop-up dialog saying &quot;Hello World!&quot;:</p>\r\n\r\n<pre>\r\n<code class=\"language-javascript\">alert(\"Hello World!\");\r\n</code></pre>\r\n\r\n<p>For the browser to execute the statement, it must be placed inside a&nbsp;<tt>&lt;script&gt;</tt>&nbsp;element. This element describes which section of the HTML code contains executable code, and will be described in further detail later.</p>\r\n\r\n<pre>\r\n<code class=\"language-javascript\">&lt;script&gt;\r\n  alert(\"Hello World!\");\r\n&lt;/script&gt;</code></pre>\r\n\r\n<p>&nbsp;</p>','first-program-section','2022-04-18 13:47:41',1,'First program section','https://youtu.be/W6NZfCO5SIk',6),(10,28,'Un document HTML5 est avant tout un document texte (c\'est-à-dire lisible par un humain), qui contient une certaine syntaxe afin de mettre en forme ou de décrire ce document. Son nom de fichier a généralement le suffixe .html (réduit à .htm sur les systèmes d\'exploitation ne supportant pas plus de 3 caractères de suffixe).\r\n\r\nL\'immense majorité des internautes réalisent leur page Web à l\'aide d\'un logiciel avec une interface graphique, en utilisant la souris et en ayant un rendu immédiat ; il en existe des gratuits. Ce logiciel génère du code HTML5.\r\n\r\nPourquoi alors vouloir taper soi-même du code ?\r\n\r\nChacun aura sa réponse à cette question. Cela peut être par curiosité, pour comprendre comment marche le Web ; ou bien encore pour « nettoyer » le code HTML généré par le logiciel, le rendre plus léger.','pourquoi-apprendre-le-html5','2022-04-15 12:37:03',1,'Pourquoi apprendre le HTML5 ?','https://youtu.be/UB1O30fR-EE',5),(11,28,'Il faut bien comprendre la différence entre « description de document » et « mise en forme ». « Décrire » un document, c\'est indiquer la « fonction » de telle ou telle partie du texte : citation, passage important, titre, paragraphe… La mise en forme, elle, est du ressort du navigateur : c\'est lui qui décide comment sera mis en forme un paragraphe (en général avec un espace vertical avant et après), une citation (en général avec une marge plus importante), un passage important (en général en italique ou en gras), un titre (en général en plus grand avec un espace vertical avant et après)…\r\n\r\nVous pouvez donner des indications au navigateur en utilisant une feuille de style (voir Le langage CSS mais il est préférable de lire Le langage HTML avant).\r\n\r\nBien sûr, pour des raisons esthétiques — tout à fait louables — certains voudront faire du « placement au millimètre ». C\'est tout à fait possible, mais plus vous voulez faire des choses compliquées, plus le code devient compliqué… Et surtout, le risque est de faire « n\'importe quoi ». Il est par exemple simple de créer des tableaux imbriqués pour placer le texte comme on veut, mais avez-vous pensé aux mal-voyants ? S\'ils utilisent un logiciel de lecture vocale, celui-ci lit le contenu des cellules linéairement, de gauche à droite et de haut en bas ; est-ce bien ce que vous désirez ? Voir à ce sujet l\'article de Wikipédia Accessibilité du Web.\r\n\r\nDans un premier temps, le recours au HTML5 revient à renoncer à la mise en forme pour la déléguer au navigateur. Ceci peut être frustrant, mais vous gagnez en simplicité et en universalité. La mise en forme viendra dans un deuxième temps, avec le CSS — Rome ne s\'est pas faite en un jour…\r\n\r\nNotons que le HTML ayant été créé avant le CSS, il contient de nombreux éléments de mise en forme. On trouvera donc de nombreuses références (ouvrages, pages en lignes) et de nombreux exemples (pages Web) utilisant ces balises. Nous vous invitons à ne pas suivre ces « mauvais exemples ».','description-de-document-ou-mise-en-forme','2022-04-15 12:38:42',1,'Description de document ou mise en forme ?','https://youtu.be/UB1O30fR-EE',5),(12,28,'<p>Pour faire une page HTML (c&#39;est &agrave; dire une page Web) vous n&#39;avez&nbsp;<em>pas</em>&nbsp;besoin d&#39;un logiciel sp&eacute;cial, il suffit d&#39;utiliser un &eacute;diteur de texte standard (comme le Bloc-note de Windows ou TextEdit sur Mac) et d&#39;enregistrer vos pages avec un nom finissant par&nbsp;<code>.html</code>. Une page Web est en fait un simple fichier texte contenant du code HTML qui est ensuite interpr&eacute;t&eacute; par le navigateur.</p>\r\n\r\n<hr />\r\n<p>Note</p>\r\n\r\n<p>Dans le protocole HTTP, ce n&#39;est pas l&#39;extension du fichier qui d&eacute;finit qu&#39;un fichier est du HTML, mais l&#39;en-t&ecirc;te (voir plus loin)&hellip; en th&eacute;orie. Si un fichier HTML devrait pouvoir avoir n&#39;importe quelle extension, dans la pratique, le navigateur se base souvent sur l&#39;extension du fichier et non pas sur l&#39;en-t&ecirc;te.</p>\r\n\r\n<hr />\r\n<p>Un document HTML est constitu&eacute; de texte normal &mdash; la plupart du temps c&#39;est ce que vous voulez afficher &agrave; l&#39;&eacute;cran &mdash; et de HTML &agrave; proprement parler sous formes de&nbsp;<strong>balises</strong>&nbsp;(ou&nbsp;<em>tags</em>&nbsp;en anglais). Les balises servent &agrave; dire des choses au navigateur comme &laquo;&nbsp;&ccedil;a c&#39;est un titre&nbsp;&raquo;, &laquo;&nbsp;&ccedil;a c&#39;est en emphase&nbsp;&raquo;, &laquo;&nbsp;l&agrave; je veux une image&nbsp;&raquo;, &laquo;&nbsp;l&agrave; je veux un lien&nbsp;&raquo; etc. Affichez ensuite la page dans votre navigateur. Une balise est facilement reconnaissable car elle est toujours entre&nbsp;<code>&lt;</code>&nbsp;et&nbsp;<code>&gt;</code>.</p>\r\n\r\n<pre>\r\n<code class=\"language-html\">Voici un texte en &lt;em&gt;emphase&lt;/em&gt;.</code></pre>\r\n\r\n<p>donne&nbsp;:</p>\r\n\r\n<p>Voici un texte en&nbsp;<em>emphase</em>.</p>\r\n\r\n<p>Dans cet exemple, seul le mot &laquo;&nbsp;emphase&nbsp;&raquo; sera en&nbsp;<em>emphase</em>&nbsp;car il est born&eacute; par les balises&nbsp;<code>&lt;em&gt;</code>&nbsp;et&nbsp;<code>&lt;/em&gt;</code>.<sup><a href=\"https://fr.wikibooks.org/wiki/Le_langage_HTML/Introduction#cite_note-1\">[1]</a></sup></p>\r\n\r\n<p>On voit d&eacute;j&agrave; qu&#39;il y a deux types de balises. Les balises qui vont par deux, pour dire des choses comme &laquo;&nbsp;l&agrave;, commence le texte en emphase&nbsp;&raquo; et &laquo;&nbsp;l&agrave;, termine le texte en emphase&nbsp;&raquo;, et les balises qui sont toutes seules, comme pour le &laquo;&nbsp;l&agrave; je veux une image&nbsp;&raquo;. Observez qu&#39;une balise de fin s&#39;&eacute;crit exactement comme la balise de d&eacute;but mais avec une barre de fraction &laquo;&nbsp;<code>/</code>&nbsp;&raquo; (<em>slash</em>&nbsp;en anglais) avant son nom (<code>em</code>). On appelle tout ce qui est situ&eacute; entre une balise de d&eacute;but et de fin un&nbsp;<em>&eacute;l&eacute;ment</em>. On a donc ici un &eacute;l&eacute;ment &laquo;&nbsp;em&nbsp;&raquo; contenant le texte &laquo;&nbsp;emphase&nbsp;&raquo;.</p>\r\n\r\n<p>Une balise de d&eacute;but peut &eacute;galement contenir un ou plusieurs&nbsp;<em>attributs</em>, qui sont des param&egrave;tres permettant de pr&eacute;ciser certaines caract&eacute;ristiques de l&#39;&eacute;l&eacute;ment. Le nom de la balise dit de faire quelque chose, et un attribut donne des pr&eacute;cisions sur comment le faire. Par exemple, la balise pour faire un lien est &laquo;&nbsp;<code>a</code>&nbsp;&raquo; (pour&nbsp;<em>anchor</em>, &laquo;&nbsp;ancre&nbsp;&raquo;). Mais si on fait juste&nbsp;<code>&lt;a&gt;mon super lien&lt;/a&gt;</code>, le navigateur ne saura pas o&ugrave; doit mener ce lien. Pour &ccedil;a il y a l&#39;attribut &laquo;&nbsp;<code>href</code>&nbsp;&raquo; (pour&nbsp;<em>hypertext reference</em>, &laquo;&nbsp;r&eacute;f&eacute;rence hypertexte&nbsp;&raquo;)&nbsp;:</p>\r\n\r\n<pre>\r\n<code class=\"language-html\">&lt;a href=\"https://fr.wikibooks.org/\"&gt;Wikibooks&lt;/a&gt; est une bibliothèque libre.\r\n</code></pre>\r\n\r\n<p>donne&nbsp;:</p>\r\n\r\n<p><a href=\"https://fr.wikibooks.org/wiki/Accueil\" title=\"Accueil\">Wikibooks</a>&nbsp;est une biblioth&egrave;que libre.</p>\r\n\r\n<p>L&#39;attribut &laquo;&nbsp;<code>href</code>&nbsp;&raquo; indique la destination du lien. Comme vous pouvez le voir dans l&#39;exemple, les attributs sont plac&eacute;s dans la balise de d&eacute;but (il ne faut pas les remettre dans la balise de fin), apr&egrave;s le nom de l&#39;&eacute;l&eacute;ment. Le contenu d&#39;un attribut est toujours d&eacute;limit&eacute; par deux guillemets &laquo;&nbsp;<code>&quot;</code>&nbsp;&raquo; ou deux apostrophes &laquo;&nbsp;<code>&#39;</code>&nbsp;&raquo;, pr&eacute;c&eacute;d&eacute;s du signe &eacute;gal &laquo;&nbsp;<code>=</code>&nbsp;&raquo;. Vous pouvez bien s&ucirc;r mettre plusieurs attributs en les s&eacute;parant par des espaces. Dans certains cas, le navigateur comprendra ce que vous voulez m&ecirc;me si vous ne mettez pas les guillemets, mais il vaut mieux prendre l&#39;habitude d&#39;en mettre partout.</p>\r\n\r\n<p>Un exemple de balise qui va toute seule maintenant&nbsp;:</p>\r\n\r\n<pre>\r\n<code class=\"language-html\">&lt;img src=\"../images/wiki-textbook.png\" /&gt;</code></pre>\r\n\r\n<p>donne&nbsp;:</p>\r\n\r\n<p><a href=\"https://fr.wikibooks.org/wiki/Fichier:Wiki-textbook.png\"><img alt=\"Wiki-textbook.png\" data-file-height=\"147\" data-file-width=\"129\" decoding=\"async\" src=\"https://upload.wikimedia.org/wikipedia/commons/2/27/Wiki-textbook.png\" style=\"height:147px; width:129px\" /></a></p>\r\n\r\n<p>Si vous avez tout suivi, vous devriez reconna&icirc;tre qu&#39;on a la balise &laquo;&nbsp;<code>img</code>&nbsp;&raquo; (qui assez logiquement veut dire&nbsp;<em>image</em>) et l&#39;attribut &laquo;&nbsp;<code>src</code>&nbsp;&raquo; (pour&nbsp;<em>source</em>) qui a pour valeur &laquo;&nbsp;../images/wiki-textbook.png&nbsp;&raquo;. Et tout &ccedil;a nous donne une jolie balise. Ce code affiche en fait l&#39;image situ&eacute;e &agrave; l&#39;adresse &laquo;&nbsp;http://fr.wikibooks.org/images/wiki-textbook.png&nbsp;&raquo;<sup><a href=\"https://fr.wikibooks.org/wiki/Le_langage_HTML/Introduction#cite_note-2\">[2]</a></sup>, soit le logo de Wikibooks</p>\r\n\r\n<hr />\r\n<p>Remarque</p>\r\n\r\n<p>La barre de fraction finale &laquo;&nbsp;<code>/</code>&nbsp;&raquo; dans une balise isol&eacute;e se met en XHTML, mais&nbsp;<em>pas</em>&nbsp;en HTML&nbsp;; l&#39;exemple ci-dessus en HTML donne&nbsp;<code>&lt;img src=&quot;http://fr.wikibooks.org/images/wiki-textbook.png&quot;&gt;</code>. Nous reviendrons la-dessus un peu plus bas.</p>\r\n\r\n<hr />\r\n<p>Dernier point important sur les balises, il faut penser &agrave;&nbsp;<em>bien les imbriquer</em>&nbsp;: une balise ouvrante doit&nbsp;<strong>toujours</strong>&nbsp;&ecirc;tre plac&eacute;e&nbsp;<strong>avant</strong>&nbsp;une balise fermante.</p>\r\n\r\n<p>Il est interdit de &laquo;&nbsp;croiser les balises&nbsp;&raquo; c&#39;est-&agrave;-dire qu&#39;il n&#39;est pas permis de fermer une balise alors qu&#39;une autre, ouverte apr&egrave;s elle, n&#39;est pas encore ferm&eacute;e. Un exemple de balises correctement agenc&eacute;es (ne vous inqui&eacute;tez pas si vous ne comprenez pas les balises elle seront expliqu&eacute;es plus tard)&nbsp;:</p>\r\n\r\n<pre>\r\n<code class=\"language-html\">Un texte qui &lt;em&gt;parle de &lt;strong&gt;choses&lt;/strong&gt; intéressantes&lt;/em&gt;</code></pre>\r\n\r\n<p>donne&nbsp;:</p>\r\n\r\n<p>Un texte qui&nbsp;<em>parle de&nbsp;<strong>choses</strong>&nbsp;int&eacute;ressantes</em></p>\r\n\r\n<p>Un exemple de mauvaise imbrication des balises&nbsp;:</p>\r\n\r\n<p><a href=\"https://fr.wikibooks.org/wiki/Fichier:Achtung.svg\" title=\"Avertissement\"><img alt=\"Avertissement\" data-file-height=\"550\" data-file-width=\"628\" decoding=\"async\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Achtung.svg/20px-Achtung.svg.png\" srcset=\"//upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Achtung.svg/30px-Achtung.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Achtung.svg/40px-Achtung.svg.png 2x\" style=\"height:18px; width:20px\" /></a>&nbsp;Ce code contient&nbsp;<strong>une erreur volontaire</strong>&nbsp;!</p>\r\n\r\n<pre>\r\nUn texte qui &lt;em&gt;parle de &lt;strong&gt;choses&lt;/em&gt; int&eacute;ressantes&lt;/strong&gt;\r\n</pre>\r\n\r\n<p>Le code correct pour entrelacer les styles de texte serait&nbsp;:</p>\r\n\r\n<pre>\r\nUn texte qui &lt;em&gt;parle de &lt;strong&gt;choses&lt;/strong&gt;&lt;/em&gt;&lt;strong&gt; int&eacute;ressantes&lt;/strong&gt;\r\n</pre>\r\n\r\n<p>ce qui donne&nbsp;:</p>\r\n\r\n<p>Un texte qui&nbsp;<em>parle de&nbsp;<strong>choses</strong></em><strong>&nbsp;int&eacute;ressantes</strong></p>\r\n\r\n<ul>\r\n	<li><a href=\"https://fr.wikibooks.org/wiki/Le_langage_HTML/Introduction/Exercice_1\" title=\"Le langage HTML/Introduction/Exercice 1\">Exercice 1</a></li>\r\n</ul>','balises-et-compagnie','2022-04-15 12:45:13',1,'Balises et compagnie','https://www.youtube.com/watch?v=UB1O30fR-EE',5),(13,29,'<p>Les documents HTML doivent tous avoir une structure minimale. C&#39;est-&agrave;-dire des balises qui sont toujours pr&eacute;sentes et au milieu desquelles vous allez ajouter votre propre contenu. Ce chapitre pr&eacute;sente cette structure en donnant quelques explications sur les mots-clefs principaux (aussi appel&eacute;s balises).</p>\r\n\r\n<p>Voici un exemple de page minimale&nbsp;:</p>\r\n\r\n<pre>\r\n<code class=\"language-html\">&lt;!DOCTYPE html&gt;\r\n \r\n&lt;html&gt;\r\n \r\n   &lt;head&gt;\r\n     &lt;title&gt;Titre affiché dans la barre de titre du navigateur&lt;/title&gt;\r\n   &lt;/head&gt;\r\n \r\n   &lt;body&gt;\r\n     &lt;!-- C\'est ici que vous mettrez votre contenu --&gt;\r\n   &lt;/body&gt;\r\n \r\n&lt;/html&gt;</code></pre>\r\n\r\n<p>&nbsp;</p>','introduction','2022-04-15 15:20:36',1,'Introduction','https://youtu.be/UB1O30fR-EE',5),(15,29,'<p>Voici une page minimale dont nous allons expliquer tous les &eacute;l&eacute;ments&nbsp;:</p>\r\n\r\n<pre>\r\n<code class=\"language-html\">&lt;!DOCTYPE html&gt;\r\n\r\n&lt;html&gt;\r\n\r\n   &lt;head&gt;\r\n     &lt;title&gt;Titre affiché dans la barre de titre du navigateur&lt;/title&gt;\r\n   &lt;/head&gt;\r\n\r\n   &lt;body&gt;\r\n     &lt;!-- C\'est ici que vous mettrez votre contenu --&gt;\r\n   &lt;/body&gt;\r\n\r\n&lt;/html&gt;</code></pre>\r\n\r\n<h3>La d&eacute;finition de type de document[<a href=\"https://fr.wikibooks.org/w/index.php?title=Le_langage_HTML/Structure_de_base_d%27un_document_HTML&amp;veaction=edit&amp;section=3\" title=\"Modifier la section : La définition de type de document\">modifier</a>&nbsp;|&nbsp;<a href=\"https://fr.wikibooks.org/w/index.php?title=Le_langage_HTML/Structure_de_base_d%27un_document_HTML&amp;action=edit&amp;section=3\" title=\"Modifier la section : La définition de type de document\">modifier le wikicode</a>]</h3>\r\n\r\n<p>Vous le savez, on en a parl&eacute; en long en large et travers dans l&#39;introduction, il existe plusieurs versions du HTML et avec &ccedil;a plusieurs variantes. On a aussi dit qu&#39;une fois la version (et le cas &eacute;ch&eacute;ant la variante) choisie, il fallait s&#39;y tenir. Mais pour savoir si vous respectez bien les r&egrave;gles d&#39;une certaines version, il faut dire la version que vous utilisez&nbsp;! C&#39;est &agrave; &ccedil;a que sert la premi&egrave;re ligne. Elle para&icirc;t barbare mais ne vous inqui&eacute;tez pas, vous n&#39;aurez pas &agrave; l&#39;apprendre par c&oelig;ur (franchement je me demande si quelqu&#39;un la conna&icirc;t). Cette premi&egrave;re balise donc est la&nbsp;<em>d&eacute;claration de type document</em>&nbsp;(appel&eacute;e couramment&nbsp;<em>doctype</em>). Dans le cas pr&eacute;sent, c&#39;est du HTML5.</p>\r\n\r\n<p>Vous avez ci-dessous une liste des Doctype les plus utilis&eacute;s que vous pouvez directement copier / coller.</p>\r\n\r\n<h4>Importance du DOCTYPE[<a href=\"https://fr.wikibooks.org/w/index.php?title=Le_langage_HTML/Structure_de_base_d%27un_document_HTML&amp;veaction=edit&amp;section=4\" title=\"Modifier la section : Importance du DOCTYPE\">modifier</a>&nbsp;|&nbsp;<a href=\"https://fr.wikibooks.org/w/index.php?title=Le_langage_HTML/Structure_de_base_d%27un_document_HTML&amp;action=edit&amp;section=4\" title=\"Modifier la section : Importance du DOCTYPE\">modifier le wikicode</a>]</h4>\r\n\r\n<p>Sans un&nbsp;<a href=\"https://fr.wikipedia.org/wiki/fr:DOCTYPE\" target=\"_blank\" title=\"w:fr:DOCTYPE\">DOCTYPE</a>, vous ne pourrez pas faire passer votre page par un validateur.</p>\r\n\r\n<p>Vous avez s&ucirc;rement remarqu&eacute; qu&#39;il n&#39;y a pas de / final. En effet, le DOCTYPE n&#39;est pas une balise, en fait, mais a un statut bien particulier.</p>\r\n\r\n<h4>Les trois variantes du HTML 4.01[<a href=\"https://fr.wikibooks.org/w/index.php?title=Le_langage_HTML/Structure_de_base_d%27un_document_HTML&amp;veaction=edit&amp;section=5\" title=\"Modifier la section : Les trois variantes du HTML 4.01\">modifier</a>&nbsp;|&nbsp;<a href=\"https://fr.wikibooks.org/w/index.php?title=Le_langage_HTML/Structure_de_base_d%27un_document_HTML&amp;action=edit&amp;section=5\" title=\"Modifier la section : Les trois variantes du HTML 4.01\">modifier le wikicode</a>]</h4>\r\n\r\n<pre>\r\n<code class=\"language-html\">&lt;!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\"\r\n    \"http://www.w3.org/TR/html4/strict.dtd\"&gt;\r\n	\r\n&lt;!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\r\n    \"http://www.w3.org/TR/html4/loose.dtd\"&gt;      \r\n\r\n&lt;!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Frameset//EN\"\r\n    \"http://www.w3.org/TR/html4/frameset.dtd\"&gt;</code></pre>\r\n\r\n<h4>Les trois variantes du XHTML 1.0[<a href=\"https://fr.wikibooks.org/w/index.php?title=Le_langage_HTML/Structure_de_base_d%27un_document_HTML&amp;veaction=edit&amp;section=6\" title=\"Modifier la section : Les trois variantes du XHTML 1.0\">modifier</a>&nbsp;|&nbsp;<a href=\"https://fr.wikibooks.org/w/index.php?title=Le_langage_HTML/Structure_de_base_d%27un_document_HTML&amp;action=edit&amp;section=6\" title=\"Modifier la section : Les trois variantes du XHTML 1.0\">modifier le wikicode</a>]</h4>\r\n\r\n<pre>\r\n<code class=\"language-html\">&lt;!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"\r\n    \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\"&gt; \r\n\r\n\r\n&lt;!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\r\n    \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"&gt;   </code></pre>\r\n\r\n<h4>Le XHTML 1.1 (qui n&#39;a pas de variantes)[<a href=\"https://fr.wikibooks.org/w/index.php?title=Le_langage_HTML/Structure_de_base_d%27un_document_HTML&amp;veaction=edit&amp;section=7\" title=\"Modifier la section : Le XHTML 1.1 (qui n\'a pas de variantes)\">modifier</a>&nbsp;|&nbsp;<a href=\"https://fr.wikibooks.org/w/index.php?title=Le_langage_HTML/Structure_de_base_d%27un_document_HTML&amp;action=edit&amp;section=7\" title=\"Modifier la section : Le XHTML 1.1 (qui n\'a pas de variantes)\">modifier le wikicode</a>]</h4>\r\n\r\n<pre>\r\n<code class=\"language-html\">&lt;!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\" \r\n    \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\"&gt;\r\nLe HTML 5[modifier | modifier le wikicode]\r\n&lt;!DOCTYPE html&gt;</code></pre>\r\n\r\n<p>&nbsp;</p>','la-page-minimale','2022-04-15 15:30:55',1,'La page minimale','https://test-videos.co.uk/vids/jellyfish/mp4/h264/720/Jellyfish_720_10s_1MB.mp4',5),(16,29,'<p>Nous retrouvons ici notre exemple du haut de page, pour en expliquer les principales balises. En HTML, pour le nom des balises, il n&#39;y a pas de distinction entre majuscules et minuscules. Cependant, par le pass&eacute; la tendance &eacute;tait de mettre le nom tout en majuscules, tandis que la tendance actuelle est de mettre le nom tout en minuscules.</p>\r\n\r\n<pre>\r\n&lt;!DOCTYPE html&gt;\r\n \r\n\r\n</pre>\r\n\r\n<pre>\r\n<code class=\"language-html\">&lt;html&gt;\r\n \r\n   &lt;head&gt;\r\n     &lt;title&gt;Titre affiché dans la barre de titre du navigateur&lt;/title&gt;\r\n   &lt;/head&gt;\r\n \r\n   &lt;body&gt;\r\n     &lt;!-- C\'est ici que vous mettrez votre contenu --&gt;\r\n   &lt;/body&gt;\r\n \r\n&lt;/html&gt;</code></pre>\r\n\r\n<h4>La balise&nbsp;<code>&lt;html&gt;</code>[<a href=\"https://fr.wikibooks.org/w/index.php?title=Le_langage_HTML/Structure_de_base_d%27un_document_HTML&amp;veaction=edit&amp;section=10\" title=\"Modifier la section : La balise &lt;html&gt;\">modifier</a>&nbsp;|&nbsp;<a href=\"https://fr.wikibooks.org/w/index.php?title=Le_langage_HTML/Structure_de_base_d%27un_document_HTML&amp;action=edit&amp;section=10\" title=\"Modifier la section : La balise &lt;html&gt;\">modifier le wikicode</a>]</h4>\r\n\r\n<p>L&agrave;, on entre dans le vif du sujet, les balises.</p>\r\n\r\n<p>Un document HTML est enti&egrave;rement compris dans une balise&nbsp;<code>html</code>. M&ecirc;me si le navigateur s&#39;y attend, vous &ecirc;tes poli et vous lui dites que vous commencez votre document HTML, puis que vous le terminez. Ainsi la balise&nbsp;<code>&lt;html&gt;</code>&nbsp;sera toujours la toute premi&egrave;re apr&egrave;s le doctype, et la balise&nbsp;<code>&lt;/html&gt;</code>&nbsp;la toute derni&egrave;re.</p>\r\n\r\n<p>&Agrave; l&#39;int&eacute;rieur on trouve deux parties principales&nbsp;: un en-t&ecirc;te et un corps, plac&eacute; respectivement dans les balises&nbsp;<code>head</code>&nbsp;et&nbsp;<code>body</code>. L&#39;en-t&ecirc;te est constitu&eacute; de d&eacute;clarations g&eacute;n&eacute;rales concernant la page HTML, destin&eacute;es au navigateur, aux moteurs de recherche etc. Le corps contient le document lui-m&ecirc;me&nbsp;: ce qui sera affich&eacute; par le navigateur dans la fen&ecirc;tre de rendu. Cette partie ne contient aucun &eacute;l&eacute;ment obligatoire.</p>\r\n\r\n<h4>La balise&nbsp;<code>&lt;head&gt;</code>[<a href=\"https://fr.wikibooks.org/w/index.php?title=Le_langage_HTML/Structure_de_base_d%27un_document_HTML&amp;veaction=edit&amp;section=11\" title=\"Modifier la section : La balise &lt;head&gt;\">modifier</a>&nbsp;|&nbsp;<a href=\"https://fr.wikibooks.org/w/index.php?title=Le_langage_HTML/Structure_de_base_d%27un_document_HTML&amp;action=edit&amp;section=11\" title=\"Modifier la section : La balise &lt;head&gt;\">modifier le wikicode</a>]</h4>\r\n\r\n<p>La balise&nbsp;<code>&lt;head&gt;</code>&nbsp;d&eacute;limite l&#39;en-t&ecirc;te de la page dont on vient de parler. On y trouve des informations qui ne seront pas affich&eacute;es directement dans la zone de rendu du navigateur. Par exemple le titre de la page, le lien vers la feuille de style, une description et des mots cl&eacute;s, etc... L&#39;en-t&ecirc;te des documents HTML est l&#39;objet du chapitre&nbsp;<em><a href=\"https://fr.wikibooks.org/wiki/Programmation_HTML/L%27en-t%C3%AAte\" title=\"Programmation HTML/L\'en-tête\">L&#39;en-t&ecirc;te</a></em>.</p>\r\n\r\n<h4>La balise&nbsp;<code>&lt;title&gt;</code>[<a href=\"https://fr.wikibooks.org/w/index.php?title=Le_langage_HTML/Structure_de_base_d%27un_document_HTML&amp;veaction=edit&amp;section=12\" title=\"Modifier la section : La balise &lt;title&gt;\">modifier</a>&nbsp;|&nbsp;<a href=\"https://fr.wikibooks.org/w/index.php?title=Le_langage_HTML/Structure_de_base_d%27un_document_HTML&amp;action=edit&amp;section=12\" title=\"Modifier la section : La balise &lt;title&gt;\">modifier le wikicode</a>]</h4>\r\n\r\n<p>L&#39;en-t&ecirc;te contient un &eacute;l&eacute;ment obligatoire&nbsp;:&nbsp;<code>title</code>&nbsp;qui indique le titre de la page. C&#39;est le titre qui s&#39;affiche ensuite en haut de la fen&ecirc;tre du navigateur.</p>\r\n\r\n<p>Essayez de mettre un titre pertinent et diff&eacute;rent pour chaque page, qui permette d&#39;identifier le site et la page en elle-m&ecirc;me. Par exemple, &quot;Sommaire&quot; est un tr&egrave;s mauvais choix. Quand votre page se retrouvera dans les favoris de quelqu&#39;un, cette personne sera incapable de savoir de quelle page il s&#39;agit rien qu&#39;en regardant le nom. Pr&eacute;f&eacute;rez des choses du style &quot;Accueil - www.ladressedemonsite.com&quot;.</p>\r\n\r\n<h4>La balise&nbsp;<code>&lt;body&gt;</code>[<a href=\"https://fr.wikibooks.org/w/index.php?title=Le_langage_HTML/Structure_de_base_d%27un_document_HTML&amp;veaction=edit&amp;section=13\" title=\"Modifier la section : La balise &lt;body&gt;\">modifier</a>&nbsp;|&nbsp;<a href=\"https://fr.wikibooks.org/w/index.php?title=Le_langage_HTML/Structure_de_base_d%27un_document_HTML&amp;action=edit&amp;section=13\" title=\"Modifier la section : La balise &lt;body&gt;\">modifier le wikicode</a>]</h4>\r\n\r\n<p>Tout le corps de notre document est dans la partie&nbsp;<code>body</code>. Elle comprend donc le texte, les liens, la r&eacute;f&eacute;rence des images et tout ce qu&#39;un auteur peut vouloir mettre dans un document HTML.</p>\r\n\r\n<h4>Les commentaires[<a href=\"https://fr.wikibooks.org/w/index.php?title=Le_langage_HTML/Structure_de_base_d%27un_document_HTML&amp;veaction=edit&amp;section=14\" title=\"Modifier la section : Les commentaires\">modifier</a>&nbsp;|&nbsp;<a href=\"https://fr.wikibooks.org/w/index.php?title=Le_langage_HTML/Structure_de_base_d%27un_document_HTML&amp;action=edit&amp;section=14\" title=\"Modifier la section : Les commentaires\">modifier le wikicode</a>]</h4>\r\n\r\n<p>Les commentaires sont du texte &eacute;crit dans le code HTML qui n&#39;est pas visible dans le rendu de la page. Les commentaires jouent habituellement le r&ocirc;le de notes pour expliquer ce qui a &eacute;t&eacute; fait dans la page, ou bien tout simplement pour indiquer des modifications &agrave; faire ult&eacute;rieurement. Ils sont biens s&ucirc;r facultatifs, mais ils peuvent vous &ecirc;tre utiles&nbsp;!</p>\r\n\r\n<p>Un commentaire commence par les caract&egrave;res&nbsp;<code>&lt;!--</code>&nbsp;et se termine par les caract&egrave;res&nbsp;<code>--&gt;</code>.</p>\r\n\r\n<p>Pratiquement n&#39;importe quelle cha&icirc;ne de caract&egrave;res peut &ecirc;tre plac&eacute;e &agrave; l&#39;int&eacute;rieur d&#39;un commentaire&nbsp;: du texte, des balises, mais pas une suite de deux traits d&#39;union adjacents (--).</p>','les-balises','2022-04-15 15:26:46',1,'Les Balises','https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/360/Big_Buck_Bunny_360_10s_1MB.mp4',5),(17,29,'<p>Dans cette partie vous avez appris vos premi&egrave;res vraies balises. Elles sont importantes car elles doivent toujours &ecirc;tre pr&eacute;sentes (en dehors des balises de commentaires, qui sont uniquement l&agrave; &agrave; titre de... commentaires).</p>','conclusion','2022-04-15 15:25:25',1,'Conclusion','https://samplelib.com/lib/preview/mp4/sample-5s.mp4',5),(28,31,'<p>Les feuilles de styles en cascade (CSS, pour Cascading Style Sheets) d&eacute;crivent l&#39;apparence des divers &eacute;l&eacute;ments d&#39;une page web par le biais de couples propri&eacute;t&eacute; / valeur. &Eacute;tant distinctes du code de la page (HTML ou XML), elles constituent un moyen pour s&eacute;parer structure et mise en page d&#39;un site web. En tant que sp&eacute;cification du W3C, elles ob&eacute;issent &agrave; un ensemble de r&egrave;gles pr&eacute;cises qui seront d&eacute;crites dans les chapitres suivants et que les navigateurs web respectent progressivement. Si l&#39;on utilise le HTML pour d&eacute;terminer la pr&eacute;sentation dans un navigateur graphique, au lieu de se limiter &agrave; structurer le document, il faut alors int&eacute;grer les &eacute;l&eacute;ments et attributs de pr&eacute;sentation au sein du code. Le code s&#39;alourdit inutilement et devient beaucoup plus difficile &agrave; faire &eacute;voluer. Par exemple, si on veut changer la police (par exemple de type courrier), la couleur (par exemple rouge) et la taille de caract&egrave;res (par exemple 5 fois la taille par d&eacute;faut) de chaque paragraphe, en HTML de pr&eacute;sentation, il faudrait &eacute;crire ceci dans chaque page Web et pour chaque paragraphe :</p>\r\n\r\n<pre>\r\n<code class=\"language-html\">&lt;p&gt;\r\n  &lt;span style=\"font-family:monospace; color:red; font-size:5em;\"&gt;\r\n     \'\'texte du paragraphe\'\'\r\n   &lt;/span&gt;\r\n&lt;/p&gt;</code></pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Les feuilles de styles se proposent de r&eacute;soudre ces deux probl&egrave;mes par deux approches diff&eacute;rentes : En d&eacute;finissant une feuille de style interne au code HTML, on cr&eacute;&eacute; un style par page ; ceci est relativement lourd mais parfois int&eacute;ressant. En d&eacute;finissant une feuille de style externe qui peut alors &ecirc;tre utilis&eacute;e depuis n&#39;importe quel document HTML ou XML. Cette seconde m&eacute;thode est la plus courante et la plus adapt&eacute;e car elle exploite au mieux la facult&eacute; de g&eacute;n&eacute;ralisation des styles. Elle consiste &agrave; cr&eacute;er un fichier externe habituellement d&#39;extension .css qui contient les r&egrave;gles de styles des pages. Une d&eacute;claration dans l&#39;en-t&ecirc;te de chaque page web (par exemple la partie head d&#39;un document HTML) permet ensuite d&#39;appeler ces styles. Le fichier de la page web ne contiendra ainsi que la structure de la page et son style sera appliqu&eacute; &laquo; par dessus &raquo; comme une sorte de masque. L&#39;objectif de s&eacute;paration de la pr&eacute;sentation et de la structure est donc atteint.</p>','qu-est-ce-qu-une-feuille-de-style','2022-04-18 13:25:37',1,'Qu\'est-ce qu\'une feuille de style ?','https://youtu.be/CUxH_rWSI1k',5),(30,32,'<p><a href=\"https://en.wikibooks.org/wiki/Python\" title=\"Python\">Python</a>&nbsp;is a&nbsp;<a href=\"https://en.wikibooks.org/wiki/Computer_programming/Highlevel\" title=\"Computer programming/Highlevel\">high-level</a>,&nbsp;<a href=\"https://en.wikibooks.org/wiki/Computer_programming/Structured_programming\" title=\"Computer programming/Structured programming\">structured</a>,&nbsp;<a href=\"https://en.wikibooks.org/wiki/Open_Source\" title=\"Open Source\">open-source</a>&nbsp;programming language that can be used for a wide variety of programming tasks. Python was created by Guido Van Rossum in the early 1990s; its following has grown steadily and interest has increased markedly in the last few years or so. It is named after Monty Python&#39;s Flying Circus comedy program.</p>\r\n\r\n<p><a href=\"https://en.wikibooks.org/wiki/Python\" title=\"Python\">Python</a>&nbsp;is used extensively for system administration (many vital components of&nbsp;<a href=\"https://en.wikibooks.org/wiki/Linux\" title=\"Linux\">Linux</a>&nbsp;distributions are written in it); also, it is a great language to teach programming to novices. NASA has used Python for its software systems and has adopted it as the standard scripting language for its Integrated Planning System. Python is also extensively used by Google to implement many components of its Web Crawler and Search Engine &amp; Yahoo! for managing its discussion groups.</p>\r\n\r\n<p>Python within itself is an interpreted programming language that is automatically compiled into bytecode before execution (the bytecode is then normally saved to disk, just as automatically, so that compilation need not happen again until and unless the source gets changed). It is also a dynamically typed language that includes (but does not require one to use) object-oriented features and constructs.</p>\r\n\r\n<p>The most unusual aspect of Python is that whitespace is significant; instead of block delimiters (braces &rarr; &quot;{}&quot; in the C family of languages), indentation is used to indicate where blocks begin and end.</p>\r\n\r\n<p>For example, the following Python code can be interactively typed at an interpreter prompt, display the famous &quot;Hello World!&quot; on the user screen:</p>\r\n\r\n<pre>\r\n<code class=\"language-python\"> &gt;&gt;&gt; print (\"Hello World!\")\r\nHello World!</code></pre>\r\n\r\n<p>Another great feature of Python is its availability for all platforms. Python can run on Microsoft Windows, Macintosh and all Linux distributions with ease. This makes the programs very portable, as any program written for one platform can easily be used on another.</p>\r\n\r\n<p>Python provides a powerful assortment of built-in types (e.g., lists, dictionaries and strings), a number of built-in functions, and a few constructs, mostly statements. For example, loop constructs that can iterate over items in a collection instead of being limited to a simple range of integer values. Python also comes with a powerful&nbsp;<a href=\"https://en.wikibooks.org/wiki/Python_Programming/Standard_Library\" title=\"Python Programming/Standard Library\">standard library</a>, which includes hundreds of modules to provide routines for a wide variety of services including&nbsp;<a href=\"https://en.wikibooks.org/wiki/Python_Programming/Regular_Expression\" title=\"Python Programming/Regular Expression\">regular expressions</a>&nbsp;and TCP/IP sessions.</p>\r\n\r\n<p>Python is used and supported by a large&nbsp;<a href=\"https://www.python.org/community/index.html\" rel=\"nofollow\">Python Community</a>&nbsp;that exists on the Internet. The&nbsp;<a href=\"https://www.python.org/community/lists.html\" rel=\"nofollow\">mailing lists and news groups</a>&nbsp;like the&nbsp;<a href=\"http://mail.python.org/mailman/listinfo/tutor\" rel=\"nofollow\">tutor list</a>&nbsp;actively support and help new python programmers. While they discourage doing homework for you, they are quite helpful and are populated by the authors of many of the Python textbooks currently available on the market.</p>','python-programming-overview','2022-04-18 13:29:12',1,'Python Programming/Overview','https://youtu.be/H1elmMBnykA',5),(31,30,'<p>Nous allons cr&eacute;er notre premi&egrave;re page &agrave; partir de la page minimale. Pour cela, ouvrez votre &eacute;diteur de texte pr&eacute;f&eacute;r&eacute; &mdash; nous parlons bien d&#39;&eacute;diteur de texte et pas de logiciel de traitement de texte (comme Microsoft Word). Sous Microsoft Windows, le Bloc-Note (Notepad) fait tr&egrave;s bien l&#39;affaire. Prenez le texte ci-dessous, copiez-le, et collez-le dans la page vide (ou bien tapez-le).</p>\r\n\r\n<p><strong>Exemple</strong></p>\r\n\r\n<pre>\r\n<code class=\"language-html\">&lt;!DOCTYPE html&gt;\r\n\r\n&lt;html&gt;\r\n\r\n  &lt;head&gt;\r\n    &lt;title&gt;Premier essai&lt;/title&gt;\r\n  &lt;/head&gt;\r\n\r\n  &lt;body&gt;\r\n    Bonjour le monde.\r\n  &lt;/body&gt;\r\n\r\n&lt;/html&gt;</code></pre>\r\n\r\n<p>&nbsp;</p>','un-bon-exemple-vaut-mieux-qu-un-long-discours','2022-04-18 13:33:05',1,'Un bon exemple vaut mieux qu\'un long discours','https://youtu.be/qsbkZ7gIKnc',5),(32,33,'Titre\r\nLe titre est compris entre les balises <title>…</title>.\r\nHabituellement, le titre de la page est affiché dans la barre de titre du navigateur (tout en haut), et lorsque le navigateur gère les onglets, dans l\'étiquette des onglets.\r\nCet élément est obligatoire.\r\nEncodage\r\nSi le fichier contient des caractères répondant à la norme ISO-8859-1 « Latin-1 », on mettra la balise','principaux-elements','2022-04-18 13:35:30',1,'Principaux éléments','https://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_320x180.mp4',5),(33,34,'<p>TypeScript knows the JavaScript language and will generate types for you in many cases. For example in creating a variable and assigning it to a particular value, TypeScript will use the value as its type.</p>\r\n\r\n<pre>\r\n<code class=\"language-javascript\">let helloWorld = \"Hello World\";\r\n        \r\nlet helloWorld: string</code></pre>\r\n\r\n<p>&nbsp;</p>','types-by-inference','2022-04-18 13:37:13',1,'Types by Inference','https://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_320x180.mp4',5),(34,35,'Select the tab for your computer\'s operating system below, then follow its installation instructions.','getting-started','2022-04-18 13:40:17',1,'Getting started','https://youtu.be/LyragMPx77c',5),(35,26,'<p>Using inline JavaScript allows you to easily work with HTML and JavaScript within the same page. This is commonly used for temporarily testing out some ideas, and in situations where the script code is specific to that one page.</p>','the-script-element','2022-04-18 13:49:03',1,'The script element','https://youtu.be/W6NZfCO5SIk',6),(36,26,'Using inline JavaScript allows you to easily work with HTML and JavaScript within the same page. This is commonly used for temporarily testing out some ideas, and in situations where the script code is specific to that one page.','inline-javascript','2022-04-18 13:45:00',1,'Inline JavaScript','https://youtu.be/W6NZfCO5SIk',6),(37,24,'Be careful, JavaScript is deceptive, it might entice you with its C-like syntax, but underneath it is an entirely different beast.\r\n\r\nDespite some naming, syntactic, and standard library similarities, JavaScript and Java are otherwise unrelated and have very different semantics. The syntax of JavaScript is actually derived from C, while the semantics and design are influenced by the Self and Scheme programming languages.[1]','c-like-languages-c-and-java','2022-04-18 13:46:32',1,'C-like languages, (C++ and Java)','https://youtu.be/W6NZfCO5SIk',6);
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_student`
--

DROP TABLE IF EXISTS `lesson_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_425FFD94CDF80196` (`lesson_id`),
  KEY `IDX_425FFD94CB944F1A` (`student_id`),
  CONSTRAINT `FK_425FFD94CB944F1A` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `FK_425FFD94CDF80196` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_student`
--

LOCK TABLES `lesson_student` WRITE;
/*!40000 ALTER TABLE `lesson_student` DISABLE KEYS */;
INSERT INTO `lesson_student` VALUES (10,12,7),(22,16,7),(24,11,7),(27,37,7),(31,9,7),(32,35,7),(33,36,7);
/*!40000 ALTER TABLE `lesson_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `correct_response` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B6F7494E41807E1D` (`teacher_id`),
  KEY `IDX_B6F7494E853CD175` (`quiz_id`),
  CONSTRAINT `FK_B6F7494E41807E1D` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FK_B6F7494E853CD175` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A412FA92D823E37A` (`section_id`),
  KEY `IDX_A412FA9241807E1D` (`teacher_id`),
  CONSTRAINT `FK_A412FA9241807E1D` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FK_A412FA92D823E37A` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `teacher_id` int(11) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_title_idx` (`title`,`course_id`),
  KEY `IDX_2D737AEF591CC992` (`course_id`),
  KEY `IDX_2D737AEF41807E1D` (`teacher_id`),
  CONSTRAINT `FK_2D737AEF41807E1D` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FK_2D737AEF591CC992` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (24,12,'Relation to other languages','Relation-to-other-languages','2022-04-15 11:38:12',6,1),(25,12,'First program','First-program','2022-04-15 11:38:12',6,1),(26,12,'Placing the code','Placing-the-code','2022-04-15 11:38:12',6,1),(28,9,'Introduction','introduction','2022-04-15 11:55:30',5,1),(29,9,'Structure de base','structure-de-base','2022-04-15 11:55:30',5,1),(30,9,'Bien commencer le HTML','Bien-commencer-le-HTML','2022-04-15 11:55:30',5,1),(31,10,'Introduction','Introduction','2022-04-15 12:30:47',5,1),(32,11,'Intro','Intro','2022-04-15 12:31:12',5,1),(33,9,'L\'en-tête','L-en-tete','2022-04-15 12:34:33',5,1),(34,13,'TypeScript for the New Programmer','TypeScript-for-the-New-Programmer','2022-04-16 16:42:07',5,1),(35,14,'Introduction','Introduction','2022-04-16 16:43:06',5,1);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B723AF33A76ED395` (`user_id`),
  CONSTRAINT `FK_B723AF33A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (7,'student',41),(8,'student2',52);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `user_id` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `image_size` int(11) NOT NULL,
  `image` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B0F6A6D5A76ED395` (`user_id`),
  CONSTRAINT `FK_B0F6A6D5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (5,'format_1','format_1','azazkjkhjjfh\r\nghf\r\ngfh\r\nfghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh','2022-03-22 21:33:37',48,'2022-03-22 21:30:18',301198,'pawel-czerwinski-wvkfthwtjwu-unsplash-623a31da43e2b415187705.jpg',1),(6,'format_2','format_2','ghdfg\r\nghghgfgffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff\r\nfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff\r\nffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff\r\nffffffffffffffffffffffffffffffffffffffffffffffffffffffff','2022-03-23 08:41:36',49,'2022-03-23 07:31:46',301198,'pawel-czerwinski-wvkfthwtjwu-unsplash-623a31da43e2b415187705.jpg',1),(7,'format_3','format_3','terterttttttttttttttttttttt\r\nrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr\r\nuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu\r\nppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp\r\nmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm\r\nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn',NULL,50,'2022-03-23 07:39:01',1686447,'ilya-bronskiy-fnbznnlxas0-unsplash-623ac08512a39701384424.jpg',0),(8,'format_4','format_4','yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy\r\nttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt\r\nrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr\r\neeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee\r\nzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz',NULL,51,'2022-03-23 07:48:15',1686447,'ilya-bronskiy-fnbznnlxas0-unsplash-623ac2afe6b6b975433276.jpg',0);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (32,'admin@gmail.com','[\"ROLE_ADMIN\"]','$2y$13$xVItisEBHXk/oXoSpJJUKuJT2cA7MiDUj7CcyIz9s/A3XpoNImZd2','2022-03-18 23:25:19'),(41,'student@gmail.com','[\"ROLE_STUDENT\"]','$2y$13$xVItisEBHXk/oXoSpJJUKuJT2cA7MiDUj7CcyIz9s/A3XpoNImZd2','2022-03-19 00:26:22'),(48,'formateur@gmail.com','[\"ROLE_TEACHER\"]','$2y$13$HG8LtNABGht/yjRQssuiGOK5XadsBqq88REZleaCzkq1xECzhI776','2022-03-22 21:30:15'),(49,'formateur2@gmail.com','[\"ROLE_TEACHER\"]','$2y$13$t3oeFoAQ40KYQYlSUzK1ReRZtyCxg4tZt0rbH9iiO7BX7lXv.QV2W','2022-03-23 07:31:44'),(50,'format_3@gmail.com','[\"ROLE_TEACHER_PENDING\"]','$2y$13$xzL3mCTho9b75nt502aPGOQvV0FOksz5qZh5ZhT6KC5O2eJi.nReG','2022-03-23 07:38:59'),(51,'format_4@gmail.com','[\"ROLE_TEACHER_PENDING\"]','$2y$13$jp1hTKvH/UVQiSayqX3a9.uP6e4FCJUEkPt9nFiyNlqDU34ZAKsOW','2022-03-23 07:48:11'),(52,'student2@gmail.com','[\"ROLE_STUDENT\"]','$2y$13$W.rrUzwY4PNTFXpyBzEH5uu5MnQq32bFkQfxoPV1u9DBhlTD/GQDq','2022-04-05 13:30:57');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-19 12:36:23
