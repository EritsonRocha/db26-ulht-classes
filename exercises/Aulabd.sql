
--Exercício 7.2.1
SELECT * FROM sales.stores

--Todos os nomes
SELECT brand_name FROM production.brands

--ID e nomes das cidades de Houston
SELECT customer_id, first_name, last_name, city FROM sales.customers WHERE city= 'Houston'
----ID e nomes do estado de Texas ou CA
SELECT * FROM sales.customers WHERE state= 'TX' OR state='CA'

--Dados dos itens com preço maior que 1500
SELECT * FROM production.products WHERE list_price > 1500

--Nome de produtos posteriores a 2017 e com preço abaixo de 1000
SELECT product_name FROM production.products WHERE model_year > 2017 AND list_price < 1000
--Produtos de 2017 ou 2018 com preços entre 1250 e 750
SELECT DISTINCT product_name FROM production.products WHERE (model_year = 2017 OR model_year = 2018) AND list_price < 1250 AND list_price > 750

SELECT * FROM production.products WHERE list_price > 10000 --Valor do produto mais caro é 11999.99
SELECT AVG(list_price) FROM production.products --Média dos preços dos produtos: 1520.591401
SELECT DISTINCT product_name FROM production.products
SELECT COUNT(DISTINCT product_name) FROM production.products

--Exercício 7.2.2
SET IDENTITY_INSERT sales.stores ON; 
INSERT INTO sales.stores(store_id, store_name, phone, email, street, city, state, zip_code) 
VALUES (4, 'Technomancy', 924658034, 'technomancy@site,com', 'bulbadox road', 'Seattle', 'TX', 55463)
SELECT * FROM sales.stores

INSERT INTO sales.stores(store_id, store_name, email, street, city, state, zip_code)
VALUES(6, 'Mcdonalds', 'Mcdonalds@bike.com', 'rua Santa Catarina', 'Porto', 'Porto', 400009)
SET IDENTITY_INSERT sales.stores OFF;

SET IDENTITY_INSERT production.brands ON; 
INSERT INTO production.brands(brand_id,brand_name) VALUES (10, 'Biklas')
SELECT brand_id, brand_name FRom production.brands

INSERT INTO production.brands(brand_id,brand_name) VALUES (11, 'Lx Trotinetes')
SET IDENTITY_INSERT production.brands OFF; 

--Exercício 7.2.3
UPDATE sales.stores SET phone = '+3512121212121' WHERE store_id = 6
SELECT * FROM sales.stores

UPDATE production.brands SET brand_name = 'Lx Cycles' WHERE brand_name = 'Biklas'
SELECT brand_name FROM production.brands
UPDATE production.brands SET brand_name = upper(brand_name) WHERE brand_name = 'Lx Cycles'

--Exercício 7.2.4
DELETE FROM sales.stores WHERE store_id IN (4,6)
SELECT * FROM sales.stores

DELETE FROM production.brands WHERE brand_name LIKE 'Lx%'
SELECT brand_name FROM production.brands
