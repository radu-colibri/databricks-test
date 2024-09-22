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
--(3, 'UX/UI Designer', 2, date('2018-04-01'), date('2018-10-01')),
--(4, 'UX UI Frontend Engineer', 3, date('2018-10-01'), date('2019-10-01')),
(5, 'Senior Frontend Engineer', 4, date('2019-10-01'), date('2021-02-01')),
(6, 'Senior Frontend Engineer', 5, date('2021-02-01'), date('2021-04-01')),
(7, 'Senior Frontend Engineer', 6, date('2021-04-01'), date('2021-08-01')),
(8, 'Senior Frontend Engineer', 7, date('2021-08-01'), null),
(9, 'Senior Marketing Designer', 7, date('2023-08-01'), null);


-- COMMAND ----------

SELECT * FROM jobs
ORDER BY id;

-- COMMAND ----------

-- List of all jobs and respective companies, with Present as the end date for current jobs 
SELECT
jobs.title AS `Job title`,
companies.name AS `Company`,
jobs.start_date AS `Start date`,
coalesce(jobs.end_date, 'Present') AS `End date`,
DATEDIFF(month, jobs.start_date, coalesce(jobs.end_date, GETDATE())) as `Length (months)`
FROM jobs
LEFT JOIN companies ON jobs.company_id = companies.id
ORDER BY DATEDIFF(month, jobs.start_date, coalesce(jobs.end_date, GETDATE())) DESC
