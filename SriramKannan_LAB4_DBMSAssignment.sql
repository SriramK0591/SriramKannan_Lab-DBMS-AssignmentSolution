create database if not exists ecomm_db;
use ecomm_db;


-- Supplier table
create table if not exists supplier(
    SUPP_ID int not null primary key auto_increment,
    SUPP_NAME varchar(50) not null,
    SUPP_CITY varchar(50) not null,
    SUPP_PHONE varchar(50) not null);
    
-- Customer table
create table if not exists customer(
    CUS_ID int not null primary key auto_increment,
    CUS_NAME varchar(20) not null,
    CUS_PHONE varchar(10) not null,
    CUS_CITY varchar(30) not null,
    CUS_GENDER CHAR);
    
-- Category table
create table if not exists category(
    CAT_ID int not null primary key auto_increment,
    CAT_NAME varchar(20) not null);
    
-- Product table
create table if not exists product(
    PRO_ID int not null primary key auto_increment,
    PRO_NAME varchar(20) not null default "DUMMY",
    PRO_DESC varchar(60),
    CAT_ID int,
    foreign key(CAT_ID) references category(CAT_ID));
    
-- Supplier pricing table
create table if not exists supplier_pricing(
    PRICING_ID int not null primary key auto_increment,
    PRO_ID int,
    SUPP_ID int,
    SUPP_PRICE int default 0,
    foreign key(PRO_ID) references product(PRO_ID),
    foreign key(SUPP_ID) references supplier(SUPP_ID));
    
-- order table
create table if not exists orders(
    ORD_ID int not null primary key auto_increment,
    ORD_AMOUNT int not null,
    ORD_DATE date not null,
    CUS_ID int,
    PRICING_ID int,
    foreign key(CUS_ID) references customer(CUS_ID),
    foreign key(PRICING_ID) references supplier_pricing(PRICING_ID));

-- rating table
create table if not exists rating(
    RAT_ID int not null primary key auto_increment,
    ORD_ID int,
    RAT_RATSTARS int not null,
    foreign key(ORD_ID) references orders(ORD_ID));

-- Inserting the records into each table for performing analysis
-- 1) Supplier table
insert into supplier(SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) values (1, 'Rajesh Retails', 'Delhi', '1234567890');
insert into supplier(SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) values (2, 'Appario Ltd.', 'Mumbai', '2589631470');
insert into supplier(SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) values (3, 'Knome products', 'Bangalore', '9785462315');
insert into supplier(SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) values (4, 'Bansal Retails ', 'Kochi', '8975463285');
insert into supplier(SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) values (5, 'Mittal Ltd.', 'Lucknow', '7898456532');

-- 2) Customer table
insert into customer(CUS_ID, CUS_NAME, CUS_PHONE,CUS_CITY, CUS_GENDER) values (1, 'AAKASH', '9999999999', 'DELHI','M');
insert into customer(CUS_ID, CUS_NAME, CUS_PHONE,CUS_CITY, CUS_GENDER) values (2, 'AMAN', '9785463215', 'NOIDA','M');
insert into customer(CUS_ID, CUS_NAME, CUS_PHONE,CUS_CITY, CUS_GENDER) values (3, 'NEHA', '9999999999', 'MUMBAI','F');
insert into customer(CUS_ID, CUS_NAME, CUS_PHONE,CUS_CITY, CUS_GENDER) values (4, 'MEGHA', '9994562399', 'KOLKATA','F');
insert into customer(CUS_ID, CUS_NAME, CUS_PHONE,CUS_CITY, CUS_GENDER) values (5, 'PULKIT', '7895999999', 'LUCKNOW','M');

-- 3) Category table
insert into category(CAT_ID, CAT_NAME) values (1, 'BOOKS');
insert into category(CAT_ID, CAT_NAME) values (2, 'GAMES');
insert into category(CAT_ID, CAT_NAME) values (3, 'GROCERIES');
insert into category(CAT_ID, CAT_NAME) values (4, 'ELECTRONICS');
insert into category(CAT_ID, CAT_NAME) values (5, 'CLOTHES');

-- 4) Product table
insert into product(PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2);
insert into product(PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5);
insert into product(PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4);
insert into product(PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (4, 'OATS', 'Highly Nutritious from Nestle', 3);
insert into product(PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1);
insert into product(PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (6, 'MILK', '1L Toned MIlk', 3);
insert into product(PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4);
insert into product(PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5);
insert into product(PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (9, 'Project IGI', 'compatible with windows 7 and above', 2);
insert into product(PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5);
insert into product(PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki ', 1);
insert into product(PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values (12, 'Train Your Brain', 'By Shireen Stephen', 1);

-- 5) supplier pricing table
insert into supplier_pricing(PRICING_ID, PRO_ID, SUPP_ID,SUPP_PRICE) values (1, 1, 2, 1500);
insert into supplier_pricing(PRICING_ID, PRO_ID, SUPP_ID,SUPP_PRICE) values (2, 3, 5, 30000);
insert into supplier_pricing(PRICING_ID, PRO_ID, SUPP_ID,SUPP_PRICE) values (3, 5, 1, 3000);
insert into supplier_pricing(PRICING_ID, PRO_ID, SUPP_ID,SUPP_PRICE) values (4, 2, 3, 2500);
insert into supplier_pricing(PRICING_ID, PRO_ID, SUPP_ID,SUPP_PRICE) values (5, 4, 1, 1500);

-- 6) orders table
SET FOREIGN_KEY_CHECKS=0; -- as there're pricing IDs in this table not exiting in the Supplier Pricing table
insert into orders(ORD_ID, ORD_AMOUNT, ORD_DATE,CUS_ID,PRICING_ID) values (101, 1500, '2021-10-06', 2,1);
insert into orders(ORD_ID, ORD_AMOUNT, ORD_DATE,CUS_ID,PRICING_ID) values (102, 1000, '2021-10-12', 3,5);
insert into orders(ORD_ID, ORD_AMOUNT, ORD_DATE,CUS_ID,PRICING_ID) values (103, 30000, '2021-09-16', 5,2);
insert into orders(ORD_ID, ORD_AMOUNT, ORD_DATE,CUS_ID,PRICING_ID) values (104, 1500, '2021-10-05', 1,1);
insert into orders(ORD_ID, ORD_AMOUNT, ORD_DATE,CUS_ID,PRICING_ID) values (105, 3000, '2021-08-16', 4,3);
insert into orders(ORD_ID, ORD_AMOUNT, ORD_DATE,CUS_ID,PRICING_ID) values (106, 1450, '2021-08-18', 1,9);
insert into orders(ORD_ID, ORD_AMOUNT, ORD_DATE,CUS_ID,PRICING_ID) values (107, 789, '2021-09-01', 3,7);
insert into orders(ORD_ID, ORD_AMOUNT, ORD_DATE,CUS_ID,PRICING_ID) values (108, 780, '2021-09-07', 5,6);
insert into orders(ORD_ID, ORD_AMOUNT, ORD_DATE,CUS_ID,PRICING_ID) values (109, 3000, '2021-09-10', 5,3);
insert into orders(ORD_ID, ORD_AMOUNT, ORD_DATE,CUS_ID,PRICING_ID) values (110, 2500, '2021-09-10', 2,4);
insert into orders(ORD_ID, ORD_AMOUNT, ORD_DATE,CUS_ID,PRICING_ID) values (111, 1000, '2021-09-15', 4,5);
insert into orders(ORD_ID, ORD_AMOUNT, ORD_DATE,CUS_ID,PRICING_ID) values (112, 789, '2021-09-16', 4,7);
insert into orders(ORD_ID, ORD_AMOUNT, ORD_DATE,CUS_ID,PRICING_ID) values (113, 31000, '2021-09-16', 1,8);
insert into orders(ORD_ID, ORD_AMOUNT, ORD_DATE,CUS_ID,PRICING_ID) values (114, 1000, '2021-09-16', 3,5);
insert into orders(ORD_ID, ORD_AMOUNT, ORD_DATE,CUS_ID,PRICING_ID) values (115, 3000, '2021-09-16', 5,3);
insert into orders(ORD_ID, ORD_AMOUNT, ORD_DATE,CUS_ID,PRICING_ID) values (116, 99, '2021-09-17', 2,14);

-- 7) rating table
insert into rating(RAT_ID, ORD_ID, RAT_RATSTARS) values (1, 101,4);
insert into rating(RAT_ID, ORD_ID, RAT_RATSTARS) values (2, 102,3);
insert into rating(RAT_ID, ORD_ID, RAT_RATSTARS) values (3, 103,1);
insert into rating(RAT_ID, ORD_ID, RAT_RATSTARS) values (4, 104,2);
insert into rating(RAT_ID, ORD_ID, RAT_RATSTARS) values (5, 105,4);
insert into rating(RAT_ID, ORD_ID, RAT_RATSTARS) values (6, 106,3);
insert into rating(RAT_ID, ORD_ID, RAT_RATSTARS) values (7, 107,4);
insert into rating(RAT_ID, ORD_ID, RAT_RATSTARS) values (8, 108,4);
insert into rating(RAT_ID, ORD_ID, RAT_RATSTARS) values (9, 109,3);
insert into rating(RAT_ID, ORD_ID, RAT_RATSTARS) values (10, 110,5);
insert into rating(RAT_ID, ORD_ID, RAT_RATSTARS) values (11, 111,3);
insert into rating(RAT_ID, ORD_ID, RAT_RATSTARS) values (12, 112,4);
insert into rating(RAT_ID, ORD_ID, RAT_RATSTARS) values (13, 113,2);
insert into rating(RAT_ID, ORD_ID, RAT_RATSTARS) values (14, 114,1);
insert into rating(RAT_ID, ORD_ID, RAT_RATSTARS) values (15, 115,1);
insert into rating(RAT_ID, ORD_ID, RAT_RATSTARS) values (16, 116,0);

-- Individual Queries
-- 3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
SELECT B.CUS_GENDER, COUNT(DISTINCT A.CUS_ID) AS TOTAL_CUSTOMERS FROM ORDERS A LEFT JOIN CUSTOMER B ON A.CUS_ID=B.CUS_ID 
WHERE A.ORD_AMOUNT>=3000
GROUP BY B.CUS_GENDER

-- 4) Display all the orders along with product name ordered by a customer having Customer_Id=2
SELECT D.CUS_NAME, Q.PRODUCT FROM (SELECT P.*, C.PRO_NAME AS PRODUCT FROM
(SELECT A.ORD_ID, A.CUS_ID, A.PRICING_ID, B.PRO_ID FROM ORDERS A LEFT JOIN SUPPLIER_PRICING B ON A.PRICING_ID=B.PRICING_ID WHERE CUS_ID=2)P
LEFT JOIN
PRODUCT C ON P.PRO_ID=C.PRO_ID)Q LEFT JOIN
CUSTOMER D ON Q.CUS_ID=D.CUS_ID
WHERE Q.PRODUCT IS NOT NULL

--5) Display the Supplier details who can supply more than one product.
SELECT A.SUPP_ID, B.SUPP_NAME, B.SUPP_CITY, B.SUPP_PHONE
FROM
(SELECT SUPP_ID, COUNT(DISTINCT PRO_ID) FROM SUPPLIER_PRICING GROUP BY SUPP_ID HAVING COUNT(DISTINCT PRO_ID)>1)A INNER JOIN
SUPPLIER B
ON A.SUPP_ID=B.SUPP_ID 

--6 Find the least expensive product from each category and print the table with category id, name, product name and price of the product
SELECT R.CAT_ID, R.CAT_NAME, R.PRO_ID, R.PRO_NAME FROM (SELECT Q.*, ROW_NUMBER() OVER (PARTITION BY Q.CAT_ID ORDER BY Q.SUPP_PRICE ASC) AS RNK
FROM (SELECT P.CAT_ID, P.CAT_NAME, C.PRO_ID, C.PRO_NAME, C.SUPP_PRICE FROM 
(SELECT A.PRO_ID, A.PRO_NAME, A.CAT_ID, B.SUPP_PRICE FROM PRODUCT A LEFT JOIN SUPPLIER_PRICING B
ON A.PRO_ID=B.PRO_ID)C
LEFT JOIN
CATEGORY P ON C.CAT_ID=P.CAT_ID)Q)R
WHERE R.RNK=1

--7 Display the Id and Name of the Product ordered after “2021-10-05”
SELECT P.PRO_ID, C.PRO_NAME AS PRODUCT FROM
(SELECT A.ORD_ID, A.ORD_DATE, A.PRICING_ID, B.PRO_ID FROM ORDERS A LEFT JOIN SUPPLIER_PRICING B ON A.PRICING_ID=B.PRICING_ID)P
LEFT JOIN
PRODUCT C ON P.PRO_ID=C.PRO_ID
WHERE P.ORD_DATE>'2021-10-05'

--8 Display customer name and gender whose names start or end with character 'A'.
SELECT DISTINCT CUS_NAME, CUS_GENDER FROM CUSTOMER WHERE CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A'

--9 Create a stored procedure to display supplier id, name, rating and Type_of_Service. 
--For Type_of_Service, If rating =5, print “Excellent Service”,
--If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”

DELIMITER && 
CREATE PROCEDURE RatingForSupplier()
BEGIN
SELECT E.SUPP_ID, F.SUPP_NAME, E.RAT_RATSTARS, 
CASE WHEN E.RAT_RATSTARS=5 THEN 'Excellent Service'
WHEN E.RAT_RATSTARS>4 THEN 'Good Service'
WHEN E.RAT_RATSTARS>2 THEN 'Average Service'
ELSE 'Poor Service' end as Type_of_Service FROM (SELECT C.*, D.SUPP_ID FROM
(SELECT A.ORD_ID, A.RAT_RATSTARS, B.PRICING_ID FROM RATING A LEFT JOIN ORDERS B ON A.ORD_ID=B.ORD_ID) C LEFT JOIN
SUPPLIER_PRICING D
ON C.PRICING_ID=D.PRICING_ID)E LEFT JOIN
SUPPLIER F ON E.SUPP_ID=F.SUPP_ID
WHERE E.SUPP_ID IS NOT NULL;
END &&
DELIMITER ;  

CALL RatingForSupplier;





