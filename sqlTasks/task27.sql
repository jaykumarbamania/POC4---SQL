use mydb;

CREATE TABLE `mydb`.`student_info` ( 
	`rno` INT(100) NOT NULL AUTO_INCREMENT ,
	`name` VARCHAR(100) NOT NULL , 
	`city` VARCHAR(50) NOT NULL , 
    PRIMARY KEY (`rno`));

    DROP TABLE student_info;
DESCRIBE student_info;
SELECT * FROM student_info;
    
INSERT INTO student_info(name,city) VALUES ('gautam','jalgaon');
INSERT INTO student_info(name,city) VALUES ('balaji','parbhani');
INSERT INTO student_info(name,city) VALUES ('rushin','jalgaon');

CREATE TABLE `mydb`.`marks` ( 
	`rno` INT(100) NOT NULL ,
	`sub_code` int(100) NOT NULL , 
	`mark` int(50)  );

DROP TABLE marks;

INSERT INTO marks(rno,sub_code,mark) VALUES (1,100,80);
INSERT INTO marks(rno,sub_code,mark) VALUES (2,100,null);
INSERT INTO marks(rno,sub_code,mark) VALUES (1,101,90);
INSERT INTO marks(rno,sub_code,mark) VALUES (2,101,78);
INSERT INTO marks(rno,sub_code,mark) VALUES (3,100,30);
INSERT INTO marks(rno,sub_code,mark) VALUES (3,101,null);
    
SELECT * FROM marks;

CREATE TABLE `mydb`.`subject` ( 
	`sub_code` INT(100) NOT NULL ,
	`sub_name` VARCHAR(100) NOT NULL );
    
INSERT INTO subject(sub_code,sub_name) VALUES (100,'dbms');
INSERT INTO subject(sub_code,sub_name) VALUES (101,'SE');

-- 1.Find out average marks of each student along with roll number of student .
SELECT rno as roll_no,AVG(mark) as avgMarks FROM marks
GROUP BY rno;

-- 2.Find out how many students have failed i.e. obtained less than 40 marks in DBMS.
select count(rno) as failedinDBMS, rno from marks where mark< 40 AND
sub_code=(select sub_code from subject
where sub_name='dbms');

-- 3.Find names of Students who are absent in Exam i.e. students having null marks
SELECT s.rno,s.name,m.sub_code, m.mark from student_info as s 
JOIN marks as m 
ON s.rno = m.rno
WHERE m.mark is null;


-- 4 Find the name of students who live in either ‘pune’ or 'jalgaon’
SELECT * from student_info WHERE city IN ('pune','jalgaon');

-- 5.Find out roll no and total marks of each student.
SELECT rno as roll_no , sum(mark) as total_marks from marks
GROUP BY rno;

-- 6.Find those student names which start with 'ba'.
SELECT * FROM student_info WHERE name like 'ba%';

-- 7.Display total no of students having greater than 75 marks in any one subject
SELECT COUNT(*) as total_students FROM marks
WHERE mark>75;

-- 8.Display marks of all students for DBMS subject.
SELECT m.rno,s.sub_code,m.mark,s.sub_name from subject as s 
JOIN marks as m 
ON s.sub_code = m.sub_code
WHERE s.sub_name = 'dbms';

select rno, mark from marks where sub_code=(select sub_code from subject where
sub_name='dbms');

-- 9.Display no of students appeared for the exam.
SELECT COUNT(*) as total_students FROM 
(SELECT COUNT(*), rno,mark FROM marks
WHERE mark is not null
GROUP BY rno) as ts;

-- 10.Display all subjects marks of students whose name is gauta
SELECT m.mark, m.sub_code from marks as m
JOIN student_info as s
ON s.rno = m.rno
WHERE s.name = 'gautam';

SELECT mark, sub_code from marks
WHERE rno=(SELECT rno from student_info where name='gautam');