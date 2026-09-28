--Alias. Why would I need this if the names are auto explained? Better filter
SELECT first_name AS Nome, last_name AS Apelido, phone AS Telefone, email AS 'Endereço Email' FROM sales.customers c
SELECT first_name AS Nome, last_name AS Apelido, phone AS Telefone, email AS 'Endereço Email' FROM sales.customers c WHERE c.phone IS NULL
SELECT first_name AS Nome, last_name AS Apelido, phone AS Telefone, email AS 'Endereço Email' FROM sales.customers c WHERE c.phone IS NOT NULL
SELECT CONCAT(first_name,' ',last_name) AS fullname, first_name, last_name, phone, email FROM sales.customers c WHERE c.phone IS  NULL
SELECT CONCAT(LOWER(first_name),' ',UPPER(last_name)) AS fullname, phone, email FROM sales.customers c WHERE c.phone IS  NULL
SELECT CONCAT(LEFT(first_name,1),'. ',last_name) AS customer_name, email, phone FROM sales.customers c WHERE c.phone IS  NULL
SELECT CONCAT(first_name,' ',LEFT(last_name,1),'.') AS customer_name, email, phone FROM sales.customers c WHERE c.phone IS  NULL
SELECT DISTINCT state AS 'Estado' FROM sales.customers c WHERE c.phone IS NULL order by 'Estado' ASC
SELECT product_name AS Produto, list_price AS 'Preço' FROM production.products p WHERE p.list_price BETWEEN 350 AND 850 ORDER BY 'Preço' DESC
SELECT product_name AS Produto, list_price AS 'Preço' FROM production.products p WHERE p.list_price IN (999.99,1999.99,2999.99) ORDER BY 'Preço' ASC
SELECT product_name AS Produto, list_price AS 'Preço' FROM production.products p WHERE p.product_name LIKE '%Fuel%'--meio
SELECT product_name AS Produto, list_price AS 'Preço' FROM production.products p WHERE p.product_name LIKE 'Trek%' --começo

--Exercícios 3.1
--Pessoas sem phone
SELECT first_name AS Nome, last_name AS Apelido, phone AS Telefone FROM sales.customers c WHERE c.phone IS NULL

--Pessoas com phone e vivem em CA
SELECT first_name AS Nome, last_name AS Apelido, phone AS Telefone, state AS 'Estado' FROM sales.customers c WHERE c.phone IS NOT NULL AND c.state = 'CA'

--Lojas com o código postal 95060 e 75088
SELECT store_name AS 'Loja', zip_code AS 'Codigo Postal' FROM sales.stores s WHERE s.zip_code = 95060 AND s.zip_code = 75088

--Staff com serrano no email
SELECT first_name AS nome, email FROM sales.staffs s WHERE s.email = '%serrano%'
--staff sem manager
SELECT first_name AS nome, manager_id FROM sales.staffs s WHERE s.manager_id IS NULL
--numero termina em 55
SELECT CONCAT(LEFT(first_name,1),'. ',last_name) AS staff_name, phone FROM sales.staffs s WHERE s.phone LIKE '%55'
SELECT CONCAT(LEFT(first_name,1),'. ',last_name) AS staff_name FROM sales.staffs s WHERE s.first_name LIKE 'M%'

--semana 3.2
SELECT COUNT(*) AS '# Produtos'
FROM production.products p --conta números de produtos

SELECT MAX(quantity) AS 'Máxima Quantidade'
FROM sales.order_items o --Máximo de quantidade de um item

SELECT MAX(list_price) AS 'Preço Máximo'
FROM production.products p --O mesmo mas o preço máximo
SELECT MIN(list_price) AS 'Preço Mínimo'--Preço mínimo
FROM production.products p 

SELECT MIN(list_price) AS 'Preço Mínimo', AVG(list_price) AS 'Preço Médio', MAX(list_price) AS 'Preço Máximo'
FROM production.products p --Minimo, medio de todos os artigos, máximo

SELECT MIN(discount) AS 'Desconto Mínimo', AVG(discount) AS 'Desconto Médio', MAX(discount) AS 'Desconto Máximo'
FROM sales.order_items o --Mesma coisa mas para descontos

SELECT SUM(list_price) AS 'Vendas (Total)'
FROM sales.order_items o --lista de todas as vendas feitas

--Lista de clientes cujo último nome esteja entre J e M
SELECT * from sales.customers c WHERE c.last_name LIKE '[j-m]%' 

--Identificar clientes com o apelido que contenham o ou u na segunda posição.
SELECT * from sales.customers c WHERE c.last_name LIKE '_[ou]%'

--Identificar produtos que quando têm preço inferior a 500 se catalogam como Muito Baratos.
SELECT product_name AS Produto, list_price AS 'Preço', 
CASE
    WHEN list_price < 500 THEN 'Muito Barato'
END AS 'Classificação'
FROM production.products p 

SELECT product_id, MIN(discount) AS 'Desconto Mínimo', AVG(discount) AS 'Desconto Médio', MAX(discount) AS 'Desconto Máximo'
FROM sales.order_items o 
GROUP BY product_id ORDER BY 1

SELECT item_id, MIN(discount) AS 'Desconto Mínimo', AVG(discount) AS 'Desconto Médio', MAX(discount) AS 'Desconto Máximo'
FROM sales.order_items o 
GROUP BY item_id
HAVING AVG(discount)  > 0.106

SELECT model_year AS 'Ano', COUNT(product_name) AS '# Produtos', MIN(list_price) AS 'Preços Anuais - Mínimo', AVG(list_price) AS 'Preços Anuais - Médio', MAX(list_price) AS 'Preços Anuais - Máximo' 
FROM production.products p
GROUP BY model_year
HAVING  model_year IN (2017, 2019)