create database Practice;
use Practice;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY ,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY bigint,
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, 14-02-20 , 'HR'),
		(002, 'Niharika', 'Verma', 80000, 14-06-11, 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, 14-02-20, 'HR'),
		(004, 'Amitabh', 'Singh', 500000, 14-02-20, 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, 14-06-11, 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, 4-06-11, 'Account'),
		(007, 'Satish', 'Kumar', 75000, 14-01-20, 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, 14-04-11, 'Admin');


CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT BIGINT,
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, 16-02-20),
		(002, 3000, 16-06-11),
		(003, 4000, 16-02-20),
		(001, 4500, 16-02-20),
		(002, 3500, 16-06-11);

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');

 select WORKER_ID from Worker;

 select distinct department from Worker;

 select upper(FIRST_NAME) from Worker;

 select SUBSTRING(FIRST_Name, 1, 3) from Worker;

SELECT DEPARTMENT, COUNT(WORKER_ID) FROM Worker GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID)<5;

SELECT DEPARTMENT,COUNT(WORKER_ID) AS 'NUMBER-OF-WORKERS' FROM Worker GROUP BY DEPARTMENT;

SELECT * FROM WORKER WHERE WORKER_ID = (SELECT MAX(WORKER_ID) FROM Worker);

SELECT * FROM Worker WHERE WORKER_ID = (SELECT MIN(WORKER_ID) FROM Worker);

select LTRIM(Department) from Worker;

select distinct len(Department) from worker;

select replace(first_name, 'a', 'A')from Worker;

select concat(first_name, '', last_name) as 'Full name' from Worker;

select * from Worker order by FIRST_NAME asc;

select * from Worker where FIRST_NAME not in ('vipul', 'satish');

select * from worker where first_name like '%a%';

select * from worker where first_name like 'a%'; 

select * from worker where first_name like '----h'; 

select * from worker where salary between 10000 and 100000; 

select * from worker where DEPARTMENT = 'Ádmin'; 

select CONCAT(first_name, ' ', last_name) as 'worker_name', salary from worker where WORKER_ID in
(select WORKER_ID from Worker where SALARY between 50000 and 100000);

select department , count(worker_id) as 'No. of Workers' from worker group by DEPARTMENT order by [No. of Workers] desc;

(select * from Worker)
intersect
(select * from worker clone);

(select * from Worker)
minus
(select * from Title);

select * from worker w1 where (4 = (select count (disctict (w2.salary)from worker w where w2.salary>=w1.SALARY));

select distinct w.worker_id, w.first_name, w.salary from worker w, worker w1 where w.salary = w1.salary and w.worker_id!=w1.worker_id;

select first_name, department from worker w where 
w.DEPARTMENT = 'HR'
union all
select first_name, department from worker w1 where w1.DEPARTMENT='HR';
 
 select * from worker 
 where WORKER_ID <= (select count (worker_id)/2 from Worker);

 select Department, count(WORKER_ID) as 'number of workers' group by department having count (worker_id)<5;

 select Department, count(WORKER_ID) as 'number of workers' group by department ;

 select * from worker where WORKER_ID=(select max(worker_id)from worker);

 select * from worker where WORKER_ID=(select min(worker_id)from worker);

 select * from worker where WORKER_ID<=5
 union
 select * from (select * from worker w order by w.worker_id desc) as w.worker_id<=5;

 select t.department , t.first_name, t.SALARY from
 (select max(salary) as 'totalsalary', department from worker group by department)as tempnew inner join worker t
 on tempnew.department=t.DEPARTMENT and 
 tempnew.totalsalary=t.SALARY;
 

 select distinct salary from worker a where 3 >= (select count(distinct salary) from worker b where a.salary<=b.salary) order by a.salary desc;

 select department, sum(salary) from worker group by DEPARTMENT;


 select first_name, salary from worker where salary = (select max(salary) from Worker);