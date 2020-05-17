INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_lawyer', 'Advogado', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_lawyer', 'Advogado', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_lawyer', 'Advogado', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('lawyer','Advogado')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('lawyer',0,'recruit','Estagiário',950,'{}','{}'),
	('lawyer',1,'employe','Empregado',1500,'{}','{}'),
	('lawyer',2,'boss','Chefe',2500,'{}','{}')
;