CREATE DATABASE student_mg;

ALTER DATABASE student_mg CHARACTER SET UTF8;

USE student_mg

CREATE TABLE students(
	no VARCHAR(50) PRIMARY KEY,
	name VARCHAR(50),
	birthday DATETIME,
	bj VARCHAR(50),
	jg VARCHAR(50),
	adds VARCHAR(50),
	numbers CHAR(6)
);

CREATE TABLE course(
	kcbh VARCHAR(50) PRIMARY KEY,
	kcmc VARCHAR(50)
);

CREATE TABLE source(
	cjguid INT(10) PRIMARY KEY,
	no VARCHAR(50),
	kcbh VARCHAR(50),
	UNIQUE(cjguid),
	cj INT(6),
	FOREIGN KEY (no) REFERENCES students(no),
	FOREIGN KEY (kcbh) REFERENCES course(kcbh)
);

/*
ALTER TABLE students CHARACTER SET UTF8;
ALTER TABLE course CHARACTER SET UTF8;
ALTER TABLE source CHARACTER SET UTF8;

ALTER TABLE students CHANGE name name VARCHAR(50) CHARACTER SET UTF8;
ALTER TABLE students CHANGE bj bj VARCHAR(50) CHARACTER SET UTF8;
ALTER TABLE students CHANGE jg jg VARCHAR(50) CHARACTER SET UTF8;
ALTER TABLE students CHANGE adds adds VARCHAR(50) CHARACTER SET UTF8;
ALTER TABLE course CHANGE kcmc kcmc VARCHAR(50) CHARACTER SET UTF8;
*/

INSERT INTO students(no, name, birthday, bj, jg, adds, numbers) VALUES('1','张三','1992-6-1','一班','上海','上海市浦东新区','123123');
INSERT INTO students(no, name, birthday, bj, jg, adds, numbers) VALUES('2','李四','1992-10-1','二班','河南','河南省洛阳市','456456');
INSERT INTO students(no, name, birthday, bj, jg, adds, numbers) VALUES('3','王华','1992-6-1','一班','湖北','湖北省武汉市','789789');

INSERT INTO course(kcbh, kcmc) VALUES('10001', '语文');
INSERT INTO course(kcbh, kcmc) VALUES('10002', '数学');
INSERT INTO course(kcbh, kcmc) VALUES('10003', '英语');

INSERT INTO source(cjguid, no, kcbh, cj) VALUES(10000, '1', '10001', 90);
INSERT INTO source(cjguid, no, kcbh, cj) VALUES(10001, '1', '10002', 80);
INSERT INTO source(cjguid, no, kcbh, cj) VALUES(10002, '2', '10001', 99);
INSERT INTO source(cjguid, no, kcbh, cj) VALUES(10003, '3', '10003', 100);
INSERT INTO source(cjguid, no, kcbh, cj) VALUES(10004, '3', '10001', 69);
INSERT INTO source(cjguid, no, kcbh, cj) VALUES(10005, '2', '10001', 90);
INSERT INTO source(cjguid, no, kcbh, cj) VALUES(10006, '1', '10003', 81);
INSERT INTO source(cjguid, no, kcbh, cj) VALUES(10007, '3', '10002', 80);
INSERT INTO source(cjguid, no, kcbh, cj) VALUES(10008, '3', '10001', 66);
INSERT INTO source(cjguid, no, kcbh, cj) VALUES(10009, '3', '10002', 75);
INSERT INTO source(cjguid, no, kcbh, cj) VALUES(10010, '3', '10003', 95);


#10.1.20.6  port 40022
#fortestgroupmro66ty
#yangyang

#不完全版
SELECT kcbh, MAX(cj) AS max, MIN(cj) AS min, AVG(cj) AS avg, SUM(cj) AS sum 
FROM source WHERE no =
(SELECT no FROM students WHERE name = '王华')
GROUP BY kcbh;

#终极版
SELECT course.kcmc, MAX(cj) AS max, MIN(cj) AS min, ROUND(AVG(cj)) AS avg, SUM(cj) AS sum 
FROM source
INNER JOIN course
ON source.kcbh=course.kcbh
WHERE no=(SELECT no FROM students WHERE name = '王华')
GROUP BY course.kcmc;
