create database poc4;

USE poc4;

-- -------------- Author Table Creation and Insertion -------------------------

create table author (
id int primary key,
name varchar(100)
);
insert into author(id,name) values(1024,'James Bond');
insert into author(id,name) values(1025,'Peter Parker');
insert into author(id,name) values(1023,'Robin Sharma');
delete from author where id = 1024;
select * from author;

-- -------------- User Table Creation and Insertion ----------------------------

create table user (
id int primary key,
name varchar(100)
);
insert into user(id,name) values(101,'Jaykumar Bamania');
insert into user(id,name) values(102,'Mulchand Jamnadas');
insert into user(id,name) values(103,'Ashok Patel');
insert into user(id,name) values(104,'Hitendra Mulchand');

select * from user;

-- -------------- Post Table Creation and Insertion ------------------

create table post(
id int primary key,
name varchar(100),
authorid int ,
FOREIGN KEY (authorid) REFERENCES author(id)   
ON DELETE CASCADE,
createdts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
insert into post(id,name,authorid) values(4011,'Learn Basic Java',1024);
insert into post(id,name,authorid) values(4012,'Java 8 features',1024);
insert into post(id,name,authorid) values(4013,'Who will cry when you die',1023);
describe post;
select * from post;

-- -------------- Comment Table Creation and Insertion -------------------

create table comment (
id int primary key,
content varchar(1000),
postid int ,
FOREIGN KEY (postid) REFERENCES post(id)   
ON DELETE CASCADE,
userid int ,
FOREIGN KEY (userid) REFERENCES user(id)   
ON DELETE CASCADE,
createdts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
describe comment;
insert into comment(id,content,postid,userid) values(10111,'Amazing Post..Thank You',4011,101);
insert into comment(id,content,postid,userid) values(10112,'Written great about Java 8 features',4012,102);
insert into comment(id,content,postid,userid) values(10113,'Yes nicely written',4012,101);
insert into comment(id,content,postid,userid) values(10114,'Written Professionally',4012,103);
insert into comment(id,content,postid,userid) values(10115,'Good for Java Begineers',4011,103);
insert into comment(id,content,postid,userid) values(10116,'Nice book',4013,103);
insert into comment(id,content,postid,userid) values(10117,'Java 8 features makes life easy',4012,104);
insert into comment(id,content,postid,userid) values(10118,'I have learned a lot from this post',4011,104);
insert into comment(id,content,postid,userid) values(10119,'Great work Robin...',4013,104);
insert into comment(id,content,postid,userid) values(10120,'Easy to Understand',4011,102);
insert into comment(id,content,postid,userid) values(10121,'Can you explore more on Stream API...?',4012,104);
insert into comment(id,content,postid,userid) values(10122,'Written Clear',4012,103);
insert into comment(id,content,postid,userid) values(10123,'Yep... got all points',4012,104);
insert into comment(id,content,postid,userid) values(10124,'Java 8 is very effective',4012,102);
insert into comment(id,content,postid,userid) values(10125,'I will use this features in my project',4012,103);
insert into comment(id,content,postid,userid) values(10126,'java 1.8 is very stable version',4012,104);
insert into comment(id,content,postid,userid) values(10127,'yes it you are right, Hitendra',4012,101);
insert into comment(id,content,postid,userid) values(10128,'will take reference of this',4012,103);
select * from comment;
select count(*) as total_comments from comment where postid=4012 order by createdts;

-- Write a query given the following data model:
-- Query: Get list of Posts with latest 10 comments of each post authored by 'James Bond'

-- Doing partition over postid in comment table
SELECT *, row_number() OVER (PARTITION BY postid ORDER BY createdts DESC) AS rn
    FROM comment;

SELECT  p.id as postid, p.name as Post, a.name as Author, 
c.userid as User, c.content as Comment,c.id as comment_id, c.createdts as 'Commented On'
FROM (
	SELECT *, row_number() OVER (PARTITION BY postid ORDER BY createdts DESC) AS no_of_rows
    FROM comment
) c
JOIN post p ON p.id = c.postid
JOIN author a on a.id = p.authorid
WHERE a.name = 'JAMES BOND' AND no_of_rows <= 10
ORDER BY c.createdts DESC;