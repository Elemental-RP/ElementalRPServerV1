INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_tequilala', 'Tequilala', 1),
	('society_tequilala_fridge', 'Tequilala Frigorifico', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_tequilala', 'Tequilala', 1),
	('society_tequilala_fridge', 'Tequilala Frigorifico', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_tequilala', 'Tequilala', 1),
	('society_tequilala_fridge', 'Tequilala Frigorifico', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('tequilala','Tequilala')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('tequilala',0,'recruit','Estagiário',750,'{}','{}'),
	('tequilala',1,'barman','Bar Man',1000,'{}','{}'),
	('tequilala',2,'security','Segurança',2000,'{}','{}'),
	('tequilala',3,'boss','CEO',2500,'{}','{}')
;
