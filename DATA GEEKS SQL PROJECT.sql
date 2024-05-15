-- This is the solution to the 1st case study of 8weeks data challenge with Data Danny
-- The project helps Danny solve problems in his restaurant 
-- The codes below create the data base dannys_diner 

CREATE DATABASE dannys_diner;

-- the code below changes the data base being worked on to dannys_diner
USE dannys_diner;

-- the commnand below creates the tables

CREATE TABLE sales(
  customer_id VARCHAR(1),
  order_date DATE,
  product_id int
  );
  
-- here, we fix data into the table sales

 INSERT into sales(customer_id, order_date, product_id)
VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-07', '3');
  
  
  -- show everythng from table sales   
  select * from sales;
  
 -- here, we fix data into the table menu
  CREATE TABLE menu (
  product_id INT,
  product_name VARCHAR(5),
  price INT
);
-- here, we fix data into the table menu
INSERT INTO menu
  (product_id, product_name, price)
VALUES
  ('1', 'sushi', '10'),
  ('2', 'curry', '15'),
  ('3', 'ramen', '12');
   -- show everythng from table  menu
 select * from menu;
 
 -- here, we fix data into the table members
 CREATE TABLE members (
customer_id VARCHAR(1),
  join_date DATE
);
 -- here, we fix data into the table members
INSERT INTO members
  (customer_id, join_date)
VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09');
 -- show everythng from table members
 select * from members;
 
 
--  Case Study Questions
-- Each of the following case study questions can be answered using a single SQL statement:

-- 1. What is the total amount each customer spent at the restaurant?
-- 2.How many days has each customer visited the restaurant?
-- 3.What was the first item from the menu purchased by each customer?
-- 4.What is the most purchased item on the menu and how many times was it purchased by all customers?
-- 5.Which item was the most popular for each customer?
-- 6.Which item was purchased first by the customer after they became a member?
-- 7.Which item was purchased just before the customer became a member?
-- 8.What is the total items and amount spent for each member before they became a member?
-- 9.If each $1 spent equates to 10 points and sushi has a 2x points multiplier - 
-- how many points would each customer have?
-- 10.In the first week after a customer joins the program (including their join date) they earn 2x points 
-- on all items, not just sushi - how many points do customer A and B have at the end of January?

-- solution to questions

-- 1)AMOUNT SPENT BY EACH CUSTOMER in the restaurant
 SELECT s.customer_id, SUM(m.price) AS TOTAL_AMOUNT_SPENT_BY_CUSTOMERS
 FROM sales s inner join menu m
on s.product_id = m.product_id
 GROUP BY s.customer_id;
 
 -- 2)DAYS EACH CUSTOMER ViSiTED RESTAURANT
 SELECT customer_id, COUNT(DISTINCT order_date)
 FROM sales
 GROUP BY customer_id;
 
 -- 3) First item from menu purchased by each customer 
 SELECT * from (
 select sal.customer_id, men.product_name, sal.order_date, 
DENSE_RANK () over (partition by sal.customer_id ORDER BY sal.order_date ) as menu_purchase
from sales sal join menu men
on sal.product_id = men.product_id
GROUP BY sal.customer_id, men.product_name,sal.order_date
) temptable where menu_purchase=1; 
 

-- 4)most purchased item on the menu and how many times was it purchased
select menu.product_name, count(sales.product_id) as Number_of_order
from sales inner join menu
on sales.product_id = menu.product_id 
group by menu.product_name 
ORDER BY count(sales.product_id) DESC
LIMIT 1;

 
 -- 5)MOST popular Item for each customer
 SELECT * from (
 select customer_id, product_name, 
count(men.product_id) as order_count, 
DENSE_RANK () over (partition by sal.customer_id ORDER BY count(men.product_id) desc) as most_popular
from sales sal join menu men
on sal.product_id = men.product_id
GROUP BY customer_id, product_name ) temptable WHERE most_popular=1
; 


-- 6 Item purchased fIrst after becomIng a member 2021-01-07'),'B', '2021-01-09

SELECT * from (
 select sal.customer_id, men.product_name,sal.order_date , men.product_id, 
RANK () over (partition by customer_id ORDER BY order_date ) as purchase_order, join_date
from sales sal join menu men
on sal.product_id = men.product_id
JOIN members mem on sal.customer_id= mem.customer_id
GROUP BY sal.customer_id, men.product_name,sal.order_date , men.product_id,join_date
) temptable where order_date > join_date and purchase_order=4; 



-- 7) Item purchased before becomIng member 
SELECT * from (
 select sal.customer_id, men.product_name,sal.order_date , men.product_id, 
RANK () over (partition by customer_id ORDER BY order_date desc ) as purchase_order, join_date
from sales sal join menu men
on sal.product_id = men.product_id
JOIN members mem on sal.customer_id= mem.customer_id
GROUP BY sal.customer_id, men.product_name,sal.order_date , men.product_id,join_date
) temptable where order_date < join_date; -- and purchase_order=4; 


-- 8 total Items and amount spent before they became members
select sal.customer_id, count(sal.product_id) as Total_items , sum(men.price) as Amount_spent
from sales as sal join menu as men
on sal.product_id = men.product_id
join members as mem
on sal.customer_id = mem.customer_id
where sal.order_date < mem.join_date
group by sal.customer_id;

-- 9.If each $1 spent equates to 10 points and sushi has a 2x points multiplier - 
-- how many points would each customer have?
WITH points AS 
(
SELECT *,
    CASE 
    WHEN m.product_name = 'sushi' THEN price * 20
    WHEN m.product_name != 'sushi' THEN price * 10
    END AS points
FROM menu m
    )
SELECT customer_id, SUM(points) AS points
FROM sales s
JOIN points p ON p.product_id = s.product_id
GROUP BY s.customer_id;

-- 10.In the first week after a customer joins the program (including their join date) they earn 2x points 
-- on all items, not just sushi - how many points do customer A and B have at the end of January?
SELECT customer_id, SUM(total_points)
FROM (WITH points AS
(SELECT s.customer_id, (s.order_date - mem.join_date) AS first_week,m.price,m.product_name,s.order_date
FROM sales s JOIN menu m 
ON s.product_id = m.product_id
JOIN members AS mem
ON mem.customer_id = s.customer_id)
SELECT customer_id,order_date,
CASE WHEN first_week BETWEEN 0 AND 7 THEN price * 20
	 WHEN (first_week > 7 OR first_week < 0) AND product_name = 'sushi' THEN price * 20
	 WHEN (first_week > 7 OR first_week < 0) AND product_name != 'sushi' THEN price * 10
       END AS total_points
FROM points
WHERE EXTRACT(MONTH FROM order_date) = 1
) as t
GROUP BY customer_id;