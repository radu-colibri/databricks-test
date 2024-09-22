-- Databricks notebook source
CREATE TABLE companies (
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
