-- QE 1  - Show the category_name and description from the categories table sorted by category_name.
-- QE 2  - Show all the contact_name, address, city of all customers which are not from 'Germany', 'Mexico', 'Spain'. 
-- QE 3  - Show order_date, shipped_date, customer_id, Freight of all orders placed on 2018 Feb 26. 
-- QE 4  - Show the employee_id, order_id, customer_id, required_date, shipped_date from all orders shipped later than the required date.
-- QE 5  - Show all the even numbered Order_id from the orders table.
-- QE 6  - Show the city, company_name, contact_name of all customers from cities which contains the letter 'L' in the city name, sorted by contact_name.
-- QE 7  - Show the company_name, contact_name, fax number of all customers that has a fax number. (not null).
-- QE 8  - Show the first_name, last_name. hire_date of the most recently hired employee.
-- QE 9  - Show the average unit price rounded to 2 decimal places, the total units in stock, total discontinued products from the products table.
-- QE 10 - Show the supplier_id, company_name, city from the suppliers table where country is 'USA' or 'Canada', sorted by company_name.
-- QE 11 - Show the employee_id, first_name, last_name, birth_date of all employees born after 1960.
-- QE 12 - Show the order_id, customer_id, employee_id, order_date from the orders table where order_date is in the year 2016.
-- QE 13 - Show the product_id, product_name, units_in_stock from the products table where units_in_stock < 10, sorted by product_name.
-- QE 14 - Show the shipper_id, company_name, phone from the shippers table.
-- QE 15 - Show the territory_id, territory_description, region_id from the territories table sorted by region_id ascending.
-- QE 16 - Show the total number of orders, the earliest order_date, and the latest shipped_date from the orders table.

-- QM 1  - Show the ProductName, CompanyName, CategoryName from the products, suppliers, and categories table.
-- QM 2  - Show the category_name and the average product unit price for each category rounded to 2 decimal places.
-- QM 3  - Show the city, company_name, contact_name from the customers and suppliers table merged together.
         -- Create a column which contains 'customers' or 'suppliers' depending on the table it came from.
-- QM 4  - Show the total amount of orders for each year/month.

-- QH 1  - Show the employee's first_name and last_name, a "num_orders" column with a count of the orders taken, 
         -- and a column called "Shipped" that displays "On Time" if the order shipped_date is less or equal to the required_date, 
         -- "Late" if the order shipped late, "Not Shipped" if shipped_date is null.
         -- Order by employee last_name, then by first_name, and then descending by number of orders.
-- QH 2  - Show how much money the company lost due to giving discounts each year, order the years from most recent to least recent. Round to 2 decimal places.
-- QH 3  - For every order that was shipped late (shipped_date > required_date), calculate a 5% "Late Refund" of the freight cost. 
         -- Show the order_id, customer_id, the original freight, and the refund_amount. Only show orders where the refund is greater than $5.00.
-- QH 4  - Group products into three "Stock Levels":
         -- 'Critical' (Stock < 10)
         -- 'Low' (Stock 11–30)
         -- 'Healthy' (Stock > 30)
         -- Show the Stock Level and the total dollar value of inventory for each level. Order by value descending.
-- QH 5  - Identify "Elite Customers." These are customers who have placed more than 10 orders AND have a total freight expenditure of over $1,000 across all their orders. 
         -- Show their company_name and the total number of orders they've placed.
-- QH 6  - Find the full details of an employee who:
         -- Works in 'London'.
         -- Has a first_name where the 3rd letter is 'n' (e.g., Anne).
         -- Was hired in an even-numbered year.
         -- Has an employee_id that is not 5.
-- QH 7  - Calculate what percentage of the total product catalog (total number of products) belongs to the 'Seafood' category. 
         -- Round the result to 2 decimal places and append a '%' sign.
-- QH 8  - For each year, show the month (1-12) and the total number of orders. 
         -- Add a column called prev_month_orders that shows the order count from the previous month of the same year.
-- QH 9  - Show the order_id and the number of unique categories represented in that order. 
         -- Only show orders that contain products from more than 3 different categories.
-- QH 10 - Display all unique ship_country values. 
         -- Sort them alphabetically, but ensure that the 'USA' and 'Canada' are pinned to the very top (1st and 2nd), 
         -- with all other countries following alphabetically below them.
-- QH 11 - Find suppliers who have products that are currently "Discontinued" (where discontinued = 1). 
         -- Show the supplier_id, company_name, and the count of discontinued products they used to provide. 
         -- Only show suppliers with more than 1 discontinued product.
         


-- QE 1  - Show the category_name and description from the categories table sorted by category_name.

select category_name,description
from categories
order by category_name;


-- QE 2  - Show all the contact_name, address, city of all customers which are not from 'Germany', 'Mexico', 'Spain'. 

select contact_name,address,city
from customers
where country <> 'Germany' and country <> 'Mexico' and country <> 'Spain';


-- QE 3  - Show order_date, shipped_date, customer_id, Freight of all orders placed on 2018 Feb 26. 

select order_date,shipped_date,customer_id, freight 
from orders
where order_date = '2018-02-26';


-- QE 4  - Show the employee_id, order_id, customer_id, required_date, shipped_date from all orders shipped later than the required date.

select employee_id,order_id,customer_id,required_date,shipped_date
from orders
where shipped_date > required_date;


-- QE 5  - Show all the even numbered Order_id from the orders table.

select order_id
from orders
where order_id % 2 = 0;


-- QE 6  - Show the city, company_name, contact_name of all customers from cities which contains the letter 'L' in the city name, sorted by contact_name.

select city, company_name,contact_name
from customers
where city like '%l%'
order by contact_name;


-- QE 7  - Show the company_name, contact_name, fax number of all customers that has a fax number. (not null).

select company_name,contact_name,fax
from customers
where fax is not null;


-- QE 8  - Show the first_name, last_name. hire_date of the most recently hired employee.

select first_name,last_name,hire_date
from employees
order by 3 desc
limit 1;


-- QE 9  - Show the average unit price rounded to 2 decimal places, the total units in stock, total discontinued products from the products table.

select round(avg(unit_price),2) as average_price,
	sum(units_in_stock) as total_stock,
    sum(discontinued) as total_discontinued
from products;


-- QE 10 - Show the supplier_id, company_name, city from the suppliers table where country is 'USA' or 'Canada', sorted by company_name.

select supplier_id,company_name,city
from suppliers
where country in ('USA','Canada')
order by company_name;


-- QE 11 - Show the employee_id, first_name, last_name, birth_date of all employees born after 1960.

select employee_id,first_name,last_name,birth_date
from employees
where year(birth_date) > 1960;



-- QE 12 - Show the order_id, customer_id, employee_id, order_date from the orders table where order_date is in the year 2016.

select order_id,customer_id,employee_id,order_date
from orders
where year(order_date) = 2016;


-- QE 13 - Show the product_id, product_name, units_in_stock from the products table where units_in_stock < 10, sorted by product_name.

select product_id, product_name, units_in_stock
from products
where units_in_stock < 10
ORDER BY product_name;


-- QE 14 - Show the shipper_id, company_name, phone from the shippers table.

select shipper_id, company_name, phone
from shippers;



-- QE 15 - Show the territory_id, territory_description, region_id from the territories table sorted by region_id ascending.

select territory_id, territory_description, region_id
from territories
order by region_id;


-- QE 16 - Show the total number of orders, the earliest order_date, and the latest shipped_date from the orders table.

select count(*),min(order_date),max(shipped_date)
from orders;

select max(order_date),min(order_date)
from orders;


-- QM 1  - Show the ProductName, CompanyName, CategoryName from the products, suppliers, and categories table.

select p.product_name,s.company_name,c.category_name
from suppliers s 
join products p 
on p.supplier_id = s.supplier_id
join categories c 
on c.category_id = p.category_id;


-- QM 2  - Show the category_name and the average product unit price for each category rounded to 2 decimal places.

select c.category_name,round(avg(p.unit_price),2) as average_unit_price
from categories c 
join products p 
on c.category_id = p.category_id
group by 1;


-- QM 3  - Show the city, company_name, contact_name from the customers and suppliers table merged together.
         -- Create a column which contains 'customers' or 'suppliers' depending on the table it came from.
         
select city,company_name,contact_name,'customers' 
from customers
union all
select city,company_name,contact_name,'suppliers' 
from suppliers;


-- QM 4  - Show the total amount of orders for each year/month.

select year(order_date) as order_year,month(order_date) as order_month, count(*) as no_of_orders
from orders
group by 1,2
order by 1,2;


-- QM 5  - Show the unique ship_country from the orders table, sorted alphabetically.

select distinct ship_country
from orders
order by 1;


-- QM 6  - Show the product_name and unit_price from the products table for all products that start with 'C' and end with 's', 
	     -- and have a name length of at least 10 characters.

SELECT product_name,unit_price
from products
where product_name like 'C%s' and len(product_name) > 9;


-- QM 7  - Show the order_id, order_date, and company_name (from customers) for all orders where the required_date was earlier than the shipped_date.

select o.order_id,o.order_date,c.company_name
from customers c 
join orders o 
using (customer_id)
where required_date > shipped_date;


-- QM 8  - Show the product_id and product_name for products that have been ordered more than 10 times in total.

select p.product_id,p.product_name
from products p 
join order_details od
using (product_id)
group by 2
having count(p.product_id) > 10;


-- QM 9  - Display the first_name and last_name of all employees. Order the list by the length of their full name (first + last), then alphabetically by last_name.

select first_name,last_name
from employees
order by (len(first_name) || len(last_name)),last_name;


-- QM 10 - Show the total count of 'Sales Representatives' versus all other job titles in the employees table. Display both counts in the same row.

select
	sum(case
    	when title = 'Sales Representative' then 1 else 0
    end) as SR_Count,
    sum(case
    	when title = 'Sales Representative' then 0 else 1
    end) as Other_Count
from employees;



-- QM 11 - Show the company_name, contact_name, and fax from the customers table for those who have a fax number. Sort the results by company_name.

select company_name,contact_name,fax
from customers
where fax is not NULL
order by 1;


-- QM 12 - Show the first_name, last_name, and birth_date of all employees born in the 1960s decade. Sort from oldest to youngest.

SELECT first_name, last_name, birth_date
FROM employees
where year(birth_date) between 1960 and 1969
order by 3;


-- QM 13 - Create a single column called employee_full_name. It should show the last_name in all caps, followed by the first_name in all lower case, separated by a hyphen (e.g., SMITH-jane). 
         -- Sort by first_name descending.

select concat(upper(last_name),'-',lower(first_name)) as employee_full_name
from employees
order by first_name desc;


-- QM 14 - Show the category_id and the sum of units_in_stock for categories where the total stock is greater than 300.

select category_id,sum(units_in_stock)
from products
group by 1
having sum(units_in_stock) > 300;


-- QM 15 - Show the difference between the most expensive and cheapest unit_price for products in the 'Seafood' category.

select max(unit_price)-min(unit_price) as difference
from products
where category_id = 8;


-- QM 16 - Show every day of the month (1-31) and how many orders were placed on that day across all years. Sort by the day with the most orders to the least.

SELECT 
    DAY(order_date) AS day_of_month,
    COUNT(*) AS order_count
FROM orders
GROUP BY DAY(order_date)
ORDER BY order_count DESC;


-- QM 17 - Show all columns from the orders table for the most recent order placed by the customer with customer_id 'ALFKI'.

select * from orders
where customer_id = 'ALFKI'
order by order_date desc
limit 1;


-- QM 18 - Show the order_id, customer_id, and ship_via for orders that meet one of these criteria:
         -- The order_id is an even number and ship_via is 3.
         --   The ship_country is 'France' and the customer_id length is 5 characters.
         
select order_id,customer_id,ship_via
from orders
where (order_id % 2 = 0 and ship_via = 3) or (ship_country = 'France' and len(customer_id) = 5);


-- QM 19 - Show the first_name, last_name, and the total number of orders handled by each employee.

select e.first_name,e.last_name,count(o.employee_id) as total_orders
from employees e 
join orders o 
using (employee_id)
group by 1,2;


-- QM 20 - For each employee, display their employee_id, full name, and the dates of their very first and very last handled orders.

select  e.employee_id, concat(e.first_name,' ',e.last_name) as full_name,min(o.order_date) as first_order, max(o.order_date) as last_order
from employees e 
join orders o 
using (employee_id)
group by 1,2;


-- QM 21 - Display the total number of customers per country. Order by the count in descending order.

select ship_country, count(1) as no_of_cust
from orders
group by 1
order by 2 desc;


-- QM 22 - For every order, display the company_name of the customer, the order_date, and the full name of the employee who processed it.

select c.company_name,o.order_date,concat(e.first_name,' ',e.last_name) as full_name
from customers c 
join orders o 
on c.customer_id = o.customer_id
join employees e 
on e.employee_id = o.employee_id;


-- QM 23 - Find all cities that have more than 2 customers. Display the city and the number of customers.

SELECT city, COUNT(*) AS number_of_customers
FROM customers
GROUP BY city
HAVING COUNT(*) > 2;


-- QM 24 - Display the product_name, the unit_price, and a new column 'InventoryValue' (calculated as unit_price * units_in_stock) rounded to 0 decimals.

select product_name,unit_price,round((unit_price*units_in_stock),0) as InventoryValue
from products;


-- QM 25 - Display a single row showing the max_freight, min_freight, and avg_freight from the orders table.

select max(freight) as max_freight,min(freight) as min_freight,avg(freight) as avg_freight
from orders;


-- QM 26 - Show the customer_id and company_name from the customers table for customers who have never placed an order (no record in the orders table).

select c.customer_id,c.company_name
from customers c 
left join orders o 
on c.customer_id = o.customer_id
where o.customer_id is null;

-- QM 27 - Display the order_id, the product_name, and the category_name for every item in every order.

select od.order_id,p.product_name,c.category_name
from order_details od
join products p 
on p.product_id = od.product_id
join categories c 
on c.category_id = p.category_id;


-- QH 1  - Show the employee's first_name and last_name, a "num_orders" column with a count of the orders taken, 
         -- and a column called "Shipped" that displays "On Time" if the order shipped_date is less or equal to the required_date, 
         -- "Late" if the order shipped late, "Not Shipped" if shipped_date is null.
         -- Order by employee last_name, then by first_name, and then descending by number of orders.
         
select e.first_name,e.last_name,count(o.order_id) as num_orders,
case
	when o.shipped_date <= o.required_date then 'On Time'
    when o.shipped_date > o.required_date then 'Late'
    when o.shipped_date is NULL then 'Not Shipped'
end as shipped 
from employees e 
left join orders o 
using (employee_id)
group by 1,2,4
order by 2,1,3 desc;


-- QH 2  - Show how much money the company lost due to giving discounts each year, order the years from most recent to least recent. Round to 2 decimal places.

select year(order_date), round(sum((od.quantity * p.unit_price) * od.discount),2) as discount_amount
from order_details od
join products p 
on od.product_id = p.product_id
join orders o 
on o.order_id = od.order_id
group by 1
order by 1 desc;


-- QH 3  - For every order that was shipped late (shipped_date > required_date), calculate a 5% "Late Refund" of the freight cost. 
         -- Show the order_id, customer_id, the original freight, and the refund_amount. Only show orders where the refund is greater than $5.00.

select * from(
select
order_id,customer_id,freight,
	case 
    	when shipped_date > required_date then round((freight*5)/100,2)
	end as refund_amount
from orders)
where refund_amount > 5;


-- QH 4  - Group products into three "Stock Levels":
         -- 'Critical' (Stock < 10)
         -- 'Low' (Stock 11–30)
         -- 'Healthy' (Stock > 30)
         -- Show the Stock Level and the total dollar value of inventory for each level. Order by value descending.
         
select product_name,
	case
    	when units_in_stock < 10 then 'Critical'
        when units_in_stock between 11 and 30 then 'Low'
        else 'Healthy'
     end as Stock_Levels,
(unit_price * units_in_stock) as total_dollar_value
from products
order by 3 desc;


-- QH 5  - Identify "Elite Customers." These are customers who have placed more than 10 orders AND have a total freight expenditure of over $1,000 across all their orders. 
         -- Show their company_name and the total number of orders they've placed.

with temp_result as 
 (    
	SELECT customer_id,count(*) as total_orders, sum(freight) as total_expenditure
	from orders
	group by 1
  )
select * from temp_result
where total_orders > 10 and total_expenditure > 1000;


-- QH 6  - Find the full details of an employee who:
         -- Works in 'London'.
         -- Has a first_name where the 3rd letter is 'n' (e.g., Anne).
         -- Was hired in an even-numbered year.
         -- Has an employee_id that is not 5.
         
select * from employees
where city = 'London'
	and first_name like '__n%'
    and year(hire_date) % 2 = 0
    and employee_id != 5;
    

-- QH 7  - Calculate what percentage of the total product catalog (total number of products) belongs to the 'Seafood' category. 
         -- Round the result to 2 decimal places and append a '%' sign.

select 
    concat(round(((select count(*) 
     			   from categories c 
     			   join products p 
    		       on c.category_id = p.category_id
     			   where c.category_name = 'Seafood') * 100.0) / count(*),2),'%') as perc
from products;


-- QH 8  - For each year, show the month (1-12) and the total number of orders. 
         -- Add a column called prev_month_orders that shows the order count from the previous month of the same year.

SELECT YEAR(order_date) AS order_year, MONTH(order_date) AS order_month, COUNT(*) AS total_orders,
LAG(COUNT(*)) OVER (PARTITION BY YEAR(order_date) ORDER BY MONTH(order_date)) AS prev_month_orders
FROM orders
GROUP BY 1,2
ORDER BY 1,2;


-- QH 9  - Show the order_id and the number of unique categories represented in that order. 
         -- Only show orders that contain products from more than 3 different categories.


select o.order_id, count(distinct p.category_id) as unique_categories
from orders o
join order_details od
on o.order_id = od.order_id
join products p
on p.product_id = od.product_id
group by 1
having unique_categories > 3
order by 1;


-- QH 10 - Display all unique ship_country values. 
         -- Sort them alphabetically, but ensure that the 'USA' and 'Canada' are pinned to the very top (1st and 2nd), with all other countries following alphabetically below them.

select distinct ship_country
from orders
order by case when ship_country = 'USA' or ship_country = 'Canada' then 0 else 1 end,
1;


-- QH 11 - Find suppliers who have products that are currently "Discontinued" (where discontinued = 1). 
         -- Show the supplier_id, company_name, and the count of discontinued products they used to provide. 
         -- Only show suppliers with more than 1 discontinued product.
         
select p.supplier_id, s.company_name, count(p.discontinued) as count_discont
from products p 
join suppliers s 
using (supplier_id)
group by 1,2
having count(p.discontinued) > 1;