--Exercício desta semana

USE BikeStores
SELECT * INTO sales.customers_shorts FROM sales.customers WHERE first_name LIKE '[A-DX-Z]%';
SELECT * FROM sales.customers_shorts

--Primeira view
CREATE VIEW sales.customers_rich_states AS SELECT first_name, last_name, email
FROM sales.customers WHERE state = 'TX' OR state = 'CA'
SELECT * FROM sales.customers_rich_states;

--Segunda view
CREATE VIEW sales.customers_special AS
SELECT *
FROM sales.customers
WHERE last_name LIKE '[ABT]%'
  AND (city LIKE '%o' OR city LIKE '%on');
SELECT * FROM sales.customers_special

--Terceira view
CREATE VIEW sales.last_trimester AS 
SELECT *
FROM sales.orders
WHERE MONTH(order_date) IN (10, 11, 12);
SELECT * FROM sales.last_trimester

--Quarta view
CREATE VIEW sales.second_semester AS 
SELECT *
FROM sales.orders
WHERE MONTH(order_date) IN (07, 08, 09, 10, 11, 12)
    AND YEAR(order_date) IN (2016, 2018)
  AND YEAR(shipped_date) <> YEAR(order_date);
SELECT * FROM sales.second_semester

--Quinta view
CREATE VIEW sales.long_email AS
SELECT *
FROM sales.customers
WHERE LEN(email) > 20;
SELECT * FROM sales.long_email
