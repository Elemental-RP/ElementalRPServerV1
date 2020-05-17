INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_unicorn', 'Vanilla Unicorn', 1),
	('society_unicorn_fridge', 'Vanilla Unicorn Frigorifico', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_unicorn', 'Vanilla Unicorn', 1),
	('society_unicorn_fridge', 'Vanilla Unicorn Frigorifico', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_unicorn', 'Vanilla Unicorn', 1),
	('society_unicorn_fridge', 'Vanilla Unicorn Frigorifico', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('unicorn','Vanilla Unicorn')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('unicorn',0,'recruit','Estagiário',750,'{}','{}'),
	('unicorn',1,'barman','Bar Man',1000,'{}','{}'),
	('unicorn',2,'security','Segurança',2000,'{}','{}'),
	('unicorn',3,'boss','CEO',2500,'{}','{}')
;
