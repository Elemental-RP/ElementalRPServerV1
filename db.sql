-- --------------------------------------------------------
-- Anfitrião:                    185.113.142.208
-- Versão do servidor:           10.4.12-MariaDB-1:10.4.12+maria~bionic-log - mariadb.org binary distribution
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping structure for table s4_erpv1.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- Dumping data for table s4_erpv1.addon_account: ~27 rows (approximately)
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT INTO `addon_account` (`id`, `name`, `label`, `shared`) VALUES
	(3, 'caution', 'Caution', 0),
	(4, 'society_realestateagent', 'Agent immobilier', 1),
	(5, 'society_ambulance', 'Ambulance', 1),
	(6, 'society_mechanic', 'Mecânico', 1),
	(7, 'society_police', 'Police', 1),
	(13, 'society_unicorn', 'Unicorn', 1),
	(17, 'society_cardealer', 'Concessionnaire', 1),
	(18, 'society_ammu', 'Ammunation', 1),
	(19, 'society_taxi', 'Taxi', 1),
	(20, 'society_airlines', 'TAP', 1),
	(21, 'society_tap', 'tap', 1),
	(22, 'society_nightclub', 'Galaxy', 1),
	(25, 'society_fbi', 'fbi', 1),
	(27, 'society_fire', 'fire', 1),
	(28, 'society_unemployed', 'Unemployed', 1),
	(31, 'society_lawyer', 'Advogado', 1),
	(32, 'society_realestateagent', 'Agente Imobiliário', 1),
	(33, 'property_black_money', 'Propriedade', 0),
	(35, 'society_mazebank', 'Maze Bank', 1),
	(36, 'society_unicorn_fridge', 'Vanilla Unicorn Frigorifico', 1),
	(38, 'society_tequilala', 'Tequilala', 1),
	(39, 'society_tequilala_fridge', 'Tequilala Frigorifico', 1),
	(40, 'society_aztecas', 'Aztecas', 1),
	(41, 'society_ballas', 'Ballas', 1),
	(42, 'society_thefamilies', 'Los Santos Vagos', 1),
	(43, 'society_thefamilies', 'The Families', 1),
	(44, 'society_thelostmc', 'The Lost MC', 1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- Dumping structure for table s4_erpv1.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `money` double NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7308 DEFAULT CHARSET=utf8;

-- Dumping structure for table s4_erpv1.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- Dumping data for table s4_erpv1.addon_inventory: ~27 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
INSERT INTO `addon_inventory` (`id`, `name`, `label`, `shared`) VALUES
	(3, 'society_ambulance', 'Ambulance', 1),
	(4, 'society_mechanic', 'Mecânico', 1),
	(5, 'society_police', 'Police', 1),
	(11, 'society_unicorn', 'Unicorn', 1),
	(12, 'society_unicorn_fridge', 'Unicorn (frigo)', 1),
	(18, 'society_cardealer', 'Concesionnaire', 1),
	(19, 'society_ammu', 'Ammunation', 1),
	(20, 'society_taxi', 'Taxi', 1),
	(21, 'society_airlines', 'TAP', 1),
	(22, 'society_tap', 'Tap', 1),
	(23, 'society_nightclub', 'Galaxy', 1),
	(24, 'society_nightclub_fridge', 'Galaxy (Frigorifico)', 1),
	(27, 'society_fbi', 'fbi', 1),
	(30, 'society_fire', 'fire', 1),
	(31, 'society_unemployed', 'Unemployed', 1),
	(34, 'society_lawyer', 'Advogado', 1),
	(35, 'property', 'Propriedade', 0),
	(37, 'society_mazebank', 'Maze Bank', 1),
	(38, 'society_unicorn_fridge', 'Vanilla Unicorn Frigorifico', 1),
	(39, 'housing', 'Propriedade', 0),
	(41, 'society_tequilala', 'Tequilala', 1),
	(42, 'society_tequilala_fridge', 'Tequilala Frigorifico', 1),
	(43, 'society_aztecas', 'Aztecas', 1),
	(44, 'society_ballas', 'Ballas', 1),
	(45, 'society_lsvagos', 'Los Santos Vagos', 1),
	(46, 'society_thefamilies', 'The Families', 1),
	(47, 'society_thelostmc', 'The Lost MC', 1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- Dumping structure for table s4_erpv1.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=884 DEFAULT CHARSET=utf8;
-- Dumping structure for table s4_erpv1.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `sender` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `target_type` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `label` longtext CHARACTER SET utf8mb4 NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5231 DEFAULT CHARSET=utf8;


-- Dumping structure for table s4_erpv1.bought_houses
CREATE TABLE IF NOT EXISTS `bought_houses` (
  `houseid` int(50) NOT NULL,
  PRIMARY KEY (`houseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping structure for table s4_erpv1.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table s4_erpv1.cardealer_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;

-- Dumping structure for table s4_erpv1.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `dateofbirth` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `sex` varchar(1) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'f',
  `height` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4739 DEFAULT CHARSET=utf8;

-- Dumping structure for table s4_erpv1.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- Dumping data for table s4_erpv1.datastore: ~26 rows (approximately)
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
INSERT INTO `datastore` (`id`, `name`, `label`, `shared`) VALUES
	(2, 'user_glasses', 'Glasses', 0),
	(3, 'user_helmet', 'Helmet', 0),
	(4, 'user_mask', 'Mask', 0),
	(5, 'property', 'Propriedade', 0),
	(6, 'society_ambulance', 'Ambulance', 1),
	(7, 'society_police', 'Police', 1),
	(13, 'society_unicorn', 'Unicorn', 1),
	(17, 'society_ammu', 'Ammunation', 1),
	(18, 'society_taxi', 'Taxi', 1),
	(19, 'society_tap', 'Tap', 1),
	(20, 'society_nightclub', 'Galaxy', 1),
	(23, 'society_fbi', 'fbi', 1),
	(25, 'society_fire', 'fire', 1),
	(26, 'society_mechanic', 'Mecânico', 1),
	(29, 'society_unemployed', 'Unemployed', 1),
	(30, 'society_lawyer', 'Advogado', 1),
	(33, 'society_mazebank', 'Maze Bank', 1),
	(34, 'society_unicorn_fridge', 'Vanilla Unicorn Frigorifico', 1),
	(35, 'housing', 'Propriedade', 0),
	(37, 'society_tequilala', 'Tequilala', 1),
	(38, 'society_tequilala_fridge', 'Tequilala Frigorifico', 1),
	(39, 'society_aztecas', 'Aztecas', 1),
	(40, 'society_ballas', 'Ballas', 1),
	(41, 'society_lsvagos', 'Los Santos Vagos', 1),
	(42, 'society_thefamilies', 'The Families', 1),
	(43, 'society_thelostmc', 'The Lost MC', 1);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

-- Dumping structure for table s4_erpv1.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19388 DEFAULT CHARSET=utf8;

-- Dumping structure for table s4_erpv1.erpm_furnishings
CREATE TABLE IF NOT EXISTS `erpm_furnishings` (
  `motelId` bigint(20) NOT NULL DEFAULT 0,
  `furnishingData` longtext DEFAULT NULL,
  `ownedFurnishingData` longtext DEFAULT NULL,
  PRIMARY KEY (`motelId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping structure for table s4_erpv1.erpm_keys
CREATE TABLE IF NOT EXISTS `erpm_keys` (
  `uuid` bigint(20) NOT NULL DEFAULT 0,
  `owner` varchar(50) NOT NULL,
  `keyData` longtext NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping structure for table s4_erpv1.erpm_motels
CREATE TABLE IF NOT EXISTS `erpm_motels` (
  `userIdentifier` varchar(50) NOT NULL,
  `motelData` longtext NOT NULL,
  `motelCreated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping structure for table s4_erpv1.erpm_storages
CREATE TABLE IF NOT EXISTS `erpm_storages` (
  `storageId` varchar(255) NOT NULL,
  `storageData` longtext NOT NULL,
  PRIMARY KEY (`storageId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping structure for table s4_erpv1.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1315 DEFAULT CHARSET=utf8;

-- Dumping data for table s4_erpv1.fine_types: ~91 rows (approximately)
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`) VALUES
	(1, 'Prática de atos que impeçam/compromentam a segurança', 2240, 0, NULL),
	(2, 'Prática de atos com o intuito de impedir a circulação de veículos a motor', 4000, 0, NULL),
	(3, 'Desobediência a ordem legitima do agente da autoridade', 5000, 0, 2),
	(4, 'Desobediência a ordem legitima de parar imposta pelo o agente', 5000, 0, 2),
	(5, '-----Manobras de Condutores-----', 0, 0, NULL),
	(8, 'Veículo a transitar em sentido oposto ao legalmente estabelecido', 2600, 0, NULL),
	(9, 'Circulação de veículo na berma da auto-estrada (ou de via equiparada)', 1000, 0, NULL),
	(10, 'Utilização de sinal sonoro, não se verificando situação de perigo iminente', 950, 0, NULL),
	(11, 'Utilização de sinal sonoro durante a noite, dentro de localidade', 1000, 0, NULL),
	(12, 'Não ceder a passagem a escolta Militar ou Policial', 1000, 0, NULL),
	(13, 'Ultrapassagem efetuada pela direita', 4000, 0, NULL),
	(14, '-----Excesso de Velocidade-----', 0, 0, NULL),
	(15, '» Dentro de Localidades', 0, 0, NULL),
	(16, 'Até 19 kh/h', 600, 0, NULL),
	(17, 'De 20 a 39 km/h', 1400, 0, NULL),
	(18, 'De 40 a 59 km/h', 4000, 0, NULL),
	(19, 'Superior a 60 km/h | Remoção da Carta', 6000, 0, NULL),
	(20, '» Fora de Localidades', 6000, 0, NULL),
	(21, 'Até 30 km/h', 600, 0, NULL),
	(22, 'De 30 a 60 km/h', 1400, 0, NULL),
	(23, 'De 60 a 80 km/h', 4000, 0, NULL),
	(24, 'Superior a 80 km/h | Remoção da Carta', 6000, 0, NULL),
	(25, '-----Paragem e Estacionamento-----', 0, 0, NULL),
	(26, 'Paragem/Estacionamento, fora do local destinado a esse efeito (ou sem respeitar a forma indicada)', 750, 0, NULL),
	(27, 'Estacionar sem deixar espaço suficiente para a saída de outro veículo', 500, 0, NULL),
	(28, 'Estacionado na passagem assinada para peões ', 800, 0, NULL),
	(29, 'Estacionado em via de um só sentido impedindo o trânsito de veículos', 400, 0, NULL),
	(30, 'A impedir o acesso a veículo devidamente estacionado ou sua saída', 600, 0, NULL),
	(31, 'Estacionado de forma a impedir o acesso a lugares vagos', 600, 0, NULL),
	(32, 'Estacionado em local sinalizado e reservado a certos veículos ou entidade', 1400, 0, NULL),
	(33, 'Estacionado em parque destinado a outra categoria de veículo', 1400, 0, NULL),
	(34, '-----Luzes-----', 0, 0, NULL),
	(35, 'Condução de veículo que não disponha de iluminação', 1000, 0, NULL),
	(36, 'Circulação de veículo que represente um perigo especial para os outros utentes da via pública sem utilização das luzes avisadoras de perigo', 1000, 0, NULL),
	(37, 'Veículo a ser rebocado sem utilizar as luzes de perigo quando funcionais', 1000, 0, NULL),
	(38, '---Veículos em missão de Polícia, Socorro Ou Serviço Urgente de Interesse Público---', 0, 0, NULL),
	(39, 'Não ceder passagem a veículo em missão de Polícia ou em Urgência', 2400, 0, NULL),
	(40, '----Dispostivivos de Segurança e Telemóvel----', 0, 0, NULL),
	(41, 'Fazer uso de telemóveis', 2200, 0, NULL),
	(42, 'Não fazer uso do capacete pelo condutor ou passageiro', 1800, 0, NULL),
	(43, '---Regras de Condução--', 0, 0, NULL),
	(44, 'Conduzir motociclo/ciclomotor levantando qualquer roda', 1000, 0, NULL),
	(45, '-----Transformações de Viaturas-----', 0, 0, NULL),
	(46, 'Tranformação de Viatura Vidros Fumados ', 2000, 0, NULL),
	(47, 'Tranformação de Viatura neons', 2600, 0, NULL),
	(48, '----Transformação de Veículo/ Falta a Inspeção Extraordinária----', 0, 0, NULL),
	(49, 'Automovel ou ciclomotor a circular sem chapa de matrícula', 1200, 0, NULL),
	(50, '----Regulamento de Sinalização de Trânsito (RST)----', 0, 0, NULL),
	(51, 'Desobediência ao sinal -STOP, não parar', 1000, 0, NULL),
	(52, 'Desobediência ao sinal- sentido proibido', 400, 0, NULL),
	(53, 'Desobediência ao sinal C11- proibido virar á esquerda/direita', 400, 0, NULL),
	(54, 'Desobediência ao sinal C15- estacionamento proibido', 350, 0, NULL),
	(55, 'Desobediência á luz semafórica vermelha', 1200, 0, NULL),
	(56, '----Crimes Contra Pessoas----', 0, 1, NULL),
	(57, 'Homicídio', 75000, 1, 25),
	(58, 'Ofensa à integridade física simples', 15000, 1, 4),
	(59, 'Ofensa à integridade física Grave', 20000, 1, 8),
	(60, 'Participação numa Luta', 5000, 1, 3),
	(61, 'Volencia Domestica', 20000, 1, 5),
	(62, 'Ameaça', 20000, 1, 7),
	(63, 'Perseguição', 14500, 1, 3),
	(64, 'Escravidão', 30000, 1, 7),
	(65, 'Tráfico de pessoas', 38000, 1, 16),
	(66, 'Rapto', 24000, 1, 13),
	(67, 'Tomada de reféns', 40000, 1, 18),
	(68, 'Violação', 20000, 1, 6),
	(69, 'Entrada em lugar vedado/interdito ao público', 7500, 1, 5),
	(70, 'Gravações e fotografias ilícitas', 10000, 1, 3),
	(71, 'Tortura e outros tratamentos cruéis, degradantes ou desumanos graves', 25000, 1, 23),
	(72, '-----Crimes Contra o Património-----', 0, 2, NULL),
	(73, 'Furto', 7500, 2, 7),
	(74, 'Roubo', 12000, 2, 16),
	(75, 'Burla', 10000, 2, 6),
	(77, 'Violencia Domestica', 35000, 2, 4),
	(78, 'Branqueamento de Capitais', 75000, 2, 25),
	(79, '-----Crimes Contra a Vida em Sociedade-----', 0, 3, NULL),
	(80, 'Tráfico e outras atividade ílicitas (estupefacientes)', 17500, 3, 14),
	(81, 'Consumo em Público de Alcool/Estupefacientes', 3500, 3, 2),
	(82, 'Falsificação ou contrafação de documento', 35000, 3, 10),
	(83, 'Corrupção de substâncias alimentares ou medicinais', 25000, 3, 6),
	(84, 'Condução de veículo em estado de embriaguez ou sob a influência de estupefacientes ou substâncias psicotrópicas | Remoção da Carta', 20000, 3, 4),
	(85, 'Condução de Veículo sem carta de condução | Apreensão da Viatura', 20000, 3, 5),
	(86, 'Associação criminosa', 25000, 3, 10),
	(87, 'Terrorismo', 95000, 3, 20),
	(88, 'Ameaça com prática de crime', 35000, 3, 18),
	(89, 'Uso/posse de arma branca (Facas) à vista', 20000, 3, 1),
	(90, 'Uso/posse de armas de fogo à vista', 25000, 3, 3),
	(91, 'Uso/posse de armas de fogo sem lincensa', 50000, 3, 9),
	(92, 'Posse de estupefacientes +2g', 15000, 3, 18),
	(93, 'Posse de Dinheiro Sujo', 20000, 3, 22),
	(94, 'Fuga às Autoridades', 20000, 3, 15);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- Dumping structure for table s4_erpv1.fine_types_tap
CREATE TABLE IF NOT EXISTS `fine_types_tap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table s4_erpv1.fine_types_tap: ~3 rows (approximately)
/*!40000 ALTER TABLE `fine_types_tap` DISABLE KEYS */;
INSERT INTO `fine_types_tap` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Atraso de pagamento de mensalidade', 2000, 0),
	(2, 'Destruição equipamentos ', 10000, 0),
	(3, 'Paraquedas ', 1000, 0);
/*!40000 ALTER TABLE `fine_types_tap` ENABLE KEYS */;

-- Dumping structure for table s4_erpv1.imported_veh
CREATE TABLE IF NOT EXISTS `imported_veh` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table s4_erpv1.imported_veh: ~103 rows (approximately)
/*!40000 ALTER TABLE `imported_veh` DISABLE KEYS */;
INSERT INTO `imported_veh` (`name`, `model`, `price`, `category`) VALUES
	('Ram', '10ram', 105000, 'dodge'),
	('Charger 16', '16charger', 550000, 'dodge'),
	('Clio 17', '17cliofl', 35000, 'renault'),
	('Chiron', '2019chiron', 4500000, 'bugatti'),
	('205 GTI', '205GTti', 50000, 'peugeot'),
	('350z', '350z', 350000, 'nissan'),
	('440i', '440i', 325000, 'bmw'),
	('458 SPC', '458spc', 1200000, 'ferrari'),
	('650 SLW', '650slw', 950000, 'mclaren'),
	('Mustang Fastback', '66fastback', 250000, 'ford'),
	('675 LT', '675lt', 1100000, 'mclaren'),
	('Charger SRT', '69charger', 430000, 'dodge'),
	('720s', '720stc', 1200000, 'mclaren'),
	('750i', '750li', 120000, 'bmw'),
	('A 45', 'a45', 180000, 'mercedes'),
	('AMG GT', 'amggt', 300000, 'mercedes'),
	('S2000', 'ap2', 135000, 'honda'),
	('A4', 'audia4', 95000, 'audi'),
	('RS6', 'audirs6tk', 135000, 'audi'),
	('Bronco', 'bc78bronco', 100000, 'ford'),
	('Divo', 'bdivo', 6500000, 'bugatti'),
	('Belair', 'belair57', 125000, 'chevrolet'),
	('Fusca', 'bfinjection', 45000, 'volkswagen'),
	('206', 'blista', 35000, 'peugeot'),
	('507', 'bmw507', 300000, 'bmw'),
	('750i', 'bmwe65', 200000, 'bmw'),
	('M8', 'bmwm8', 420000, 'bmw'),
	('BMW S1000', 'bmws', 100000, 'motas'),
	('Brabus 850', 'brabus850', 500000, 'mercedes'),
	('BMW S1000 rr16', 'bs17', 125000, 'motas'),
	('C63 Coupe', 'c63coupe', 175000, 'mercedes'),
	('Honda CB500F', 'cb500f', 75000, 'motas'),
	('CBR 500r', 'cbr500r', 75000, 'motas'),
	('Honda CB1000F', 'cbrr', 120000, 'motas'),
	('Camaro ZL1', 'ccss16', 180000, 'chevrolet'),
	('Clio 93', 'clio', 22500, 'renault'),
	('Ducati 1199', 'd99', 115000, 'motas'),
	('Duster', 'daduster', 50000, 'dacia'),
	('DM 1200', 'dm1200', 135000, 'motas'),
	('Evo', 'evo10', 190000, 'mitsubishi'),
	('Lancer', 'evo9', 145000, 'mitsubishi'),
	('Evoque', 'evoque', 150000, 'rangerover'),
	('KTMEXC', 'exc530', 80000, 'motas'),
	('Ghibli', 'exemplar', 450000, 'maserati'),
	('Agusta F4', 'f4rr', 140000, 'motas'),
	('812', 'f812', 1200000, 'ferrari'),
	('Harley Davidson', 'fatboy', 65000, 'motas'),
	('California', 'fc15', 850000, 'ferrari'),
	('Escort', 'fe86', 100000, 'ford'),
	('Fit Sport', 'fit', 200000, 'honda'),
	('G65 AMG', 'g65amg', 350000, 'mercedes'),
	('GT 86 RB', 'gt86rb', 120000, 'toyota'),
	('599 GTO', 'gtoxx', 950000, 'ferrari'),
	('GTR 17', 'gtr', 450000, 'nissan'),
	('CBR 1000r', 'hcbr17', 125000, 'motas'),
	('Huracan', 'hevo', 900000, 'lambo'),
	('Civic Type-R', 'hondacivictr', 110000, 'honda'),
	('Ibiza', 'ibiza', 40000, 'seat'),
	('B5', 'intruder', 60000, 'volkswagen'),
	('KSR', 'ksr', 25000, 'motas'),
	('Aventador', 'lamboavj', 850000, 'lambo'),
	('Levante', 'levante', 350000, 'maserati'),
	('Logan', 'logan', 50000, 'dacia'),
	('Centenario', 'lp770r', 2000000, 'lambo'),
	('Lykan', 'lykan', 9000000, 'wm'),
	('M3', 'm3e30', 280000, 'bmw'),
	('M5', 'm5e60', 385000, 'bmw'),
	('GTS', 'mqgts', 400000, 'maserati'),
	('Mustang GT', 'mustang19', 350000, 'ford'),
	('Astra', 'opastra', 25000, 'opel'),
	('P1', 'p1', 3000000, 'mclaren'),
	('911r', 'p911r', 650000, 'porsche'),
	('Panamera', 'panamera17turbo', 375000, 'porsche'),
	('Cayenne', 'pcs18', 300000, 'porsche'),
	('488', 'pista', 1500000, 'ferrari'),
	('Polo 05', 'polo05', 45000, 'volkswagen'),
	('Prius', 'prius', 70000, 'toyota'),
	('Yamaha R6', 'r6', 145000, 'motas'),
	('R8', 'r8ppi', 650000, 'audi'),
	('Agera', 'regera', 4000000, 'koeg'),
	('I8', 'rmodbmwi8', 450000, 'bmw'),
	('Vogue', 'rrst', 225000, 'rangerover'),
	('RS7', 'rs7', 200000, 'audi'),
	('Sandero', 'Sandero', 50000, 'dacia'),
	('Sandero S2', 'sanderos2', 60000, 'dacia'),
	('Scirrocco', 'scijo', 135000, 'volkswagen'),
	('R34 Skyline', 'skyline', 380000, 'nissan'),
	('WRX', 'subwrx', 380000, 'subaru'),
	('Supra', 'supra2', 350000, 'toyota'),
	('Model S', 'surge', 450000, 'tesla'),
	('Model X', 'teslax', 650000, 'tesla'),
	('Titan', 'titan17', 110000, 'nissan'),
	('Model 3', 'tmodel', 500000, 'tesla'),
	('Roadster', 'tr22', 550000, 'tesla'),
	('Urus', 'urus', 700000, 'lambo'),
	('Vega GT', 'vega', 90000, 'chevrolet'),
	('RX7', 'vsrx7', 150000, 'mazda'),
	('Passat', 'vwstance', 50000, 'volkswagen'),
	('Fenyr', 'wmfenyr', 12000000, 'wm'),
	('Wraith', 'Wraith', 3500000, 'rollsroyce'),
	('X6', 'x6m', 240000, 'bmw'),
	('Kawazaki z1000', 'z1000', 180000, 'motas'),
	('Kawazaki zx10r Bubja', 'zx10', 220000, 'motas');
/*!40000 ALTER TABLE `imported_veh` ENABLE KEYS */;

-- Dumping structure for table s4_erpv1.imported_veh_categories
CREATE TABLE IF NOT EXISTS `imported_veh_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table s4_erpv1.imported_veh_categories: ~30 rows (approximately)
/*!40000 ALTER TABLE `imported_veh_categories` DISABLE KEYS */;
INSERT INTO `imported_veh_categories` (`name`, `label`) VALUES
	('audi', 'Audi'),
	('bmw', 'BMW'),
	('bugatti', 'Bugatti'),
	('chevrolet', 'Chebrolet'),
	('dacia', 'Dacia'),
	('dodge', 'Dodge'),
	('ferrari', 'Ferrari'),
	('ford', 'Ford'),
	('honda', 'Honda'),
	('koeg', 'Koenigsegg'),
	('lambo', 'Lamborghini'),
	('maserati', 'Maserati'),
	('mazda', 'Mazda'),
	('mclaren', 'McLaren'),
	('mercedes', 'Mercedes'),
	('mitsubishi', 'Mitsubishi'),
	('motas', 'Motas'),
	('nissan', 'Nissan'),
	('opel', 'Opel'),
	('peugeot', 'Peugeot'),
	('porsche', 'Porsche'),
	('rangerover', 'Range Rover'),
	('renault', 'Renault'),
	('rollsroyce', 'Rolls Royce'),
	('seat', 'Seat'),
	('subaru', 'Subaru'),
	('tesla', 'Tesla'),
	('toyota', 'Toyota'),
	('volkswagen', 'Volkswagen'),
	('wm', 'WM');
/*!40000 ALTER TABLE `imported_veh_categories` ENABLE KEYS */;

-- Dumping structure for table s4_erpv1.insto_accounts
CREATE TABLE IF NOT EXISTS `insto_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forename` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `surname` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping structure for table s4_erpv1.insto_instas
CREATE TABLE IF NOT EXISTS `insto_instas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filters` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_insto_instas_insto_accounts` (`authorId`),
  CONSTRAINT `FK_insto_instas_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `insto_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping structure for table s4_erpv1.insto_likes
CREATE TABLE IF NOT EXISTS `insto_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `inapId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_insto_likes_insto_accounts` (`authorId`),
  KEY `FK_insto_likes_insto_instas` (`inapId`),
  CONSTRAINT `FK_insto_likes_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `insto_accounts` (`id`),
  CONSTRAINT `FK_insto_likes_insto_instas` FOREIGN KEY (`inapId`) REFERENCES `insto_instas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping structure for table s4_erpv1.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `label` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `weight` int(11) NOT NULL DEFAULT -1,
  `rare` int(11) NOT NULL DEFAULT 0,
  `can_remove` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table s4_erpv1.items: ~162 rows (approximately)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('advanced_lockpick', 'Lockpick Avançada', -1, 0, 1),
	('alface', 'Alface', -1, 0, 1),
	('algemas', 'Algemas', -1, 0, 1),
	('algemas_chaves', 'Chaves das Algemas', -1, 0, 1),
	('alho', 'Alho', -1, 0, 1),
	('alive_chicken', 'Frango vivo', -1, 0, 1),
	('bandage', 'Ligaduras', -1, 0, 1),
	('bankidcard', 'Banco Cartão de Acesso', -1, 0, 1),
	('beer', 'Cerveja', -1, 0, 1),
	('binoculars', 'Binoculos', -1, 0, 1),
	('blackberry', 'Black Berry', -1, 0, 1),
	('blowpipe', 'Tochas', -1, 0, 1),
	('blowtorch', 'Maçarico', -1, 0, 1),
	('bolcacahuetes', 'Tigela de amendoim', -1, 0, 1),
	('bolchips', 'Pacote de batatas fritas', -1, 0, 1),
	('bolnoixcajou', 'Taça de cajus', -1, 0, 1),
	('bolpistache', 'Tigela de pistacios', -1, 0, 1),
	('bread', 'Pão', -1, 0, 1),
	('bronzeecars', 'Cartão Bronze Elemental Cars', -1, 0, 1),
	('c4_bank', 'C4', -1, 0, 1),
	('carnep', 'Carne Picada', -1, 0, 1),
	('carokit', 'Kit de carrossaria', -1, 0, 1),
	('carotool', 'Ferramentas de carrossaria', -1, 0, 1),
	('chips', 'Batatas Fritas', -1, 0, 1),
	('chocolate', 'Chocolate', -1, 0, 1),
	('cigarett', 'Cigarro', -1, 0, 1),
	('clip', 'Carregador', -1, 0, 1),
	('clothe', 'Roupas', -1, 0, 1),
	('cocacola', 'Coca-cola', -1, 0, 1),
	('coffe', 'Café', -1, 0, 1),
	('coke', 'Cocaína', -1, 0, 1),
	('coke10g', 'Cocaína (10G)', -1, 0, 1),
	('coke1g', 'Cocaína (1G)', -1, 0, 1),
	('cokebrick', 'Bloco de Cocaína (100G)', -1, 0, 1),
	('cokeburn', 'USB-C Branca', -1, 0, 1),
	('coke_pooch', 'Sacos de Cocaína', -1, 0, 1),
	('copper', 'Cobre', -1, 0, 1),
	('croquettes', 'Comida de Animal', -1, 0, 1),
	('cupcake', 'Bolinho', -1, 0, 1),
	('cutted_wood', 'Madeira Cortada', -1, 0, 1),
	('dabs', 'Dabs', -1, 0, 1),
	('diamond', 'Diamante', -1, 0, 1),
	('diamondecars', 'Cartão Diamond Elemental Cars', -1, 0, 1),
	('dia_box', 'Caixa de Diamante', -1, 0, 1),
	('dildo', 'Dildo', -1, 0, 1),
	('dildo2', 'Pocket Pussy', -1, 0, 1),
	('drill', 'Broca', -1, 0, 1),
	('drpepper', 'Dr. Pepper', -1, 0, 1),
	('drugbags', 'Sacos', -1, 0, 1),
	('drugBUSBC', 'Black USB-C', -1, 0, 1),
	('energy', 'RedBull', -1, 0, 1),
	('ephedra', 'Ephedra', -1, 0, 1),
	('ephedrine', 'Ephedrine', -1, 0, 1),
	('essence', 'Essência', -1, 0, 1),
	('fabric', 'Pano', -1, 0, 1),
	('fakepee', 'Fake Pee', -1, 0, 1),
	('fanta', 'Fanta', -1, 0, 1),
	('fichas', 'Fichas', -1, 0, 1),
	('fish', 'Peixa', -1, 0, 1),
	('fixkit', 'Kit de reparação', -1, 0, 1),
	('fixtool', 'Ferramentas de reparação', -1, 0, 1),
	('gazbottle', 'Botija de gas', -1, 0, 1),
	('gold', 'Ouro', -1, 0, 1),
	('goldecars', 'Cartão Gold Elemental Cars', -1, 0, 1),
	('gold_bar', 'Barra de Ouro', -1, 0, 1),
	('golem', 'Golem', -1, 0, 1),
	('grapperaisin', 'Cacho de uvas', -1, 0, 1),
	('hackerDevice', 'Dispositivo de Hacker', -1, 0, 1),
	('hamburger', 'Hamburger', -1, 0, 1),
	('hqscale', 'Balança', -1, 0, 1),
	('ice', 'Gelo', -1, 0, 1),
	('icetea', 'Ice-tea', -1, 0, 1),
	('iron', 'Ferro', -1, 0, 1),
	('jager', 'Liquor Beirão', -1, 0, 1),
	('jagerbomb', 'Absinto', -1, 0, 1),
	('jagercerbere', 'Liquor de figo', -1, 0, 1),
	('joint2g', 'Ganza (2G)', -1, 0, 1),
	('jusfruit', 'Sumo de fruta', -1, 0, 1),
	('licenca_neons', 'Licença de Neons', -1, 0, 1),
	('lighter', 'Isqueiro', -1, 0, 1),
	('limonade', 'Limonada', -1, 0, 1),
	('lockpick', 'Lockpick', -1, 0, 1),
	('manteiga', 'Manteiga', -1, 0, 1),
	('martini', 'Martini ', -1, 0, 1),
	('medikit', 'Kit Médico', -1, 0, 1),
	('membroecars', 'Cartão Membro Elemental Cars', -1, 0, 1),
	('menthe', 'Folha de Menta', -1, 0, 1),
	('meth', 'Metanfetamina', -1, 0, 1),
	('meth10g', 'Meth (10G)', -1, 0, 1),
	('meth1g', 'Meth (1G)', -1, 0, 1),
	('methbrick', 'Bloco de Meth (100G)', -1, 0, 1),
	('methburn', 'USB-C Azul', -1, 0, 1),
	('meth_pooch', 'Saco de Metanfetamina', -1, 0, 1),
	('metreshooter', 'Cocktail Shot', -1, 0, 1),
	('milk', 'Leite', -1, 0, 1),
	('mixapero', 'Mistura de aperitivos', -1, 0, 1),
	('mojito', 'Mojito', -1, 0, 1),
	('narcan', 'Narcan', -1, 0, 1),
	('notepad', 'Bloco de Notas', -1, 0, 1),
	('opium', 'Opium', -1, 0, 1),
	('opium_pooch', 'Saco de Ópium', -1, 0, 1),
	('oregaos', 'Oregaos', -1, 0, 1),
	('ovo', 'Ovo', -1, 0, 1),
	('ovoes', 'Ovo estrelado', -1, 0, 1),
	('oxycutter', 'Tocha de plasma', -1, 0, 1),
	('pacificidcard', 'Pacific Cartão de Acesso', -1, 0, 1),
	('packaged_chicken', 'Frango em uma bandeja', -1, 0, 1),
	('packaged_plank', 'Embalagem de placas de madeira', -1, 0, 1),
	('painkiller', 'Painkiller', -1, 0, 1),
	('petrol', 'Petrolio', -1, 0, 1),
	('petrol_raffin', 'Petrolio Refinado', -1, 0, 1),
	('phone', 'Telemóvel', -1, 0, 1),
	('pizza', 'Pizza', -1, 0, 1),
	('polvo', 'Polvo Cru', -1, 0, 1),
	('polvogre', 'Polvo Grelhado', -1, 0, 1),
	('poolreceipt', 'Recibo da Piscina', -1, 0, 1),
	('poppy', 'Poppy', -1, 0, 1),
	('poubelle', 'Lixo', -1, 0, 1),
	('queijo', 'Queijo', -1, 0, 1),
	('radio', 'Rádio', -1, 0, 1),
	('rasperry', 'Raspberry', -1, 0, 1),
	('repairkit', 'Kit de reparação', -1, 0, 1),
	('rhum', 'Rhum', -1, 0, 1),
	('rhumcoca', 'Rhum-coca', -1, 0, 1),
	('rhumfruit', 'Rhum-sumu de frutas', -1, 0, 1),
	('rolex', 'Relógio Rolex', -1, 0, 1),
	('rolpaper', 'Filtro', -1, 0, 1),
	('sandwich', 'Sandwiche', -1, 0, 1),
	('saucisson', 'Salsicha', -1, 0, 1),
	('silencieux', 'Silenciador', -1, 0, 1),
	('silverecars', 'Cartão Silver Elemental Cars', -1, 0, 1),
	('sim', 'Sim Card', -1, 0, 1),
	('slaughtered_chicken', 'Frango Abatido', -1, 0, 1),
	('soda', 'Refrigerante', -1, 0, 1),
	('sprite', 'Sprite', -1, 0, 1),
	('stone', 'Pedra', -1, 0, 1),
	('teqpaf', 'Teq\'paf', -1, 0, 1),
	('tequila', 'Tequila', -1, 0, 1),
	('thermal_charge', 'Carga térmica', -1, 0, 1),
	('thermite', 'Bomba Térmica', -1, 0, 1),
	('tires', 'Pneu', -1, 0, 1),
	('tomate', 'Tomate', -1, 0, 1),
	('tuning_laptop', 'Tuner Laptop', -1, 0, 1),
	('vipecars', 'Cartão VIP Elemental Cars', -1, 0, 1),
	('vitela', 'Vitela Crua', -1, 0, 1),
	('vitelaass', 'Vitela Assada', -1, 0, 1),
	('vodka', 'Vodka', -1, 0, 1),
	('vodkaenergy', 'Vodka-Energy', -1, 0, 1),
	('vodkafruit', 'Vodka-jus de fruits', -1, 0, 1),
	('washed_stone', 'Pedra Lavada', -1, 0, 1),
	('water', 'Água', -1, 0, 1),
	('weed', 'Cannabis', -1, 0, 1),
	('weed20g', 'Weed (20G)', -1, 0, 1),
	('weed4g', 'Weed (4G)', -1, 0, 1),
	('weedbrick', 'Bloco de Weed (200G)', -1, 0, 1),
	('weedburn', 'USB-C Verde', -1, 0, 1),
	('weed_pooch', 'Saco de Canábis', -1, 0, 1),
	('whisky', 'Whisky', -1, 0, 1),
	('whiskycoca', 'Whisky-Cola', -1, 0, 1),
	('wine', 'Vinho', -1, 0, 1),
	('wood', 'Madeira', -1, 0, 1),
	('wool', 'Lã', -1, 0, 1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table s4_erpv1.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `label` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table s4_erpv1.jobs: ~24 rows (approximately)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'INEM', 1),
	('ammu', 'Ammunation', 1),
	('aztecas', 'Aztecas', 1),
	('ballas', 'Ballas', 1),
	('cardealer', 'Motor Sport', 1),
	('delivery', 'Logistica', 0),
	('fire', 'Bombeiros', 1),
	('lawyer', 'Advogado', 0),
	('lixeiro', 'Coletor de Lixo', 0),
	('lsvagos', 'Los Santos Vagos', 1),
	('mechanic', 'Mecânico', 1),
	('miner', 'Minerador', 0),
	('nightclub', 'Galaxy', 1),
	('police', 'PSP', 1),
	('poolcleaner', 'Limpador de piscina', 0),
	('realestateagent', 'Imobiliária Pires', 1),
	('security', 'Prosegur', 0),
	('tap', 'Tap', 1),
	('taxi', 'Taxista', 0),
	('tequilala', 'Tequilala', 1),
	('thefamilies', 'The Families', 1),
	('thelostmc', 'The Lost MC', 1),
	('unemployed', 'Desempregado', 0),
	('unicorn', 'Vanilla Unicorn', 1);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table s4_erpv1.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `label` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext CHARACTER SET utf8mb4 NOT NULL,
  `skin_female` longtext CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;

-- Dumping data for table s4_erpv1.job_grades: ~92 rows (approximately)
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployedunemployed', 'Fundo de Desemprego', 500, '{}', '{}'),
	(17, 'ambulance', 0, 'ambulance', 'TEPH', 1500, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"bproof_1":13,"bproof_2":0,"shoes_1":25,"shoes_2":0,"torso_2":0,"hair_color_2":0,"pants_1":35,"glasses_1":0,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":54,"helmet_1":-1,"helmet_2":0,"arms":85,"face":19,"decals_1":0,"torso_1":102,"hair_2":0,"chain_1":30,"chain_2":0,"skin":34,"pants_2":0}', '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":47,"torso_2":1,"hair_color_2":0,"pants_1":47,"glasses_1":0,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":54,"helmet_1":-1,"helmet_2":0,"arms":85,"face":19,"decals_1":0,"torso_1":47,"hair_2":0,"chain_1":30,"chain_2":0,"skin":34,"pants_2":0}'),
	(18, 'ambulance', 1, 'doctor', 'Enfermeiro', 2750, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"bproof_1":13,"bproof_2":0,"shoes_1":25,"shoes_2":0,"torso_2":1,"hair_color_2":0,"pants_1":35,"glasses_1":0,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":54,"helmet_1":-1,"helmet_2":0,"arms":85,"face":19,"decals_1":0,"torso_1":102,"hair_2":0,"chain_1":30,"chain_2":0,"skin":34,"pants_2":0}', '{"tshirt_2":1,"hair_color_1":5,"glasses_2":3,"shoes":47,"torso_2":1,"hair_color_2":0,"pants_1":47,"glasses_1":0,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":54,"helmet_1":-1,"helmet_2":0,"arms":85,"face":19,"decals_1":0,"torso_1":47,"hair_2":0,"chain_1":30,"chain_2":0,"skin":34,"pants_2":0}'),
	(19, 'ambulance', 2, 'chief_doctor', 'Medico', 3000, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"bproof_1":13,"bproof_2":0,"shoes_1":25,"shoes_2":0,"torso_2":2,"hair_color_2":0,"pants_1":35,"glasses_1":0,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":54,"helmet_1":-1,"helmet_2":0,"arms":85,"face":19,"decals_1":0,"torso_1":102,"hair_2":0,"chain_1":30,"chain_2":0,"skin":34,"pants_2":0}', '{"tshirt_2":6,"hair_color_1":5,"glasses_2":3,"shoes":47,"torso_2":1,"hair_color_2":0,"pants_1":47,"glasses_1":0,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":149,"helmet_1":-1,"helmet_2":0,"arms":85,"face":19,"decals_1":0,"torso_1":47,"hair_2":0,"chain_1":30,"chain_2":0,"skin":34,"pants_2":0}'),
	(20, 'ambulance', 3, 'boss', 'Delegado', 3500, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"bproof_1":13,"bproof_2":0,"shoes_1":25,"shoes_2":0,"torso_2":3,"hair_color_2":0,"pants_1":35,"glasses_1":0,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":54,"helmet_1":-1,"helmet_2":0,"arms":85,"face":19,"decals_1":0,"torso_1":102,"hair_2":0,"chain_1":30,"chain_2":0,"skin":34,"pants_2":0}', '{"tshirt_2":7,"hair_color_1":5,"glasses_2":3,"shoes":47,"torso_2":1,"hair_color_2":0,"pants_1":47,"glasses_1":0,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":149,"helmet_1":-1,"helmet_2":0,"arms":85,"face":19,"decals_1":0,"torso_1":47,"hair_2":0,"chain_1":30,"chain_2":0,"skin":34,"pants_2":0}'),
	(21, 'mechanic', 0, 'recrue', 'Estagiario', 1000, '{"tshirt_2":1,"hair_color_1":5,"glasses_2":3,"shoes_1":25,"shoes_2":0,"torso_2":1,"hair_color_2":0,"pants_1":47,"glasses_1":0,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":90,"helmet_1":-1,"helmet_2":0,"arms":92,"face":19,"decals_1":0,"torso_1":95,"hair_2":0,"chain_1":0,"chain_2":0,"skin":34,"pants_2":0}', '{}'),
	(22, 'mechanic', 1, 'novice', 'Mecanico Novato', 1250, '{"tshirt_2":1,"hair_color_1":5,"glasses_2":3,"shoes_1":25,"shoes_2":0,"torso_2":1,"hair_color_2":0,"pants_1":47,"glasses_1":0,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":90,"helmet_1":-1,"helmet_2":0,"arms":92,"face":19,"decals_1":0,"torso_1":95,"hair_2":0,"chain_1":0,"chain_2":0,"skin":34,"pants_2":0}', '{}'),
	(23, 'mechanic', 2, 'experimente', 'Mecanico Experiente', 1500, '{"tshirt_2":1,"hair_color_1":5,"glasses_2":3,"shoes_1":25,"shoes_2":0,"torso_2":1,"hair_color_2":0,"pants_1":47,"glasses_1":0,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":90,"helmet_1":-1,"helmet_2":0,"arms":92,"face":19,"decals_1":0,"torso_1":95,"hair_2":0,"chain_1":0,"chain_2":0,"skin":34,"pants_2":0}', '{}'),
	(24, 'mechanic', 3, 'chief', 'Chefe Mecanico', 1750, '{"tshirt_2":1,"hair_color_1":5,"glasses_2":3,"shoes_1":25,"shoes_2":0,"torso_2":1,"hair_color_2":0,"pants_1":47,"glasses_1":0,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":90,"helmet_1":-1,"helmet_2":0,"arms":92,"face":19,"decals_1":0,"torso_1":95,"hair_2":0,"chain_1":0,"chain_2":0,"skin":34,"pants_2":0}', '{}'),
	(25, 'mechanic', 4, 'boss', 'Patrão', 2000, '{"tshirt_2":1,"hair_color_1":5,"glasses_2":3,"shoes_1":25,"shoes_2":0,"torso_2":1,"hair_color_2":0,"pants_1":47,"glasses_1":0,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":90,"helmet_1":-1,"helmet_2":0,"arms":92,"face":19,"decals_1":0,"torso_1":95,"hair_2":0,"chain_1":0,"chain_2":0,"skin":34,"pants_2":0}', '{}'),
	(26, 'police', 0, 'cadete', 'Cadete/Agente Provisorio', 950, '{}', '{}'),
	(27, 'police', 1, 'agente', 'Agente', 1350, '{}', '{}'),
	(28, 'police', 2, 'agentep', 'Agente Principal', 1550, '{}', '{}'),
	(29, 'police', 3, 'agentec', 'Agente Coordenador', 1750, '{}', '{}'),
	(30, 'police', 4, 'chefe', 'Chefe', 2000, '{}', '{}'),
	(32, 'police', 5, 'chefep', 'Chefe Principal', 2250, '{}', '{}'),
	(33, 'police', 6, 'chefec', 'Chefe-Coordenador ', 2500, '{}', '{}'),
	(34, 'police', 7, 'subc', 'Sub-Comissário', 2750, '{}', '{}'),
	(35, 'police', 8, 'comissario', 'Comissário', 3000, '{}', '{}'),
	(61, 'cardealer', 0, 'recruit', 'Recruta', 0, '{}', '{}'),
	(62, 'cardealer', 1, 'novice', 'Funcionário', 0, '{}', '{}'),
	(63, 'cardealer', 2, 'experienced', 'Experimente', 0, '{}', '{}'),
	(64, 'cardealer', 3, 'boss', 'Patrão', 0, '{}', '{}'),
	(102, 'ammu', 0, 'soldato', 'Soldado', 0, '{}', '{}'),
	(103, 'ammu', 1, 'capo', 'Assasino', 0, '{}', '{}'),
	(104, 'ammu', 2, 'consigliere', 'Capo', 0, '{}', '{}'),
	(105, 'ammu', 3, 'righthand', 'Mão direita', 0, '{}', '{}'),
	(106, 'ammu', 4, 'boss', 'Chefe ', 0, '{}', '{}'),
	(114, 'taxi', 0, 'recrue', 'Motorista', 1000, '{}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(115, 'taxi', 1, 'novice', 'Novato', 1000, '{}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(116, 'taxi', 2, 'experimente', 'Experiente', 1000, '{}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(117, 'taxi', 3, 'uber', 'Uber', 1200, '{}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(118, 'taxi', 4, 'boss', 'Patrão', 1500, '{}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(119, 'security', 0, 'employee', 'Segurança', 350, '{}', '{"tshirt_1":60,"torso_1":0,"arms":68,"pants_1":25,"glasses_1":0,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":27,"glasses_2":0,"torso_2":0,"shoes":63,"hair_1":5,"skin":0,"sex":1,"glasses_1":15,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":65}'),
	(120, 'tap', 0, 'soldato', 'Soldado', 0, '{}', '{}'),
	(121, 'tap', 1, 'capo', 'Assasino', 0, '{}', '{}'),
	(122, 'tap', 2, 'consigliere', 'Capo', 0, '{}', '{}'),
	(123, 'tap', 3, 'righthand', 'Mão direita', 0, '{}', '{}'),
	(124, 'tap', 4, 'boss', 'Chefe ', 0, '{}', '{}'),
	(127, 'nightclub', 0, 'barman', 'Barman', 850, '{}', '{}'),
	(128, 'nightclub', 1, 'dancer', 'Segurança', 1000, '{}', '{}'),
	(129, 'nightclub', 2, 'viceboss', 'Co-Manager', 1200, '{}', '{}'),
	(130, 'nightclub', 3, 'boss', 'Manager', 1755, '{}', '{}'),
	(152, 'fire', 0, 'recruit', 'Cadete', 0, '{"tshirt_1":57,"torso_1":55,"arms":0,"pants_1":35,"glasses":0,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":5,"face":19,"glasses_2":1,"torso_2":0,"shoes":24,"hair_1":2,"skin":34,"sex":0,"glasses_1":0,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":8}', '{"tshirt_1":34,"torso_1":48,"shoes":24,"pants_1":34,"torso_2":0,"decals_2":0,"hair_color_2":0,"glasses":0,"helmet_2":0,"hair_2":3,"face":21,"decals_1":0,"glasses_2":1,"hair_1":11,"skin":34,"sex":1,"glasses_1":5,"pants_2":0,"arms":14,"hair_color_1":10,"tshirt_2":0,"helmet_1":57}'),
	(153, 'fire', 1, 'sergeant', 'Oficial Bombeiro Principal', 0, '{"tshirt_1":58,"torso_1":55,"shoes":24,"pants_1":35,"pants_2":0,"decals_2":1,"hair_color_2":0,"face":19,"helmet_2":0,"hair_2":0,"arms":0,"decals_1":8,"torso_2":0,"hair_1":2,"skin":34,"sex":0,"glasses_1":0,"glasses_2":1,"hair_color_1":5,"glasses":0,"tshirt_2":0,"helmet_1":11}', '{"tshirt_1":35,"torso_1":48,"arms":14,"pants_1":34,"pants_2":0,"decals_2":1,"hair_color_2":0,"shoes":24,"helmet_2":0,"hair_2":3,"decals_1":7,"torso_2":0,"face":21,"hair_1":11,"skin":34,"sex":1,"glasses_1":5,"glasses_2":1,"hair_color_1":10,"glasses":0,"tshirt_2":0,"helmet_1":57}'),
	(154, 'fire', 2, 'lieutenant', 'Adjunto', 0, '{"tshirt_1":58,"torso_1":55,"shoes":24,"pants_1":35,"pants_2":0,"decals_2":2,"hair_color_2":0,"face":19,"helmet_2":0,"hair_2":0,"glasses":0,"decals_1":8,"hair_color_1":5,"hair_1":2,"skin":34,"sex":0,"glasses_1":0,"glasses_2":1,"torso_2":0,"arms":41,"tshirt_2":0,"helmet_1":11}', '{"tshirt_1":35,"torso_1":48,"arms":44,"pants_1":34,"hair_2":3,"decals_2":2,"hair_color_2":0,"hair_color_1":10,"helmet_2":0,"face":21,"shoes":24,"torso_2":0,"glasses_2":1,"hair_1":11,"skin":34,"sex":1,"glasses_1":5,"pants_2":0,"decals_1":7,"glasses":0,"tshirt_2":0,"helmet_1":57}'),
	(155, 'fire', 3, 'boss', 'Comandante', 0, '{"tshirt_1":58,"torso_1":55,"shoes":24,"pants_1":35,"pants_2":0,"decals_2":3,"hair_color_2":0,"face":19,"helmet_2":0,"hair_2":0,"arms":41,"torso_2":0,"hair_color_1":5,"hair_1":2,"skin":34,"sex":0,"glasses_1":0,"glasses_2":1,"decals_1":8,"glasses":0,"tshirt_2":0,"helmet_1":11}', '{"tshirt_1":35,"torso_1":48,"arms":44,"pants_1":34,"pants_2":0,"decals_2":3,"hair_color_2":0,"face":21,"helmet_2":0,"hair_2":3,"decals_1":7,"torso_2":0,"hair_color_1":10,"hair_1":11,"skin":34,"sex":1,"glasses_1":5,"glasses_2":1,"shoes":24,"glasses":0,"tshirt_2":0,"helmet_1":57}'),
	(159, 'poolcleaner', 0, 'interim', 'Limpador', 1500, '{}', '{}'),
	(160, 'lawyer', 0, 'recruit', 'Sócio', 1000, '{}', '{}'),
	(161, 'lawyer', 1, 'employe', 'Sócio-Principal', 1500, '{}', '{}'),
	(162, 'lawyer', 2, 'boss', 'Sócio-Gerente', 1600, '{}', '{}'),
	(168, 'miner', 0, 'employee', 'Empregado', 1000, '{}', '{}'),
	(170, 'realestateagent', 0, 'location', 'Estagiario', 350, '{}', '{}'),
	(171, 'realestateagent', 1, 'vendeur', 'Vendedor', 350, '{}', '{}'),
	(172, 'realestateagent', 2, 'gestion', 'Gerente', 350, '{}', '{}'),
	(173, 'realestateagent', 3, 'boss', 'CEO', 350, '{}', '{}'),
	(178, 'unicorn', 0, 'recruit', 'Estagiário', 800, '{}', '{}'),
	(179, 'unicorn', 1, 'barman', 'Bar Man', 1000, '{}', '{}'),
	(180, 'unicorn', 2, 'security', 'Segurança', 1200, '{}', '{}'),
	(181, 'unicorn', 3, 'boss', 'CEO', 1755, '{}', '{}'),
	(183, 'lixeiro', 0, 'employee', 'Empregado', 1500, '{"tshirt_1":59,"torso_1":89,"arms":31,"pants_1":36,"glasses_1":19,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":2,"glasses_2":0,"torso_2":1,"shoes":35,"hair_1":0,"skin":0,"sex":0,"glasses_1":19,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":5}', '{"tshirt_1":36,"torso_1":0,"arms":68,"pants_1":30,"glasses_1":15,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":27,"glasses_2":0,"torso_2":11,"shoes":26,"hair_1":5,"skin":0,"sex":1,"glasses_1":15,"pants_2":2,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":19}'),
	(184, 'delivery', 0, 'delivery', 'Transportador', 1500, '{}', '{}'),
	(189, 'tequilala', 0, 'recruit', 'Estagiário', 800, '{}', '{}'),
	(190, 'tequilala', 1, 'barman', 'Bar Man', 1000, '{}', '{}'),
	(191, 'tequilala', 2, 'security', 'Segurança', 1200, '{}', '{}'),
	(192, 'tequilala', 3, 'boss', 'CEO', 1755, '{}', '{}'),
	(200, 'police', 9, 'subint', 'Sub-Intendente', 1000, '{}', '{}'),
	(201, 'police', 10, 'inten', 'Intendente', 1000, '{}', '{}'),
	(202, 'police', 11, 'superin', 'Superintendente', 1000, '{}', '{}'),
	(203, 'police', 12, 'superinchefe', 'Superintendente-Chefe', 1000, '{}', '{}'),
	(204, 'police', 13, 'diretoradjunto', 'Diretor Nacional-Adjunto', 1000, '{}', '{}'),
	(205, 'police', 14, 'diretornacional', 'Diretor Nacional', 1000, '{}', '{}'),
	(206, 'aztecas', 0, 'recruit', 'Recruta', 600, '{}', '{}'),
	(207, 'aztecas', 1, 'member', 'Membro', 600, '{}', '{}'),
	(208, 'aztecas', 2, 'intercircle', 'Circulo Interno', 600, '{}', '{}'),
	(209, 'aztecas', 3, 'boss', 'Líder', 600, '{}', '{}'),
	(210, 'ballas', 0, 'recruit', 'Recruta', 600, '{}', '{}'),
	(211, 'ballas', 1, 'member', 'Membro', 600, '{}', '{}'),
	(212, 'ballas', 2, 'intercircle', 'Circulo Interno', 600, '{}', '{}'),
	(213, 'ballas', 3, 'boss', 'Líder', 600, '{}', '{}'),
	(214, 'lsvagos', 0, 'recruit', 'Recruta', 600, '{}', '{}'),
	(215, 'lsvagos', 1, 'member', 'Membro', 600, '{}', '{}'),
	(216, 'lsvagos', 2, 'intercircle', 'Circulo Interno', 600, '{}', '{}'),
	(217, 'lsvagos', 3, 'boss', 'Líder', 600, '{}', '{}'),
	(218, 'thefamilies', 0, 'recruit', 'Recruta', 600, '{}', '{}'),
	(219, 'thefamilies', 1, 'member', 'Membro', 600, '{}', '{}'),
	(220, 'thefamilies', 2, 'intercircle', 'Circulo Interno', 600, '{}', '{}'),
	(221, 'thefamilies', 3, 'boss', 'Líder', 600, '{}', '{}'),
	(222, 'thelostmc', 0, 'recruit', 'Recruta', 600, '{}', '{}'),
	(223, 'thelostmc', 1, 'member', 'Membro', 600, '{}', '{}'),
	(224, 'thelostmc', 2, 'intercircle', 'Circulo Interno', 600, '{}', '{}'),
	(225, 'thelostmc', 3, 'boss', 'Líder', 600, '{}', '{}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- Dumping structure for table s4_erpv1.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  `label` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table s4_erpv1.licenses: ~6 rows (approximately)
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` (`type`, `label`) VALUES
	('dmv', 'Código da Estrada'),
	('drive', 'Carta de Ligeiros'),
	('drive_bike', 'Carta de Ciclomotores'),
	('drive_truck', 'Carta de Pesados'),
	('weapon', 'Porte de  Armas'),
	('weed_processing', 'Autorização do uso de weed');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;

-- Dumping structure for table s4_erpv1.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `incident` longtext DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=895 DEFAULT CHARSET=latin1;

-- Dumping structure for table s4_erpv1.mdt_warrants
CREATE TABLE IF NOT EXISTS `mdt_warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `char_id` int(11) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `report_title` varchar(255) DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `expire` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=latin1;


-- Dumping structure for table s4_erpv1.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `vehicle` longtext NOT NULL,
  `owner` varchar(60) NOT NULL,
  `stored` int(11) NOT NULL DEFAULT 0 COMMENT 'State of the vehicle',
  `plate` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'car',
  `job` varchar(50) DEFAULT NULL,
  `modelname` varchar(255) DEFAULT NULL,
  `tunerdata` longtext DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `vehsowned` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping structure for table s4_erpv1.owned_vehicles_jobs
CREATE TABLE IF NOT EXISTS `owned_vehicles_jobs` (
  `vehicle` longtext CHARACTER SET latin1 NOT NULL,
  `owner` varchar(60) CHARACTER SET latin1 NOT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `garage_name` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT 'Garage_Centre',
  `pound` tinyint(1) NOT NULL DEFAULT 0,
  `plate` varchar(50) CHARACTER SET latin1 NOT NULL,
  `vehiclename` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT 'vehicle',
  `type` varchar(10) CHARACTER SET latin1 NOT NULL DEFAULT 'car',
  `job` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `vehsowned` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping structure for table s4_erpv1.phone_app_chat
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8;


-- Dumping structure for table s4_erpv1.phone_calls
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15934 DEFAULT CHARSET=utf8;

-- Dumping structure for table s4_erpv1.phone_ch_reddit
CREATE TABLE IF NOT EXISTS `phone_ch_reddit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `redgkit` varchar(20) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping structure for table s4_erpv1.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56938 DEFAULT CHARSET=utf8;

-- Dumping structure for table s4_erpv1.phone_reddit
CREATE TABLE IF NOT EXISTS `phone_reddit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `redgkit` varchar(20) DEFAULT NULL,
  `reditsage` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

-- Dumping structure for table s4_erpv1.phone_shops
CREATE TABLE IF NOT EXISTS `phone_shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(255) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dumping data for table s4_erpv1.phone_shops: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_shops` DISABLE KEYS */;
INSERT INTO `phone_shops` (`id`, `store`, `item`, `price`, `label`) VALUES
	(18, 'https://img.pngio.com/sim-card-png-clipart-sim-cards-png-1483_1162.png', 'sim', 50, 'SIM CARD');
/*!40000 ALTER TABLE `phone_shops` ENABLE KEYS */;

-- Dumping structure for table s4_erpv1.phone_users_contacts
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1729 DEFAULT CHARSET=utf8;


-- Dumping structure for table s4_erpv1.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  `plate` varchar(12) CHARACTER SET utf8mb4 NOT NULL,
  `player_name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table s4_erpv1.rented_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;

-- Dumping structure for table s4_erpv1.shops
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `item` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- Dumping data for table s4_erpv1.shops: ~48 rows (approximately)
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` (`id`, `store`, `item`, `price`) VALUES
	(1, 'TwentyFourSeven', 'bread', 1),
	(2, 'TwentyFourSeven', 'water', 1),
	(3, 'RobsLiquor', 'bread', 1),
	(4, 'RobsLiquor', 'water', 1),
	(5, 'LTDgasoline', 'bread', 1),
	(6, 'LTDgasoline', 'water', 1),
	(7, 'TwentyFourSeven', 'drill', 6500),
	(8, 'RobsLiquor', 'drill', 6500),
	(9, 'LTDgasoline', 'drill', 6500),
	(27, 'TwentyFourSeven', 'chocolate', 2),
	(28, 'RobsLiquor', 'chocolate', 2),
	(29, 'LTDgasoline', 'chocolate', 2),
	(30, 'TwentyFourSeven', 'sandwich', 4),
	(31, 'RobsLiquor', 'sandwich', 4),
	(32, 'LTDgasoline', 'sandwich', 4),
	(33, 'TwentyFourSeven', 'hamburger', 2),
	(34, 'RobsLiquor', 'hamburger', 2),
	(35, 'LTDgasoline', 'hamburger', 2),
	(36, 'TwentyFourSeven', 'cupcake', 1),
	(37, 'RobsLiquor', 'cupcake', 1),
	(38, 'LTDgasoline', 'cupcake', 1),
	(39, 'TwentyFourSeven', 'cocacola', 2),
	(40, 'RobsLiquor', 'cocacola', 2),
	(41, 'LTDgasoline', 'cocacola', 2),
	(42, 'TwentyFourSeven', 'coffe', 1),
	(43, 'RobsLiquor', 'coffe', 1),
	(44, 'LTDgasoline', 'coffe', 1),
	(46, 'TwentyFourSeven', 'cigarett', 6),
	(47, 'TwentyFourSeven', 'lighter', 3),
	(52, 'TwentyFourSeven', 'milk', 5),
	(53, 'RobsLiquor', 'milk', 5),
	(54, 'LTDgasoline', 'milk', 5),
	(55, 'RobsLiquor', 'beer', 8),
	(57, 'LTDgasoline', 'cigarett', 3),
	(58, 'LTDgasoline', 'lighter', 3),
	(60, 'RobsLiquor', 'lighter', 3),
	(61, 'RobsLiquor', 'cigarett', 6),
	(62, 'LTDgasoline', 'binoculars', 30),
	(63, 'RobsLiquor', 'binoculars', 30),
	(64, 'TwentyFourSeven', 'binoculars', 30),
	(65, 'SeedShop', 'milk', 2),
	(66, 'RobsLiquor', 'blindfold', 75),
	(67, 'TwentyFourSeven', 'handcuffs', 550),
	(68, 'RobsLiquor', 'handcuffs', 550),
	(69, 'LTDgasoline', 'handcuffs', 550),
	(70, 'RobsLiquor', 'dildo', 25),
	(71, 'RobsLiquor', 'dildo2', 25),
	(72, 'LTDgasoline', 'Comida de Animal', 100);
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;

-- Dumping structure for table s4_erpv1.sim
CREATE TABLE IF NOT EXISTS `sim` (
  `identifier` varchar(50) NOT NULL,
  `phone_number` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table s4_erpv1.sim: 0 rows
/*!40000 ALTER TABLE `sim` DISABLE KEYS */;
/*!40000 ALTER TABLE `sim` ENABLE KEYS */;

-- Dumping structure for table s4_erpv1.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  `society` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table s4_erpv1.society_moneywash: ~0 rows (approximately)
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;

-- Dumping structure for table s4_erpv1.trunk_inventory
CREATE TABLE IF NOT EXISTS `trunk_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) CHARACTER SET latin1 NOT NULL,
  `data` longtext CHARACTER SET latin1 NOT NULL DEFAULT '',
  `owned` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=1110 DEFAULT CHARSET=utf8;

-- Dumping structure for table s4_erpv1.twitter_accounts
CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=547 DEFAULT CHARSET=utf8;

-- Dumping structure for table s4_erpv1.twitter_likes
CREATE TABLE IF NOT EXISTS `twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`),
  CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;

-- Dumping structure for table s4_erpv1.twitter_tweets
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7778 DEFAULT CHARSET=utf8;


-- Dumping structure for table s4_erpv1.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `license` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `money` int(255) DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 DEFAULT '',
  `skin` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `job` varchar(50) CHARACTER SET utf8mb4 DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `inventory` longtext DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `bank` int(255) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `firstname` varchar(50) CHARACTER SET utf8mb4 DEFAULT '',
  `lastname` varchar(50) CHARACTER SET utf8mb4 DEFAULT '',
  `dateofbirth` varchar(25) CHARACTER SET utf8mb4 DEFAULT '',
  `sex` varchar(10) CHARACTER SET utf8mb4 DEFAULT '',
  `height` varchar(5) CHARACTER SET utf8mb4 DEFAULT '',
  `status` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `phone_number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `jail` int(11) NOT NULL DEFAULT 0,
  `house` longtext NOT NULL DEFAULT '{"owns":false,"furniture":[],"houseId":0}',
  `bought_furniture` longtext NOT NULL DEFAULT '{}',
  `last_house` int(11) DEFAULT 0,
  `tattoos` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping structure for table s4_erpv1.user_accounts
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `money` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4966 DEFAULT CHARSET=utf8;

-- Dumping structure for table s4_erpv1.user_convictions
CREATE TABLE IF NOT EXISTS `user_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `offense` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1511 DEFAULT CHARSET=latin1;

-- Dumping structure for table s4_erpv1.user_lastcharacter
CREATE TABLE IF NOT EXISTS `user_lastcharacter` (
  `steamid` varchar(255) CHARACTER SET latin1 NOT NULL,
  `charid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping structure for table s4_erpv1.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  `owner` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1847 DEFAULT CHARSET=utf8;



-- Dumping structure for table s4_erpv1.user_mdt
CREATE TABLE IF NOT EXISTS `user_mdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `mugshot_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;


-- Dumping structure for table s4_erpv1.user_whitelist
CREATE TABLE IF NOT EXISTS `user_whitelist` (
  `identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping structure for table s4_erpv1.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table s4_erpv1.vehicles: ~251 rows (approximately)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Adder', 'adder', 4000000, 'super'),
	('Akuma', 'AKUMA', 30000, 'motorcycles'),
	('Alpha', 'alpha', 240000, 'sports'),
	('Ardent', 'ardent', 2500000, 'sportsclassics'),
	('Asea', 'asea', 25000, 'sedans'),
	('Autarch', 'autarch', 5000000, 'super'),
	('Avarus', 'avarus', 72000, 'motorcycles'),
	('Bagger', 'bagger', 52000, 'motorcycles'),
	('Baller', 'baller2', 160000, 'suvs'),
	('Baller Sport', 'baller3', 240000, 'suvs'),
	('Banshee', 'banshee', 280000, 'sports'),
	('Banshee 900R', 'banshee2', 1200000, 'super'),
	('Bati 801', 'bati', 48000, 'motorcycles'),
	('Bati 801RR', 'bati2', 76000, 'motorcycles'),
	('Bestia GTS', 'bestiagts', 220000, 'sports'),
	('BF400', 'bf400', 24000, 'motorcycles'),
	('Bf Injection', 'bfinjection', 64000, 'offroad'),
	('Bifta', 'bifta', 48000, 'offroad'),
	('Bison', 'bison', 180000, 'vans'),
	('Blade', 'blade', 60000, 'muscle'),
	('Blazer', 'blazer', 24000, 'offroad'),
	('Blazer Sport', 'blazer4', 60000, 'offroad'),
	('Blista', 'blista', 32000, 'compacts'),
	('Bobcat XL', 'bobcatxl', 128000, 'vans'),
	('Brawler', 'brawler', 180000, 'offroad'),
	('Brioso R/A', 'brioso', 72000, 'compacts'),
	('Btype', 'btype', 248000, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 620000, 'sportsclassics'),
	('Btype Luxe', 'btype3', 340000, 'sportsclassics'),
	('Buccaneer', 'buccaneer', 72000, 'muscle'),
	('Buccaneer Rider', 'buccaneer2', 96000, 'muscle'),
	('Buffalo', 'buffalo', 48000, 'sports'),
	('Buffalo S', 'buffalo2', 80000, 'sports'),
	('Bullet', 'bullet', 360000, 'super'),
	('Burrito', 'burrito3', 76000, 'vans'),
	('Camper', 'camper', 168000, 'vans'),
	('Caracara 4x4', 'caracara2', 232000, 'offroad'),
	('Carbonizzare', 'carbonizzare', 300000, 'sports'),
	('Carbon RS', 'carbonrs', 72000, 'motorcycles'),
	('Casco', 'casco', 120000, 'sportsclassics'),
	('Cavalcade', 'cavalcade2', 225000, 'suvs'),
	('Cheetah', 'cheetah', 1500000, 'super'),
	('Chimera', 'chimera', 150000, 'motorcycles'),
	('Chino', 'chino', 150000, 'muscle'),
	('Chino Luxe', 'chino2', 80000, 'muscle'),
	('Cliffhanger', 'cliffhanger', 38000, 'motorcycles'),
	('Cognoscenti Cabrio', 'cogcabrio', 220000, 'coupes'),
	('Cognoscenti', 'cognoscenti', 220000, 'sedans'),
	('Comet', 'comet2', 260000, 'sports'),
	('Pfister Comet Retrô Personalizado', 'comet3', 132000, 'sports'),
	('Comet Safari', 'comet4', 520000, 'offroad'),
	('Comet SR', 'comet5', 1760000, 'sports'),
	('Contender', 'contender', 280000, 'suvs'),
	('Coquette', 'coquette', 260000, 'sports'),
	('Coquette Classic', 'coquette2', 160000, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 220000, 'muscle'),
	('Cyclone', 'cyclone', 7500000, 'super'),
	('Daemon', 'daemon', 45000, 'motorcycles'),
	('Daemon High', 'daemon2', 52000, 'motorcycles'),
	('Defiler', 'defiler', 36000, 'motorcycles'),
	('Dominator', 'dominator', 140000, 'muscle'),
	('Double T', 'double', 112000, 'motorcycles'),
	('8F Drafter', 'drafter', 220000, 'sports'),
	('Dubsta', 'dubsta', 180000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 240000, 'suvs'),
	('Bubsta 6x6', 'dubsta3', 480000, 'offroad'),
	('Dukes', 'dukes', 112000, 'muscle'),
	('Dune Buggy', 'dune', 32000, 'offroad'),
	('Dynasty', 'dynasty', 180000, 'sportsclassics'),
	('Elegy RH8', 'elegy', 272000, 'sports'),
	('Elegy', 'elegy2', 122000, 'sports'),
	('Emerus', 'emerus', 7820000, 'super'),
	('Emperor', 'emperor', 32000, 'sedans'),
	('Enduro', 'enduro', 20000, 'motorcycles'),
	('Entity XF', 'entityxf', 1700000, 'super'),
	('Esskey', 'esskey', 165000, 'motorcycles'),
	('Exemplar', 'exemplar', 128000, 'coupes'),
	('F620', 'f620', 160000, 'coupes'),
	('Faction', 'faction', 80000, 'muscle'),
	('Faction Rider', 'faction2', 120000, 'muscle'),
	('Faction XL', 'faction3', 160000, 'muscle'),
	('Faggio', 'faggio', 6000, 'motorcycles'),
	('Vespa', 'faggio2', 9000, 'motorcycles'),
	('Felon', 'felon', 168000, 'coupes'),
	('Felon GT', 'felon2', 220000, 'coupes'),
	('Feltzer', 'feltzer2', 220000, 'sports'),
	('Stirling GT', 'feltzer3', 260000, 'sportsclassics'),
	('Flash GT', 'flashgt', 440000, 'sports'),
	('FMJ', 'fmj', 750000, 'super'),
	('Fhantom', 'fq2', 68000, 'suvs'),
	('Fugitive', 'fugitive', 48000, 'sedans'),
	('Furore GT', 'furoregt', 180000, 'sports'),
	('Fusilade', 'fusilade', 160000, 'sports'),
	('Gargoyle', 'gargoyle', 64000, 'motorcycles'),
	('Gauntlet', 'gauntlet', 120000, 'muscle'),
	('Gauntlet Classic', 'gauntlet3', 88000, 'muscle'),
	('Gauntlet Hellfire', 'gauntlet4', 128000, 'muscle'),
	('Burrito', 'gburrito2', 116000, 'vans'),
	('Glendale', 'glendale', 25000, 'sedans'),
	('Grabger', 'granger', 200000, 'suvs'),
	('Gresley', 'gresley', 180000, 'suvs'),
	('GT 500', 'gt500', 3140000, 'sportsclassics'),
	('Guardian', 'guardian', 180000, 'offroad'),
	('Hakuchou', 'hakuchou', 124000, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 220000, 'motorcycles'),
	('Hermes', 'hermes', 2140000, 'muscle'),
	('Hexer', 'hexer', 48000, 'motorcycles'),
	('Hotknife', 'hotknife', 500000, 'muscle'),
	('Huntley S', 'huntley', 160000, 'suvs'),
	('Hustler', 'hustler', 2500000, 'muscle'),
	('Infernus', 'infernus', 720000, 'super'),
	('Innovation', 'innovation', 92000, 'motorcycles'),
	('Intruder', 'intruder', 29000, 'sedans'),
	('Issi', 'issi2', 40000, 'compacts'),
	('Issi Classic', 'issi3', 32000, 'compacts'),
	('Issi Classic Velho', 'issi4', 28000, 'compacts'),
	('Issi Classic Gold', 'issi5', 36000, 'compacts'),
	('Jackal', 'jackal', 152000, 'coupes'),
	('Jester', 'jester', 260000, 'sports'),
	('Jester(Racecar)', 'jester2', 540000, 'sports'),
	('Journey', 'journey', 25000, 'vans'),
	('Jugular', 'jugular', 620000, 'sports'),
	('Kamacho', 'kamacho', 580000, 'offroad'),
	('Khamelion', 'khamelion', 152000, 'sports'),
	('Krieger', 'krieger', 9500000, 'super'),
	('Kuruma', 'kuruma', 120000, 'sports'),
	('Landstalker', 'landstalker', 140000, 'suvs'),
	('Locust', 'locust', 475000, 'sports'),
	('Lynx', 'lynx', 160000, 'sports'),
	('Mamba', 'mamba', 280000, 'sports'),
	('Manana', 'manana', 50000, 'sportsclassics'),
	('Manchez', 'manchez', 25000, 'motorcycles'),
	('Massacro', 'massacro', 260000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 550000, 'sports'),
	('Mesa', 'mesa', 64000, 'suvs'),
	('Mesa Trail', 'mesa3', 200000, 'suvs'),
	('Minivan', 'minivan', 520000, 'vans'),
	('Monroe', 'monroe', 220000, 'sportsclassics'),
	('Moonbeam', 'moonbeam', 75000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 140000, 'vans'),
	('Nemesis', 'nemesis', 22000, 'motorcycles'),
	('Neon', 'neon', 6000000, 'sports'),
	('Nero', 'nero', 6000000, 'super'),
	('Nightblade', 'nightblade', 140000, 'motorcycles'),
	('Nightshade', 'nightshade', 260000, 'muscle'),
	('9F', 'ninef', 260000, 'sports'),
	('9F Cabrio', 'ninef2', 320000, 'sports'),
	('Novak', 'novak', 440000, 'suvs'),
	('Omnis', 'omnis', 140000, 'sports'),
	('Oracle XS', 'oracle2', 140000, 'coupes'),
	('Osiris', 'osiris', 640000, 'super'),
	('Panto', 'panto', 40000, 'compacts'),
	('Paradise', 'paradise', 76000, 'vans'),
	('Paragon R', 'paragon', 260000, 'sports'),
	('Pariah', 'pariah', 5675000, 'sports'),
	('Patriot', 'patriot', 250000, 'suvs'),
	('PCJ-600', 'pcj', 24800, 'motorcycles'),
	('Penumbra', 'penumbra', 112000, 'sports'),
	('Peyote Gasser', 'peyote2', 140000, 'muscle'),
	('Pfister', 'pfister811', 340000, 'super'),
	('Phoenix', 'phoenix', 50000, 'muscle'),
	('Picador', 'picador', 72000, 'muscle'),
	('Pigalle', 'pigalle', 80000, 'sportsclassics'),
	('Prairie', 'prairie', 48000, 'compacts'),
	('Premier', 'premier', 32000, 'sedans'),
	('Primo Custom', 'primo2', 56000, 'sedans'),
	('X80 Proto', 'prototipo', 10000000, 'super'),
	('Radius', 'radi', 116000, 'suvs'),
	('raiden', 'raiden', 6200000, 'sports'),
	('Rapid GT', 'rapidgt', 140000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 180000, 'sports'),
	('Rapid GT3', 'rapidgt3', 2540000, 'sportsclassics'),
	('Reaper', 'reaper', 600000, 'super'),
	('Rebel', 'rebel2', 140000, 'offroad'),
	('Regina', 'regina', 20000, 'sedans'),
	('Retinue', 'retinue', 2500000, 'sportsclassics'),
	('Revolter', 'revolter', 6500000, 'sports'),
	('riata', 'riata', 155000, 'offroad'),
	('Rocoto', 'rocoto', 180000, 'suvs'),
	('Rampant Rocket', 'rrocket', 260000, 'motorcycles'),
	('Ruffian', 'ruffian', 27500, 'motorcycles'),
	('Ruiner', 'ruiner', 10000, 'muscle'),
	('Rumpo', 'rumpo', 60000, 'vans'),
	('Rumpo Trail', 'rumpo3', 78000, 'vans'),
	('Sabre Turbo', 'sabregt', 80000, 'muscle'),
	('Sabre GT', 'sabregt2', 100000, 'muscle'),
	('Sanchez', 'sanchez', 21000, 'motorcycles'),
	('Sanchez Sport', 'sanchez2', 21000, 'motorcycles'),
	('Sanctus', 'sanctus', 100000, 'motorcycles'),
	('Sandking', 'sandking', 255000, 'offroad'),
	('Savestra', 'savestra', 4500000, 'sportsclassics'),
	('SC 1', 'sc1', 5000000, 'super'),
	('Schafter', 'schafter2', 100000, 'sedans'),
	('Schafter V12', 'schafter3', 200000, 'sports'),
	('Schlagen GT', 'schlagen', 320000, 'sports'),
	('Seminole', 'seminole', 100000, 'suvs'),
	('Sentinel', 'sentinel', 128000, 'coupes'),
	('Sentinel XS', 'sentinel2', 160000, 'coupes'),
	('Sentinel3', 'sentinel3', 2200000, 'sports'),
	('Seven 70', 'seven70', 158000, 'sports'),
	('ETR1', 'sheava', 880000, 'super'),
	('Shotaro Concept', 'shotaro', 1280000, 'motorcycles'),
	('Slam Van', 'slamvan3', 46000, 'muscle'),
	('Sovereign', 'sovereign', 88000, 'motorcycles'),
	('Stinger', 'stinger', 320000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 300000, 'sportsclassics'),
	('Streiter', 'streiter', 2000000, 'sports'),
	('Stretch', 'stretch', 360000, 'sedans'),
	('Sultan', 'sultan', 60000, 'sports'),
	('Sultan RS', 'sultanrs', 260000, 'super'),
	('Super Diamond', 'superd', 520000, 'sedans'),
	('Surano', 'surano', 200000, 'sports'),
	('Surfer', 'surfer', 48000, 'vans'),
	('T20', 't20', 1200000, 'super'),
	('Tailgater', 'tailgater', 120000, 'sedans'),
	('Tampa', 'tampa', 64000, 'muscle'),
	('Drift Tampa', 'tampa2', 320000, 'sports'),
	('Thrax', 'thrax', 12000000, 'super'),
	('Thrust', 'thrust', 96000, 'motorcycles'),
	('Trophy Truck', 'trophytruck', 240000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 320000, 'offroad'),
	('Tropos', 'tropos', 16000, 'sports'),
	('Turismo R', 'turismor', 1400000, 'super'),
	('Tyrus', 'tyrus', 2400000, 'super'),
	('Vacca', 'vacca', 480000, 'super'),
	('Vader', 'vader', 28800, 'motorcycles'),
	('Verlierer', 'verlierer2', 250000, 'sports'),
	('Vigero', 'vigero', 50000, 'muscle'),
	('Virgo', 'virgo', 96000, 'muscle'),
	('Viseris', 'viseris', 3500000, 'sportsclassics'),
	('Visione', 'visione', 9000000, 'super'),
	('Voltic', 'voltic', 360000, 'super'),
	('Voodoo', 'voodoo', 28800, 'muscle'),
	('Vortex', 'vortex', 39200, 'motorcycles'),
	('Warrener', 'warrener', 16000, 'sedans'),
	('Washington', 'washington', 36000, 'sedans'),
	('Windsor', 'windsor', 380000, 'coupes'),
	('Windsor Drop', 'windsor2', 200000, 'coupes'),
	('Woflsbane', 'wolfsbane', 36000, 'motorcycles'),
	('XLS', 'xls', 125000, 'suvs'),
	('Yosemite', 'yosemite', 650000, 'muscle'),
	('Youga', 'youga', 55000, 'vans'),
	('Youga Luxuary', 'youga2', 60000, 'vans'),
	('Z190', 'z190', 3800000, 'sportsclassics'),
	('Zentorno', 'zentorno', 5500000, 'super'),
	('Zion', 'zion', 108000, 'coupes'),
	('Zion Cabrio', 'zion2', 180000, 'coupes'),
	('Zion Classic', 'zion3', 200000, 'sportsclassics'),
	('Zombie', 'zombiea', 38000, 'motorcycles'),
	('Zombie Luxuary', 'zombieb', 48000, 'motorcycles'),
	('Z-Type', 'ztype', 666666, 'sportsclassics');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Dumping structure for table s4_erpv1.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table s4_erpv1.vehicle_categories: ~11 rows (approximately)
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compactos'),
	('coupes', 'Coupés'),
	('motorcycles', 'Motas'),
	('muscle', 'Lowriders'),
	('offroad', 'Off Road'),
	('sedans', 'Sedans'),
	('sports', 'Desportivos'),
	('sportsclassics', 'Desportivos Clássicos'),
	('super', 'Super'),
	('suvs', 'SUVs'),
	('vans', 'Carrinhas');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;

-- Dumping structure for table s4_erpv1.vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `model` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `plate` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `soldby` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `date` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table s4_erpv1.vehicle_sold: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicle_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_sold` ENABLE KEYS */;

-- Dumping structure for table s4_erpv1.yellow_tweets
CREATE TABLE IF NOT EXISTS `yellow_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` int(11) DEFAULT NULL,
  `firstname` varchar(256) DEFAULT NULL,
  `lastname` varchar(256) DEFAULT NULL,
  `message` varchar(256) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4;


/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
