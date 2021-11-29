-- 29. Procedure and Function:
-- 1. Create a procedure to Display employees experience level with company. (With In as Empid and 
-- Out as Level)
-- If worked more than 2 and less than 4 years - Middle
-- If worked more than 4 years - Seniour
-- else Juniour


-- select * from emp;
-- -- DROP PROCEDURE MYDB.experienceLvl;
DELIMITER // 
CREATE PROCEDURE experienceLvl(IN empId Varchar(20), OUT levelVar varchar(50))
BEGIN
DECLARE experience Varchar(20);
SELECT DATE_FORMAT(NOW(), '%Y') - DATE_FORMAT(hiredate, '%Y') INTO experience
 FROM EMP WHERE empno = empId;
IF experience > 2 AND experience <= 4 THEN
SET levelVar = 'Middle';
ELSEIF experience > 4 THEN
SET levelVar = 'Senior';
ELSE
SET levelVar = 'Junior';
END IF;
END //
DELIMITER ;
use mydb;
select * from emp;
CALL experienceLvl(1212,@expLvl);
SELECT @expLvl as ExperienceLevel;

-- 2. Create a function to give incremented salary value if passed Int and Percentage parameter.
-- salIncre(2000,10) --> Output 2200 (10% incremented)

DELIMITER $$
CREATE FUNCTION salIncre( sal INT , percent INT ) 
RETURNS Int(20)
DETERMINISTIC
BEGIN
		DECLARE result VARCHAR(20);
        SET result = sal + sal*(percent/100);
        RETURN result;
END $$

SELECT salIncre(3000,10) as IncrSal;