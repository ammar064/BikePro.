
USE BikeStores;

/*Veiw our tables */

SELECT *
FROM sales.orders;
SELECT *
FROM sales.customers;
SELECT *
FROM sales.order_items;

SELECT *
FROM sales.staffs;
SELECT *
FROM sales.stores;

SELECT *
FROM production.products;
SELECT *
FROM production.brands;
SELECT *
FROM sales.orders;

/* Select the new BikeStores database Form five tables in the SQL server which  include :
1.Customer name 
2.city 
3.Date of order 
4.Category name of product 
5.Stats
6.How many of units
7.Stores names
8.Salesmen names
9.brand name

*/

SELECT orde.order_id,
       CONCAT(cust.first_name,' ',cust.last_name) AS Customer_name,
	   cust.city,
	   cust.state,
	   orde.order_date,
	   SUM(sit.quantity) AS Units,
	   SUM(sit.quantity*sit.list_price) AS TotalRevenue,
	   pro.product_id,
	   cat.category_name,
	   sto.store_name,
	   bra.brand_name,
	   CONCAT(aff.first_name,' ',aff.last_name) As Salesmen
FROM sales.orders orde
JOIN sales.customers cust
ON orde.customer_id=cust.customer_id
JOIN sales.order_items sit
ON orde.order_id=sit.order_id
JOIN production.products pro
ON sit.product_id=pro.product_id
JOIN production.categories cat
ON pro.category_id=cat.category_id
JOIN sales.stores sto
ON orde.store_id=sto.store_id
JOIN sales.staffs aff
ON orde.staff_id=aff.staff_id
JOIN production.brands bra
ON pro.brand_id=bra.brand_id
GROUP BY
     orde.order_id,
       CONCAT(cust.first_name,' ',cust.last_name) ,
	   cust.city,
	   cust.state,
	   orde.order_date,
	   pro.product_id,
	   cat.category_name,
	   sto.store_name,
	   bra.brand_name,
	   CONCAT(aff.first_name,' ',aff.last_name) 
