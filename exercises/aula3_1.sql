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

