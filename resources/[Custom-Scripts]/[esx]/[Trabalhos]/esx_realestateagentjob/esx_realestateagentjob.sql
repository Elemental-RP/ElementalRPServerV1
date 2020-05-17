INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_realestateagent','Agente Imobiliário',1)
;

INSERT INTO `jobs` (name, label) VALUES
	('realestateagent','Agente Imobiliário')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('realestateagent',0,'location','Estagiante',1600,'{}','{}'),
	('realestateagent',1,'vendeur','Vendedor',2300,'{}','{}'),
	('realestateagent',2,'gestion','Gestor',2700,'{}','{}'),
	('realestateagent',3,'boss','Patrão',3500,'{}','{}')
;
