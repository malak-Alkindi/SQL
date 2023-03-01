--DROP TABLE department;
--DROP TABLE employees;
--DROP TABLE salary_grade ;

--CREATE TABLE department (dep_id INTEGER PRIMARY KEY,dep_name VARCHAR(15),dep_location VARCHAR(15));
--CREATE TABLE salary_grade  (grade INTEGER,min_salary INTEGER,max_salary INTEGER,);
--CREATE TABLE  employees (emp_id INTEGER PRIMARY KEY,emp_name VARCHAR(15),job_name VARCHAR(10),manager_id INTEGER,hire_date DATE,salary DECIMAL(10, 2),commission DECIMAL(7,2),dep_id INTEGER FOREIGN KEY REFERENCES department(dep_id));


--INSERT INTO department(dep_id  , dep_name, dep_location) VALUES(1001 , 'FINANCE', 'SYDNEY'),(2001 , 'AUDIT', 'MELBOURNE'),(3001 , 'MARKETING', 'PERTH'),(4001 , 'PRODUCTION', 'BRISBANE');
--INSERT INTO employees VALUES(68319 ,' KAYLING ',' PRESIDENT ',      null      ,' 1991-11-18 ',  6000.00 ,     null       ,   1001),( 66928 ,' BLAZE     ',' MANAGER   ',      68319 ,' 1991-05-01 ',  2750.00 ,      null      ,   3001),( 67832 ,' CLARE     ',' MANAGER   ',      68319 ,' 1991-06-09 ',  2550.00 ,     null       ,   1001),( 65646 ,' JONAS     ',' MANAGER   ',      68319 ,' 1991-04-02 ',  2957.00 ,      null      ,   2001),(  67858 ,' SCARLET   ',' ANALYST   ',      65646 ,' 1997-04-19 ',  3100.00 ,     null       ,   2001),(69062 ,' FRANK     ',' ANALYST   ',      65646 ,' 1991-12-03 ',  3100.00 ,      null      ,   2001),( 63679 ,' SANDRINE  ',' CLERK     ',      69062 ,' 1990-12-18 ',   900.00 ,      null     ,    2001),( 64989 ,' ADELYN    ',' SALESMAN  ',      66928 ,' 1991-02-20 ',  1700.00 ,     400.00 ,   3001),(  65271 ,' WADE      ',' SALESMAN  ',      66928 ,' 1991-02-22 ',  1350.00 ,     600.00 ,   3001),( 66564 ,' MADDEN    ',' SALESMAN  ',      66928 ,' 1991-09-28 ',  1350.00 ,    1500.00 ,   3001),( 68454 ,' TUCKER    ',' SALESMAN  ',      66928 ,' 1991-09-08 ',  1600.00 ,       0.00 ,   3001),( 68736 ,' ADNRES    ',' CLERK     ',      67858 ,'  1997-05-23 ',  1200.00 ,      null      ,   2001),( 69000 ,' JULIUS    ',' CLERK     ',      66928 ,' 1991-12-03 ',  1050.00 ,     null       ,   3001),( 69324 ,' MARKER    ',' CLERK     ',      67832 ,' 1992-01-23 ',  1400.00 ,     null       ,  1001);
--INSERT INTO salary_grade VALUES (1 ,     800 ,    1300),(2 ,    1301 ,    1500), (3 ,    1501 ,    2100), (4 ,    2101 ,    3100),(5 ,    3101 ,    9999);

SELECT * FROM department;
--SELECT * FROM employees;
SELECT * FROM salary_grade;

 --1 Return complete information about the employees
 SELECT * FROM employees;

 --2 Write a SQL query to find the salaries of all employees. Return salary.
 SELECT salary FROM employees;

 --3 Write a SQL query to find the unique designations of the employees. Return job name
 SELECT DISTINCT job_name FROM employees;

 --4 Write a SQL query to list the employees’ name, increased their salary by 15%
  SELECT emp_name,(((salary*15)/100)+salary) as 'raise' FROM employees;

 --5 Write a SQL query to list the employee's name and job name as a format of "Employee & Job"
 SELECT emp_name,job_name as 'Employee & Job' FROM employees;

 --6 Write a SQL query to find those employees with hire date in the format like February 22, 1991. Return employee ID, employee name, salary, hire date.
SELECT emp_ID,emp_name,salary,FORMAT (hire_date, 'dd-MMMM-yy') as date FROM employees;

 --7 Write a SQL query to count the number of employees who have total income more than 2200
SELECT COUNT(salary) FROM employees
where salary >2200

 --8 Write a SQL query to find the unique jobs with their corresponding department id.
 SELECT DISTINCT (job_name),emp_id FROM employees;
-- The SELECT DISTINCT statement is used to return only distinct (different) values.
--Inside a table, a column often contains many duplicate values; and sometimes you only want to list the different (distinct) values.

 --9 Write a SQL query to find those employees who do not belong to the department 2001. Return complete information about the employees.
 SELECT job_name FROM employees
 WHERE dep_id <> 2001;

 --10 Write a SQL query to find those employees who joined before 1991. Return complete information about the employees
SELECT  *   FROM employees
WHERE hire_date >'1991-12-30';

 --11 Write a SQL query to calculate the average salary of employees who work as analysts. Return average salary.
 SELECT salary/( SELECT COUNT(salary)  FROM employees
 WHERE job_name = ' ANALYST') as averagre  FROM employees 



 --12 Write a SQL query to find the details of the employees who's name start start with B or end with E
select emp_name from employees 
where emp_name LIKE 'B%' OR emp_name LIKE '%E'

 --13 Write a SQL query to find the details of the employees who's department name start start with B or end with E
SELECT employees.*, department.dep_name
FROM employees
JOIN department
ON employees.dep_id = department.dep_id
where department.dep_name LIKE 'M%' OR department.dep_name LIKE '%G'

 --14 Write a SQL query to find the details of the employees who's department location start start with F or end with N 
 --SELECT employees.*, department.dep_location
--FROM employees
--JOIN department
--ON employees.dep_id = department.dep_id
-- department.dep_location LIKE 'P%' OR department.dep_location LIKE '%H'

 --15 Write a SQL query to identify employees whose commissions exceed their salaries. Return complete information about the employees, department location and department name
 --SELECT * from employees
 --WHERE commission > salary

-- 16.	 Write a SQL query to identify those employees whose salaries exceed 3000 after receiving a 25% salary increase
  --SELECT emp_name,salary as 'before' ,(((salary*25)/100)+salary) as 'raise' FROM employees
  --WHERE (((salary*25)/100)+salary) > 3000

--17.	 Write a SQL query to find out which employees joined in the month of January. Return complete information about the employees.
--SELECT * FROM employees
 --where FORMAT (hire_date, 'MMMM')='January'



--18.	 Write a SQL query to separate the names of employees and their managers by the string 'works for'.
--SELECT CONCAT(emp_name, ' works for :', manager_id) FROM employees


--19.	 Write a SQL query to find those employees whose designation is ‘CLERK’. Return complete information about the employees.
--SELECT  * FROM employees
--WHERE job_name = ' CLERK     '

--20.	 Write a SQL query to identify employees with more than 27 years of experience. Return complete information about the employees.
--SELECT *   FROM employees
--WHERE (cast(FORMAT(getdate(),'yyyy') as INTEGER) - cast(FORMAT (hire_date,'yyyy') as INTEGER) ) >27



--21.	 Write a SQL query to find those employees whose salaries are less than 3500. Return complete information about the employees.
  --SELECT* FROM employees
  --WHERE salary < 3500

--22.	 Write a SQL query to find the employee whose designation is ‘ANALYST’. Return employee name, job name and salary.
  --SELECT emp_name ,job_name,salary FROM employees
 -- WHERE UPPER(job_name) LIKE '%ANALYST%'

--23.	 Write a SQL query to identify those employees who joined the company in 1991. Return complete information about the employees.
--SELECT * FROM employees
 --where FORMAT (hire_date, 'yyy')='1991'

--24.	 Write a SQL query to identify those employees who joined the company after 1991. Return complete information about the employees.
--SELECT * FROM employees
 --where FORMAT (hire_date, 'yyy')>'1991'

--25.	 Write a SQL query to find those employees who joined before 1st April 1991. Return employee ID, employee name, hire date and salary.
--SELECT *  ,FORMAT (hire_date, 'dd MMMM yyyy') FROM employees
--where FORMAT (hire_date, 'd MMMM yyyy') < '1 April 1991'

--26.	 Write a SQL query identify the employees who do not report to a manager. Return employee name, job name.
--SELECT * FROM employees
--where manager_iD IS NULL

--27.	 Write a SQL query to find the employees who joined on the 1st of May 1991. Return complete information about the employees.
--SELECT *  ,FORMAT (hire_date, 'dd MMMM yyyy') FROM employees
--where FORMAT (hire_date, 'd MMMM yyyy') = '1 May 1991'

--28.	 Write a SQL query to identify the experience of the employees who work under the manager whose ID number is 68319. Return employee ID, employee name, salary, experience
--SELECT *  , (cast(FORMAT(getdate(),'yyyy') as INTEGER) - cast(FORMAT (hire_date,'yyyy') as INTEGER) ) as 'experience' FROM employees
--WHERE manager_id=68319

--29.	 Write a SQL query to find out which employees earn more than 100 per day as a salary. Return employee ID, employee name, salary, and experience.
--SELECT *  , (cast(FORMAT(getdate(),'yyyy') as INTEGER) - cast(FORMAT (hire_date,'yyyy') as INTEGER) ) as 'experience' FROM employees
--WHERE (salary/30)>300

--30.	 Write a SQL query to identify those employees who retired after 31-Dec-99, completing eight years of service. Return employee name.
--SELECT emp_name   FROM employees
--where  (cast(FORMAT(getdate(),'yyyy') as INTEGER) - 1999)>8 

--31.	 Write a SQL query to identify the employees whose salaries are odd. Return complete information about the employee
--SELECT *  , (cast(FORMAT(getdate(),'yyyy') as INTEGER) - cast(FORMAT (hire_date,'yyyy') as INTEGER) ) as 'experience' FROM employees
--WHERE (salary%2)>0

--32.	 Write a SQL query to identify employees whose salaries contain only three digits. Return complete information about the employees.
--SELECT *  FROM employees
--WHERE LEN(cast(salary as int)) =3

--33.	 Write a SQL query to find those employees who joined in the month of APRIL. Return complete information about the employees
--SELECT *   FROM employees
--WHERE  UPPER ( FORMAT(hire_date,'MMMM')) ='APRIL'

--34.	 Write a SQL query to find out which employees joined the company before the 19th of the month. Return complete information about the employees
--SELECT *   FROM employees
--WHERE DAY(hire_date) <'19'

--35.	 Write a SQL query to identify those employees who have been working as a SALESMAN and month portion of the experience is more than 10. Return complete information about the employees.
--SELECT * ,  12-month(hire_date) FROM employees
--WHERE 12-month(hire_date) >10 AND job_name LIKE '%SALESMAN'

--36.	 Write a SQL query to find those employees of department id 3001 or 1001 and joined in the year 1991. Return complete information about the employees.
--SELECT *  FROM employees
--WHERE (dep_id =3001 or dep_id=1001) and year(hire_date)=1991

--37.	 Write a SQL query to find the employees who are working for the department ID 1001 or 2001. Return complete information about the employees.
--SELECT *  FROM employees
--WHERE (dep_id =2001 or dep_id=1001)

--38.	 Write a SQL query to find those employees whose designation is ‘CLERK’ and work in the department ID 2001. Return complete information about the employees.
--SELECT *  FROM employees
--WHERE  dep_id=1001 and job_name like '%CLERK%'

--39.	 Write a SQL query to find those employees who are either CLERK or MANAGER. Return complete information about the employees.
--SELECT *  FROM employees
--WHERE (job_name like '%MANAGER%') or job_name like '%CLERK%'

--40.	 Write a SQL query to identify those employees who joined in any month other than February. Return complete information about the employees.
--SELECT * ,month(hire_date) FROM employees
--WHERE FORMAT(hire_date,'MMMM')='February'


--41.	 Write a SQL query to identify the employees who joined the company in June 1991. Return complete information about the employees.
--SELECT *  ,FORMAT(hire_date,'MMMM yyyy') FROM employees
--WHERE FORMAT(hire_date,'MMMM yyyy')='June 1991'

--42.	 Write a SQL query to search for all employees with an annual salary between 24000 and 50000 (Begin and end values are included.). Return complete information about the employees.
--SELECT * FROM employees
--where (salary*24 between 24000) AND 50000


--43.	 Write a SQL query to identify all employees who joined the company on 1st May, 20th February, and 3rd December 1991. Return complete information about the employees.
-----------------------------------------------------------

--44.	 Write a SQL query to find out which employees are working under the managers 63679, 68319, 66564, or 69000. Return complete information about the employees.
-----------------------------------------------------------

--45.	 Write a SQL query to find those employees who joined in 90's. Return complete information about the employees.
--SELECT * FROM employees
--where YEAR(hire_date) between 1900 AND 1999

--46.	 Write a SQL query to find those managers who are in the department 1001 or 2001. Return complete information about the employees.
-----------------------------------------------------------

--47.	 Write a SQL query to identify employees who joined in the month of FEBRUARY with a salary range of 1001 to 2000 (Begin and end values are included.). Return complete information about the employees.
-----------------------------------------------------------

--48.	 Write a SQL query to find those employees who joined before or after the year 1991. Return complete information about the employees.
-----------------------------------------------------------

--49.	 Write a SQL query to find employees along with their department details. Return employee ID, employee name, job name, manager ID, hire date, salary, commission, department ID, and department name.
SELECT employees.*, department.dep_name
FROM employees
JOIN department
ON employees.dep_id = department.dep_id

--50.	 Write a SQL query to identify those employees who earn 60000 or more per year or do not work as ANALYST. Return employee name, job name, (12*salary) as Annual Salary, department ID, and grade.
SELECT * FROM employees
where 12*salary >= 60000 and job_name !='ANALYST'


--51.  Write a SQL query to identify employees whose salaries are higher than their managers' salaries. Return employee name, job name, manager ID, salary, manager name, manager's salary
--SELECT * FROM department;
--SELECT * FROM employees;
--SELECT * FROM salary_grade;

SELECT *,  (SELECT emp_name FROM employees WHERE manager_id  = emp_id and job_name !='%managers%') as 'mangers' FROM employees

	------------------------------------------------------------------------------------

--52.	 Write a SQL query to find those employees whose salary is between 2000 and 5000 (Begin and end values are included.) and location is PERTH. Return employee name, department ID, salary, and commission
SELECT employees.*,department.dep_location
FROM employees
JOIN department
ON employees.dep_id = department.dep_id
where (employees.salary between 2000 and 5000) and department.dep_location = 'PERTH'

--53.	 Write a SQL query to find the employees whose department ID is 1001 or 3001 and whose salary grade is not 4. They joined the company before 1992-12-31. Return grade, employee name.

SELECT 
    ROW_NUMBER() OVER (
            ORDER BY salary
    ) row_num, 


*
FROM
    employees
where (employees.dep_id = 1001)

	
SELECT * FROM employees;
SELECT * FROM salary_grade;

SELECT employees.*,department.dep_location
FROM employees
JOIN department
ON employees.dep_id = department.dep_id

where (employees.dep_id = 1001 OR employees.dep_id = 3001)  

--54.	 Write a SQL query to find those employees whose manager name is JONAS. Return employee id, employee name, job name, manager ID, hire date, salary, department ID, employee name.
--55.	 Write a SQL query to find the name and salary of the employee FRANK. Salary should be equal to the maximum salary within his or her salary group.
--56.	 Write a SQL query to search for employees who are working either as a MANAGER or an ANALYST with a salary between 2000 and 5000 (Begin and end values are included.) without commissions. Return complete information about the employees.
--57.	 Write a SQL query to search for employees who are working either as a MANAGER or an ANALYST with a salary between 2000 and 5000 (Begin and end values are included.) without commissions. Return complete information about the employees.
--58.	 From the following table, write a SQL query to find the employees who joined in 1991 and whose department location is SYDNEY or MELBOURNE with a salary range of 2000 to 5000. Return employee ID, employee name, department ID, salary, and department location.
--59.	 Write a SQL query to find the employees of MARKETING department come from MELBOURNE or PERTH, are in grades 3 ,4, and 5 and have at least 25 years of experience. Return department ID, employee ID, employee name, salary, department name, department location and grade.
--60.	 Write a SQL query to find those employees who are senior to their manager. Return complete information about the employees.

SELECT *
FROM employees

where (salary between 2000 and 5000) 

UNION select grade From salary_grade 

SELECT *
FROM employees



UNION select grade From salary_grade 
    