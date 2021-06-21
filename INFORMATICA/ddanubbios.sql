/*
Navicat MySQL Data Transfer

Source Server         : casa
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : ddanubbios

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-05-28 00:02:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `apparels_abstract`
-- ----------------------------
DROP TABLE IF EXISTS `apparels_abstract`;
CREATE TABLE `apparels_abstract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `articuled_code` varchar(15) NOT NULL,
  `brand` varchar(30) NOT NULL,
  `original_price` double NOT NULL,
  `attual_price` double NOT NULL,
  `discount` double NOT NULL,
  `type` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `typeapp` (`type`),
  CONSTRAINT `typeapp` FOREIGN KEY (`type`) REFERENCES `apparels_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of apparels_abstract
-- ----------------------------
INSERT INTO `apparels_abstract` VALUES ('1', 'CLUB', '3232-3322-3233', 'Nike Sportswear', '50', '0', '0', '1', 'https://iili.io/BOIndx.jpg');
INSERT INTO `apparels_abstract` VALUES ('2', 'CLUB TEE', '3232-3223-2332', 'Nike Sportswear', '50', '0', '0', '2', 'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/divhtybtltxjtyhhq2i5/t-shirt-sportswear-club-DDLtRZ.png');
INSERT INTO `apparels_abstract` VALUES ('3', 'PANT', '3232-332-22', 'Nike Nike Performance', '50', '0', '0', '1', 'https://i.gyazo.com/30adae2c392949aae321376568f91f5d.png');
INSERT INTO `apparels_abstract` VALUES ('4', 'CLUB HOODIE', '3344-322-33', 'Nike Sportswear', '50', '0', '0', '3', 'https://i.gyazo.com/9ca011048fffb233e9829ebfaf1b1f5e.png');
INSERT INTO `apparels_abstract` VALUES ('5', 'JJIMARCO JJPHIL', '234-243-2332', 'Jack & Jones', '50', '0', '0', '4', 'https://i.gyazo.com/e693d18f40b21410dfae69e37baa1696.png');
INSERT INTO `apparels_abstract` VALUES ('6', 'JOGGER', '3234-2233-332', 'Jack & Jones', '50', '0', '0', '1', 'https://i.gyazo.com/ac1b3817d0ff8a09f9a2b20d11563686.png');

-- ----------------------------
-- Table structure for `apparels_concrete`
-- ----------------------------
DROP TABLE IF EXISTS `apparels_concrete`;
CREATE TABLE `apparels_concrete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(20) NOT NULL,
  `size` varchar(5) NOT NULL,
  `apparel` int(11) NOT NULL,
  `hexcolor` varchar(10) NOT NULL DEFAULT '#fffff',
  `qty` int(11) NOT NULL DEFAULT 50,
  PRIMARY KEY (`id`),
  KEY `concreabstr` (`apparel`),
  CONSTRAINT `concreabstr` FOREIGN KEY (`apparel`) REFERENCES `apparels_abstract` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of apparels_concrete
-- ----------------------------
INSERT INTO `apparels_concrete` VALUES ('1', 'Red', 'CIAO', '1', '#D81414', '50');
INSERT INTO `apparels_concrete` VALUES ('2', 'Red', 'CIAO', '1', '#D81414', '50');
INSERT INTO `apparels_concrete` VALUES ('3', 'Red', 'L', '1', '#D81414', '50');
INSERT INTO `apparels_concrete` VALUES ('4', 'Red', 'L', '1', '#D81414', '50');
INSERT INTO `apparels_concrete` VALUES ('5', 'Red', 'L', '1', '#D81414', '50');
INSERT INTO `apparels_concrete` VALUES ('6', 'Red', 'L', '1', '#D81414', '50');
INSERT INTO `apparels_concrete` VALUES ('7', 'Red', 'M', '1', '#D81414', '50');
INSERT INTO `apparels_concrete` VALUES ('8', 'Blue', 'M', '1', '#0E15DE', '50');
INSERT INTO `apparels_concrete` VALUES ('9', 'Blue', 'M', '1', '#0E15DE', '50');
INSERT INTO `apparels_concrete` VALUES ('10', 'Gray', 'M', '1', '#56575D', '50');
INSERT INTO `apparels_concrete` VALUES ('11', 'Gray', 'S', '1', '#56575D', '50');
INSERT INTO `apparels_concrete` VALUES ('12', 'Gray', 'S', '1', '#56575D', '50');
INSERT INTO `apparels_concrete` VALUES ('13', 'Gray', 'S', '1', '#56575D', '50');
INSERT INTO `apparels_concrete` VALUES ('14', 'Gray', 'XL', '1', '#56575D', '50');
INSERT INTO `apparels_concrete` VALUES ('15', 'Gray', 'XL', '1', '#56575D', '50');
INSERT INTO `apparels_concrete` VALUES ('16', 'Gray', 'XXL', '1', '#56575D', '50');
INSERT INTO `apparels_concrete` VALUES ('17', 'Gray', 'M', '1', '#56575D', '50');
INSERT INTO `apparels_concrete` VALUES ('18', 'Gray', 'L', '1', '#56575D', '50');
INSERT INTO `apparels_concrete` VALUES ('19', 'White', 'L', '1', '#fffff', '50');
INSERT INTO `apparels_concrete` VALUES ('20', 'Blue', 'M', '1', '#0E15DE', '50');
INSERT INTO `apparels_concrete` VALUES ('21', 'Black', 'M', '2', '#00E203', '50');
INSERT INTO `apparels_concrete` VALUES ('22', 'Black', 'M', '2', '#00000', '50');
INSERT INTO `apparels_concrete` VALUES ('23', 'Black', 'M', '2', '#00000', '50');
INSERT INTO `apparels_concrete` VALUES ('24', 'Black', 'M', '2', '#00000', '50');
INSERT INTO `apparels_concrete` VALUES ('25', 'Black', 'M', '2', '#00000', '50');
INSERT INTO `apparels_concrete` VALUES ('26', 'Black', 'M', '2', '#00000', '50');
INSERT INTO `apparels_concrete` VALUES ('27', 'Black', 'M', '2', '#00000', '50');
INSERT INTO `apparels_concrete` VALUES ('28', 'Black', 'M', '2', '#00000', '50');
INSERT INTO `apparels_concrete` VALUES ('29', 'Black', 'M', '2', '#00000', '50');
INSERT INTO `apparels_concrete` VALUES ('30', 'Black', 'M', '2', '#00000', '50');
INSERT INTO `apparels_concrete` VALUES ('31', 'Black', 'M', '2', '#00000', '50');
INSERT INTO `apparels_concrete` VALUES ('32', 'White', 'S', '3', '#fffff', '50');
INSERT INTO `apparels_concrete` VALUES ('33', 'White', 'S', '2', '#fffff', '50');
INSERT INTO `apparels_concrete` VALUES ('34', 'White', 'S', '2', '#fffff', '50');
INSERT INTO `apparels_concrete` VALUES ('35', 'White', 'S', '2', '#fffff', '50');
INSERT INTO `apparels_concrete` VALUES ('36', 'White', 'S', '2', '#fffff', '50');
INSERT INTO `apparels_concrete` VALUES ('37', 'White', 'S', '2', '#fffff', '50');
INSERT INTO `apparels_concrete` VALUES ('38', 'White', 'S', '2', '#fffff', '50');
INSERT INTO `apparels_concrete` VALUES ('39', 'White', 'S', '2', '#fffff', '50');
INSERT INTO `apparels_concrete` VALUES ('40', 'White', 'S', '2', '#fffff', '50');
INSERT INTO `apparels_concrete` VALUES ('41', 'White', 'S', '2', '#fffff', '50');
INSERT INTO `apparels_concrete` VALUES ('42', 'White', 'S', '2', '#fffff', '50');
INSERT INTO `apparels_concrete` VALUES ('43', 'White', 'S', '2', '#fffff', '50');
INSERT INTO `apparels_concrete` VALUES ('44', 'White', 'S', '2', '#fffff', '50');
INSERT INTO `apparels_concrete` VALUES ('45', 'White', 'S', '2', '#fffff', '50');
INSERT INTO `apparels_concrete` VALUES ('46', 'White', 'S', '2', '#fffff', '50');
INSERT INTO `apparels_concrete` VALUES ('47', 'Gray', 'XS', '3', '#5B5C61', '50');
INSERT INTO `apparels_concrete` VALUES ('48', 'Gray', 'XS', '3', '#5B5C61', '50');
INSERT INTO `apparels_concrete` VALUES ('49', 'Gray', 'XS', '3', '#5B5C61', '50');
INSERT INTO `apparels_concrete` VALUES ('50', 'Gray', 'XS', '3', '#5B5C61', '50');
INSERT INTO `apparels_concrete` VALUES ('51', 'Gray', 'XS', '3', '#5B5C61', '50');
INSERT INTO `apparels_concrete` VALUES ('52', 'Black', 'M', '4', '#000', '50');
INSERT INTO `apparels_concrete` VALUES ('53', 'Black', 'XL', '5', '#000', '50');
INSERT INTO `apparels_concrete` VALUES ('54', 'Black', 'XL', '5', '#000', '50');
INSERT INTO `apparels_concrete` VALUES ('55', 'Black', 'XL', '5', '#000', '50');
INSERT INTO `apparels_concrete` VALUES ('56', 'Black', 'XL', '5', '#000', '50');
INSERT INTO `apparels_concrete` VALUES ('57', 'Black', 'XL', '5', '#000', '50');
INSERT INTO `apparels_concrete` VALUES ('58', 'Black', 'XL', '5', '#000', '50');
INSERT INTO `apparels_concrete` VALUES ('59', 'Black', 'XL', '5', '#000', '50');
INSERT INTO `apparels_concrete` VALUES ('60', 'Black', 'XL', '5', '#000', '50');

-- ----------------------------
-- Table structure for `apparels_type`
-- ----------------------------
DROP TABLE IF EXISTS `apparels_type`;
CREATE TABLE `apparels_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of apparels_type
-- ----------------------------
INSERT INTO `apparels_type` VALUES ('1', 'sport trousers\r\n');
INSERT INTO `apparels_type` VALUES ('2', 't-shirt');
INSERT INTO `apparels_type` VALUES ('3', 'hoodie');
INSERT INTO `apparels_type` VALUES ('4', 'trousers');

-- ----------------------------
-- Table structure for `cities`
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `cap` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cities
-- ----------------------------
INSERT INTO `cities` VALUES ('1', 'Napoli', 'Nola', '80035');
INSERT INTO `cities` VALUES ('2', 'Napoli', 'Camposano', '80030');
INSERT INTO `cities` VALUES ('3', 'Napoli', 'Cicciano', '80033');
INSERT INTO `cities` VALUES ('4', 'Napoli', 'Saviano', '80039');
INSERT INTO `cities` VALUES ('5', 'Napoli', 'San Vitaliano', '80030');
INSERT INTO `cities` VALUES ('6', 'Napoli', 'San Giovanni a ', '80146');
INSERT INTO `cities` VALUES ('7', 'Napoli', 'Barra', '80147');
INSERT INTO `cities` VALUES ('8', 'Napoli', 'Ponticelli', '80147');
INSERT INTO `cities` VALUES ('9', 'Napoli', 'San Giorgio a C', '80046');
INSERT INTO `cities` VALUES ('10', 'Milano', 'Cinisello Balsa', '20092');
INSERT INTO `cities` VALUES ('11', 'Milano', 'cusano Milanino', '20095');
INSERT INTO `cities` VALUES ('12', 'Milano', 'Sesto San Giova', '20099');
INSERT INTO `cities` VALUES ('13', 'Roma', 'Cecchignola', '00143');
INSERT INTO `cities` VALUES ('14', 'Roma', 'Torricola', '00178');
INSERT INTO `cities` VALUES ('15', 'Roma', 'Capannelle', '00178');

-- ----------------------------
-- Table structure for `logs`
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `action` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usrlog` (`id_user`),
  CONSTRAINT `usrlog` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES ('1', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('2', '1', ' insert into users (name, surname, cdf, phone, email, territory, custumer) values (\'Mammt\', \'fsdfsdfsd\', \'DLAGOVWUIEWU389\', \'3668602473\', \'antoniodauria2002@gmail.com\', 1, 1)');
INSERT INTO `logs` VALUES ('3', '1', ' DELETE FROM users where custumer = ** NOT SPECIFIED ** and cdf = ** NOT SPECIFIED **');
INSERT INTO `logs` VALUES ('4', '1', ' insert into users (name, surname, cdf, phone, email, territory, custumer) values (\'Mammt\', \'fsdfsdfsd\', \'DLAGOVWUIEWU389\', \'3668602473\', \'antoniodauria2002@gmail.com\', 1, 1)');
INSERT INTO `logs` VALUES ('5', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('6', '1', ' DELETE FROM users where custumer = ** NOT SPECIFIED ** and cdf = ** NOT SPECIFIED **');
INSERT INTO `logs` VALUES ('7', '1', ' insert into users (name, surname, cdf, phone, email, territory, custumer) values (\'Mammt\', \'fdgfdgfdg\', \'DLAGOVWUIEWU389\', \'3668602473\', \'antoniodauria2002@gmail.com\', 1, 1)');
INSERT INTO `logs` VALUES ('8', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('9', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('10', '1', ' DELETE FROM users where custumer = ** NOT SPECIFIED ** and cdf = ** NOT SPECIFIED **');
INSERT INTO `logs` VALUES ('11', '1', ' insert into users (name, surname, cdf, phone, email, territory, custumer) values (\'Mammt\', \'fsdfsdfsd\', \'DLAGOVWUIEWU389\', \'3668602473\', \'ronaldocms@outlook.it\', 1, 1)');
INSERT INTO `logs` VALUES ('12', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('13', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('14', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('15', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('16', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('17', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('18', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('19', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('20', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('21', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('22', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('23', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('24', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('25', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('26', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('27', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('28', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('29', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('30', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('31', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');
INSERT INTO `logs` VALUES ('32', '1', ' SELECT * FROM users where custumer = 1 and cdf = \'DLAGOVWUIEWU389\'');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `shipping` date NOT NULL,
  `delivered` date NOT NULL,
  `review` varchar(500) NOT NULL,
  `address` varchar(50) NOT NULL,
  `user` int(11) NOT NULL,
  `apparel` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userorder` (`user`),
  CONSTRAINT `userorder` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '5000', '2021-05-04', '2021-05-26', 'Belissimo prodotto', 'Via Libertà 4, Cimitile', '2', '1');
INSERT INTO `orders` VALUES ('2', '5000', '2021-05-04', '2021-05-26', '', 'Via Cosimo 2, Roma', '2', '21');

-- ----------------------------
-- Table structure for `territories`
-- ----------------------------
DROP TABLE IF EXISTS `territories`;
CREATE TABLE `territories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of territories
-- ----------------------------
INSERT INTO `territories` VALUES ('1', 'Agro Nolano', 'agroNolano@danubbios.com', '3339384855');
INSERT INTO `territories` VALUES ('2', 'Milano Nord', 'milanoNord@danubbios.com', '3332933966');
INSERT INTO `territories` VALUES ('3', 'Roma Sud', 'romaSud@danubbios.com', '3928394938');
INSERT INTO `territories` VALUES ('4', 'Napoli Est', 'napoliEst@danubbios.com', '3923849384');

-- ----------------------------
-- Table structure for `territories_cities`
-- ----------------------------
DROP TABLE IF EXISTS `territories_cities`;
CREATE TABLE `territories_cities` (
  `territory` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  PRIMARY KEY (`city`,`territory`),
  KEY `tercity` (`territory`),
  CONSTRAINT `cityter` FOREIGN KEY (`city`) REFERENCES `cities` (`id`),
  CONSTRAINT `tercity` FOREIGN KEY (`territory`) REFERENCES `territories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of territories_cities
-- ----------------------------
INSERT INTO `territories_cities` VALUES ('1', '1');
INSERT INTO `territories_cities` VALUES ('2', '3');
INSERT INTO `territories_cities` VALUES ('2', '4');
INSERT INTO `territories_cities` VALUES ('2', '5');
INSERT INTO `territories_cities` VALUES ('3', '6');
INSERT INTO `territories_cities` VALUES ('3', '7');
INSERT INTO `territories_cities` VALUES ('4', '8');
INSERT INTO `territories_cities` VALUES ('2', '9');
INSERT INTO `territories_cities` VALUES ('1', '10');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `surname` varchar(20) DEFAULT NULL,
  `cdf` varchar(16) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `territory` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `last_login` date DEFAULT NULL,
  `rank` int(11) DEFAULT 1,
  `email` varchar(100) DEFAULT NULL,
  `custumer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cdfunq` (`cdf`) USING BTREE,
  KEY `cust` (`custumer`),
  KEY `terruser` (`territory`),
  CONSTRAINT `cust` FOREIGN KEY (`custumer`) REFERENCES `users` (`id`),
  CONSTRAINT `terruser` FOREIGN KEY (`territory`) REFERENCES `territories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Fabio', 'Danubbio', 'DNBFBA2938328328', '3401949331', '1', 'RonaldoCMS', '123', null, '2', 'LOLLO', null);
INSERT INTO `users` VALUES ('2', 'Paolo', 'Cannone', 'CNNPLADSNOIKSDAS', '3928374384', '1', null, null, null, '1', null, '1');
INSERT INTO `users` VALUES ('3', 'Giovanni', 'Maio', 'MIAGVNSOIJASIJIJ', '3402897238', '1', 'Giovy', '123', null, '2', 'giovy@gmail.com', null);
INSERT INTO `users` VALUES ('4', 'Mario', 'Verdi', 'VRDMRASDOIJSDAID', '3292932782', '1', 'Mario12', '123', null, '1', null, '1');
INSERT INTO `users` VALUES ('5', 'Filippo', 'Giacomo', 'GCMFLPASDSADASDS', '3663892473', '1', null, null, null, '1', null, '1');
INSERT INTO `users` VALUES ('6', 'Antonio', 'Gassone', 'GSSATNSAIJUHASDU', '3242809328', '1', null, null, null, '1', null, '1');
INSERT INTO `users` VALUES ('7', 'Michele', 'La Marca', 'LMRMHL02H20H86OQ', '3243298328', '1', 'Mikyy85', '123', null, '1', 'miky.lamarca@outlook.it', '1');
INSERT INTO `users` VALUES ('8', 'Marco', 'Mascolo', 'MSCMRCSDAOIJSADI', '3922382871', '1', null, null, null, '1', null, '1');
INSERT INTO `users` VALUES ('9', 'Anna', 'Esposito', 'SPSNNASDAIJASDSA', '3902387912', '1', null, null, null, '1', null, '3');
INSERT INTO `users` VALUES ('10', 'Paola', 'Esposito', 'SPOPLASADOIJASUH', '3661238723', '1', null, null, null, '1', null, '3');
INSERT INTO `users` VALUES ('11', 'Miriam', 'Delia', 'DLEMRMASDJ8ISADU', '3419287912', '1', null, null, null, '1', null, '3');
INSERT INTO `users` VALUES ('12', 'Federica', 'Massimo', 'MSSFDRSOIJASDIJA', '3311298702', '1', null, null, null, '1', null, '3');
INSERT INTO `users` VALUES ('30', 'Pasqualina', 'Ambra', 'OIDKEIRJFURIDOEK', '3668602473', '1', null, null, null, '1', 'paky@gmail.com', '1');
INSERT INTO `users` VALUES ('40', 'Mammt', 'fsdfsdfsd', 'DLAGOVWUIEWU389', '3668602473', '1', null, null, null, '1', '45444545', '1');
