--To view the entire table called sales in the database called Bee--
SELECT * FROM bee.sales;

-- To view the customer age, country, revenue, and create an additional revenue column and then add 20 to each figure in the original revenue column--
SELECT date, 
customer_age, 
country,
 revenue,
 revenue +20
FROM bee.sales;

--To select unique rows in the age group column--
SELECT DISTINCT Age_Group FROM bee.sales;

--Introducing the where clause to highlight only the bike stands rows in the sub category column--
SELECT * FROM bee.sales
WHERE sub_category = 'bike stands'

-- Introducing the where clause to highlight only profits that are above 1000--
SELECT * 
FROM bee.sales
WHERE profit > 1000;

-- Introducing the where clause to highlight only profits that are below 1000--
SELECT * 
FROM bee.sales
WHERE profit <= 1000;

-- Introducing the where clause to highlight only customer genders that are not female--
SELECT * 
FROM bee.sales
WHERE customer_gender != 'f';

--Logical operators(AND OR NOT)--
--To find out the customers who are not female and generates revenue of over 2000 for the company--
SELECT * 
FROM bee.sales
WHERE customer_gender != 'f'
AND revenue >2000

--Introducing the OR operator to capture customer details that fulfills either of the stated commands.\
 We aim to find out the revenue generated in 2014 that is above 2000 including those 
 less than 2000 found in Canada
SELECT * 
FROM bee.sales
WHERE year = 2014
AND country = 'canada'
OR revenue >2000

--Selecting the states that begins with BRI using the LIKE operator--
SELECT * 
FROM bee.sales
WHERE state LIKE 'bri%'

--Selecting the states that ends with DA using the LIKE operator--
SELECT * 
FROM bee.sales
WHERE state LIKE '%da'

--Selecting the date that begins with 2013 using the LIKE operator--
SELECT * 
FROM bee.sales
WHERE date LIKE '2013%'

--Finding out the average customer age, the count for each age group as well as the minimum and 
maximum ages using the GROUP BY operator--
SELECT age_group, AVG(customer_age), MAX(customer_age), MIN(customer_age), COUNT(customer_age)
FROM bee.sales
GROUP BY age_group

--Finding out the sub categories for eachproduct category using the GROUP BY operator--
SELECT product_category, sub_category
FROM bee.sales
GROUP BY product_category, sub_category 

--Finding out the highest revenue using the ORDER BY operator arranged in descending order--
SELECT * 
FROM bee.sales
ORDER BY revenue desc

--Finding out what country, product category, sub_category, customer age that provided the highest revenue for the business--
SELECT customer_age, country, product_category, sub_category, revenue 
FROM bee.sales
ORDER BY revenue desc

--Finding out what country, product category and sub_category has an average revenue above or equal to
 250. The aim is to find out what country, product and sub category generates the highest revenue, 
 which will in turn provide insights on what products performs best, ask business questions like the 
 factors behind this and what marketing strategy to put in place to ensure that this number keeps 
 going up. This could also help with putting measures in place to see if other branches in other 
 countries could put similar measures in place to boost sales. From the query below, it is evident
 that Canada sold the most bikes(product_category), with an average revenue of 3251.1490
SELECT country, product_category, sub_category, AVG(revenue)
FROM bee.sales
GROUP BY country, product_category, sub_category
HAVING AVG(revenue) >=250
ORDER BY AVG(revenue) desc

--Specify the top 10 products with the highests costs and their countries. 
The idea is to understand the top 10 products that incurs the most cost to the business 
SELECT country, product_category, sub_category, cost
FROM bee.sales
ORDER BY cost desc
LIMIT 10