UCCC & SPBCBA & SDHG COLLEGE OF BCA AND I.T.
F.Y.B.C.A. (Sem-2) DBMS (206) 

PRACTICAL JOURNAL: 2019-20

SET - I (Odd Roll Nos.)

Create an EMPLOYEE database and also create the following tables with appropriate constraints and input at least 20 records in EMP table, 05 records in DEPT table, and 10 records in Project table.

Table Name: EMP
Field Name		Field Type	           Constraints
Empno		Number	           Primary Key
Name			Text
Salary			Number
City			Text
Hiredate		Date
Designation		Text
Deptno		Number		Foreign Key
ProjID			Number		Foreign Key

Table Name: DEPT
Field Name		Field Type	           Constraints
Deptno		Number		 Primary Key
DeptName		Text
Description		Text


Table Name: PROJECT
Field Name		Field Type	           Constraints
ProjID			Number	            Primary key
ProjTitle		Text
Duration		Number
ProjManager		Number		 Foreign Key

Solve the following queries.
    1. List all the employees who are working in deptno 20.
    2. List the name, empno and city of purchase department employee.
    3. Find the employees whose salary is greater than 15000.
    4.  List the name and salary of all employees whose project duration is more than 5 years.
    5. Find all employee in department no 3 whose salary is between 10000 to 25000.
    6. Find all employees whose designation is either ‘Manager’ or ‘Supervisor’.
    7. Find all managers who are not in department 30.
    8. Find the details of all ‘manager’ in department no 10 and ‘clerk’.
    9. List the name of project on which no employees are working.
    10. Find the details of all ‘manager’ (work in any department) and all clerks in deptno 20.
    11. Find the name of employees in deptno 20 who is neither a manager nor a clerk.
    12. Find all employees whose name begin with letter ‘M’ and end with letter ‘n’.
    13. Find the employees whose name are five characters long and ends with ‘a’.
    14. Find all employees who have hired in the month of February of any year.
    15. Show the first five character of name of all employees.
    16. For each employee display the number of months passed since the employees joined the Company.
    17. Display the name, job and salary of all the employees sorted on job and salary in descending order.
    18. Increase the salary of employees by 10%.
    19. Delete all records of Peon.
    20. Find the details employee who getting highest salary.
    21. Find the average salary of Managers.
    22. List the total number of employees in the project number 5.
    23. Destroy table PROJECT along with its data.


