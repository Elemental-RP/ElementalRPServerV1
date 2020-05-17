INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_thefamilies', 'The Families', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_thefamilies', 'The Families', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_thefamilies', 'The Families', 1)
;

INSERT INTO `jobs` (name, label,whitelisted) VALUES
	('thefamilies','The Families',0)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('thefamilies',0,'recruit','Recruta',600,'{}','{}'),
	('thefamilies',1,'member','Membro',600,'{}','{}'),
	('thefamilies',2,'intercircle','Circulo Interno',600,'{}','{}'),
	('thefamilies',3,'boss','Líder',600,'{}','{}')
;