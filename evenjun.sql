UCCC & SPBCBA & SDHG COLLEGE OF BCA AND I.T.
F.Y.B.C.A. (Sem-2) DBMS (206) 

PRACTICAL JOURNAL: 2019-20

SET - II (Even Roll Nos.)

Create an Order_Master database and also create the following tables with appropriate constraints and input at least 20 records in Order_Master table, 05 records in Product_master table, and 10 records in Salesman_master table.

Table Name: Order_Master
Field Name		Field Type	           Constraints
Order_no		Number	           Primary Key
Prod_no		Number		Foreign Key
Qty			Number
Discount		Number
Order_date		Date
GST			Number 
Payment_Type	Text			
Total_Amount	Number		

Table Name: Product_master
Field Name		Field Type	           Constraints
Product_no		Number	           Primary Key
Product_name	Text
Description		Text
Quantity		Number
Sell_Price		Number
Cost_Price		Number

Table Name: Salesman_master
Field Name		Field Type	           Constraints
Salesman_no		Number	           Primary Key
Salesman_name	Text
City			Text
Pincode		Number
State			Text
Salary			Number
Remarks		Text
Order_No		Number		Foreign Key
Solve the following queries.
    1. Display all the order with payment_type ‘UPI’.
    2. Display all salesman name from salesman_master table.
    3. Retrieve the list of name and city of all the salesmen.
    4. List the various products available in product_master table.
    5. List all the salesmen who are located in Mumbai.
    6. List all the products whose sell_price is >= 1000 rupees.
    7. Change the city of salesman ‘Akshay’ to ‘UNJHA’ in salesman_master table.
    8. Change the cost_price of monitor to 999.50 rupees.
    9. Change the salary of ‘Dipika’ to 6500 rupees.
    10. Delete all salesman from salesman_master whose salaries are greater than 5000RS.
    11. Delete all products from product_master where the quantity is equal to 100.
    12. Delete from Order_master where order duration more than 6 months.
    13. Add a column called ‘telephone’ of data type number and size 10 to the salesman_master table.
    14. Change the size of sell_price column in product_master to (10,2).
    15. Count the total number of salesmen working in surat city.
    16. Display the name of the product whose order placed maximum time.
    17. Destroy the table Order_master along with its data.
    18. Display total GST collected on current date.
    19. Display all products whose name are four characters long and starts with ‘a’.
    20. Increase the price of products by 5% which has highest discount.
    21. Display all the products sold today.
    22. Display total stock of all the product.
    23. Update GST for all orders to 7%.
