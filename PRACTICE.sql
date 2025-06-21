
CREATE DATABASE IF NOT EXISTS test;

USE test;

CREATE TABLE student
(
	stdID INT NOT NULL,
    fname VARCHAR(30) NOT NULL,
    lname VARCHAR(45) NOT NULL,
    dob DATE NOT NULL,
    gpa FLOAT,
    gender CHAR(1) NOT NULL

);

DROP TABLE student;

CREATE DATABASE IF NOT EXISTS test;


SELECT * FROM test.student;


CREATE TABLE student
(
	stdID INT NOT NULL,
    fname VARCHAR(30) NOT NULL,
    lname VARCHAR(45) NOT NULL,
    dob DATE NOT NULL,
    gpa FLOAT,
    gender CHAR(1) NOT NULL

);

ALTER TABLE student
ADD PRIMARY KEY (stdID);

DROP TABLE IF EXISTS student;
ALTER TABLE student
ADD CONSTRAINT PK_STUDENT_STUDENT_ID PRIMARY KEY (stdID);
SELECT * FROM test.student;


CREATE DATABASE company;
USE company;

CREATE TABLE employee
(
	empID INT NOT NULL,
    empFName VARCHAR(35) NOT NULL,
    empMInitial CHAR(1) NOT NULL,
    empLName VARCHAR(35) NOT NULL,
    empPhone INT NOT NULL
);

CREATE TABLE department
(
	deptNum INT NOT NULL,
    deptName INT NOT NULL
);

CREATE TABLE project
(
	prjNum INT NOT NULL,
    prjName VARCHAR(40),
    prjLocation VARCHAR(20)
);

SELECT * FROM test.student;

ALTER TABLE `company`.`employee` 
CHANGE COLUMN `empMInitial` `empMInitial` CHAR(1) NULL;

CREATE TABLE dependent
(
	depFName VARCHAR(35) NOT NULL,
    depMInitial CHAR(1) NULL,
    depLNAME VARCHAR(35) NOT NULL,
    depSex CHAR(1) NOT NULL,
    depDOB DATE NOT NULL,
    depRelation VARCHAR(12) NOT NULL
);

CREATE TABLE dept_location
(
	deptNum INT,
    dLocation VARCHAR(20)
);

CREATE TABLE assignment
(
	empID INT NOT NULL,
    prjNum INT NOT NULL,
    hour INT NULL
);

ALTER TABLE EMPLOYEE
ADD CONSTRAINT FK_EMPLOYEE_deptNum FOREIGN KEY (deptNUM) REFERENCES department(deptNUM);


ALTER TABLE EMPLOYEE
ADD COLUMN deptNum INT;

ALTER TABLE employee
ADD supID INT;

ALTER TABLE employee
ADD CONSTRAINT PK_EMPLOYEE_EMPLOYEE_ID PRIMARY KEY (empID);

ALTER TABLE employee
ADD CONSTRAINT FK_EMPLOYEE_DEPARTMENT_NUM FOREIGN KEY (deptNum) REFERENCES department;

ALTER TABLE employee
ADD CONSTRAINT FK_EMPLOYEE_DEPARTMENT_NUM FOREIGN KEY (deptNum) REFERENCES department (deptNum);

SELECT * FROM company.employee;

ALTER TABLE `company`.`employee` 
ADD CONSTRAINT `deptNum`
  FOREIGN KEY (`deptNum`)
  REFERENCES `company`.`department` (`deptNum`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
  ALTER TABLE employee
ADD CONSTRAINT FK_EMPLOYEE_DEPARTMENT_NUM FOREIGN KEY (deptNum) REFERENCES department (deptNum);

ALTER TABLE department
ADD mgrID INT;

ALTER TABLE department
ADD startDate DATE;

ALTER TABLE project
ADD deptNum INT;

ALTER TABLE dependent
ADD empID INT NOT NULL;

ALTER TABLE project
ADD CONSTRAINT PK_PROJECT_PROJECT_NUM PRIMARY KEY (prjNum);

ALTER TABLE department
ADD CONSTRAINT PK_DEPARTMENT_DEPARTMENT_NUM PRIMARY KEY (deptNum);

ALTER TABLE employee
ADD CONSTRAINT FK_EMPLOYEE_DEPARTMENT_NUM FOREIGN KEY (deptNum) REFERENCES department (deptNum);

ALTER TABLE employee
ADD CONSTRAINT FK_EMPLOYEE_SUPERVISOR_ID FOREIGN KEY (empID) REFERENCES employee (empID);

ALTER TABLE employee
ADD CONSTRAINT FK_EMPLOYEE_SUPERVISOR_ID FOREIGN KEY (supID) REFERENCES employee (empID);

ALTER TABLE department
ADD CONSTRAINT FK_DEPARTMENT_MANAGER_ID FOREIGN KEY (mgrID) REFERENCES employee (empID);

ALTER TABLE project
ADD CONSTRAINT FK_PROJECT_DEPARTMENT_NUM FOREIGN KEY (deptNum) REFERENCES department (deptNum);

ALTER TABLE dependent
ADD CONSTRAINT FK_DEPENDENT_EMPLOYEE_ID FOREIGN KEY (empID) REFERENCES employee (empID);

ALTER TABLE dependent
ADD CONSTRAINT PK_DEPENDENT PRIMARY KEY (empID, depFName);

CREATE TABLE dept_location
(
	deptNum INT,
    deptLocation VARCHAR(45)
);

CREATE TABLE assignment
(
	empID INT,
    prjNum INT,
    hours FLOAT
);

ALTER TABLE dept_location
ADD CONSTRAINT FK_DEPARTMENT_LOCATION_DEPARTMENT_NUM FOREIGN KEY (deptNum) REFERENCES department (deptNum);

ALTER TABLE dept_location
ADD d_location VARCHAR(45);

ALTER TABLE dept_location
ADD CONSTRAINT PK_DEPARTMENT_LOCATION PRIMARY KEY (deptNum, d_location);

ALTER TABLE assignment
ADD CONSTRAINT FK_ASSIGNMENT_EMPLOYEE_ID FOREIGN KEY (empID) REFERENCES employee (empID);

ALTER TABLE assignment
ADD CONSTRAINT FK_ASSIGNMENT_PROJECT_NUM FOREIGN KEY (prjNum) REFERENCES project (prjNum);

USE book;
ALTER TABLE assignment
ADD CONSTRAINT PK_ASSIGNMENT PRIMARY KEY (empID, prjNum);

Create table book_customer
(CustNum  INT(4) NOT NULL,
LastName VARCHAR(10),
FirstName VARCHAR(10),
Address VARCHAR(20),
City VARCHAR(12),
State VARCHAR(2),
Zip VARCHAR(5),
Referred INT(4),
PRIMARY KEY (CustNum));

Create Table book_order
(OrderNum INT(4) PRIMARY KEY,
CustNum INT(4),
OrderDate DATE,
ShipDate DATE,
ShipStreet VARCHAR(18),
Shipcity VARCHAR(15),
Shipstate VARCHAR(2),
Shipzip VARCHAR(5));
INSERT INTO book_customer
VALUES (1020, 'FALAH', 'KENNETH', 'P.O. BOX 335', 'TRENTON', 'NJ', '08607', NULL);
INSERT INTO book_customer
VALUES (1019, 'SMITH', 'JENNIFER', 'P.O. BOX 1151', 'MORRISTOWN', 'NJ', '07962', 1003);
INSERT INTO book_customer
VALUES (1018, 'MONTIASA', 'GREG', '1008 GRAND AVENUE', 'MACON', 'GA', '31206', NULL);
INSERT INTO book_customer
VALUES (1017, 'NELSON', 'BECCA', 'P.O. BOX 563', 'KALMAZOO', 'MI', '49006', NULL);
INSERT INTO book_customer
VALUES (1016, 'DAUM', 'MICHELL', '9851231 LONG ROAD', 'BURBANK', 'CA', '91508', 1010);
INSERT INTO book_customer
VALUES (1015, 'SCHELL', 'STEVE', 'P.O. BOX 677', 'MIAMI', 'FL', '33111', NULL);
INSERT INTO book_customer
VALUES (1014, 'LEE', 'JASMINE', 'P.O. BOX 2947', 'CODY', 'WY', '82414', NULL);
INSERT INTO book_customer
VALUES (1013, 'NGUYEN', 'NICHOLAS', '357 WHITE EAGLE AVE.', 'CLERMONT', 'FL', '34711', 1006);
INSERT INTO book_customer
VALUES (1012, 'MCKENZIE', 'WILLIAM', 'P.O. BOX 971', 'BOSTON', 'MA', '02110', NULL);
INSERT INTO book_customer
VALUES (1011, 'MCGOVERN', 'REESE', 'P.O. BOX 18', 'CHICAGO', 'IL', '60606', NULL);
INSERT INTO book_customer
VALUES (1010, 'LUCAS', 'JAKE', '114 EAST SAVANNAH', 'ATLANTA', 'GA', '30314', NULL);
INSERT INTO book_customer
VALUES (1009, 'PEREZ', 'JORGE', 'P.O. BOX 8564', 'BURBANK', 'CA', '91510', 1003);
INSERT INTO book_customer
VALUES (1008, 'JONES', 'KENNETH', 'P.O. BOX 137', 'CHEYENNE', 'WY', '82003', NULL);
INSERT INTO book_customer
VALUES (1007, 'GIANA', 'TAMMY', '9153 MAIN STREET', 'AUSTIN', 'TX', '78710', 1003);
INSERT INTO book_customer
VALUES (1006, 'CRUZ', 'MESHIA', '82 DIRT ROAD', 'ALBANY', 'NY', '12211', NULL);
INSERT INTO book_customer
VALUES (1005, 'GIRARD', 'CINDY', 'P.O. BOX 851', 'SEATTLE', 'WA', '98115', NULL);
INSERT INTO book_customer
VALUES (1004, 'PIERSON', 'THOMAS', '69821 SOUTH AVENUE', 'BOISE', 'ID', '83707', NULL);
INSERT INTO book_customer
VALUES (1003, 'SMITH', 'LEILA', 'P.O. BOX 66', 'TALLAHASSEE', 'FL', '32306', NULL);
INSERT INTO book_customer
VALUES (1002, 'THOMPSON', 'RYAN', 'P.O. BOX 9835', 'SANTA MONICA', 'CA', '90404', NULL);
INSERT INTO book_customer
VALUES (1001, 'MORALES', 'BONITA', 'P.O. BOX 651', 'EASTPOINT', 'FL', '32328', NULL);

Create Table author
(authorID VARCHAR(4) PRIMARY KEY,
Lname VARCHAR(10),
Fname VARCHAR(10));
INSERT INTO publisher
VALUES(6,'LITTLE HOUSE','DOUG COLLINS','800-515-2665');
INSERT INTO publisher
VALUES(5,'REED-N-RITE','SEBASTIAN JONES','800-555-8284');
INSERT INTO publisher
VALUES(4,'READING MATERIALS INC.','RENEE SMITH','800-555-9743');
INSERT INTO publisher
VALUES(3,'AMERICAN PUBLISHING','DAVID DAVIDSON','800-555-1211');
INSERT INTO publisher
VALUES(2,'PUBLISH OUR WAY','JANE TOMLIN','800-410-0010');
INSERT INTO publisher
VALUES(1,'PRINTING IS US','TOMMIE SEYMOUR','800-714-8321');
Create Table publisher
(PubID INT(2) PRIMARY KEY,
Name VARCHAR(23),
Contact VARCHAR(15),
Phone VARCHAR(12));
INSERT INTO book_order
VALUES (1020,1008,'2003-04-05',NULL,'195 JAMISON LANE', 'CHEYENNE', 'WY', '82003');
INSERT INTO book_order
VALUES (1019,1018,'2003-04-05',NULL, '1008 GRAND AVENUE', 'MACON', 'GA', '31206');
INSERT INTO book_order
VALUES (1018,1001,'2003-04-05',NULL,'95812 HIGHWAY 98', 'EASTPOINT', 'FL', '32328');
INSERT INTO book_order
VALUES (1017,1015,'2003-04-04','2003-04-05','887 HOT ASPHALT ST', 'MIAMI', 'FL', '33112');
INSERT INTO book_order
VALUES (1016,1003,'2003-04-04',NULL,'9901 SEMINOLE WAY', 'TALLAHASSEE', 'FL', '32307');
INSERT INTO book_order
VALUES (1015,1020,'2003-04-04',NULL,'557 GLITTER ST.', 'TRENTON', 'NJ', '08606');
INSERT INTO book_order
VALUES (1014,1007,'2003-04-04','2003-04-05', '9153 MAIN STREET', 'AUSTIN', 'TX', '78710');
INSERT INTO book_order
VALUES (1013,1014,'2003-04-03','2003-04-04','7618 MOUNTAIN RD.', 'CODY', 'WY', '82414');
INSERT INTO book_order
VALUES (1012,1017,'2003-04-03',NULL,'1295 WINDY AVENUE', 'KALMAZOO', 'MI', '49002');
INSERT INTO book_order
VALUES (1011,1010,'2003-04-03','2003-04-05', '102 WEST LAFAYETTE', 'ATLANTA', 'GA', '30311');
INSERT INTO book_order
VALUES (1010,1019,'2003-04-03','2003-04-04','384 WRONG WAY HOME', 'MORRISTOWN', 'NJ', '07960');
INSERT INTO book_order
VALUES (1009,1005,'2003-04-03','2003-04-05','9 LIGHTENING RD.', 'SEATTLE', 'WA', '98110');
INSERT INTO book_order
VALUES (1008,1004,'2003-04-02','2003-04-03', '69821 SOUTH AVENUE', 'BOISE', 'ID', '83707');
INSERT INTO book_order
VALUES (1007,1007,'2003-04-02','2003-04-04', '9153 MAIN STREET', 'AUSTIN', 'TX', '78710');
INSERT INTO book_order
VALUES (1006,1003,'2003-04-01','2003-04-02','558A CAPITOL HWY.', 'TALLAHASSEE', 'FL', '32307');
INSERT INTO book_order
VALUES (1005,1018,'2003-04-01','2003-04-02', '1008 GRAND AVENUE', 'MACON', 'GA', '31206');
INSERT INTO book_order
VALUES (1004,1020,'2003-04-01','2003-04-05','561 ROUNDABOUT WAY', 'TRENTON', 'NJ', '08601');
INSERT INTO book_order
VALUES (1003,1001,'2003-04-01','2003-04-01','958 MAGNOLIA LANE', 'EASTPOINT', 'FL', '32328');
INSERT INTO book_order
VALUES (1002,1011,'2003-03-31','2003-04-01','58 TILA CIRCLE', 'CHICAGO', 'IL', '60605');
INSERT INTO book_order
VALUES (1001,1010,'2003-03-31','2003-04-01', '114 EAST SAVANNAH', 'ATLANTA', 'GA', '30314');
INSERT INTO book_order
VALUES (1000,1005,'2003-03-31','2003-04-02','1201 ORANGE AVE', 'SEATTLE', 'WA', '98114');

Create table books
(ISBN VARCHAR(10) PRIMARY KEY,
Title VARCHAR(30),
PubDate DATE,
PubID INT (2),
Cost DECIMAL (5,2),
Retail DECIMAL (5,2),
Category VARCHAR(12));
INSERT INTO author
VALUES ('W110','WILKINSON','ANTHONY');
INSERT INTO author
VALUES ('F100','FIELDS','OSCAR');
INSERT INTO author
VALUES ('R100','ROBINSON','ROBERT');
INSERT INTO author
VALUES ('W105','WHITE','LISA');
INSERT INTO author
VALUES ('W100','WHITE','WILLIAM');
INSERT INTO author
VALUES ('P105','PETERSON','TINA');
INSERT INTO author
VALUES ('B100','BAKER','JACK');
INSERT INTO author
VALUES ('A105','ADAMS','JUAN');
INSERT INTO author
VALUES ('P100','PORTER','LISA');
INSERT INTO author
VALUES ('K100','KZOCHSKY','TAMARA');
INSERT INTO author
VALUES ('M100','MARTINEZ','SHEILA');
INSERT INTO author
VALUES ('A100','AUSTIN','JAMES');
INSERT INTO author
VALUES ('J100','JONES','JANICE');
INSERT INTO author
VALUES ('S100','SMITH', 'SAM');

insert into promotion
values ('FREE SHIPPING', 56.01, 999.99);
insert into promotion
values ('BOOK COVER', 25.01, 56);
insert into promotion
 values ('BOOK LABELS', 12.01, 25);
insert into promotion
 values ('BOOKMARKER', 0, 12);
create table promotion
(gift  VARCHAR(15),
MinRetail DECIMAL(5,2),
MaxRetail DECIMAL(5,2));
INSERT INTO book_author
VALUES ('2147428890','W105');
INSERT INTO book_author
VALUES ('9247381001','W100');
INSERT INTO book_author
VALUES ('0132149871','S100');
INSERT INTO book_author
VALUES ('8117949391','R100');
INSERT INTO book_author
VALUES ('0299282519','S100');
INSERT INTO book_author
VALUES ('2491748320','B100');
INSERT INTO book_author
VALUES ('2491748320','F100');
INSERT INTO book_author
VALUES ('2491748320','R100');
INSERT INTO book_author
VALUES ('9959789321','J100');
INSERT INTO book_author
VALUES ('1915762492','W105');
INSERT INTO book_author
VALUES ('1915762492','W100');
INSERT INTO book_author
VALUES ('3957136468','A100');
INSERT INTO book_author
VALUES ('3437212490','B100');
INSERT INTO book_author
VALUES ('8843172113','A105');
INSERT INTO book_author
VALUES ('8843172113','A100');
INSERT INTO book_author
VALUES ('8843172113','P105');
INSERT INTO book_author
VALUES ('4981341710','K100');
INSERT INTO book_author
VALUES ('0401140733','J100');
INSERT INTO book_author
VALUES ('1059831198','P100');
INSERT INTO book_author
VALUES ('1059831198','S100');
CREATE TABLE book_author
(ISBN VARCHAR(10),
authorid VARCHAR(4),
CONSTRAINT pk_bookauthor PRIMARY KEY (isbn,authorid));
INSERT INTO order_items
VALUES (1020,1,'3437212490',1);
INSERT INTO order_items
VALUES (1019,1,'0401140733',1);
INSERT INTO order_items
VALUES (1018,2,'8843172113',1);
INSERT INTO order_items
VALUES (1018,1,'3437212490',1);
INSERT INTO order_items
VALUES (1017,1,'8117949391',2);
INSERT INTO order_items
VALUES (1016,1,'2491748320',1);
INSERT INTO order_items
VALUES (1015,1,'3437212490',1);
INSERT INTO order_items
VALUES (1014,1,'0401140733',2);
INSERT INTO order_items
VALUES (1013,1,'8843172113',1);
INSERT INTO order_items
VALUES (1012,4,'0401140733',1);
INSERT INTO order_items
VALUES (1012,3,'2491748320',1);
INSERT INTO order_items
VALUES (1012,2,'1915762492',2);
INSERT INTO order_items
VALUES (1012,1,'8117949391',1);
INSERT INTO order_items
VALUES (1011,1,'2491748320',1);
INSERT INTO order_items
VALUES (1010,1,'8843172113',4);
INSERT INTO order_items
VALUES (1009,2,'0401140733',1);
INSERT INTO order_items
VALUES (1009,1,'3437212490',1);
INSERT INTO order_items
VALUES (1008,1,'3437212490',2);
INSERT INTO order_items
VALUES (1007,4,'8843172113',1);
INSERT INTO order_items
VALUES (1007,3,'8117949391',1);
INSERT INTO order_items
VALUES (1007,2,'9959789321',1);
INSERT INTO order_items
VALUES (1007,1,'3957136468',3);
INSERT INTO order_items
VALUES (1006,1,'9959789321',1);
INSERT INTO order_items
VALUES (1005,1,'2147428890',1);
INSERT INTO order_items
VALUES (1004,1,'2491748320',2);
INSERT INTO order_items
VALUES (1003,3,'3437212490',1);
INSERT INTO order_items
VALUES (1003,2,'1059831198',1);
INSERT INTO order_items
VALUES (1003,1,'8843172113',1);
INSERT INTO order_items
VALUES (1002,1,'8843172113',2);
INSERT INTO order_items
VALUES (1001,2,'2491748320',1);
INSERT INTO order_items
VALUES (1001,1,'9247381001',1);
INSERT INTO order_items
VALUES (1000,1,'3437212490',1);
CREATE TABLE order_items
(OrderNum INT(4) NOT NULL,
ItemNum INT(2) NOT NULL,
ISBN VARCHAR(10),
QUANTITY INT(3), 
constraint pk_orderitems PRIMARY KEY (OrderNum, ItemNum));
INSERT INTO books
VALUES ('2147428890','SHORTEST POEMS','2001-05-01',5,21.85,39.95, 'LITERATURE');
INSERT INTO books
VALUES ('9247381001','HOW TO MANAGE THE MANAGER','1999-05-09',1,15.40,31.95, 'BUSINESS');
INSERT INTO books
VALUES ('0132149871','HOW TO GET FASTER PIZZA','2002-11-11',4,17.85,29.95, 'SELF HELP');
INSERT INTO books
VALUES ('8117949391','BIG BEAR AND LITTLE DOVE','2001-11-08',5,5.32,8.95, 'CHILDREN');
INSERT INTO books
VALUES ('0299282519','THE WOK WAY TO COOK','2000-09-11',4,19.00,28.75, 'COOKING');
INSERT INTO books
VALUES ('2491748320','PAINLESS CHILD-REARING','2000-07-17',5,48.00,89.95, 'FAMILY LIFE');
INSERT INTO books
VALUES ('9959789321','E-BUSINESS THE EASY WAY','2002-03-01',2,37.90,54.50, 'COMPUTER');
INSERT INTO books
VALUES ('1915762492','HANDCRANKED COMPUTERS','2001-01-21',3,21.80,25.00, 'COMPUTER');
INSERT INTO books
VALUES ('3957136468','HOLY GRAIL OF ORACLE','2001-12-31',3,47.25,75.95, 'COMPUTER');
INSERT INTO books
VALUES ('3437212490','COOKING WITH MUSHROOMS','2000-02-28',4,12.50,19.95, 'COOKING');
INSERT INTO books
VALUES ('8843172113','DATABASE IMPLEMENTATION','1999-06-04',3,31.40,55.95, 'COMPUTER');
INSERT INTO books
VALUES ('4981341710','BUILDING A CAR WITH TOOTHPICKS','2002-03-18',2,37.80,59.95, 'CHILDREN');
INSERT INTO books
VALUES ('0401140733','REVENGE OF MICKEY','2001-12-14',1,14.20,22.00, 'FAMILY LIFE');
INSERT INTO books
VALUES ('1059831198','BODYBUILD IN 10 MINUTES A DAY','2001-01-21',4,18.75,30.95, 'FITNESS');

SELECT FirstName, LastName
FROM book_customer
ORDER BY LastName DESC, FirstName DESC;
SELECT FirstName, LastName
FROM book_customer
ORDER BY LastName DESC, FirstName;
SELECT FirstName, LastName
FROM book_customer
ORDER BY LastName DESC;
SELECT FirstName, LastName
FROM book_customer
ORDER BY LastName;
SELECT FirstName, LastName
FROM book_customer
WHERE Zip < 60606
ORDER BY LastName;
SELECT FirstName, LastName
FROM book_customer
WHERE Zip < 60606;
SELECT FirstName, LastName
FROM book_customer
WHERE Zip = 60606;
SELECT DISTINCT state
FROM book_customer;
SELECT state
FROM book_customer;
SELECT FirstName, LastName
FROM book_customer;
SELECT *
FROM book_customer;

SELECT FirstName, LastName, Zip
FROM book_customer
WHERE Zip between 6000 AND 8000;
SELECT FirstName, LastName
FROM book_customer
WHERE Zip between 6000 AND 8000;
DESC book_customer;
SELECT DISTINCT state AS "States we serve"
FROM book_customer;
SELECT FirstName, LastName
FROM book_customer
ORDER BY 2 DESC, 1 DESC;

SELECT FirstName, LastName, State
FROM book_customer
WHERE lower(State) IN ('fl','nj');
SELECT FirstName, LastName, State
FROM book_customer
WHERE lower(State) IN ('FL','NJ');
SELECT FirstName, LastName, State
FROM book_customer
WHERE State IN ('fl','nj');
SELECT FirstName, LastName, State
FROM book_customer
WHERE State IN ('FL','NJ');
SELECT FirstName, LastName, Zip
FROM book_customer
WHERE Zip BETWEEN 60000 AND 80000;

SELECT *
FROM book_customer
WHERE Referred IS NOT NULL;
SELECT *
FROM book_customer
WHERE Referred = NULL;
SELECT *
FROM book_customer
WHERE Referred IS NOT NULL;
SELECT *
FROM book_customer;
SELECT FirstName, LastName
FROM book_customer
WHERE FirstName LIKE '__A%';
SELECT FirstName, LastName
FROM book_customer
WHERE FirstName LIKE '%A';
SELECT FirstName, LastName
FROM book_customer
WHERE FirstName Like '%A';
SELECT FirstName, LastName, State
FROM book_customer
WHERE State LIKE '%A';
SELECT FirstName, LastName, State
FROM book_customer
WHERE State LIKE '%A';

SELECT CONCAT (FirstName," ", LastName) AS "FULL NAME"
FROM book_customer
WHERE ((State='FL') AND (LastName ='SMITH'));
SELECT CONCAT (FirstName," ", LastName) AS "FULLNAME"
FROM book_customer
WHERE ((State='FL') AND (LastName ='SMITH'));
SELECT CONCAT (FirstName, , LastName) AS "FULLNAME"
FROM book_customer
WHERE ((State='FL') AND (LastName ='SMITH'));
SELECT CONCAT (FirstName , LastName) AS "FULLNAME"
FROM book_customer
WHERE ((State='FL') AND (LastName ='SMITH'));
SELECT FirstName ||','|| LastName AS "FULLNAME"
FROM book_customer
WHERE ((State='FL') AND (LastName ='SMITH'));
SELECT FirstName, ',', LastName AS "FULLNAME"
FROM book_customer
WHERE ((State='FL') AND (LastName ='SMITH'));
SELECT FirstName ||','|| LastName AS "FULLNAME"
FROM book_customer
WHERE ((State='FL') AND (LastName ='SMITH'));
SELECT FirstName || ','|| LastName AS "FULLNAME"
FROM book_customer
WHERE ((State='FL') AND (LastName ='SMITH'));
SELECT FirstName, LastName
FROM book_customer
WHERE ((State='FL') AND (LastName ='SMITH'));
SELECT FirstName, LastName, Referred
FROM book_customer
WHERE Referred IS NOT NULL;

SELECT CONCAT('For publisher ', Name, 'their contact is ', Contact,'.')
FROM publisher;
SELECT CONCAT('For publisher ', Name, 'their contact is ', Contact)
FROM publisher;
SELECT CONCAT(SUBSTR(Name, 5, 4), '***', SUBSTR(Contact, 5, 4))
FROM publisher;
SELECT Name, SUBSTR(Name, 5,4)
FROM publisher;
SELECT OrderNum, IFNULL(ShipDate, 'Not yet Shipped') AS 'SHIP STATUS'
FROM book_order;
SELECT OrderNum, IFNULL(ShipDate, 'Not yet Shipped')
FROM book_order;
SELECT OrderNum, ShipDate
FROM book_order;
SELECT CONCAT('$', round(cost, 2)) AS 'ROUNDED COST'
FROM books;
SELECT CONCAT('$', round(cost, 2))
FROM books;
SELECT CONCAT('$', round(FORMAT(cost, 2)))
FROM books;
SELECT round(cost, 1)
FROM books;
SELECT round(FORMAT(cost, 1))
FROM books,;
SELECT round(cost, 1)
FROM books,;
SELECT COUNT(*) AS NUMBERS, COUNT(referred)
FROM book_customer;
SELECT COUNT(*) AS Numbers, SUM(Cost) AS TOTAL, AVG(Cost) AS AVERAGE, MIN(Cost) AS MINIMUM, MAX(Cost) AS MAXIMUM
FROM books;
SELECT *
FROM books;
SELECT SUM(Quantity) AS TOTAL
FROM order_items;
SELECT *
FROM order_items;
SELECT Title, PubDate, DATE_FORMAT(PubDate, '%M/%D/%Y') AS "Date"
FROM books;
SELECT sysdate(), DATE_FORMAT(sysdate(), '%m/%d/%y') AS "Date"
FROM dual;
SELECT Title, PubDate, DATE_FORMAT(PubDate, '%M/%D/%Y') AS "Date"
FROM books;
SELECT Title, PubDate, DATE_FORMAT(PubDate, '%M/%D/%Y')
FROM books;
SELECT sysdate(), DATE_FORMAT(sysdate(), '%m/%d/%y') AS "Date"
FROM dual;
SELECT sysdate(), DATE_FORMAT(sysdate(), '%m %d %y') AS "Date"
FROM dual;
SELECT orderNum, quantity, quantity*2 AS "Double"
FROM order_items;
SELECT orderid, quantity, quantity*2 AS "Double"
FROM order_items;
SELECT orderid, quantity, quantity*2 AS "Double"
FROM order_items;
SELECT orderid, quantity, quantity*2 "Double"
FROM order_items;
SELECT sysdate()
FROM dual;
SELECT sysdate
FROM dual;
SELECT sysdate
FROM dual;
SELECT (3*5)
FROM Dual;

SELECT R.FirstName, R.LastName
FROM book_customer C, book_customer R
WHERE C.Referred = R.CustNum
AND C.LastName = 'GIANA';
SELECT R.FirstName, R.LastName
FROM book_customer C, book_customer R
WHERE R.CustNum = C.Referred
AND C.LastName = 'GIANA';
SELECT R.FirstaName, R.LastName
FROM book_customer C, book_customer R
WHERE R.CustNum = C.Referred
AND C.LastName = 'GIANA';
SELECT OrderNum, CustNum, FirstName, LastName
FROM book_customer LEFT OUTER JOIN
book_order USING (CustNum)
ORDER BY 1 DESC;
SELECT OrderNum, CustNum, FIrstName, LastName
FROM book_customer LEFT OUTER JOIN
book_order USING (CustNum)
ORDER BY 1 DESC;
SELECT ORderNum, CustNum, FIrstName, LastName
FROM book_customer LEFT OUTER JOIN
book_order USING (CustNum)
ORDER BY 1 DESC;
SELECT ORderNum, CustNum, FIrstName, LastName
FROM book_order RIGHT OUTER JOIN
book_customer  USING (CustNum);
SELECT ORderNum, CustNum, FIrstName, LastName
FROM book_customer LEFT OUTER JOIN
book_order USING (CustNum);
SELECT ORderNum, CustNum, FIrstName, LastName
FROM book_customer RIGHT OUTER JOIN
book_order USING (CustNum);
SELECT OrderNum, C.CustNum, FirstName, LastName
From book_customer C, book_order O
WHERE C.CustNum = O.CustNum AND OrderNum >1010;
SELECT OrderNum, C.CustNum, FirstName, LastName
From book_customer C, book_order O
WHERE C.CustNum = O.CustNum;
SELECT OrderNum, CustNum, FirstName, LastName
FROM book_customer NATURAL JOIN book_order;
SELECT LastName, State, Shipstate
FROM book_customer NATURAL JOIN book_order;
SELECT LastName, State, Shipstate
FROM book_customer C, book_order O
WHERE C.CustNum = O.CustNum;
SELECT shipstate
FROM book_order;
SELECT shipstate
FROM book_orders;
SELECT *
FROM book_customer C, book_order O
WHERE C.CustNum = O.CustNum;
SELECT *
FROM book_customer, book_order
WHERE book_customer.CustNum = book_order.CustNum;
SELECT *
FROM book_customer, book_order;
USE book;
SELECT state, COUNT(CustNum)
FROM book_customer
WHERE Zip != 90404
GROUP by State
HAVING COUNT(CustNum) > 2
ORDER BY 2 DESC;
SELECT state, COUNT(CustNum)
FROM book_customer
WHERE Zip != 90404
GROUP by State
HAVING COUNT(CustNum) > 2
ORDER BY 2 DESC;
SELECT state, COUNT(CustNum)
FROM book_customer
GROUP BY state
Having COUNT(CustNum) > 2;
SELECT state, COUNT(CustNum)
FROM book_customer
GROUP BY state
Having COUNT(CustNum) > 1;
SELECT state, COUNT(CustNum)
FROM book_customer
GROUP BY state;
SELECT COUNT(CustNum)
FROM book_customer
WHERE state='FL';
SELECT *
FROM book_customer
WHERE state='FL';


SELECT Category,
CONCAT('$', SUM(Retail)) AS 'Total Retail',
CONCAT('$', AVG(Retail)) AS 'Average Retail'
FROM books
GROUP BY Category
HAVING SUM(Retail) > 40
ORDER BY Category ASC, SUM(Retail) ASC, AVG(Retail) ASC;
SELECT Category,
CONCAT('$', SUM(Retail)) AS 'Total Retail',
CONCAT('$', AVG(Retail)) AS 'Average Retail'
FROM books
GROUP BY Category
HAVING SUM(Retail) > 40
ORDER BY SUM(Retail) ASC;
SELECT Category,
CONCAT('$', SUM(Retail)) AS 'Total Retail',
CONCAT('$', AVG(Retail)) AS 'Average Retail'
FROM books
GROUP BY Category
HAVING SUM(Retail) > 40
ORDER BY 2 ASC;
SELECT Category,
CONCAT('$', SUM(Retail)) AS 'Total Retail',
CONCAT('$', AVG(Retail)) AS 'Average Retail'
FROM books
GROUP BY Category
HAVING SUM(Retail) > 40;
SELECT Category,
CONCAT('$', SUM(Retail)) AS 'Total Retail',
CONCAT('$', AVG(Retail)) AS 'Average Retail'
FROM books
GROUP BY Category;
SELECT Category,
CONCAT('$', SUM(Retail)) AS 'Total Retail',
CONCAT('$', AVG(Retail)) AS 'Average Retail'
FROM books
GROUP BY Category
HAVING SUM(Retail) > 40;
SELECT Category,
CONCAT('$', SUM(Retail)) AS 'Total Retail',
CONCAT('$', AVG(Retail)) AS 'Average Retail'
FROM books
WHERE SUM(Retail) > 40
GROUP BY Category;
SELECT Category,
CONCAT('$', SUM(Retail)) AS 'Total Retail',
CONCAT('$', AVG(Retail)) AS 'Average Retail'
FROM books
GROUP BY Category;
SELECT Category,
CONCAT('$', SUM(Retail)) AS 'Total Retail',
CONCAT('$', AVG(Retail)) AS 'Average Retail'
FROM books
WHERE 'Total Retail' > 40
GROUP BY Category;
SELECT Category,
CONCAT('$', SUM(Retail)) AS 'Total Retail',
CONCAT('$', AVG(Retail)) AS 'Average Retail'
FROM books
WHERE SUM(Retail) > 40
GROUP BY Category;
SELECT Category,
CONCAT('$', SUM(Retail)) AS 'Total Retail',
CONCAT('$', AVG(Retail)) AS 'Average Retail'
FROM books
WHERE 2 > 40
GROUP BY Category;
SELECT ItemNum, 
COUNT(Quantity) AS Total,
ROUND(AVG(Quantity), 2) AS Average,
MIN(Quantity) AS Minimum,
MAx(Quantity) AS Maximum
FROM order_items
GROUP BY ItemNum;
SELECT ItemNum, 
COUNT(Quantity) AS Total,
ROUND(AVG(Quantity), 2) AS Average,
MIN(Quantity) AS Minimum,
MAx(Quantity) AS Maximum
FROM order_items
GROUP BY ItemNum
LIMIT 4;
SELECT Category,
COUNT(*) AS 'Category Total',
CONCAT('$', FORMAT(SUM(Cost), 2)) AS Cost
FROM books
GROUP BY Category
ORDER BY SUM(Cost) DESC;
SELECT Category,
COUNT(*) AS 'Category Total',
CONCAT('$', FORMAT(SUM(Cost), 2)) AS Cost
FROM books
GROUP BY Category
ORDER BY 2 DESC;
SELECT Category,
COUNT(*) AS 'Category Total',
CONCAT('$', FORMAT(SUM(Cost), 2)) AS Cost
FROM books
GROUP BY Category
ORDER BY 3 DESC;
SELECT Category,
COUNT(*) AS 'Category Total',
CONCAT('$', FORMAT(SUM(Cost), 2)) AS Cost
FROM books
GROUP BY Category
ORDER BY 2 DESC;
SELECT Category,
COUNT(*) AS 'Category Total',
CONCAT('$', FORMAT(SUM(Cost), 2)) AS Cost
FROM books
GROUP BY Category
ORDER BY Cost DESC;
SELECT Category,
COUNT(*) AS 'Category Total',
CONCAT('$', FORMAT(SUM(Cost), 2)) AS Cost
FROM books
GROUP BY Category
ORDER BY 3 DESC;
SELECT Category,
COUNT(*) AS 'Category Total',
CONCAT('$', FORMAT(SUM(Cost), 2)) AS Cost
FROM books
GROUP BY Category
ORDER BY 3 ASC, 2 ASC;
SELECT Category,
COUNT(*) AS 'Category Total',
CONCAT('$', FORMAT(SUM(Cost), 2)) AS Cost
FROM books
GROUP BY Category
ORDER BY 3 DESC, 2 DESC;
SELECT Category,
COUNT(*) AS 'Category Total',
CONCAT('$', FORMAT(SUM(Cost), 2)) AS Cost
FROM books
GROUP BY Category;
SELECT Category,
Count(*) AS 'Category Total'
FROM books
GROUP BY Category
ORDER BY 2 DESC;
SELECT Category,
Count(*) AS 'Category Total'
FROM books
GROUP BY Category
ORDER BY 2 DESC;
SELECT Category,
Count(*) AS 'Category Total'
FROM books
GROUP BY Category
ORDER BY "Category Total" DESC;
SELECT Category,
Count(*) AS 'Category Total'
FROM books
GROUP BY Category
ORDER BY 'Category Total' DESC;
SELECT Category,
Count(*) AS 'Category Total'
FROM books
GROUP BY Category DESC;
SELECT Category,
Count(*) AS 'Category Total'
FROM books
GROUP BY Category Desc;
SELECT OrderNum, 
OrderDate, 
ShipDate,
ROUND(ABS(TIMESTAMPDIFF(DAY, OrderDate, ShipDate) / 30.0), 2) AS 'Months Between'
FROM book_order
WHERE ShipDate IS NOT NULL;
SELECT OrderNum, OrderDate, ShipDate
FROM book_order
WHERE ShipDate IS NOT NULL;
SELECT OrderNum, 
OrderDate, 
ShipDate,
ROUND(ABS(TIMESTAMPDIFF(DAY, OrderDate, ShipDate) / 30.0), 2) AS 'Months Between'
FROM book_order
WHERE ShipDate IS NOT NULL;
SELECT OrderNum,
DATE_FORMAT(OrderDate, '%M %d, %Y') AS 'Date Ordered',
Shipcity, Shipstate, Shipzip
FROM book_order
WHERE Shipcity IN ('Atlanta', 'Austin');
SELECT *
FROM book_order;
SELECT OrderNum,
DATE_FORMAT(OrderDate, '%M %d, %Y') AS 'Date Ordered',
Shipcity, Shipstate, Shipzip
FROM book_order
WHERE Shipcity IN ('Atlanta', 'Austin');
SELECT * from book_order;
SELECT OrderNum,
DATE_FORMAT(OrderDate, '%M %d, %Y') AS 'Date Ordered',
Shipcity, Shipstate, Shipzip
FROM book_order
WHERE Shipcity IN ('Atlanta', 'Austin');
SELECT OrderNum,
DATE_FORMAT(OrderDate, '%M %d, %Y') AS 'Date Ordered',
Shipcity, Shipstate, Shipzip
FROM book_order
WHERE ShipState IN ('Atlanta', 'Austin');
SELECT OrderNum,
DATE_FORMAT(OrderDate, '%M %d, %Y') AS 'Date Ordered',
Shipcity, Shipstate, Shipzip
FROM book_order
WHERE ShipState IN ('Atlanta' OR 'Austin');
SELECT OrderNum,
DATE_FORMAT(OrderDate, '%M %d, $Y') AS 'Date Ordered',
Shipcity, Shipstate, Shipzip
FROM book_order
WHERE ShipState IN ('Atlanta' OR 'Austin');
SELECT
CONCAT(
SUBSTR(ISBN, 1, 1), '-',
SUBSTR(ISBN, 2, 3), '-',
SUBSTR(ISBN, 5, 5), '-',
SUBSTR(ISBN, 10, 1)
) AS 'Formatted ISBN', 
Title
FROM books
WHERE Category = 'Computer';
SELECT 
  CONCAT(
    SUBSTR(ISBN, 1, 1), '-',          -- First digit
    SUBSTR(ISBN, 2, 3), '-',          -- Next three digits
    SUBSTR(ISBN, 5, 5), '-',          -- Next five digits
    SUBSTR(ISBN, 10, 1)               -- Last digit
  ) AS Formatted_ISBN,
  Title
FROM BOOKS
WHERE Category = 'COMPUTER';
SELECT
CONCAT(
SUBSTR(ISBN, 1, 1), '-',
SUBSTR(ISBN, 2, 3), '-',
SUBSTR(ISBN, 5, 5), '-',
SUBSTR(ISBN, 10, 1)
) AS 'Formatted ISBN'
FROM books
WHERE Category = 'Computer';
SELECT 
  DATE_FORMAT(NOW(), '%a') AS Day,
  DATE_FORMAT(NOW(), '%H') AS Hour,
  DATE_FORMAT(NOW(), '%i') AS Minutes,
  DATE_FORMAT(NOW(), '%s') AS Seconds
FROM DUAL;
SELECT CustNum AS 'Customer Number', FirstName AS 'First Name', LastName AS 'Last Name',
CASE
WHEN Referred IS NULL THEN 'NOT REFERRED'
ELSE 'REFERRED'
END AS 'STATUS'
FROM book_customer;
SELECT CustNum, FirstName, LastName,
CASE
WHEN Referred IS NULL THEN 'NOT REFERRED'
ELSE 'REFERRED'
END AS 'STATUS'
FROM book_customer;
SELECT Title, PubID AS 'Publisher ID', PubDate AS 'Published Date'
 FROM books
 WHERE (PubID = 4) OR (PubDate > '2001-01-01')
 ORDER BY PubID ASC;
SELECT Title, PubID AS 'Publisher ID', PubDate AS 'Published Date'
 FROM books;
SELECT Title, PubID AS 'Publisher ID', PubDate AS 'Published Date'
 FROM books
 WHERE (PubID = 4) OR (PubDate = '2001-01-01')
 ORDER BY PubID ASC;
SELECT Title, PubID AS 'Publisher ID', PubDate AS 'Published Date'
 FROM books
 WHERE PubID = 4 OR PubDate = '2001-01-01'
 ORDER BY PubID ASC;
SELECT *
 FROM book_order
 WHERE OrderDate BETWEEN '2003-04-02' AND '2003-04-05';
SELECT *
 FROM book_order
 WHERE OrderDate BETWEEN '2003-04-02' AND '2003-04-05';
SELECT *
 FROM book_order
 WHERE OrderDate > '2003-04-01'
 AND OrderDate < '2003-04-04';
SELECT *
 FROM author
 WHERE Fname LIKE "%A"
 ORDER BY Lname DESC, Fname DESC;
SELECT *
FROM book_customer
WHERE (STATE = 'FL' OR STATE = 'NJ')
AND referred IS NULL;
SELECT *
FROM books
WHERE Category != 'Computer'
AND Retail <= 30;
SELECT *
FROM books
WHERE Category != 'Computer'
AND Retail <= $30;
SELECT *
FROM book_customer
WHERE (STATE = 'FL' OR STATE = 'NJ')
AND referred IS NULL;
Select *
From book_customer;
SELECT *
FROM book_customer
WHERE (STATE = 'FL' OR STATE = 'NJ')
AND referred IS NULL;
SELECT *
FROM book_customer
WHERE STATE = 'FL' OR 'NJ'
AND referred IS NULL;
SELECT *
FROM book_customer;
SELECT *
FROM book_customer
WHERE (STATE = 'FL' OR 'NJ')
AND referred IS NULL;
SELECT *
FROM book_order
WHERE ShipDate IS NULL;
SELECT *
FROM book_order
WHERE MONTHNAME(OrderDate) = 'April'
AND YEAR(OrderDate) = '2003'
AND DAY(OrderDate) = '02';
SELECT FirstName, LastName, City
FROM book_customer
WHERE Zip=31206;
SELECT Title, PubID AS 'Publisher ID'
FROM books;
SELECT Title, Retail, Retail - Cost AS 'Price Markup'
FROM books;
SELECT Title, PubID AS 'Publisher ID'
FROM books;
SELECT (Title, PubID) AS 'Publisher ID'
FROM books;
SELECT DISTINCT category
FROM books;

SELECT firstname, lastname
 FROM book_customer C
 WHERE NOT EXISTS (SELECT 1
				FROM book_order
                WHERE C.CustNum = custNum);
SELECT count(*) AS COUNT
FROM (SELECT DISTINCT firstname
 FROM book_customer C
 WHERE EXISTS (SELECT 1
				FROM book_order
                WHERE C.CustNum = custNum)) X;
SELECT count(*) AS COUNT
FROM (SELECT firstname, lastname
 FROM book_customer C
 WHERE EXISTS (SELECT 1
				FROM book_order
                WHERE C.CustNum = custNum)) X;
SELECT count(*)
FROM (SELECT firstname, lastname
 FROM book_customer C
 WHERE EXISTS (SELECT 1
				FROM book_order
                WHERE C.CustNum = custNum)) X;
SELECT firstname, lastname
 FROM book_customer C
 WHERE EXISTS (SELECT 1
				FROM book_order
                WHERE C.CustNum = custNum);
SELECT DISTINCT shipstate
FROM book_order
WHERE OrderNum IN (SELECT OrderNum
			FROM book_order
			WHERE CustNum IN (SELECT Referred
								FROM book_customer
								WHERE CustNum = (SELECT CustNum
													FROM book_customer
													WHERE FirstName= "Tammy"
													AND LastName = "Giana")));
SELECT shipstate
FROM book_order
WHERE OrderNum IN (SELECT OrderNum
			FROM book_order
			WHERE CustNum IN (SELECT Referred
								FROM book_customer
								WHERE CustNum = (SELECT CustNum
													FROM book_customer
													WHERE FirstName= "Tammy"
													AND LastName = "Giana")));
SELECT shipstate
FROM book_order
WHERE OrderNum = (SELECT OrderNum
			FROM book_order
			WHERE CustNum IN (SELECT Referred
								FROM book_customer
								WHERE CustNum = (SELECT CustNum
													FROM book_customer
													WHERE FirstName= "Tammy"
													AND LastName = "Giana")));
SELECT OrderNum
FROM book_order
WHERE CustNum IN (SELECT Referred
					FROM book_customer
                    WHERE CustNum = (SELECT CustNum
										FROM book_customer
                                        WHERE FirstName= "Tammy"
                                        AND LastName = "Giana"));
SELECT OrderNum
FROM book_order
WHERE CustNum IN (SELECT CustNum
					FROM book_customer
                    WHERE Referred = (SELECT Referred
										FROM book_customer
                                        WHERE FirstName= "Tammy"
                                        AND LastName = "Giana"));
SELECT OrderNum
FROM book_order
WHERE CustNum IN (SELECT CustNum
					FROM book_customer
                    WHERE Referred = (SELECT Referred
										FROM book_customer
                                        WHERE FName= "Tammy"
                                        AND LName = "Giana"));
SELECT DISTINCT C.FirstName, C.LastName
FROM book_customer C
WHERE C.CustNum IN (SELECT Referred
					FROM book_customer R
                    WHERE referred IS NOT NULL);
SELECT DISTINCT C.FirstName, C.LastName
FROM book_customer C
WHERE C.CustNum IN (SELECT CustNum
					FROM book_customer R
                    WHERE referred IS NOT NULL);
SELECT DISTINCT C.FirstName, C.LastName
FROM book_customer C
WHERE C.CustNum IN (SELECT CustNum
					FROM book_customer R
                    WHERE referred =! NULL);
SELECT DISTINCT C.FirstName, C.LastName
FROM book_customer C, book_customer R
WHERE R.referred = C.CustNum;
SELECT C.FirstName, C.LastName
FROM book_customer C, book_customer R
WHERE R.referred = C.CustNum;
SELECT R.FirstName, R.LastName
FROM book_customer C, book_customer R
WHERE R.referred = C.CustNum;
SELECT FirstName, LastName
FROM book_customer C, book_customer R
WHERE R.referred = C.CustNum;
SELECT LastName, FirstName
FROM book_customer C, book_customer R
WHERE R.referred = C.CustNum;
SELECT Lname, Fname AS "FULL NAME"
FROM author
WHERE authorID IN  (SELECT authorID
					FROM book_author
					WHERE ISBN IN (SELECT ISBN
								FROM books
								WHERE PubID = (SELECT PubID
									FROM book.publisher
									WHERE Name = "printing is us")));
SELECT Lname, Fname
FROM author
WHERE authorID IN  (SELECT authorID
					FROM book_author
					WHERE ISBN IN (SELECT ISBN
								FROM books
								WHERE PubID = (SELECT PubID
									FROM book.publisher
									WHERE Name = "printing is us")));
SELECT Lname, Fname
FROM author
WHERE authorID =   (SELECT authorID
					FROM book_author
					WHERE ISBN IN (SELECT ISBN
								FROM books
								WHERE PubID = (SELECT PubID
									FROM book.publisher
									WHERE Name = "printing is us")));
SELECT authorID
FROM book_author
WHERE ISBN IN (SELECT ISBN
			FROM books
			WHERE PubID = (SELECT PubID
				FROM book.publisher
				WHERE Name = "printing is us"));
SELECT authorID
FROM book_author
WHERE ISBN = (SELECT ISBN
			FROM books
			WHERE PubID = (SELECT PubID
				FROM book.publisher
				WHERE Name = "printing is us"));
SELECT ISBN
FROM books
WHERE PubID = (SELECT PubID
				FROM book.publisher
				WHERE Name = "printing is us");
SELECT ISBN
FROM books, publisher
WHERE books.PubID = publisher.PubID
AND Name = "printing is us";
SELECT PubID
FROM book.publisher
WHERE Name = "printing is us";
SELECT Fname, Lname, Title
FROM author A, book_author B, books C
WHERE A.authorID = B.authorID AND B.ISBN = C.ISBN
AND A.Fname = "James" AND A.Lname = "AUSTIN";
SELECT Title
FROM books
WHERE ISBN = (SELECT ISBN
				FROM book_author
                WHERE authorid = (SELECT authorID
									FROM author
                                    WHERE Lname = Austin
									AND Fname = James));
SELECT Title
FROM author A, books B, book_author C
WHERE authorId = (SELECT authorId
				FROM author
                WHERE Lname = Austin
                AND Fname = James);
SELECT Title
FROM author A, books B, book_author C
WHERE A.authorID = C.authorid
AND authorId = (SELECT authorId
				FROM author
                WHERE Lname = Austin
                AND Fname = James);
