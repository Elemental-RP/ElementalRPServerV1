INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('poolcleaner', 'Limpador de piscina', 0);

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('poolcleaner', 0, 'interim', 'Limpador', 400, '{}', '{}');

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('poolreceipt', 'Recibo', 15, 0, 1);
