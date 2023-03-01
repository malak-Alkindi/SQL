CREATE TABLE Salesman (
 salesman_id INT PRIMARY KEY,
 name VARCHAR(20) NOT NULL,
 city VARCHAR(20) NOT NULL,
 commission DECIMAL(4, 2) NOT NULL
);
INSERT INTO Salesman (salesman_id, name, city, commission)
VALUES
 (5001, 'James Hoog', 'New York', 0.15),
 (5002, 'Nail Knite', 'Paris', 0.13),
 (5005, 'Pit Alex', 'London', 0.11),
 (5006, 'Mc Lyon', 'Paris', 0.14),
 (5007, 'Paul Adam', 'Rome', 0.13),
 (5003, 'Lauson Hen', 'San Jose', 0.12);


CREATE TABLE Customer (
 customer_id INT PRIMARY KEY,
 cust_name VARCHAR(20) NOT NULL,
 city VARCHAR(20) NOT NULL,
 grade INT,
 salesman_id INT,
 FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id)
);
INSERT INTO Customer (customer_id, cust_name, city, grade, salesman_id)
VALUES
 (3002, 'Nick Rimando', 'New York', 100, 5001),
 (3007, 'Brad Davis', 'New York', 200, 5001),
 (3005, 'Graham Zusi', 'California', 200, 5002),
 (3008, 'Julian Green', 'London', 300, 5002),
 (3004, 'Fabian Johnson', 'Paris', 300, 5006),
 (3009, 'Geoff Cameron', 'Berlin', 100, 5003),
 (3003, 'Jozy Altidor', 'Moscow', 200, 5007),
 (3001, 'Brad Guzan', 'London', NULL, 5005);

CREATE TABLE Orders (
 ord_no INT PRIMARY KEY,
 purch_amt DECIMAL(8, 2) NOT NULL,
 ord_date DATE NOT NULL,
 customer_id INT,
 salesman_id INT,
 FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
 FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id)
);
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
 (70001, 150.5, '2012-10-05', 3005, 5002),
 (70009, 270.65, '2012-09-10', 3001, 5005),
 (70002, 65.26, '2012-10-05', 3002, 5001),
 (70004, 110.5, '2012-08-17', 3009, 5003),
 (70007, 948.5, '2012-09-10', 3005, 5002),
 (70005, 2400.6, '2012-07-27', 3007, 5001),
 (70008, 5760, '2012-09-10', 3002, 5001),
 (70010, 1983.43, '2012-10-10', 3004, 5006),
 (70003, 2480.4, '2012-10-10', 3009, 5003),
 (70012, 250.45, '2012-06-27', 3008, 5002),
 (70011, 75.29, '2012-08-17', 3003, 5007),
 (70013, 3045.6, '2012-04-25', 3002, 5001);
CREATE TABLE Company_mast (
 COM_ID INT PRIMARY KEY,
 COM_NAME VARCHAR(30) NOT NULL
);
INSERT INTO Company_mast (COM_ID, COM_NAME)
VALUES
 (11, 'Samsung'),
 (12, 'iBall'),
 (13, 'Epsion'),
 (14, 'Zebronics'),
 (15, 'Asus'),
 (16, 'Frontech');
create table item_mast (
PRO_ID int PRIMARY KEY,
PRO_NAME varchar(50),
PRO_PRICE float,
PRO_COM int)
insert into item_mast values 
(101,'Mother Board', 3200.00,15),
(102, 'Key Board', 450.00, 16),
(103, 'ZIP drive', 250.00,14),
(104, 'Speaker' , 550.00,16),
(105, 'Monitor' , 5000.00,11),
(106, 'DVD drive', 900.00, 12),
(107, 'CD drive', 800.00, 12),
(108, 'Printer', 2600.00, 13),
(109, 'Refill cartridge' , 350.00, 13),
(110, ' Mouse', 250.00, 12);
CREATE TABLE DEPARTMENT (
 DPT_CODE INT PRIMARY KEY,
 DPT_NAME VARCHAR(20) NOT NULL,
 DPT_ALLOTMENT FLOAT NOT NULL
);
INSERT INTO DEPARTMENT (DPT_CODE, DPT_NAME, DPT_ALLOTMENT)
VALUES
(57, 'IT', 65000),
(63, 'Finance', 15000),
(47, 'HR', 240000),
(27, 'RD', 55000),
(89, 'QC', 75000);
CREATE TABLE EMP_DETAILS (
 EMP_IDNO INT PRIMARY KEY,
 EMP_FNAME VARCHAR(50) NOT NULL,
 EMP_LNAME VARCHAR(50) NOT NULL,
 EMP_DEPT INT NOT NULL
);
INSERT INTO EMP_DETAILS (EMP_IDNO, EMP_FNAME, EMP_LNAME, 
EMP_DEPT)
VALUES 
(127323, 'Michale', 'Robbin', 57),
(526689, 'Carlos', 'Snares', 63),
(843795, 'Enric', 'Dosio', 57),
(328717, 'Jhon', 'Snares', 63),
(444527, 'Joseph', 'Dosni', 47),
(659831, 'Zanifer', 'Emily', 47),
(847674, 'Kuleswar', 'Sitaraman', 57),
(748681, 'Henrey', 'Gabriel', 47),
(555935, 'Alex', 'Manuel', 57),
(539569, 'George', 'Mardy', 27),
(733843, 'Mario', 'Saule', 63),
(631548, 'Alan', 'Snappy', 27),
(839139, 'Maria', 'Foster', 57);



SELECT * FROM Salesman
SELECT * FROM Customer
SELECT * FROM Orders
SELECT * FROM Company_mast 
SELECT * FROM item_mast
SELECT * FROM DEPARTMENT
SELECT * FROM EMP_DETAILS


--18. From the following tables write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.
SELECT s.name ,c.cust_name 
FROM Salesman S
JOIN Customer c 
    ON s.city = c.city

--19. From the following tables write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city. 
SELECT o.purch_amt ,o.ord_no,c.cust_name 
FROM Orders o
full JOIN Customer c 
    ON o.customer_id =c.customer_id
	where o.purch_amt between 500 and 2000
--20. From the following tables write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission. 
SELECT c.*,s.name as salesman
FROM Salesman S
JOIN Customer c 
    ON s.salesman_id = c.salesman_id

--21. From the following tables write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission. 
SELECT c.cust_name,c.city,s.name as sales_man_name ,s.commission
FROM Salesman S 
JOIN Customer c 
    ON s.salesman_id = c.salesman_id
	where s.commission > 0.12

--22. From the following tables write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission.
SELECT c.cust_name,c.city as cus_city ,s.city as sale_city,s.name as sales_man_name ,s.commission
FROM Salesman S 
full JOIN Customer c 
    ON s.salesman_id = c.salesman_id
	where s.city <> c.city and s.commission > 0.12

--23. From the following tables write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission. 

------------------------------------------------------------------ REPATED ---------------------------------------------------------------

--24. Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned. 
SELECT   s.salesman_id ,c.salesman_id,o.salesman_id
FROM Salesman S 
 JOIN Customer c 
    ON s.salesman_id = c.salesman_id
    JOIN Orders o
	   ON s.salesman_id = o.salesman_id


--25. From the following tables write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id. 
SELECT   C.customer_id,  c.cust_name,c.city as cust_city,c.grade,S.name,S.city as sales_city
FROM Salesman S 
  JOIN Customer c 
    ON s.salesman_id = c.salesman_id

ORDER BY c.customer_id ASC;

--26. From the following tables write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id. 
SELECT  C.cust_name,c.city as cust_city,c.grade,S.name,S.city as sales_city
FROM Salesman S 
  JOIN Customer c 
    ON s.salesman_id = c.salesman_id
    
WHERE C.grade<300

--27. Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not. 


SELECT  C.cust_name,c.city as cust_city,O.ord_date,O.purch_amt
FROM  Customer c 
    JOIN Orders o
	   ON C.customer_id = o.customer_id
ORDER BY O.ord_date ASC;

--28. SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves. 
SELECT  C.cust_name,c.city as cust_city,O.ord_date,O.purch_amt,s.name,s.commission
FROM  Customer c   

    JOIN Orders o
	   ON C.customer_id = o.customer_id
JOIN Salesman s 
    ON s.salesman_id = c.salesman_id

--29. Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers.


SELECT  C.cust_name,c.city as cust_city,s.name,s.commission
FROM  Customer c 

 JOIN Salesman s 
    ON s.salesman_id = c.salesman_id

--30. From the following tables write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount.






------------------------------------------------------------------ REPATED ---------------------------------------------------------------

--31. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. 
--The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier. 


SELECT C.salesman_id
FROM Customer C 

    JOIN Orders o
	   ON C.customer_id = o.customer_id 
GROUP BY  C.salesman_id
 HAVING COUNT(C.salesman_id) > 1   


--32.For those customers from the existing list who put one or more orders, or which orders have been placed by the customer who is not on the list, create a report containing the customer name, city, order number, order date, and purchase amount 
 

--33. Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade.
SELECT * FROM Salesman
SELECT * FROM Customer
SELECT * FROM Orders
SELECT * FROM Company_mast 
SELECT * FROM item_mast
SELECT * FROM DEPARTMENT
SELECT * FROM EMP_DETAILS
SELECT C.salesman_id
FROM Customer C 


    JOIN Orders o
	   ON C.customer_id = o.customer_id 
GROUP BY  C.salesman_id
 HAVING COUNT(C.salesman_id) > 1 

--34. Write a SQL query to combine each row of the salesman table with each row of the customer table.
--35. Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city.
--36. Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for every customer and vice versa for those salesmen who belong to a city and customers who require a grade.
--37. Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear for all customers and vice versa for those salesmen who must belong to a city which is not the same as his customer and the customers should have their own grade. 
--38. From the following tables write a SQL query to select all rows from both participating tables as long as there is a match between pro_com and com_id.


--39. Write a SQL query to display the item name, price, and company name of all the products. 

;WITH Cte AS(
    SELECT *,
        RN = DENSE_RANK() 
    FROM Company_mast co
)
SELECT
  I.PRO_COM  
FROM item_mast i 


SELECT AVG(I.PRO_PRICE),CO.COM_NAME,I.PRO_NAME  FROM item_mast i 

    JOIN Company_mast co
	   ON co.COM_ID=i.PRO_COM
	   GROUP BY   CO.COM_NAME

SELECT (SELECT AVG(PRO_PRICE) FROM Company_mast CC WHERE I.PRO_COM =CC.COM_ID  GROUP BY I.PRO_NAME)
FROM item_mast i
    JOIN Company_mast co
	   ON co.COM_ID=i.PRO_COM
	   GROUP BY   CO.COM_NAME

--40. From the following tables write a SQL query to  calculate the average price of items of each company. Return average value and company name. 
SELECT * FROM Salesman
SELECT * FROM Customer
SELECT * FROM Orders
SELECT * FROM Company_mast 
SELECT * FROM item_mast
SELECT * FROM DEPARTMENT
SELECT * FROM EMP_DETAILS

SELECT C.COM_NAME,I.PRO_PRICE,
FROM Company_mast C

JOIN item_mast I
  ON C.COM_ID=I.PRO_COM
--41. From the following tables write a SQL query to calculate and find the average price of items of each company higher than or equal to Rs. 350. Return average value and company name.
--42. From the following tables write a SQL query to find the most expensive product of each company. Return pro_name, pro_price and com_name.
--43. From the following tables write a SQL query to display all the data of employees including their department. 


--44. From the following tables write a SQL query to display the first and last names of each employee, as well as the department name and sanction amount. 
--45. From the following tables write a SQL query to find the departments with budgets more than Rs. 50000 and display the first name and last name of employees. 
--46. From the following tables write a SQL query to find the names of departments where more than two employees are employed. Return dpt_name. 
SELECT * FROM Salesman
SELECT * FROM Customer
SELECT * FROM Orders
SELECT * FROM Company_mast 
SELECT * FROM item_mast
SELECT * FROM DEPARTMENT
SELECT * FROM EMP_DETAILS


SELECT D.DPT_NAME, COUNT(E.EMP_FNAME)
FROM  DEPARTMENT D 
    JOIN EMP_DETAILS E
	   ON D.DPT_CODE = E.EMP_DEPT


--47. From the following tables write a SQL query to find the names of departments where the department name has two letters. Return dpt_name. 
SELECT DPT_NAME FROM DEPARTMENT
WHERE DPT_NAME LIKE '__'

--48. From the following tables write a SQL query to find the names of customers where the customer name eds with ‘n’. Return cust_name.
SELECT cust_name
FROM Customer
WHERE cust_name LIKE '%n'
	


--49. From the following tables write a SQL query to find the names of departments, cutomer id and order id. 


SELECT D.DPT_NAME,C.customer_id,O.ord_no
FROM Orders O,
DEPARTMENT D,
Customer C








--50. From the following tables write a SQL query to find cutomer name and order id where the order was purchased on October
SELECT  C.cust_name,o.ord_no
FROM  Customer c 

 JOIN Salesman s 
    ON s.salesman_id = c.salesman_id

	 JOIN Orders o
	   ON C.customer_id = o.customer_id
	   where FORMAT(o.ord_date,'MMMM') = 'October'


	    