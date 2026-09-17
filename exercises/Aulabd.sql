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
SELECT product_name FROM production.products WHERE (model_year = 2017 OR model_year = 2018) AND list_price < 1250 AND list_price > 750