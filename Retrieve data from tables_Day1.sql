  
-- Basics SQL Exercises, Practice, Solution - Retrieve data from tables
-- You can create table on your own and please do check https://www.w3resource.com/sql-exercises/sql-retrieve-from-table.php to get more details
-- 1.Write a SQL statement that displays all the information about all salespeople
select * from salesman;
-- 2.Write a SQL statement to display a string "This is SQL Exercise, Practice and Solution"
select "This is SQL Exercise, Practice and Solution";
-- 3. Write a SQL query to display three numbers in three columns.
select 1,2,3;
-- 4. Write a SQL query to display the sum of two numbers 10 and 15 from the RDBMS server.
select 10+15;
-- 5. Write an SQL query to display the result of an arithmetic expression.
select (10+15)/2;
-- 6. Write a SQL statement to display specific columns such as names and commissions for all salespeople.
select name,commission from salesman;
-- 7. Write a query to display the columns in a specific order, such as order date, salesman ID, order number, and purchase amount for all orders.
select * from orders;
select ord_date,salesman_id,ord_no,purch_amt from orders;
-- 8. From the following table, write a SQL query to identify the unique salespeople ID. Return salesman_id.
-- Distinct
select distinct(salesman_id) from orders; 
-- Group by
select salesman_id from orders where salesman_id  group by salesman_id; 
-- Row Count
with temp_table as(
select salesman_id,row_number() 
over(partition by salesman_id)as row_count
from orders) 
select salesman_id,row_count from temp_table where row_count=1;
-- Intersect doesn't support in mysql
-- Union
select salesman_id from orders
union
select salesman_id from orders;
-- 9. From the following table, write a SQL query to locate salespeople who live in the city of 'Paris'. Return salesperson's name, city.
select * from salesman;
select name,city from salesman where city='Paris';
-- 10. From the following table, write a SQL query to find customers whose grade is 200. Return customer_id, cust_name, city, grade, salesman_id.
select * from customers where grade=200;
-- 11. From the following table, write a SQL query to find orders that are delivered by a salesperson with ID. 5001. Return ord_no, ord_date, purch_amt.
select * from orders;
select ord_no,ord_date,purch_amt from orders where salesman_id=5001;
-- 12. From the following table, write a SQL query to find the Nobel Prize winner(s) for the year 1970. Return year, subject and winner.
select * from noble_win;
select year,subject,winner from noble_win where year =1970;
-- 13. From the following table, write a SQL query to find the Nobel Prize winner in ‘Literature’ for 1971. Return winner.
select winner from noble_win where year =1971 and subject="Literature";
-- 14. From the following table, write a SQL query to locate the Nobel Prize winner ‘Dennis Gabor'. Return year, subject.
select year,subject from noble_win where winner="Dennis Gabor";  
-- 15. From the following table, write a SQL query to find the Nobel Prize winners in the field of ‘Physics’ since 1950. Return winner.
select winner,year from noble_win where subject="Physics" and year>=1950;
-- 16. From the following table, write a SQL query to find the Nobel Prize winners in ‘Chemistry’ between the years 1965 and 1975. Begin and end values are included. Return year, subject, winner, and country. 
select * from noble_win where subject="Chemistry" and year between 1965 and 1975;
-- 17. Write a SQL query to display all details of the Prime Ministerial winners after 1972 of Menachem Begin and Yitzhak Rabin.
select * from noble_win where category ='Prime Minister' and year>=1972;
-- 18. From the following table, write a SQL query to retrieve the details of the winners whose first names match with the string ‘Louis’. Return year, subject, winner, country, and category.
select * from noble_win where winner like '%Louis%';
-- 19. From the following table, write a SQL query that combines the winners in Physics, 1970 and in Economics, 1971. Return year, subject, winner, country, and category.
 select * from noble_win where (subject="Physics" and year=1970)or(subject="Economics" and year=1971);
-- 20. From the following table, write a SQL query to find the Nobel Prize winners in 1970 excluding the subjects of Physiology and Economics. Return year, subject, winner, country, and category.
select * from noble_win where year=1970 and subject not in ("Physiology","Economics");
-- 21. From the following table, write a SQL query to combine the winners in 'Physiology' before 1971 and winners in 'Peace' on or after 1974. Return year, subject, winner, country, and category. 
 select * from noble_win where (subject="Physiology" and year<1971)or(subject="Peace" and year>1974);
-- 22. From the following table, write a SQL query to find the details of the Nobel Prize winner 'Johannes Georg Bednorz'. Return year, subject, winner, country, and category.
select * from noble_win where winner="Johannes Georg Bednorz";
-- 23. From the following table, write a SQL query to find Nobel Prize winners for the subject that does not begin with the letter 'P'. Return year, subject, winner, country, and category. Order the result by year, descending and winner in ascending.
select * from noble_win where subject not like "P%" order by year desc,winner;
-- 24. From the following table, write a SQL query to find the details of 1970 Nobel Prize winners. Order the results by subject, ascending except for 'Chemistry' and ‘Economics’ which will come at the end of the result set. Return year, subject, winner, country, and category.  
select * from noble_win where year=1970 order by
case 
	when subject in ("Chemistry","Economics") then 1
    else 0
    end asc;
-- 25. From the following table, write a SQL query to select a range of products whose price is in the range Rs.200 to Rs.600. Begin and end values are included. Return pro_id, pro_name, pro_price, and pro_com.    Go to the editor
-- Sample table: item_mast
select * from item_mast where pro_price between 200 and 600;
-- 26. From the following table, write a SQL query to calculate the average price for a manufacturer code of 16. Return avg.  
select avg(pro_price) as Average from item_mast where pro_com=16;
-- 27. From the following table, write a SQL query to display the pro_name as 'Item Name' and pro_priceas 'Price in Rs.'    Go to the editor
select pro_name as 'Item Name',pro_price as 'Price in Rs.' from item_mast; 
-- 28. From the following table, write a SQL query to find the items whose prices are higher than or equal to $250. Order the result by product price in descending, then product name in ascending. Return pro_name and pro_price. 
select pro_name,pro_price from item_mast where pro_price>=250 order by pro_price desc,pro_name;
-- 29. From the following table, write a SQL query to calculate average price of the items for each company. Return average price and company code.  Go to the editor
select * FROM item_mast;
select avg(pro_price),PRO_COM from item_mast group by PRO_COM;
-- 30. From the following table, write a SQL query to find the cheapest item(s). Return pro_name and, pro_price.   Go to the editor
Select pro_name,pro_price from item_mast where pro_price<500;
-- 31. From the following table, write a SQL query to find the unique last name of all employees. Return emp_lname.   Go to the editor
select distinct(emp_lname) from emp_details;
-- 32. From the following table, write a SQL query to find the details of employees whose last name is 'Snares'. Return emp_idno, emp_fname, emp_lname, and emp_dept.   Go to the editor
select * from emp_details where emp_lname='Snares';
-- 33. From the following table, write a SQL query to retrieve the details of the employees who work in the department 57. Return emp_idno, emp_fname, emp_lname and emp_dept..   Go to the editor
select * from emp_details where emp_dept=57;