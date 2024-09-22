-- Databricks notebook source
CREATE TABLE IF NOT EXISTS companies (
    id INT NOT NULL,
    name STRING NOT NULL
);

-- COMMAND ----------

INSERT INTO companies
VALUES (1, 'Blippar'),
(2, 'Mark Roberts Motion Control'),
(3, 'NewDay'),
(4, 'Gain Credit'),
(5, 'Motorway'),
(6, 'REALM.art'),
(7, 'Colibri Digital');

-- COMMAND ----------

SELECT * FROM companies
ORDER BY id;

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS jobs (
    id INT NOT NULL,
    title STRING NOT NULL,
    company_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE
);

-- COMMAND ----------

INSERT INTO jobs
VALUES
--(1, 'Mobile Augmented Reality Developer', 1, date('2012-05-01'), date('2018-04-01'));
--(2, 'Lead Engineer / Developer Relations', 1, date('2014-05-01'), date('2018-04-01'))
(3, 'UX/UI Designer', 2, date('2018-04-01'), date('2018-10-01')),
(4, 'UX UI Frontend Engineer', 3, date('2018-10-01'), date('2019-10-01'))


-- COMMAND ----------

SELECT * FROM jobs
ORDER BY id;

-- COMMAND ----------

--Get all comapnies that have jobs associated
SELECT jobs.title AS `Job title`, companies.name AS `Company`
FROM jobs
INNER JOIN companies ON jobs.company_id = companies.id
ORDER BY jobs.id
