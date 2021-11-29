-- 24 Order by

USE mydb;
SELECT * FROM emp;
-- Increment sal by 7% who is a manager and display records in descending of sal?
SELECT SAL as ORIGSAL, (SAL *1.75) as INCRSAL FROM EMP
WHERE JOB = 'MANAGER'
ORDER BY SAL DESC;

-- Display eno and ename who have sal between 2000 and 3000. Display the records order by empno 
-- in ascending?
SELECT EMPNO AS ENO, ENAME FROM EMP
WHERE SAL BETWEEN 2000 AND 3000
ORDER BY EMPNO;

-- Display unique records of empno and job who are from dept 10 or 20?
SELECT DISTINCT EMPNO , JOB , DEPTNO FROM EMP
WHERE DEPTNO IN(10,20)
ORDER BY DEPTNO;

-- Display unique jobs from emp except manager?
SELECT DISTINCT  JOB , DEPTNO FROM EMP
WHERE JOB != 'MANAGER'
ORDER BY DEPTNO;