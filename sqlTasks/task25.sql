--  Group by

USE mydb;
SELECT * FROM emp;
-- 1. Count total no. of emps?
SELECT COUNT(*) AS TOTAL_EMP FROM EMP;

-- 2. Count dept wise total emps?
SELECT COUNT(DEPTNO) AS TOTAL_DEPTS, DEPTNO FROM EMP
GROUP BY DEPTNO;

-- 3. Display min salary of emps?
SELECT MIN(SAL) AS MINSAL FROM EMP;

-- 4. Display the max salary of each dept?
SELECT MAX(SAL) AS MAXSAL, DEPTNO FROM EMP
GROUP BY DEPTNO;

-- 5. Count people have salary > 2000?
SELECT COUNT(*) FROM EMP
WHERE SAL>2000;

-- 6. Count people from each dept have salary < 3000?
SELECT DEPTNO,COUNT(*) FROM EMP
WHERE SAL<3000
GROUP BY DEPTNO;

-- 7. Display dept has < 3 people.
SELECT DEPTNO,COUNT(*) AS PEOPLES FROM EMP
GROUP BY DEPTNO
HAVING PEOPLES<=3;

-- 8. Display deptno where dept's max(sal) > 3000?
SELECT DEPTNO , MAX(SAL) AS MAXSAL FROM EMP
GROUP BY DEPTNO
HAVING MAXSAL >3000;