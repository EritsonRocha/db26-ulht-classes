SELECT * FROM sys.databases
CREATE DATABASE BikeStoresPlus
USE BikeStoresPlus


SELECT * FROM INFORMATION_SCHEMA.TABLES

CREATE SCHEMA "marketing"
CREATE SCHEMA "analytics"
SELECT * FROM sys.schemas WHERE name NOT LIKE 'db%'

USE BikeStoresPlus
CREATE TABLE marketing.products ( --Criar tabela mesmo aqui
    product_id INT,
    product_name VARCHAR (255)
)

SELECT * FROM marketing.products
INSERT INTO marketing.products (product_id, product_name) VALUES (1, 'cyberBike')
INSERT INTO marketing.products (product_id, product_name) VALUES (2, 'harleyDavison')
SELECT * FROM marketing.products

USE BikeStoresPlus
CREATE TABLE analytics.products_new ( --Tabela nova dentro do analytics
    product_id INT PRIMARY KEY,
    product_name VARCHAR (255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    model_year SMALLINT NOT NULL,
    list_price DECIMAL (10, 2) NOT NULL,
);
SELECT * FROM analytics.products_new

INSERT INTO analytics.products_new (product_id, product_name, brand_id, category_id, model_year, list_price)
VALUES (1, 'cyberBike', 1, 1, 2019, 1999)
SELECT * FROM analytics.products_new

CREATE TABLE analytics.products_new2 ( --Outra tabela dentro do analytics
    product_id INT IDENTITY(1, 1) PRIMARY KEY,
    product_name VARCHAR (255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    model_year SMALLINT NOT NULL,
    list_price DECIMAL (10, 2) NOT NULL,
);

INSERT INTO analytics.products_new2 (product_id, product_name, brand_id, category_id, model_year, list_price)
VALUES (1, 'cyberBike', 1, 1, 2019, 1999)

--Exercício para fazer agora
CREATE DATABASE BikeStoresAnalytics
USE BikeStoresAnalytics

SELECT * FROM sys.databases

CREATE SCHEMA "metrics"
CREATE SCHEMA "events"
SELECT * FROM sys.schemas WHERE name NOT LIKE 'db%'
