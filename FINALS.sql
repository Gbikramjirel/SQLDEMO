Use book;

-- 1. GET the list of the unique categories for the books in inventory
SELECT DISTINCT category
FROM books;

-- 2. Get the list of the title and publisher ID for each book in the table with the column name Publisher ID
SELECT Title, PubID AS 'Publisher ID'
FROM books;

-- 3. Get the list of the book title, retail price and the amount of markup for each book and use the column name Price Markup
SELECT Title, Retail, Retail - Cost AS 'Price Markup'
FROM books;

/*4.	Using the BOOK_CUSTOMER table, write a query that will 
list the customer’s first name, last name, and city 
for those customers living in zip code 31206. */

SELECT FirstName, LastName, City
FROM book_customer
WHERE Zip = 31206;

/* 5.	Using the BOOK_ORDER table, write a query that will list everything about 
the orders placed prior to April 2, 2003. */

SELECT *
FROM book_order
WHERE MONTHNAME(OrderDate) = 'April'
AND YEAR(OrderDate) = '2003'
AND DAY(OrderDate) = '02';

-- 6.	Using the BOOK_ORDER table, write a query that will list everything about the orders that have not been shipped yet.

SELECT *
FROM book_order
WHERE ShipDate IS NULL;

/* 7.	Using the BOOK_CUSTOMER table, write a query using the AND and OR operators that will list the customer information for those customers 
living in either Florida or New Jersey who have not been 
referred by another customer. */

SELECT *
FROM book_customer
WHERE (STATE = 'FL' OR STATE = 'NJ')
AND referred IS NULL;

/* 8.	Using the BOOKS table, write a query that will list all information 
about those books that are not computer books 
and do not cost more than $30.00 retail. */

SELECT *
FROM books
WHERE Category != 'Computer'
AND Retail <= 30;

/*9. Using the AUTHOR table, write a query that will list 
all information about authors whose first name ends with an “A”. 
 Put the results in descending order of last name, then first name. */
 
 SELECT *
 FROM author
 WHERE Fname LIKE "%A"
 ORDER BY Lname DESC, Fname DESC;
 
 /* 10. 10.	Using the BOOK_ORDER table, write a query using the > and < operators that will list the orders 
 that were placed between April 1, 2003 and April 4, 2003.  
 Only show the orders for April 2nd or 3rd in your result set. */
 
 SELECT *
 FROM book_order
 WHERE OrderDate > '2003-04-01'
 AND OrderDate < '2003-04-04';
 
 /* 11.	Using the BOOK_ORDER table, write a query that will list the orders that were placed between April 2, 2003 
 and April 5, 2003 including those placed on the 2nd and 5th. 
 Use the BETWEEN operator in writing this query. */
 
 SELECT *
 FROM book_order
 WHERE OrderDate BETWEEN '2003-04-02' AND '2003-04-05';
 
 
 /* 12.	Using the BOOKS table, write a query that will list the book title, publisher ID, and published date for all 
 books that were published by publisher 4 or after 
 January 1, 2001.  Order the results in ascending order by 
 publisher ID and give the publish date and publisher ID 
 columns meaningful titles. */
 
 SELECT Title, PubID AS 'Publisher ID', PubDate AS 'Published Date'
 FROM books
 WHERE (PubID = 4) OR (PubDate > '2001-01-01')
 ORDER BY PubID ASC;
 
 /* 13.	Many organizations use percentage of markup (e.g., profit margin) when analyzing financial data.  
 To determine the percentage of markup for a particular item, 
 simply subtract the cost for the item from the retail price 
 to obtain the dollar amount of profit, and then divide the profit by the cost of the item.  
 The resulting solution is then multiplied by 100 to determine the percentage markup.  
 Using a SELECT statement, display the title of each book and its percentage markup.  
 For the column displaying the percentage markup, use ‘Markup %’ as the column heading.  */
 
 SELECT Title, ((Retail - Cost)/ Cost * 100) AS 'Markup %'
 FROM books;


/* 14.	Using the BOOK_CUSTOMER table, create a query that will return a list containing the 
customer number, first name, last name, and the characters ‘NOT REFERRED’ 
if the customer was not referred by another customer.  Give the derived column an alias of STATUS. */

SELECT CustNum AS 'Customer Number', FirstName AS 'First Name', LastName AS 'Last Name',
CASE
WHEN Referred IS NULL THEN 'NOT REFERRED'
ELSE 'REFERRED'
END AS 'STATUS'
FROM book_customer;

/* 15.	Using the DUAL table, create a query that will return the current day of the week, hour, minutes, \
and seconds of the current date setting on a computer.  The day should be in SUN format. */

SELECT 
  DATE_FORMAT(NOW(), '%a') AS Day,
  DATE_FORMAT(NOW(), '%H') AS Hour,
  DATE_FORMAT(NOW(), '%i') AS Minutes,
  DATE_FORMAT(NOW(), '%s') AS Seconds
FROM DUAL;

/* 16.	Using the BOOKS table and the SUBSTR function, create a query that will return a list of book ISBN codes 
and the book title for all the computer books.  Format the ISBN code to display as 9-999-99999-9 
(e.g., 1059831198 would display as 1-059-83119-8). */

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

/* 17.	Using the BOOK_ORDER table, create a query that will return the 
order number, order date, shipping address, city, state, and zip code for 
all orders going to Atlanta or Austin.  Format the order date to display 
Month DD, YYYY and give the column an alias of ‘Date Ordered’.  Be sure the month begins with a capital letter. */

SELECT OrderNum,
DATE_FORMAT(OrderDate, '%M %d, %Y') AS 'Date Ordered',
Shipcity, Shipstate, Shipzip
FROM book_order
WHERE Shipcity IN ('Atlanta', 'Austin');

/* 18.	Using the BOOK_ORDER table, create a query using the correct functions to return the order#, 
the date ordered, the date shipped, and a column representing the number of months between the two dates for all columns 
where a date shipped exists.  Round the number returned from the function to two decimals, and give the column an alias of ‘Months Between’.  
Be sure that all of the numbers in the fourth column are positive numbers. */

SELECT OrderNum, 
OrderDate, 
ShipDate,
ROUND(ABS(TIMESTAMPDIFF(DAY, OrderDate, ShipDate) / 30.0), 2) AS 'Months Between'
FROM book_order
WHERE ShipDate IS NOT NULL;


/* 19.	Using the BOOKS table, create a query that will return the book title, cost, 
and retail price for all books with a title starting with the letter ‘H’.  
Use the correct functions to format the cost and retail columns to show dollars and cents with a dollar sign 
(e.g., a price of $25 would display $25.00 in the result set). */


SELECT Title, 
CONCAT('$', FORMAT(Cost,2)) AS Cost, 
CONCAT('$', FORMAT(Retail,2)) AS Retail
FROM books
WHERE Title LIKE 'H%';



/* 20.	Using the PUBLISHER table, create a query that will return a line of output like the one below for each record in the table.  
Be sure to use the correct functions in the SELECT statement so that your output looks like the example below.
The contact person for PRINTING IS US publishing is TOMMIE SEYMOUR. */

SELECT
CONCAT ('The contact person for', ' ',
UPPER(Name), ' ',
'publishing is', ' ',
UPPER(Contact), '.'
) AS "Contact Person"
FROM publisher;

/* 21.	Using the BOOKS table, create a query using the correct group function that will return the category name and 
total number of books in each category.  Give the return column an alias of ‘Category Total’.  
Your query should only return eight rows. */

SELECT Category,
COUNT(*) AS 'Category Total'
FROM books
GROUP BY Category
ORDER BY 2 DESC;


/* 22.	Using the BOOKS table, create a query using the correct functions to return the category name, total number 
books per category with a column alias of ‘Category Total’, and the total cost of all the books per category with an alias of ‘Cost’.  
Format the cost column using the correct function to show dollars and cents with a dollar sign. */

SELECT Category,
COUNT(*) AS 'Category Total',
CONCAT('$', FORMAT(SUM(Cost), 2)) AS Cost
FROM books
GROUP BY Category
ORDER BY SUM(Cost) DESC;


/* 23.	Using the ORDER_ITEMS table, create a query using the correct functions to return the item#, the total number of items ordered with an alias of ‘Total’, 
the average number of items ordered with an alias of ‘Average’ (since averages are often in decimals, only show two decimal places), 
the minimum number of items ordered with an alias of ‘Minimum’, and the maximum number of items ordered with an alias of ‘Maximum’.  
You output results set should have 5 columns and 4 rows of data. */

SELECT ItemNum, 
COUNT(Quantity) AS Total,
ROUND(AVG(Quantity), 2) AS Average,
MIN(Quantity) AS Minimum,
MAx(Quantity) AS Maximum
FROM order_items
GROUP BY ItemNum;


/* 24.	Using the BOOKS table, create a query using the correct functions to return the category name, 
the total retail of all books per category with a column alias of ‘Total Retail’, and the average retail of all the books per category 
with an alias of ‘Average Retail’ for all categories with a total retail greater than $40.00.  Format the total retail and average retail 
columns using the correct function to show dollars and cents with a dollar sign. */

SELECT Category,
CONCAT('$', SUM(Retail)) AS 'Total Retail',
CONCAT('$', AVG(Retail)) AS 'Average Retail'
FROM books
GROUP BY Category
HAVING SUM(Retail) > 40
ORDER BY Category ASC, SUM(Retail) ASC, AVG(Retail) ASC;
