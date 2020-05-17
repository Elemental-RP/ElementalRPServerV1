INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_ammu', 'Ammunation', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_ammu', 'Ammunation', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_ammu', 'Ammunation', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('ammu','Ammunation')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('ammu',0,'soldato','Recruta',20,'{}','{}'),
	('ammu',1,'capo','Empregado',40,'{}','{}'),
	('ammu',2,'consigliere','Conselheiro',60,'{}','{}'),
	('ammu',3,'righthand','Mão Direita',85,'{}','{}'),
	('ammu',4,'boss','Chefe',100,'{}','{}')
;
