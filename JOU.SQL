
/*
Create an Order_Master database and also create the following
tables with appropriate constraints and input at least 20 records
in Order_Master table, 05 records in Product_master table,
and 10 records in  Salesman_master table.
*/

CREATE TABLE Order_Master
(
	Order_no INTEGER PRIMARY KEY,
	Prod_no INTEGER,
	Qty INTEGER,
	Discount INTEGER,
	Order_date DATE,
	GST INTEGER,
	Payment_Type VARCHAR(50),
	Total_Amount INTEGER
);

/*1.	Display all the order with payment_type ‘UPI’.*/
/*12.	Delete from Order_master where order duration more than 6 months.*/
/*20.	Increase the price of products by 5% which has highest discount.*/
/*21.	Display all the products sold today.*/
/*23.	Update GST for all orders to 7%.
*/
INSERT INTO Order_Master
VALUES (1209,3201,2,5,'2018-05-23',3,'GOOGLE PAY',19200);
INSERT INTO Order_Master
VALUES (1210,4301,1,4,'2019-06-30',2,'UPI',500);
INSERT INTO Order_Master
VALUES (1211,2101,1,2,'2020-07-02',3,'PAYTM',1500);
INSERT INTO Order_Master
VALUES (1212,5401,3,4,'2019-11-21',5,'PAYPAL',2850);
INSERT INTO Order_Master
VALUES (1213,2101,2,5,'2019-12-25',3,'AMAZON PAY',3000);
INSERT INTO Order_Master
VALUES (1214,3201,2,6,'2019-01-09',0,'PHONE PAY',19200);
INSERT INTO Order_Master
VALUES (1215,2101,1,2,'2019-02-31',3,'AIRTEL BANK',1500);
INSERT INTO Order_Master
VALUES (1216,5401,5,4,'2019-06-18',2,'GOOGLE PAY',4750);
INSERT INTO Order_Master
VALUES (1217,3201,1,7,'2019-05-01',3,'UPI',9600);
INSERT INTO Order_Master
VALUES (1218,4301,2,9,'2019-03-26',1,'GOOGLE PAY',1000);
INSERT INTO Order_Master
VALUES (1219,5401,1,10,'2019-09-28',1,'UPI',950);
INSERT INTO Order_Master
VALUES (1220,6501,1,5,'2019-10-30',5,'PAYTM',650);
INSERT INTO Order_Master
VALUES (1221,4301,3,6,'2019-12-12',2,'AMAZON PAY',1500);
INSERT INTO Order_Master
VALUES (1222,3201,5,4,'2019-11-10',10,'GOOGLE PAY',48000);
INSERT INTO Order_Master
VALUES (1223,2101,1,9,'2018-08-07',1,'UPI',1500);
INSERT INTO Order_Master
VALUES (1224,4301,1,7,'2019-07-23',3,'PAYTM',500);
INSERT INTO Order_Master
VALUES (1225,6501,2,2,'2019-06-08',2,'GOOGLE PAY',1300);
INSERT INTO Order_Master
VALUES (1226,4301,2,5,'2019-04-22',5,'AIRTEL BANK',1000);
INSERT INTO Order_Master
VALUES (1227,2101,3,4,'2019-02-17',2,'AMAZON PAY',4500);
INSERT INTO Order_Master
VALUES (1228,3201,1,3,'2020-01-24',0,'PHONE PAY',9600);


Trushil
Parth
Khayati
Sweta
Mahesh
Ankit
Dhwani
Mitesh
Jonny
Rohen
Shruti
Preeti
Kabir
Khalid
Sohel
Dhaval
Vikram
Rakesh
Fenil
Adarsh



CREATE TABLE Product_Master
(
	Product_no INTEGER PRIMARY KEY,
	Product_name VARCHAR(50),
	Description VARCHAR(50),
	Quantity INTEGER,
	Sell_Price INTEGER,
	Cost_Price FLOAT
);
/*11.	Delete all products from product_master where the quantity is equal to 100.*/
/*8.	Change the cost_price of monitor to 999.50 rupees.*/
/*19.	Display all products whose name are four characters long and starts with ‘a’.*/



INSERT INTO Product_Master
VALUES (2101,'MONITOR','FULL HD+ DISPLAY',15,1500,1000);
INSERT INTO Product_Master
VALUES (3201,'CPU','WITH 8GB RAM & 256GB SSD',10,9600,8000);
INSERT INTO Product_Master
VALUES (4301,'ABCD','UPTO "Z" ALPHABETS',100,500,450);
INSERT INTO Product_Master
VALUES (5401,'KEYBOARD','WITH INBUILT SCROLLING',25,950,790);
INSERT INTO Product_Master
VALUES (6501,'MOUSE','WITH EXTRA GAMING BUTTONS',25,650,500);

CREATE TABLE Salesman_Master
(
	Salesman_no INTEGER PRIMARY KEY,
	Salesman_name VARCHAR(50),
	City VARCHAR(50),
	Pincode INTEGER,
	State VARCHAR(50),
	Salary INTEGER,
	Remarks VARCHAR(50),
	Order_no INTEGER--,
	--FOREIGN KEY(Order_no) REFERENCES Order_Master(Order_no)
);

/*
10 records in Salesman_master table.
/*7.	Change the city of salesman ‘Akshay’ to ‘UNJHA’ in salesman_master table.
/*9.	Change the salary of ‘Dipika’ to 6500 rupees.*/
/*10.	Delete all salesman from salesman_master whose salaries are greater than 5000RS.*/
/*15.	Count the total number of salesmen working in surat city.*/
/*5.	List all the salesmen who are located in Mumbai.*/
/*15.	Count the total number of salesmen working in surat city.*/


INSERT INTO Salesman_Master 
VALUES(1024,'Akshay','Surat',394210,'Gujarat',12560,'VERY LAZY PERSON',1209);
INSERT INTO Salesman_Master 
VALUES(2024,'Dipika','Mumbai',395050,'Maharashtra',15000,'VERY TALL PERSON',1210);
INSERT INTO Salesman_Master 
VALUES(3024,'Chirag','Navsari',399305,'Gujarat',10000,'VERY THIN PERSON',1211);
INSERT INTO Salesman_Master 
VALUES(4024,'Mihir','Surat',394220,'Gujarat',2500,'VERY LONGLIVING PERSON',1212);
INSERT INTO Salesman_Master 
VALUES(5024,'Venky','Mumbai',405010,'Maharashtra',9500,'CHILDLIKE PERSON',1213);
INSERT INTO Salesman_Master 
VALUES(6024,'Bhavin','Kerla',505109,'Kerla',16350,'ACTIVE PERSON',1214);
INSERT INTO Salesman_Master 
VALUES(7024,'Ravi','Surat',390081,'Gujarat',1530,'VERY FAT PERSON',1215);
INSERT INTO Salesman_Master 
VALUES(8024,'Divyang','Jaipur',415263,'Rajasthan',1250,'VERY FUNNY PERSON',1216);
INSERT INTO Salesman_Master 
VALUES(9024,'Jayan','Shirdi',395052,'Maharashtra',1100,'VERY ROMANTIC PERSON',1217);
INSERT INTO Salesman_Master 
VALUES(10024,'Miral','Karnatka',665934,'Karnatka',4500,'VERY STYLISH PERSON',1218);


ALTER TABLE Order_Master
ADD CONSTRAINT FK FOREIGN KEY(Prod_no)
REFERENCES Product_Master(Product_no);





/*1.	Display all the order with payment_type ‘UPI’.*/
SELECT * FROM Order_Master WHERE Payment_Type LIKE 'UPI';

/*2.	Display all salesman name from salesman_master table.*/
SELECT Salesman_name FROM Salesman_Master;

/*3.	Retrieve the list of name and city of all the salesmen.*/
SELECT Salesman_name,City FROM Salesman_Master;

/*4.	List the various products available in product_master table.*/
SELECT DISTINCT Product_name FROM Product_Master;

/*5.	List all the salesmen who are located in Mumbai.*/
SELECT * FROM Salesman_Master WHERE City LIKE 'MUMBAI';

/*6.	List all the products whose sell_price is >= 1000 rupees.*/
SELECT * FROM Product_Master WHERE Sell_Price >=1000;

/*7.	Change the city of salesman ‘Akshay’ to ‘UNJHA’ in salesman_master table.*/
UPDATE Salesman_Master SET City = 'UNJHA' WHERE Salesman_name LIKE 'AKSHAY';

/*8.	Change the cost_price of monitor to 999.50 rupees.*/
UPDATE Product_Master SET Cost_Price = 999.50 WHERE Product_name LIKE 'MONITOR';

/*9.	Change the salary of ‘Dipika’ to 6500 rupees.*/
UPDATE Salesman_Master SET Salary = 6500 WHERE Salesman_name LIKE 'DIPIKA';

/*10.	Delete all salesman from salesman_master whose salaries are greater than 5000RS.*/

/*11.	Delete all products from product_master where the quantity is equal to 100.*/

/*12.	Delete from Order_master where order duration more than 6 months.*/

/*13.	Add a column called ‘telephone’ of data type number and size 10 to the salesman_master table.*/
ALTER TABLE Salesman_Master ADD COLUMN 'Telephone' INTEGER(10);


/*14.	Change the size of sell_price column in product_master to (10,2).*/
ALTER TABLE Product_Master ALTER COLUMN Sell_Price FLOAT(10.2);
alter table alter column datatype[double](10,2);

/*15.	Count the total number of salesmen working in surat city.*/
SELECT * FROM Salesman_Master WHERE City LIKE 'SURAT';

/*16.	Display the name of the product whose order placed maximum time.*/

/*17.	Destroy the table Order_master along with its data.*/
DROP TABLE Order_Master;

/*18.	Display total GST collected on current date.*/

/*19.	Display all products whose name are four characters long and starts with ‘a’.*/
SELECT Product_name FROM Product_Master WHERE Product_name	LIKE 'A___'

/*20.	Increase the price of products by 5% which has highest discount.*/

/*21.	Display all the products sold today.*/

/*22.	Display total stock of all the product.*/

/*23.	Update GST for all orders to 7%.*/
