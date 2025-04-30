-- EMPLOYEE Schema
-- Field     | Type            | NULL | KEY | DEFAULT
-- ------------------------------------------------------
-- Eno       | Char(3)         | NO   | PRI | NIL
-- Ename     | Varchar(50)     | NO   |     | NIL
-- Job_type  | Varchar(50)     | NO   |     | NIL
-- Manager   | Char(3)         | YES  | FK  | NIL
-- Hire_date | Date            | NO   |     | NIL
-- Dno       | Integer         | YES  | FK  | NIL
-- Commission| Decimal(10,2)   | YES  |     | NIL
-- Salary    | Decimal(7,2)    | NO   |     | NIL

-- DEPARTMENT Schema
-- Field     | Type            | NULL | KEY | DEFAULT
-- ------------------------------------------------------
-- Dno       | Integer         | NO   | PRI | NULL
-- Dname     | Varchar(50)     | YES  |     | NULL
-- Location  | Varchar(50)     | YES  |     | New Delhi


-- 1. Query to display Employee Name, Job, Hire Date, Employee Number; for each employee with Employee Number appearing first.
-- Displays Employee Name, Job Type, Hire Date, and Employee Number.

-- 2. Query to display unique Jobs from the Employee Table.
-- Retrieves a list of distinct job types from the Employee table.

-- 3. Query to display the Employee Name concatenated by a Job separated by a comma.
-- Concatenates Employee Name and Job, separated by a comma.

-- 4. Query to display all the data from the Employee Table. Separate each Column by a comma and name the column as THE_OUTPUT.
-- Concatenates all columns into a single output column, labeled as THE_OUTPUT.

-- 5. Query to display the Employee Name and Salary of all the employees earning more than $2850.
-- Retrieves Employee Name and Salary for employees whose salary is greater than 2850.

-- 6. Query to display Employee Name and Department Number for the Employee No = 7900.
-- Retrieves Employee Name and Department Number for employee with Eno = 7900.

-- 7. Query to display Employee Name and Salary for all employees whose salary is not in the range of $1500 and $2850.
-- Retrieves Employee Name and Salary for employees whose salary is outside the range of $1500 and $2850.

-- 8. Query to display Employee Name and Department No. of all the employees in Dept 10 and Dept 30 in the alphabetical order by name.
-- Retrieves Employee Name and Department Number for employees in departments 10 and 30, sorted by name.

-- 9. Query to display Name and Hire Date of every Employee who was hired in 1981.
-- Retrieves Employee Name and Hire Date for employees hired in 1981.

-- 10. Query to display Name and Job of all employees who don’t have a current Manager.
-- Retrieves Employee Name and Job Type for employees who don't have a manager.

-- 11. Query to display the Name, Salary and Commission for all the employees who earn commission.
-- Retrieves Employee Name, Salary, and Commission for employees who have a commission.

-- 12. Sort the data in descending order of Salary and Commission.
-- Sorts all employee records in descending order based on Salary and Commission.

-- 13. Query to display Name of all the employees where the third letter of their name is ‘A’.
-- Retrieves Employee Names where the third letter of their name is 'A'.

-- 14. Query to display Name of all employees either have two ‘R’s or have two ‘A’s in their name and are either in Dept No = 30 or their Manager’s Employee No = 7788.
-- Retrieves Employee Names who have two 'R's or two 'A's in their name and are either in Dept 30 or have Manager Eno = 7788.

-- 15. Query to display Name, Salary and Commission for all employees whose Commission amount is 14 greater than their Salary increased by 5%.
-- Retrieves Employee Name, Salary, and Commission for employees where the commission is 14 more than salary increased by 5%.

-- 16. Query to display the Current Date.
-- Displays the current date from the system.

-- 17. Query to display Name, Hire Date and Salary Review Date which is the 1st Monday after six months of employment.
-- Displays Employee Name, Hire Date, and Salary Review Date, which is the first Monday after 6 months from Hire Date.

-- 18. Query to display Name and calculate the number of months between today and the date each employee was hired.
-- Calculates the number of months between the current date and the employee's hire date.

-- 19. Query to display the following for each employee <E-Name> earns < Salary> monthly but wants < 3 * Current Salary >. Label the Column as Dream Salary.
-- Displays a sentence stating the current and dream salary (3 times the current salary), with the column labeled Dream Salary.

-- 20. Query to display Name with the 1st letter capitalized and all other letter lower case and length of their name of all the employees whose name starts with ‘J’, ’A’ and ‘M’.
-- Retrieves Employee Names with the first letter capitalized and the length of their names, where names start with J, A, or M.

-- 21. Query to display Name, Hire Date and Day of the week on which the employee started.
-- Displays Employee Name, Hire Date, and the day of the week the employee was hired.

-- 22. Query to display Name, Department Name and Department No for all the employees.
-- Retrieves Employee Name, Department Name, and Department Number for all employees.

-- 23. Query to display Unique Listing of all Jobs that are in Department # 30.
-- Displays a list of unique job types for employees in Department 30.

-- 24. Query to display Name, Dept Name of all employees who have an ‘A’ in their name.
-- Retrieves Employee Name and Department Name for employees whose name contains 'A'.

-- 25. Query to display Name, Job, Department No. And Department Name for all the employees working at the Dallas location.
-- Retrieves Employee Name, Job Type, Department Number, and Department Name for employees working at Dallas.

-- 26. Query to display Name and Employee no. Along with their Manger’s Name and the Manager’s employee no; along with the Employees’ Name who do not have a Manager.
-- Displays Employee Name, Employee No, their Manager's Name, Manager's Employee No, and Employees without a Manager.

-- 27. Query to display Name, Dept No. And Salary of any employee whose department No. and salary matches both the department no. And the salary of any employee who earns a commission.
-- Retrieves Employee Name, Department Number, and Salary for employees whose department and salary match those of an employee who earns a commission.

-- 28. Query to display Name and Salaries represented by asterisks, where each asterisk (*)
-- signifies $100.
-- Represents Employee Salary as asterisks, where each asterisk represents $100.

-- 29. Query to display the Highest, Lowest, Sum and Average Salaries of all the employees.
-- Retrieves the highest, lowest, total sum, and average salary of all employees.

-- 30. Query to display the number of employees performing the same Job type functions.
-- Counts the number of employees for each job type.

-- 31. Query to display the no. of managers without listing their names.
-- Displays the number of employees who are managers, without listing their names.

-- 32. Query to display the Department Name, Location Name, No. of Employees and the average salary for all employees in that department.
-- Displays Department Name, Location, Employee Count, and Average Salary for each department.

-- 33. Query to display Name and Hire Date for all employees in the same dept. as Blake.
-- Retrieves Employee Name and Hire Date for employees in the same department as Blake.

-- 34. Query to display the Employee No. And Name for all employees who earn more than the average salary.
-- Retrieves Employee No and Name for employees whose salary is greater than the average salary.

-- 35. Query to display Employee Number and Name for all employees who work in a department with any employee whose name contains a ‘T’.
-- Retrieves Employee Number and Name for employees working in departments that have an employee whose name contains 'T'.

-- 36. Query to display the names and salaries of all employees who report to King.
-- Displays Employee Names and Salaries for employees who report to King.

-- 37. Query to display the department no, name and job for all employees in the Sales department.
-- Retrieves Department Number, Department Name, and Job Type for employees in the Sales department.

-- ===================================
-- STEP 1: SCHEMA DEFINITION
-- ===================================

DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS DEPARTMENT;

CREATE TABLE DEPARTMENT (
    Dno INTEGER PRIMARY KEY,
    Dname VARCHAR(50),
    Location VARCHAR(50) DEFAULT 'New Delhi'
);

CREATE TABLE EMPLOYEE (
    Eno CHAR(3) PRIMARY KEY,
    Ename VARCHAR(50) NOT NULL,
    Job_type VARCHAR(50) NOT NULL,
    Manager CHAR(3),
    Hire_date DATE NOT NULL,
    Dno INTEGER,
    Commission DECIMAL(10,2),
    Salary DECIMAL(7,2) NOT NULL,
    FOREIGN KEY (Manager) REFERENCES EMPLOYEE(Eno),
    FOREIGN KEY (Dno) REFERENCES DEPARTMENT(Dno)
);

-- ===================================
-- STEP 2: SAMPLE DATA INSERTION
-- ===================================

INSERT INTO DEPARTMENT VALUES (10, 'Accounting', 'New York');
INSERT INTO DEPARTMENT VALUES (20, 'Research', 'Dallas');
INSERT INTO DEPARTMENT VALUES (30, 'Sales', 'Chicago');
INSERT INTO DEPARTMENT VALUES (40, 'Operations', 'Boston');

INSERT INTO EMPLOYEE VALUES ('7839', 'King', 'President', NULL, '1981-11-17', 10, NULL, 5000);
INSERT INTO EMPLOYEE VALUES ('7566', 'Jones', 'Manager', '7839', '1981-04-02', 20, NULL, 2975);
INSERT INTO EMPLOYEE VALUES ('7698', 'Blake', 'Manager', '7839', '1981-05-01', 30, NULL, 2850);
INSERT INTO EMPLOYEE VALUES ('7782', 'Clark', 'Manager', '7839', '1981-06-09', 10, NULL, 2450);
INSERT INTO EMPLOYEE VALUES ('7788', 'Scott', 'Analyst', '7566', '1982-12-09', 20, NULL, 3000);
INSERT INTO EMPLOYEE VALUES ('7902', 'Ford', 'Analyst', '7566', '1981-12-03', 20, NULL, 3000);
INSERT INTO EMPLOYEE VALUES ('7844', 'Turner', 'Salesman', '7698', '1981-09-08', 30, 0.00, 1500);
INSERT INTO EMPLOYEE VALUES ('7900', 'James', 'Clerk', '7698', '1981-12-03', 30, NULL, 950);
INSERT INTO EMPLOYEE VALUES ('7654', 'Martin', 'Salesman', '7698', '1981-09-28', 30, 1400.00, 1250);
INSERT INTO EMPLOYEE VALUES ('7499', 'Allen', 'Salesman', '7698', '1981-02-20', 30, 300.00, 1600);
INSERT INTO EMPLOYEE VALUES ('7521', 'Ward', 'Salesman', '7698', '1981-02-22', 30, 500.00, 1250);
INSERT INTO EMPLOYEE VALUES ('7934', 'Miller', 'Clerk', '7782', '1982-01-23', 10, NULL, 1300);

-- ===================================
-- STEP 3: EXECUTE ALL 37 QUERIES
-- ===================================

-- 1
SELECT Eno, Ename, Job_type, Hire_date FROM EMPLOYEE;

-- 2
SELECT DISTINCT Job_type FROM EMPLOYEE;

-- 3
SELECT CONCAT(Ename, ', ', Job_type) AS EMP_JOB FROM EMPLOYEE;

-- 4
SELECT CONCAT_WS(', ', Eno, Ename, Job_type, Manager, Hire_date, Dno, Commission, Salary) AS THE_OUTPUT FROM EMPLOYEE;

-- 5
SELECT Ename, Salary FROM EMPLOYEE WHERE Salary > 2850;

-- 6
SELECT Ename, Dno FROM EMPLOYEE WHERE Eno = '7900';

-- 7
SELECT Ename, Salary FROM EMPLOYEE WHERE Salary NOT BETWEEN 1500 AND 2850;

-- 8
SELECT Ename, Dno FROM EMPLOYEE WHERE Dno IN (10, 30) ORDER BY Ename;

-- 9
SELECT Ename, Hire_date FROM EMPLOYEE WHERE YEAR(Hire_date) = 1981;

-- 10
SELECT Ename, Job_type FROM EMPLOYEE WHERE Manager IS NULL;

-- 11
SELECT Ename, Salary, Commission FROM EMPLOYEE WHERE Commission IS NOT NULL AND Commission > 0;

-- 12
SELECT * FROM EMPLOYEE ORDER BY Salary DESC, Commission DESC;

-- 13
SELECT Ename FROM EMPLOYEE WHERE SUBSTRING(Ename, 3, 1) = 'A';

-- 14
SELECT Ename FROM EMPLOYEE 
WHERE 
    (Ename LIKE '%R%R%' OR Ename LIKE '%A%A%')
    AND (Dno = 30 OR Manager = '7788');

-- 15
SELECT Ename, Salary, Commission 
FROM EMPLOYEE 
WHERE Commission = ROUND(Salary * 1.05 + 14, 2);

-- 16
SELECT CURRENT_DATE() AS Today;

-- 17
SELECT 
  Ename, 
  Hire_date,
  DATE_ADD(DATE_ADD(Hire_date, INTERVAL 6 MONTH), 
     INTERVAL (8 - DAYOFWEEK(DATE_ADD(Hire_date, INTERVAL 6 MONTH))) % 7 DAY
  ) AS Review_Date
FROM EMPLOYEE;

-- 18
SELECT Ename, TIMESTAMPDIFF(MONTH, Hire_date, CURRENT_DATE()) AS Months_Employed FROM EMPLOYEE;

-- 19
SELECT CONCAT(Ename, ' earns ', Salary, ' monthly but wants ', 3 * Salary) AS "Dream Salary" FROM EMPLOYEE;

-- 20
SELECT 
  CONCAT(UPPER(LEFT(Ename, 1)), LOWER(SUBSTRING(Ename, 2))) AS Name_Formatted,
  LENGTH(Ename) AS Name_Length
FROM EMPLOYEE
WHERE LEFT(Ename, 1) IN ('J', 'A', 'M');

-- 21
SELECT Ename, Hire_date, DAYNAME(Hire_date) AS Day_of_Week FROM EMPLOYEE;

-- 22
SELECT Ename, Dname, EMPLOYEE.Dno FROM EMPLOYEE 
JOIN DEPARTMENT ON EMPLOYEE.Dno = DEPARTMENT.Dno;

-- 23
SELECT DISTINCT Job_type FROM EMPLOYEE WHERE Dno = 30;

-- 24
SELECT Ename, Dname FROM EMPLOYEE 
JOIN DEPARTMENT ON EMPLOYEE.Dno = DEPARTMENT.Dno 
WHERE Ename LIKE '%A%';

-- 25
SELECT Ename, Job_type, EMPLOYEE.Dno, Dname 
FROM EMPLOYEE 
JOIN DEPARTMENT ON EMPLOYEE.Dno = DEPARTMENT.Dno 
WHERE Location = 'Dallas';

-- 26
SELECT 
  E.Ename AS Employee, 
  E.Eno AS Emp_No, 
  M.Ename AS Manager, 
  M.Eno AS Manager_No
FROM EMPLOYEE E
LEFT JOIN EMPLOYEE M ON E.Manager = M.Eno;

-- 27
SELECT Ename, Dno, Salary 
FROM EMPLOYEE 
WHERE (Dno, Salary) IN (
  SELECT Dno, Salary FROM EMPLOYEE WHERE Commission IS NOT NULL AND Commission > 0
);

-- 28
SELECT Ename, REPEAT('*', Salary / 100) AS Salary_Asterisks FROM EMPLOYEE;

-- 29
SELECT 
  MAX(Salary) AS Highest,
  MIN(Salary) AS Lowest,
  SUM(Salary) AS Total,
  AVG(Salary) AS Average
FROM EMPLOYEE;

-- 30
SELECT Job_type, COUNT(*) AS Num_Employees FROM EMPLOYEE GROUP BY Job_type;

-- 31
SELECT COUNT(DISTINCT Manager) AS Num_Managers FROM EMPLOYEE WHERE Manager IS NOT NULL;

-- 32
SELECT Dname, Location, COUNT(E.Eno) AS Num_Emp, AVG(Salary) AS Avg_Salary
FROM DEPARTMENT D
LEFT JOIN EMPLOYEE E ON D.Dno = E.Dno
GROUP BY D.Dno;

-- 33
SELECT Ename, Hire_date FROM EMPLOYEE WHERE Dno = (
  SELECT Dno FROM EMPLOYEE WHERE Ename = 'Blake'
);

-- 34
SELECT Eno, Ename FROM EMPLOYEE WHERE Salary > (SELECT AVG(Salary) FROM EMPLOYEE);

-- 35
SELECT Eno, Ename FROM EMPLOYEE WHERE Dno IN (
  SELECT Dno FROM EMPLOYEE WHERE Ename LIKE '%T%'
);

-- 36
SELECT Ename, Salary FROM EMPLOYEE 
WHERE Manager = (SELECT Eno FROM EMPLOYEE WHERE Ename = 'King');

-- 37
SELECT EMPLOYEE.Dno, Dname, Job_type 
FROM EMPLOYEE 
JOIN DEPARTMENT ON EMPLOYEE.Dno = DEPARTMENT.Dno 
WHERE Dname = 'Sales';
