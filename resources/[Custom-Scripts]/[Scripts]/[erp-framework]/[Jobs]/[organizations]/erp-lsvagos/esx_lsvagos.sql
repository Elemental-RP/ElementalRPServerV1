INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_thefamilies', 'Los Santos Vagos', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_lsvagos', 'Los Santos Vagos', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_lsvagos', 'Los Santos Vagos', 1)
;

INSERT INTO `jobs` (name, label,whitelisted) VALUES
	('lsvagos','Los Santos Vagos',0)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('lsvagos',0,'recruit','Recruta',600,'{}','{}'),
	('lsvagos',1,'member','Membro',600,'{}','{}'),
	('lsvagos',2,'intercircle','Circulo Interno',600,'{}','{}'),
	('lsvagos',3,'boss','Líder',600,'{}','{}')
;