CREATE SCHEMA `intuit`;

USE intuit;

DROP TABLE IF EXISTS employees;

CREATE TABLE `intuit`.`employees` (
  `id_employee` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `department` VARCHAR(255) NOT NULL,
  `salary` DECIMAL(8,2) NOT NULL,
  `id_boss` INT NOT NULL,
  PRIMARY KEY (`id_employee`),
  UNIQUE INDEX `id_employee_UNIQUE` (`id_employee` ASC));

DESCRIBE employees;

INSERT INTO employees
(id_employee, first_name, last_name, department, salary, id_boss)
VALUES
(1,  'Lee', 'Iacocca', 'CEO',              1.00, 1),

(2,  'Abert', 'More', 'Eng',           87000.00, 4),
(3,  'Benjamin', 'More', 'Eng',        86000.00, 4),
(4,  'Carl', 'Boss', 'Eng',            85000.00, 1),
(5,  'David', 'Less', 'Eng',           84000.00, 4),
(6,  'Earl', 'Less', 'Eng',            83000.00, 4),

(7,  'Frank', 'More', 'Acct',          77000.00, 9),
(8,  'Gene', 'More', 'Acct',           76000.00, 9),
(9,  'Howard', 'Boss', 'Acct',         75000.00, 1),
(10, 'Ian', 'Less', 'Acct',            74000.00, 9),
(11, 'James', 'Less', 'Acct',          73000.00, 9)
;

SELECT * FROM employees;

-- For each emmplyee, display their name, their salary,
-- their boss's name and their boss's salary.
SELECT 
  CONCAT(e1.first_name, ' ', e1.last_name) 'Employee Name', 
  e1.salary 'Employee Salary',
  CONCAT(e2.first_name, ' ', e2.last_name) 'Boss Name', 
  e2.salary 'Boss Salary'
FROM employees e1
JOIN employees e2
on e1.id_boss = e2.id_employee;

-- Select all employess that make more than 
-- thier bosses' and display highest paid to lowest paid.
SELECT 
  CONCAT(e1.first_name, ' ', e1.last_name) 'Employee Name', 
  e1.salary 'Employee Salary',
  CONCAT(e2.first_name, ' ', e2.last_name) 'Boss Name', 
  e2.salary 'Boss Salary'
FROM employees e1
JOIN employees e2
on e1.id_boss = e2.id_employee AND e1.salary > e2.salary
order by e1.salary DESC;

-- or

SELECT 
  CONCAT(e1.first_name, ' ', e1.last_name) 'Employee Name', 
  e1.salary 'Employee Salary',
  CONCAT(e2.first_name, ' ', e2.last_name) 'Boss Name', 
  e2.salary 'Boss Salary'
FROM employees e1, employees e2
where e1.id_boss = e2.id_employee AND e1.salary > e2.salary
order by e1.salary DESC;

