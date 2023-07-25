/*Employee table*/
CREATE TABLE EMPLOYEE(
    emp_id varchar(20),
    emp_name varchar(50),
    salary integer,
    dept_id varchar(20),
    manager_id varchar(20)
);

INSERT INTO EMPLOYEE(emp_id,emp_name,salary,dept_id,manager_id)
VALUES ("E1","RAHUL",15000,"D1","M1"),
       ("E2","Manoj",15000,"D1","M1"),
       ("E3","James",52000,"D2","M2"),
       ("E4","Michael",25000,"D2","M2"),
       ("E5","Ali",20000,"D10","M3"),
       ("E6","Robin",35000,"D10","M3");

/*DEPARTMENT TABLE*/
CREATE TABLE DEPARTMENT(
    dept_id varchar(20),
    dept_name varchar(50)
);

INSERT INTO DEPARTMENT(dept_id,dept_name)
VALUES ("D1","IT"),
       ("D2","HR"),
       ("D3","Finance"),
       ("D4","Admin");

/*Manager table */

CREATE TABLE Manager(
    manager_id varchar(20),
    manager_name varchar(50),
    dept_id varchar(20)
);

INSERT INTO Manager(manager_id,manager_name,dept_id)
VALUES ("M1","Prem","D3"),
       ("M2","Shripadh","D4"),
       ("M3","Nick","D1"),
       ("M4","Corey","D1");

/*PROJECTS TABLE*/
CREATE TABLE Projects(
    proj_id varchar(20),
    proj_name varchar(50),
    team_member_id varchar(20)   
);

INSERT INTO Projects(proj_id,proj_name,team_member_id)
VALUES ("P1","Data Migration","E1"),
       ("P1","Data Migration","E2"),
       ("P1","Data Migration","M3"),
       ("P2","ETL TOOL","E1"),
       ("P2","ETL TOOL","M4");

/*COMPANY TABLE*/
CREATE TABLE COMPANY(
   company_id VARCHAR(20),
   company_name varchar(50),
   company_location VARCHAR(50)
);

INSERT INTO COMPANY(company_id,company_name,company_location)
VALUES ("ACC01","Accenture","Hyderabad");

/*FETCH DATA OF RESPECTIVE TABLE*/
SELECT * FROM EMPLOYEE;
/*
   emp_id	emp_name	salary	dept_id	 manager_id
    E1	    RAHUL	    15000	D1	     M1
    E2	    Manoj	    15000	D1	     M1
    E3	    James	    52000	D2	     M2
    E4	    Michael	    25000	D2	     M2
    E5	    Ali	        20000	D10	     M3
    E6	    Robin	    35000	D10	     M3
*/
SELECT * FROM DEPARTMENT;
/*
   dept_id	dept_name
   D1	    IT
   D2	    HR
   D3	    Finance
   D4	    Admin
*/
SELECT * FROM Manager;
/*
   manager_id	manager_name	dept_id
   M1	        Prem	        D3
   M2	        Shripadh	    D4
   M3	        Nick	        D1
   M4	        Corey	        D1
*/
SELECT * FROM PROJECTS;
/*
  proj_id	proj_name	    team_member_id
  P1	    Data Migration	E1
  P1	    Data Migration	E2
  P1	    Data Migration	M3
  P2	    ETL TOOL	    E1
  P2	    ETL TOOL	    M4
*/

/*FETCH THE EMPLOYEE NAME AND DEPT NAME THEY BELONGS TO*/
SELECT e.emp_name,d.dept_name from EMPLOYEE e inner join DEPARTMENT d on e.dept_id = d.dept_id;
/*
   RAHUL - IT
   MANOJ - IT
   JAMES - HR
   MICHAEL - HR
*/

/*FETCH ALL THE EMPLOYEE NAME AND THEIR DEPT NAME THEY BELONGS TO*/
select e.emp_name,d.dept_name from Employee e left join DEPARTMENT d on e.dept_id = d.dept_id;
/*
   RAHUL - IT
   MANOJ - IT
   JAMES - HR
   MICHAEL - HR
   ALI - NULL
   ROBIN - NULL
*/
/*left join = Inner join + Additional data from left table*/

/*FETCH  ALL DEPT NAME AND THE CORRESPONDING EMPLOYEE NAME */
SELECT e.emp_name,d.dept_name from EMPLOYEE e right join DEPARTMENT d on e.dept_id = d.dept_id;
/*
   RAHUL - IT
   MANOJ - IT
   JAMES - HR
   MICHAEL - HR
   null - FINANCE
   null - Admin
*/

/*FETCH ALL EMPLOYEE NAME THE MANAGERS ,THEIR DEPARTMENT AND THE PROJECTS THEY ARE WORKING ON*/

SELECT e.emp_name,m.manager_name,d.dept_name,p.proj_name 
from Employee e
left join Manager m on e.manager_id = m.manager_id
left join Department d on e.dept_id = d.dept_id
left join Projects p on e.emp_id = p.team_member_id;

/*
emp_name 	manager_name	dept_name	proj_name
RAHUL	      Prem	         IT	        Data Migration
RAHUL	      Prem	         IT	        ETL TOOL
Manoj	      Prem	         IT	        Data Migration
James	      Shripadh	      HR	        null
Michael	   Shripadh	      HR	        null
Ali	      Nick		      null       null
Robin	      Nick		      null       null
*/

/*FETCH ALL EMPLOYEE NAME AND ALL DEPARTMENT NAME*/
SELECT e.emp_name,d.dept_name from Employee e FULL OUTER JOIN DEPARTMENT d on e.emp_id = d.dept_id;

/*
   RAHUL - IT
   MANOJ - IT
   JAMES - HR
   MICHAEL - HR
   ALI - NULL
   ROBIN - NULL
   null - FINANCE
   null - Admin

*/

/*
   FULL OUTER JOIN = MATCHING RECORD OF BOTH TABLE + ADDITIONAL DATA FROM LEFT TABLE + ADDITIONAL DATA FROM RIGHT TABLE
*/

/*CROSS JOIN*/
/*FETCH THE EMPLOYEE NAME AND THEIR CORRESPONDING DEPT_NAME ALONG WITH COMPANY NAME*/

SELECT e.emp_name,d.dept_name,c.company_name,c.company_location
from EMPLOYEE e 
inner join DEPARTMENT d on e.dept_id = d.dept_id
cross join COMPANY c;

/* 
   e.emp_name  d.dept_name  c.company_name  c.company_location
   RAHUL       IT           Accenture       Hyderabad
   MANOJ       IT           Accenture       Hyderabad
   JAMES       HR           Accenture       Hyderabad
   MICHAEL     HR           Accenture       Hyderabad
*/


/*NATURAL JOINS*/
/* In natural join the condition is decided by sql not by user */

SELECT e.emp_name,d.dept_name from Employee e natural join Department d;

/*SELF JOIN*/

CREATE TABLE FAMILY(
   member_id VARCHAR(20),
   name varchar(50),
   age integer,
   parent_id VARCHAR(20)
);

INSERT INTO FAMILY(member_id,name,age,parent_id)
VALUES ("F1","David",4,"F5"),
       ("F2","Carol",10,"F5"),
       ("F3","Michael",12,"F5"),
       ("F4","Johnson",36),
       ("F5","Maryam",40,"F6"),
       ("F6","Stewart",70),
       ("F7","Rohan",6,"F4"),
       ("F8","Asha",8,"F4");  

/*FETCH THE CHILD AND THEIR RESPECTIVE PARENT NAME FROM FAMILY*/
select f1.name as child_name,f2.name AS parent_name from FAMILY f1 JOIN FAMILY f2 on f1.parent_id = f2.member_id;