SET IDENTITY_INSERT production.brands ON; 
INSERT INTO production.brands(brand_id,brand_name) VALUES (10, 'Marca fixe');
SELECT * FROM production.brands;
SET IDENTITY_INSERT production.brands OFF; 

SET IDENTITY_INSERT production.categories ON; 
INSERT INTO production.categories(category_id, category_name) VALUES(8, 'Categoria fixe');
SELECT * FROM production.categories;

SET IDENTITY_INSERT production.categories OFF; 
SET IDENTITY_INSERT sales.customers ON; 
INSERT INTO sales.customers(customer_id, first_name, last_name, phone, email, street, city, state, zip_code) 
VALUES (1446, 'Catarina', 'Afonso', 928071687, 'catarina.afonso@gmail.com', 'rua faias', 'quinta do conde', 'ST', 2845980)
SELECT * FROM sales.customers;
SET IDENTITY_INSERT sales.customers OFF; 

--Update
UPDATE production.brands SET brand_name = 'Marca não fixe' WHERE brand_id = 10
SELECT * FROM production.brands;

UPDATE production.categories SET category_name = 'Categoria não fixe' WHERE category_id = 8
SELECT * FROM production.categories;

--delete
DELETE FROM production.brands WHERE brand_id = 10
DELETE FROM production.categories WHERE category_id = 8
DELETE FROM sales.customers WHERE customer_id = 1446

