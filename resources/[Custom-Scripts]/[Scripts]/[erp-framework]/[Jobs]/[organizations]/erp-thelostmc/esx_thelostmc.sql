INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_thelostmc', 'The Lost MC', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_thelostmc', 'The Lost MC', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_thelostmc', 'The Lost MC', 1)
;

INSERT INTO `jobs` (name, label,whitelisted) VALUES
	('thelostmc','The Lost MC',0)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('thelostmc',0,'recruit','Recruta',600,'{}','{}'),
	('thelostmc',1,'member','Membro',600,'{}','{}'),
	('thelostmc',2,'intercircle','Circulo Interno',600,'{}','{}'),
	('thelostmc',3,'boss','Líder',600,'{}','{}')
;