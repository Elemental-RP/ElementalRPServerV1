INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_aztecas', 'Aztecas', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_aztecas', 'Aztecas', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_aztecas', 'Aztecas', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('aztecas','Aztecas')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('aztecas',0,'recruit','Recruta',600,'{}','{}'),
	('aztecas',1,'member','Membro',600,'{}','{}'),
	('aztecas',2,'intercircle','Circulo Interno',600,'{}','{}'),
	('aztecas',3,'boss','Líder',600,'{}','{}')
;