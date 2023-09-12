/*

					SQL Project Name : Percel Delivery Management System(PDMS)
							    Trainee Name : Md.Manjurul Islam   
						    	  Trainee ID : 1272178       
							Batch ID : ESAD-CS/PNTL-M/53/01 

 --------------------------------------------------------------------------------
Table of Contents: DML
			=> SECTION 01: INSERT DATA USING INSERT INTO KEYWORD
			=> SECTION 02: INSERT DATA THROUGH STORED PROCEDURE
				SUB SECTION => 2.1 : INSERT DATA THROUGH STORED PROCEDURE WITH AN OUTPUT PARAMETER 
				SUB SECTION => 2.2 : INSERT DATA USING SEQUENCE VALUE
			=> SECTION 03: UPDATE DELETE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.1 : UPDATE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.2 : DELETE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.3 : STORED PROCEDURE WITH TRY CATCH AND RAISE ERROR
			=> SECTION 04: INSERT UPDATE DELETE DATA THROUGH VIEW
				SUB SECTION => 4.1 : INSERT DATA through view
				SUB SECTION => 4.2 : UPDATE DATA through view
				SUB SECTION => 4.3 : DELETE DATA through view
			=> SECTION 05: RETREIVE DATA USING FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED)
			=> SECTION 06: TEST TRIGGER (FOR/AFTER TRIGGER ON TABLE, INSTEAD OF TRIGGER ON TABLE & VIEW)
			=> SECTION 07: QUERY
				SUB SECTION => 7.01 : SELECT FROM TABLE
				SUB SECTION => 7.02 : SELECT FROM VIEW
				SUB SECTION => 7.03 : SELECT INTO
				SUB SECTION => 7.04 : IMPLICIT JOIN WITH WHERE BY CLAUSE, ORDER BY CLAUSE
				SUB SECTION => 7.05 : INNER JOIN WITH GROUP BY CLAUSE
				SUB SECTION => 7.06 : OUTER JOIN
				SUB SECTION => 7.07 : CROSS JOIN
				SUB SECTION => 7.08 : TOP CLAUSE WITH TIES
				SUB SECTION => 7.09 : DISTINCT
				SUB SECTION => 7.10 : COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR
				SUB SECTION => 7.11 : LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE
				SUB SECTION => 7.12 : OFFSET FETCH
				SUB SECTION => 7.13 : UNION
				SUB SECTION => 7.14 : EXCEPT INTERSECT
				SUB SECTION => 7.15 : AGGREGATE FUNCTIONS
				SUB SECTION => 7.16 : GROUP BY & HAVING CLAUSE
				SUB SECTION => 7.17 : ROLLUP & CUBE OPERATOR
				SUB SECTION => 7.18 : GROUPING SETS
				SUB SECTION => 7.19 : SUB-QUERIES (INNER, CORRELATED)
				SUB SECTION => 7.20 : EXISTS
				SUB SECTION => 7.21 : CTE
				SUB SECTION => 7.22 : MERGE
				SUB SECTION => 7.23 : BUILT IN FUNCTION
				SUB SECTION => 7.24 : CASE
				SUB SECTION => 7.25 : IIF
				SUB SECTION => 7.26 : COALESCE & ISNULL
				SUB SECTION => 7.27 : WHILE
				SUB SECTION => 7.28 : GROPING FUNCTION
				SUB SECTION => 7.29 : RANKING FUNCTION
				SUB SECTION => 7.30 : IF ELSE & PRINT
				SUB SECTION => 7.31 : TRY CATCH
				SUB SECTION => 7.32 : GOTO
				SUB SECTION => 7.33 : WAITFOR
				SUB SECTION => 7.34 : sp_helptext
				SUB SECTION => 7.35 : TRANSACTION WITH SAVE POINT
*/
/*
-------------------  SECTION 01  ----------------------------
					INSERT DATA USING INSERT INTO KEYWORD
--------------------------------------
*/
USE PDMS
GO
INSERT INTO gender VALUES('Male'),('Female')
GO
SELECT * FROM gender
GO
INSERT INTO country VALUES('America'),('India'),('Pakistan'),('China'),('Japan'),('Italy'),('Malaysia'),('United Kingdom')
GO
SELECT * FROM country
GO
INSERT INTO city VALUES('Barisal'),('Borguna'),('Chadpur'),('Gopalganj'),('Feni'),('Manikganj'),('Munshiganj'),('Narayanganj'),('Narsingdi'),('Rajbari'),('Tangail'),('Gazipur')
GO
SELECT * FROM city
GO
INSERT INTO [state] VALUES ('North'), ('South')
GO
SELECT * FROM [state]
GO
INSERT INTO [admin] VALUES
('abc123','shakil12','shakil'),
('cde123','shakil12','shakil'),
('abc123','shakil12','Milon'),
('cde123','shakil12','Mosiur')
GO
SELECT * FROM [admin]
GO
INSERT INTO product VALUES
('Sony','tv', 65000.00,20),
('Apple', 'Phone', 300000.00,NULL),
('cookaris', 'cokar', 2000.00,50),
('Apex', 'shoe', 5000.00,3000),
('matador', 'pen', 10.00,10000),
('la vista', 'share', 12000.00,NULL),
('coke', 'drink', 100.00,300),
('shofiz', 'decor', 36500.00,10),
('laptop', 'pc', 69000.00,25),
('minister', 'fan', 7000.00,null)
GO
SELECT * FROM product
GO
----------------- Insert data by specifying column name ---------------
INSERT INTO customer([name], dob, genderId,nid,userid,email, phone, [address], cityId, countryId, postalCode, customerOrderDate, customerRemarks) VALUES
('Filon', '1992-06-01', 1, '1953358252', 1,'filon@gmail.com', '0158974562','13 roy rd',1,1,NULL,NULL,NULL),
('Maruf', '1995-07-13', 1 ,'1953358056',2, 'maruf@gmail.com', '01831469877','41 Smith St',2,2,'3922',NULL,NULL),
('Shaon', '1995-08-03', 1,'1852147895',3, 'shaon@gmail.com', '01656060804','10443 201st St',1,1,'3192',NULL,NULL),
('Hossain', '1995-08-11', 1, '1992478254',2, 'hoaain@gmail.com', '01541092559','265 E Good Ave',2,1,'3426',NULL,NULL),
('Nur', '1995-09-06', 1, '1983154898', 4,'nur@gmail.com', '01986795907','172 City Of Refuge Rd',6,1,'2214',NULL,NULL)
GO
SELECT * FROM customer
GO
---------------- Insert data by column sequence --------------
INSERT INTO customer VALUEs
('hilon', '1992-06-01', 2, '1953350000', 2,'filon@gmail.com', '01589745201','13 roy rd',5,1,NULL,NULL,NULL),
('manjurul', '1990-01-01', 2,'1969049999',3,'manjurul@gmail.com', '01547090170','321 ui10 PlNE',2,2,'1633',NULL,NULL)
GO
SELECT * FROM customer
GO
INSERT INTO employee VALUES
('malak', '1980-06-12', 1,'1948589698', 'mk@gmail.com', '01780816281','430 Ashland St N',1,1,'3922',420.00,1,'abc123'),
('Karim', '1981-12-28',2,'1956524757', 're@gmail.com', '01792949056','130 Shirley Ln',1,2,'1212',420.00,2,'bvc123'),
('Hossain', '1983-03-08',1, '1953252525', 'ha@gmail.com', '01789457265','21 linis St',2,1,'1213',420.00,3,'235'),
('Mamil', '1983-04-28', 2, '1954525252', 'mamil@gmail.com', '01763204814','yu road 734',3,3,'3900',420.00,4,'mn25')
GO
SELECT * FROM employee
GO
/*
-------------------------  SECTION 02  -----------------------
					INSERT DATA THROUGH STORED PROCEDURE
---------------------------------------------------------------------
*/
EXEC spInsertcustomer 'abul Hossain', '1990-07-01', 2,'1215778846',2, 'abul@gmail.com', '02576440774','21 lahor',2,1,'5847',NULL,NULL
EXEC spInsertcustomer 'laki', '1998-07-01', 2,'1988778846',5, 'laki@gmail.com', '2566440774','58 dohar',3,6,'1587',NULL,NULL
EXEC spInsertcustomer 'Farzana', '1997-09-03',2,'1984015516',3,'farzana@gmail.com', '0156156454','1142 W Main St',2,1,'2326',NULL,NULL
EXEC spInsertcustomer 'Moriom Jahan', '1997-09-07', 2,'1924025561',3, 'moriom@gmail.com', '01547825145','1142 W Main St',5,1,'2326',NULL,NULL
GO
SELECT * FROM customer
GO
---------------------- INSERT DATA THROUGH STORED PROCEDURE WITH AN OUTPUT PARAMETER -------------------------

DECLARE @employeeId INT
EXEC spInsertemployee 'mir hasan', '1986-10-01', 1,'1989646464', 'ramzan@gmail.com', '01779852333','01 north ',1,1,'3921',420.00,1,'kl123', @employeeId OUTPUT
PRINT 'The new Employee ID is : '+ str(@employeeId)
GO
-----------------INSERT DATA WITH RELATION --------------------
INSERT INTO customerOrderInfo VALUES
(1, 1, 1, 1),--(si1,2/ei1to5 first)
(2, 2, 2, 2),
(3, 1, 2, 3),
(1, 1, 1, 4),
(2, 2, 2, 1),
(3, 1, 2, 2),
(4, 2, 1, 3),
(5, 2, 2, 4),
(6, 2, 1, 1),
(7, 2, 1, 2),
(8, 2, 2, 3)
GO
SELECT * FROM customerOrderInfo
GO
INSERT INTO productDetails(customerId, productId, discount) VALUES
(5, 1, .03),
(6, 2, .05),--(sameEIxx)
(7, 10,.10),
(8, 9, .10),
(9, 8, .05),
(5, 7, DEFAULT)
GO
SELECT * FROM productDetails
GO
INSERT INTO area VALUES('north',.2),('south',.08),('east',.10),('West',.15),('Central',.25)
GO
SELECT * FROM area
GO
INSERT INTO vahicles VALUES
('Mollicca', 1),
('Golapi', 2),
('Rosy', 3),
('Eagle', 4),
('bazpaki', 5),
('kanchon', 3),
('Rojoni', 3),
('Golam', 3),
('Mamun car ', 3),
('taki', 5)
GO
SELECT * FROM vahicles
GO
INSERT INTO branchs VALUES---problem%%%%%%%%%
('Mirpur', '1234567890', 'mirpur@gmail.com', '01923654789','south bushil Rd',1,1,'0022'),
('Tajul', '2222323256', 'tajul@gmail.com', '01987089288','36 2nd St',1,1,'1212'),
('Uddin', '5212409201', 'sahabuddin@gmail.com', '01990975035','818 Pony Express Trl',2,1,'1213')
GO
SELECT * FROM branchs
GO
INSERT INTO percelDetails VALUES 
(1, 1, 75000.00, DEFAULT),
(2, 1, 48000.00, DEFAULT),
(3, 3, 55000.00, DEFAULT),
(1, 2, 68000.00, DEFAULT),
(2, 2, 50000.00, DEFAULT)
GO
SELECT * FROM percelDetails
GO
INSERT INTO [location] VALUES
('Mirpur','25p',1,1),
('Dhanmondi','20p',1,2),
('Moghbazar','2p',2,1),
('Mohakhali','5p',2,2),
('Uttara','6p',3,1),
('South kafrul','250p',4,1),
('Sutrapur','259p',5,1)
GO
SELECT * FROM [location]
GO
INSERT INTO Stock(productId, quantity) VALUES
(1, 57),
(2, 58),
(3, 11),
(4, 14),
(5, 17),
(6, 12),
(7, 17)
GO
SELECT * FROM Stock
INSERT INTO ProductForValuation(productId, quantity) VALUES
(1, 25),
(5, 17),
(4, 13),
(2, 27),
(3, 29),
(6, 62)
GO
SELECT * FROM ProductForValuation
GO
INSERT INTO Comments VALUES
(1, 'Great'),
(2,'bad'),
(3,'better')
GO
SELECT * FROM Comments
GO
--============== INSERT DATA USING SEQUENCE VALUE ============--

INSERT INTO Comments VALUES((NEXT VALUE FOR sequenceNumber), NULL)
GO
SELECT * FROM Comments
GO
/*
==============================  SECTION 03  ==============================
			UPDATE DELETE DATA THROUGH STORED PROCEDURE
==========================================================================
*/


--============== UPDATE DATA THROUGH STORED PROCEDURE ============--

-- STORED PROCEDURE FOR UPDATE CUSTOMER (ORDER DATE & ORDER REMARKS)
EXEC spUpdateCustomer 1, '2022-01-01', 'ORDER OPENING'
EXEC spUpdateCustomer 2, '2022-02-07', 'ORDER OPENING'
EXEC spUpdateCustomer 3, '2022-02-17', 'ORDER OPENING'
EXEC spUpdateCustomer 4, '2022-03-19', 'ORDER OPENING'
EXEC spUpdateCustomer 5, '2022-04-05', 'ORDER OPENING'
EXEC spUpdateCustomer 6, '2022-05-11', 'ORDER OPENING'
EXEC spUpdateCustomer 7, '2022-06-04', 'ORDER OPENING'
GO
SELECT * FROM customer
GO
--============== DELETE DATA THROUGH STORED PROCEDURE ============--

-- STORED PROCEDURE FOR DELETE PRODUCTDETAILS
EXEC spDeleteProductDetails 101
EXEC spDeleteProductDetails 106
EXEC spDeleteProductDetails 115
EXEC spDeleteProductDetails 120
GO
SELECT * FROM productDetails
GO
--============== STORED PROCEDURE WITH TRY CATCH AND RAISE ERROR ============--

EXEC spRaisError
GO
/*
==============================  SECTION 04  ==============================
					INSERT UPDATE DELETE DATA THROUGH VIEW
==========================================================================
*/

--============== INSERT DATA through view ============--
SELECT * FROM VW_ProductSalesInfo
GO

INSERT INTO VW_ProductSalesInfo(customerId,productId, discount) VALUES(1, 1, .05)
INSERT INTO VW_ProductSalesInfo(customerId,productId, discount) VALUES(2, 2, .02)
INSERT INTO VW_ProductSalesInfo(customerId,productId, discount) VALUES(3, 3, .10)
GO
SELECT * FROM VW_ProductSalesInfo
GO
--============== UPDATE DATA THROUGH VIEW ============--
UPDATE VW_ProductSalesInfo
SET discount = 0.5
WHERE productId = 2
GO
SELECT * FROM VW_ProductSalesInfo
GO
--============== DELETE DATA THROUGH VIEW ============--
DELETE FROM VW_ProductSalesInfo
WHERE customerId = 2
GO
SELECT * FROM VW_ProductSalesInfo
GO
/*
==============================  SECTION 05  ==============================
						RETREIVE DATA USING FUNCTION
==========================================================================
*/

-- A SCALAR FUNCTION TO GET MONTHLY TOTAL NET SALES USING TWO PARAMETER @YEAR & @MONTH
SELECT dbo.fnCurrentMonthProductDetilasSales() AS 'Currrent Year Net Sale'
GO
-- A INLINE TABLE VALUED FUNCTION TO GET MONTHLY TOTAT SALES,DISCOUNT & NET SALES USING TWO PARAMETER @YEAR & @MONTH
SELECT * FROM dbo.fnMonthlyProductDetails(1996, 6)
GO
-- A MULTI STATEMENT TABLE VALUED FUNCTION TO GET MONTHLY TOTAOT SALES,DISCOUNT & NET SALES USING TWO PARAMETER @YEAR & @MONTH
SELECT * FROM dbo.fnMonthlyProductSalesDetails(1996, 6)
GO
/*
==============================  SECTION 06  ==============================
							   TEST TRIGGER
==========================================================================
*/
--============== FOR/AFTER TRIGGER ON TABLE ============--

-- EX - 01
-- INSERT DATA IN Stock TABLE and AUTOMATICALLY UPDATE STOCK IN Prodcut TABLE

SELECT * FROM Product
SELECT * FROM Stock

INSERT INTO Stock(productId, quantity) VALUES (4, 12)
GO

SELECT * FROM Product
SELECT * FROM Stock
GO
-- EX - 02
-- INSERT DATA ON PRODUCTFORVALUATION TABLE and AUTOMATICALLY UPDATE STOCK IN Prodcut TABLE

SELECT * FROM Product
SELECT * FROM ProductForValuation

INSERT INTO ProductForValuation(productId, quantity) VALUES(4, 5)

SELECT * FROM Product
SELECT * FROM ProductForValuation
GO
--============== INSTEAD OF TRIGGER ON TABLE ============--


--INSTEAD OF INSERT TRIGGER ON PRODUCTDETAILS TO get price from PRODUCT table and manipulate data in current table

SELECT * FROM productDetails
SELECT * FROM product
GO
INSERT INTO productDetails(customerId, productId, discount) VALUES
(15, 5, .10)
GO
SELECT * FROM productDetails
GO
--============== AN INSTEAD OF TRIGGER ON VIEW ============--

SELECT * FROM VW_ProductSalesInfo

INSERT INTO VW_ProductSalesInfo(customerId,productId, discount) VALUES(1, 2, .10)

SELECT * FROM VW_ProductSalesInfo
GO

/*
==============================  SECTION 07  ==============================
								  QUERY
==========================================================================
*/
----------------7.01 A SELECT STATEMENT TO GET RESULT SET FROM A TABLE ============
--SELECT * FROM customer
GO

--============== 7.02 A SELECT STATEMENT TO GET today product details information FROM A VIEW ============--

SELECT * FROM VW_TodayProductDetails
GO

--============== 7.03 SELECT INTO > SAVE RESULT SET TO A NEW TEMPORARY TABLE ============--

SELECT * INTO #pdmsProduct
FROM Product
GO

SELECT * FROM #pdmsProduct
GO

--============== 7.04 IMPLICIT JOIN WITH WHERE BY CLAUSE, ORDER BY CLAUSE ============--

-- GET VAHICLES UNDER LOCATION
SELECT vahi_Name,  locationName FROM  vahicles, [location]
WHERE  [location].locationId = [location].locationId
ORDER BY locationName ASC, vahi_Name DESC
GO

--============== 7.05 INNER JOIN WITH GROUP BY CLAUSE ============--

-- GET STATE WISE CUSTOMER LIST
SELECT [state].stateName, COUNT(tr.customerId) AS customer FROM customerOrderInfo coInfo
INNER JOIN customer tr ON tr.customerId = coInfo.customerId
INNER JOIN [state] ON [state].stateId = coInfo.stateId
GROUP BY [state].stateName
GO

--============== 7.06 OUTER JOIN ============--

SELECT * FROM customerOrderInfo coInfo
LEFT JOIN customer tr ON tr.customerId = coInfo.customerId
RIGHT JOIN [state] ON [state].stateId = coInfo.stateId
FULL JOIN product p ON p.productId = coInfo.productId
GO

--============== 7.07 CROSS JOIN ============--

SELECT * FROM customerOrderInfo coInfo
CROSS JOIN employee
GO

--============== 7.08 TOP CLAUSE WITH TIES ============--

SELECT TOP 5 WITH TIES product.productName, stateId FROM customerOrderInfo
INNER JOIN product ON product.productId = customerOrderInfo.productId
ORDER BY customerId
GO

--============== 7.09 DISTINCT ============--

SELECT DISTINCT product.productName, stateId FROM customerOrderInfo
INNER JOIN product ON product.productId = customerOrderInfo.productId
ORDER BY product.productName
GO
 
--============== 7.10 COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR ============--

SELECT * FROM customer
WHERE customerId = 1
AND dob BETWEEN '1996-01-01' AND '1997-12-10'
AND NOT cityId = 4
AND postalCode > 1400
OR cityId = 2
GO

--============== 7.11 LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE ============--

SELECT * FROM customer
WHERE name LIKE '%n'
AND cityId NOT IN ('1' ,'2')
AND customerRemarks IS NULL
GO

--============== 7.12 OFFSET FETCH ============--

-- OFFSET 5 ROWS
SELECT * FROM customer
ORDER BY customerId
OFFSET 5 ROWS
GO

-- OFFSET 10 ROWS AND GET NEXT 5 ROWS

SELECT * FROM customer
ORDER BY customerId
OFFSET 10 ROWS
FETCH NEXT 5 ROWS ONLY
GO

--============== 7.13 UNION ============--

SELECT * FROM employee
WHERE cityId IN ('1', '2', '3')

UNION

SELECT * FROM employee
WHERE cityId IN ('4', '5', '6')
GO

--============== 7.14 EXCEPT INTERSECT ============--

-- EXCEPT
SELECT * FROM employee

EXCEPT

SELECT * FROM employee
WHERE genderId = 2
GO

--INTERSECT

SELECT * FROM productDetails
WHERE product_dId > 2

INTERSECT

SELECT * FROM productDetails
WHERE customerId > 3
GO

--============== 7.15 AGGREGATE FUNCTION ============--

SELECT	COUNT(*) 'Total Sales Count',
		SUM(netSale) 'Total Net Sale',
		AVG(netSale) 'Average Sale',
		MIN(amount) 'MIN COURSE FEE',
		(MAX(discount))*100 'MAX Discount %'
FROM productDetails
GO

--============== 7.16 AGGREGATE FUNCTION WITH GROUP BY & HAVING CLAUSE ============--

SELECT product.productName, count(productDetails.productId) Total, SUM(netSale) 'NET SALES' FROM productDetails
INNER JOIN product ON product.productId = productDetails.productId
GROUP BY product.productName
HAVING SUM(netSale) > 50000
GO

--============== 7.17 ROLLUP & CUBE OPERATOR ============--

--ROLLUP
SELECT a.areaName, v.vahi_Name, SUM(pd.price) price FROM percelDetails pd
INNER JOIN vahicles v ON v.vahi_Id = pd.vahi_Id
INNER JOIN area a ON a.areaId = v.areaId
GROUP BY  ROLLUP (a.areaName, v.vahi_Name)
ORDER BY a.areaName DESC, v.vahi_Name DESC
GO

-- CUBE
SELECT a.areaName, v.vahi_Name, SUM(pd.price) AS 'Total Price' FROM percelDetails pd
INNER JOIN vahicles v ON v.vahi_Id = pd.vahi_Id
INNER JOIN area a ON a.areaId = v.areaId
GROUP BY  ROLLUP (a.areaName, v.vahi_Name)
ORDER BY a.areaName DESC, v.vahi_Name DESC
GO

--============== 7.18 GROUPING SETS ============--

SELECT a.areaName, v.vahi_Name, SUM(pd.price) AS 'Total Price' FROM percelDetails pd
INNER JOIN vahicles v ON v.vahi_Id = pd.vahi_Id
INNER JOIN area a ON a.areaId = v.areaId
GROUP BY  GROUPING SETS (a.areaName, v.vahi_Name)
ORDER BY a.areaName DESC, v.vahi_Name DESC
GO

--============== 7.19 SUB-QUERIES============--


--A subquery to findout customer who have not enrolled yet

SELECT [name], dob, nid, email, phone, [address] FROM customer
WHERE customerId NOT IN (SELECT customerId FROM productDetails)
ORDER BY [name]
GO

--A correlated subquery

SELECT pd.productId, SUM(pd.netSale) 'NET SALES' FROM productDetails pd
GROUP BY  pd.productId
HAVING SUM(pd.netSale) > (SELECT AVG(pd2.netSale) FROM productDetails pd2 WHERE pd.productId = pd2.productId)
GO

--============== 7.20 EXISTS ============--

SELECT [name], dob, nid, email, phone, [address] FROM customer c
WHERE NOT EXISTS 
			(SELECT * FROM productDetails pd
				WHERE pd.customerId = c.customerId)
GO

--============== 7.21 CTE ============--

-- A CTE TO GET MAXIMUM SALES COURSE
WITH ProductCount AS
(
SELECT p.productName, count(coinfo.productId) TotalProduct FROM customerOrderInfo coInfo
INNER JOIN product p ON p.productId = coinfo.productId
GROUP BY p.productName
)
SELECT productName, TotalProduct from ProductCount
WHERE TotalProduct = (SELECT MAX(TotalProduct) FROM ProductCount)
GO

--============== 7.22 MERGE ============--

SELECT * FROM Comments
SELECT * FROM tblComments
GO

MERGE tblComments AS SOURCE
USING Comments AS TARGET
ON SOURCE.commentId = TARGET.commentId
WHEN MATCHED THEN
				UPDATE SET
				commentId = SOURCE.commentId,
				comment = SOURCE.comment;
GO

--============== 7.23 BUILT IN FUNCTION ============--

-- Get current date and time
SELECT GETDATE()
GO

-- GET STRING LENGTH
SELECT employeeId, LEN([name]) 'Name Length' FROM employee
GO

-- CONVERT DATA USING CAST()
SELECT CAST(1500 AS decimal(17,2)) AS DecimalNumber
GO

-- CONVERT DATA USING CONVERT()
DECLARE @currTime DATETIME = GETDATE()
SELECT CONVERT(VARCHAR, @currTime, 108) AS ConvertToTime
GO

-- CONVERT DATA USING TRY_CONVERT()
SELECT TRY_CONVERT(FLOAT, 'HELLO', 1) AS ReturnNull
GO

-- GET DIFFERENCE OF DATES
SELECT DATEDIFF(DAY, '2021-01-01', '2022-01-01') AS DAYinYear
GO

-- GET A MONTH NAME
SELECT DATENAME(MONTH, GETDATE()) AS 'Month'
GO

--============== 7.24 CASE ============--

SELECT b.[name], 
pd.price,
	CASE 
		WHEN (pd.price < 40000) THEN 'medium price'
		WHEN (pd.price > 40000) THEN 'Good price'
		WHEN (pd.price > 50000) THEN 'Better price'
		WHEN (pd.price > 50000) THEN 'Great price'
END AS 'Status'
FROM percelDetails pd
INNER JOIN branchs b ON pd.branch_Id = b.branch_Id
GO

--============== 7.25 IIF ============--

SELECT b.[name], 
pd.price,
IIF((pd.price > 50000), 'Great price', 'medium price') AS 'Status'
FROM percelDetails pd
INNER JOIN branchs b ON pd.branch_Id = b.branch_Id
GO


--============== 7.26 COALESCE & ISNULL ============--

SELECT COALESCE(a.areaName, 'All Area') AS Area,
ISNULL(v.vahi_Name, 'All vahicles') AS vahicles,
SUM(pd.price) Price
FROM percelDetails pd
INNER JOIN vahicles v ON v.vahi_Id = pd.vahi_Id
INNER JOIN area a ON a.areaId = v.vahi_Id
GROUP BY  ROLLUP (a.areaName,v.vahi_Name)
ORDER BY a.areaName DESC, v.vahi_Name DESC
GO

--============== 7.27 WHILE ============--

	DECLARE @counter int
	SET @counter = 0

	WHILE @counter < 20

	BEGIN
	  SET @counter = @counter + 1
	  INSERT INTO Comments(commentId, comment) VALUES((NEXT VALUE FOR [dbo].sequenceNumber), NULL)
	END

	SELECT * FROM Comments
GO

--============== 7.28 GROPING FUNCTION ============--

SELECT 
	CASE 
		WHEN GROUPING(a.areaName) = 1 THEN 'All Area'
		ELSE a.areaName
		END AS Area,
	CASE 
		WHEN GROUPING(v.vahi_Name) = 1 THEN 'All vahicles'
		ELSE v.vahi_Name
		END AS vahicle,
	SUM(pd.price) Price

FROM percelDetails pd
INNER JOIN vahicles v ON v.vahi_Id = pd.vahi_Id
INNER JOIN area a ON a.areaId = v.vahi_Id
GROUP BY  ROLLUP (a.areaName,v.vahi_Name)
ORDER BY a.areaName DESC, v.vahi_Name DESC
GO

--============== 7.29 RANKING FUNCTION ============--

SELECT 
ROW_NUMBER() OVER(ORDER BY customerId) AS 'ROW_NUMBER',
RANK() OVER(ORDER BY customerId) AS 'Rank',
DENSE_RANK() OVER(ORDER BY productId) AS 'Dense_Rank',
NTILE(3) OVER(ORDER BY netSale) AS 'NTILE',
customerId,
productId, 
netSale
FROM productDetails
GO

--============== 7.30 IF ELSE & PRINT ============--

DECLARE @totalSales MONEY
SELECT @totalSales = SUM((netSale))
FROM productDetails
WHERE YEAR(productDetails.deliDate) = YEAR(GETDATE())
IF @totalSales > 1000000
	BEGIN
		PRINT 'Great ! The Delivery is greater than target in this year !!'
	END
ELSE
	BEGIN
		PRINT 'Didn''t Achieved the goal !'
	END
GO

--============== 7.31 TRY CATCH ============--

BEGIN TRY
	DELETE FROM product
	PRINT 'SUCCESSFULLY DELETE'
END TRY

BEGIN CATCH
		DECLARE @Error VARCHAR(200) = 'Error' + CONVERT(varchar, ERROR_NUMBER(), 1) + ' : ' + ERROR_MESSAGE()
		PRINT (@Error)
END CATCH
GO

--============== 7.32 GOTO ============--

DECLARE @value INT
SET @value = 0

WHILE @value <= 20
	BEGIN
	   IF @value = 5
		  GOTO printMessage
	   SET @value = @value + 1

	   	IF @value = 10
		  GOTO printMessage2
	   SET @value = @value + 1
	END
printMessage:
   PRINT 'Crossed Value 5'
printMessage2:
   PRINT 'Crossed Value 10'
GO

--============== 7.33 WAITFOR ============--

PRINT 'HELLO'
WAITFOR DELAY '00:00:09'
PRINT 'GOOD LUCK'
GO

--============== 7.34 SYSTEM STORED PROCEDURE(sp_helptext) TO GET UNENCRYPTED STORED PROCEDURE SCRIPT  ============--

EXEC sp_helptext spUpdatecustomer
GO

--============== 7.35 TRANSACTION WITH SAVE POINT  ============--

SELECT * INTO #Product1
FROM Product
GO
SELECT * FROM #Product1
GO

BEGIN TRANSACTION
	DELETE FROM #Product1 WHERE productId = 5
	SAVE TRANSACTION tran1
		DELETE FROM #Product1 WHERE productId = 6
		SAVE TRANSACTION tran2
			DELETE FROM #Product1 WHERE productId = 7
			SAVE TRANSACTION tran3

			SELECT * FROM #Product1

		ROLLBACK TRANSACTION tran2
		SELECT * FROM #Product1
	ROLLBACK TRANSACTION tran1
	SELECT * FROM #Product1
COMMIT TRANSACTION
GO
-------------------------------------------------------------------------------------------------------

