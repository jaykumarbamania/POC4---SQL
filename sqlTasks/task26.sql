use mydb;
DROP TABLE emp;


-- 26. Joins (emp+dept):

select * from emp;
select * from dept;

-- 1. Display emp details with 7% increment who belongs to BOSTON location.
SELECT E.ENAME, (E.SAL*1.07) AS INCRSAL,D.LOC from EMP E
INNER JOIN DEPT AS D
ON D.DEPTNO = E.DEPTNO 
WHERE D.LOC= 'BOSTON';

-- 2. Count the no. of employees works for RESEARCH dept.
SELECT COUNT(*) as Ttl_Emps from EMP E
INNER JOIN DEPT AS D
ON D.DEPTNO = E.DEPTNO 
WHERE D.DNAME= 'RESEARCH';

-- 3. Find out the max salary received in SALES dept.

SELECT DISTINCT * FROM EMP  WHERE SAL = 
(SELECT MAX(E.SAL) FROM EMP AS E 
JOIN DEPT AS D
ON D.DEPTNO = E.DEPTNO 
WHERE D.DNAME= 'SALES');

-- 4. Display date of joining of emp whose dept location is not available.
SELECT HIREDATE FROM EMP  WHERE DEPTNO = 
(SELECT D.DEPTNO FROM EMP AS E 
JOIN DEPT AS D
ON D.DEPTNO = E.DEPTNO 
WHERE D.DNAME= '');