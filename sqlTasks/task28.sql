-- 28.Date Functions:






use mydb;

select * from emp;

-- Display the most seniour employees? (Based on days)
SELECT ENAME, hiredate, DATEDIFF(now(), hiredate) AS 'Days' FROM EMP
HAVING MAX(Days);

-- Give 5% increment to employees who are here since last 3 years?
SELECT ENAME, (SAL*1.05) as INCRSAL, hiredate, DATE_FORMAT(NOW(), '%Y') - DATE_FORMAT(hiredate, '%Y') AS 'YEARS' FROM EMP
HAVING YEARS <= 3;

-- Give 7% increment to employees who are here since last 5 years and salary < 2000?
SELECT ENAME, (SAL*1.07) as INCRSAL, hiredate, DATE_FORMAT(NOW(), '%Y') - DATE_FORMAT(hiredate, '%Y') AS 'YEARS' FROM EMP
WHERE sal<2000
HAVING YEARS <= 5;

-- Display yearly report which shows year wise no. of joinings?
SELECT ENAME, DATE_FORMAT(hiredate, '%Y') AS 'YEAR', COUNT(*) as JOININGS 
FROM EMP GROUP BY YEAR 
ORDER BY YEAR;

-- Create a seperate table from existing emp table 
-- for emps who have recently joined (i.e. last year).
create table lastyearemp select * from emp where year(hiredate)>=year(NOW())-1;
select * from lastyearemp;
drop table lastyearemp;