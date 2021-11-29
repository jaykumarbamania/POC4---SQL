-- Fetching (select queries only):
-- Use database mydb and emp table from it:



USE mydb;

SELECT * FROM emp;

-- Decrement sal by 5% who is a clerk?
SELECT JOB,SAL as ORIGSAL, (0.95*SAL) as DECRSAL FROM EMP
WHERE JOB = 'CLERK';

-- Display eno and ename who have sal between 2000 and 3000?
SELECT EMPNO as ENO, ENAME FROM EMP
WHERE SAL BETWEEN 2000 AND 3000 ;

-- Display eno and job who are from dept 10 or 20?
SELECT EMPNO as ENO, JOB FROM EMP
WHERE DEPTNO IN(20,10) ;

-- Display eno,mgr who have salary > 2000 or deptno > 10 or job is clerk?
SELECT EMPNO as ENO, MGR FROM EMP
WHERE SAL>2000 OR DEPTNO>10 OR JOB='CLERK';

-- Increment sal by 15% who is not reporting to any one?
SELECT ENAME, JOB, SAL as ORi, SAL as INCRSAL FROM EMP
WHERE MGR IS NULL AND COMM IS NULL;