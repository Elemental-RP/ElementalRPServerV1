USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_mechanic', 'Mécano', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_mechanic', 'Mécano', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('mechanic', 'Mécano')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('mechanic',0,'recrue','Recrue',12,'{}','{}'),
	('mechanic',1,'novice','Novice',24,'{}','{}'),
	('mechanic',2,'experimente','Experimente',36,'{}','{}'),
	('mechanic',3,'chief',"Chef d\'équipe",48,'{}','{}'),
	('mechanic',4,'boss','Patron',0,'{}','{}')
;

INSERT INTO `items` (name, label, `weight`) VALUES
	('gazbottle', 'bouteille de gaz', 1),
	('fixtool', 'outils réparation', 1),
	('carotool', 'outils carosserie', 1),
	('blowpipe', 'Chalumeaux', 1),
	('fixkit', 'Kit réparation', 1),
	('carokit', 'Kit carosserie', 1)
;
