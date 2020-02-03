/*
Create an Order_Master database and also create the following
tables with appropriate constraints and input at least 20 records
in Order_Master table, 05 records in Product_master table,
and 10 records in Salesman_master table.
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
VALUES (2101,"MONITOR","FULL HD+ DISPLAY",15,1500,1000);
INSERT INTO Product_Master
VALUES (3201,"CPU","WITH 8GB RAM & 256GB SSD",10,9600,8000);
INSERT INTO Product_Master
VALUES (4301,"SOUND SYSTEM","WITH ULTRA 2 SUBWOOFAR",19,999,800);
INSERT INTO Product_Master
VALUES (5401,"KEYBOARD","WITH INBUILT SCROLLING",25,950,790);
INSERT INTO Product_Master
VALUES (6501,"MOUSE","WITH EXTRA GAMING BUTTONS",25,650,500);

CREATE TABLE Salesman_Master
(
	Salesman_no INTEGER PRIMARY KEY,
	Salesman_name VARCHAR(50),
	City VARCHAR(50),
	Pincode INTEGER,
	State VARCHAR(50),
	Salary INTEGER,
	Remarks VARCHAR(50),
	Order_no INTEGER,
	FOREIGN KEY(Order_no) REFERENCES Order_Master(Order_no)
);

/*
10 records in Salesman_master table.
/*7.	Change the city of salesman ‘Akshay’ to ‘UNJHA’ in salesman_master table.
‘Dipika’
/*10.	Delete all salesman from salesman_master whose salaries are greater than 5000RS.*/
/*15.	Count the total number of salesmen working in surat city.*/
/*5.	List all the salesmen who are located in Mumbai.*/
/*15.	Count the total number of salesmen working in surat city.*/



Dipika
Akshay
Chirag
Mihir
Venky
Bhavin
Ravi
Divyang
Jayan
Kartik
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

/*1.	Display all the order with payment_type ‘UPI’.*/
/*12.	Delete from Order_master where order duration more than 6 months.*/
/*20.	Increase the price of products by 5% which has highest discount.*/
/*21.	Display all the products sold today.*/
/*23.	Update GST for all orders to 7%.*/





ALTER TABLE Order_Master
ADD CONSTRAINT FK FOREIGN KEY(Prod_no)
REFERENCES Product_Master(Product_no);





/*1.	Display all the order with payment_type ‘UPI’.*/

/*2.	Display all salesman name from salesman_master table.*/

/*3.	Retrieve the list of name and city of all the salesmen.*/

/*4.	List the various products available in product_master table.*/

/*5.	List all the salesmen who are located in Mumbai.*/

/*6.	List all the products whose sell_price is >= 1000 rupees.*/

/*7.	Change the city of salesman ‘Akshay’ to ‘UNJHA’ in salesman_master table.*/

/*8.	Change the cost_price of monitor to 999.50 rupees.*/

/*9.	Change the salary of ‘Dipika’ to 6500 rupees.*/

/*10.	Delete all salesman from salesman_master whose salaries are greater than 5000RS.*/

/*11.	Delete all products from product_master where the quantity is equal to 100.*/

/*12.	Delete from Order_master where order duration more than 6 months.*/

/*13.	Add a column called ‘telephone’ of data type number and size 10 to the salesman_master table.*/

/*14.	Change the size of sell_price column in product_master to (10,2).*/

/*15.	Count the total number of salesmen working in surat city.*/

/*16.	Display the name of the product whose order placed maximum time.*/

/*17.	Destroy the table Order_master along with its data.*/

/*18.	Display total GST collected on current date.*/

/*19.	Display all products whose name are four characters long and starts with ‘a’.*/

/*20.	Increase the price of products by 5% which has highest discount.*/

/*21.	Display all the products sold today.*/

/*22.	Display total stock of all the product.*/

/*23.	Update GST for all orders to 7%.*/
