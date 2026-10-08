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

CREATE TABLE metrics.info (
    metrics_id INT IDENTITY(1, 1) PRIMARY KEY ,
    metrics_name VARCHAR(255) NOT NULL,
    category VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR (255),
    metrics_val INT NOT NULL CHECK (metrics_val > 10),
    dt DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE events.info (
    events_id INT IDENTITY(1, 1) PRIMARY KEY,
    message VARCHAR(255) DEFAULT 'General Event',
    events_datetime TIMESTAMP NOT NULL
);
SELECT * from events.info

ALTER TABLE events.info
DROP COLUMN events_datetime;
ALTER TABLE events.info
ADD events_datetime DATETIME2 NOT NULL;

-- 10 registos na tabela metrics.info

INSERT INTO metrics.info
    (metrics_name, category, description, metrics_val)
VALUES
    ('Total Sales', 'Sales', 'Total value of sales', 150),
    ('Total Orders', 'Orders', 'Number of orders placed', 125),
    ('Average Order', 'AverageOrder', 'Average value per order', 75),
    ('Active Customers', 'Customers', 'Number of active customers', 350),
    ('New Customers', 'NewCustomers', 'Number of new customers', 85),
    ('Products Sold', 'Products', 'Total number of products sold', 425),
    ('Stock Level', 'Inventory', 'Current stock level', 900),
    ('Low Stock', 'LowStock', 'Products with low stock', 25),
    ('Website Visits', 'Website', 'Number of website visits', 1200),
    ('Conversion Rate', 'ConversionRate', 'Website conversion rate', 18)
;


-- 10 registos na tabela events.info

INSERT INTO events.info
    (message, events_datetime)
VALUES
    ('General Event', '2026-10-01 09:00:00'),
    ('New order received', '2026-10-01 10:15:00'),
    ('Customer registered', '2026-10-02 11:30:00'),
    ('Product added', '2026-10-02 14:20:00'),
    ('Order cancelled', '2026-10-03 09:45:00'),
    ('Payment completed', '2026-10-03 16:10:00'),
    ('Stock updated', '2026-10-04 12:00:00'),
    ('Customer updated profile', '2026-10-05 15:30:00'),
    ('New promotion created', '2026-10-06 10:00:00'),
    ('Order shipped', '2026-10-07 17:45:00')
;

SELECT * FROM metrics.info;

SELECT * FROM events.info;