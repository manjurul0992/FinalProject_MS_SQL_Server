/*			SQL Project Name : Percel Delivery Management System(PDMS)
			Trainee Name : Md Manjurul Islam
			trainee ID : 1272178
			Batch ID : ESAD-CS/PNTL-M/53/01
----------------------------------------------
Table of Contents: DDL
			$> SECTION 01: Created a Database [PDMS]
			$> SECTION 02: Created Appropriate Tables with column definition related to the project
			$> SECTION 03: ALTER, DROP AND MODIFY TABLES & COLUMNS
			$> SECTION 04: CREATE CLUSTERED AND NONCLUSTERED INDEX
			$> SECTION 05: CREATE SEQUENCE &ys ALTER SEQUENCE
			$> SECTION 06: CREATE A VIEW & ALTER VIEW
			$> SECTION 07: CREATE STORED PROCEDURE & ALTER STORED PROCEDURE
			$> SECTION 08: CREATE FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED) & ALTER FUNCTION
			$> SECTION 09: CREATE TRIGGER (FOR/AFTER TRIGGER)
			$> SECTION 10: CREATE TRIGGER (INSTEAD OF TRIGGER)
*/
/*
==============================  SECTION 01  ==============================
	   CHECK DATABASE EXISTANCE & CREATE DATABASE WITH ATTRIBUTES
==========================================================================
*/
USE master
go
IF DB_ID('PDMS') IS NOT NULL
DROP DATABASE PDMS
GO
CREATE DATABASE PDMS
ON
(
name = 'pdms_data',
filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pdms_data.mdf',
size = 5MB,
maxsize = 50MB,
filegrowth = 5%
)
LOG ON
(
name = 'pdms_log',
filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pdms_log.ldf',
size = 8MB,
maxsize = 40MB,
filegrowth = 5MB
)
GO


USE PDMS
GO
/*
==============================  SECTION 02  ==============================
		          CREATE TABLES WITH COLUMN DEFINITION 
==========================================================================
*/

--============== Table with IDENTITY, PRIMARY KEY & nullability CONSTRAINT... ============--
-- USE SCHEMA
CREATE TABLE product
(
	productId INT IDENTITY PRIMARY KEY,
	productName VARCHAR(40) NOT NULL,
	productType CHAR(5) NULL,
	unitPrice MONEY NULL,
	stock INT null
)
GO
CREATE TABLE ProductForValuation
(
	OrderId INT IDENTITY PRIMARY KEY,
	OrderDate DATETIME DEFAULT GETDATE(),
	productId INT REFERENCES Product(productId),
	quantity INT NOT NULL
)
GO
CREATE TABLE gender
(
	genderId INT IDENTITY PRIMARY KEY,
	genderTitle CHAR(10) NOT NULL
)
GO
CREATE TABLE country
(
	countryId INT IDENTITY PRIMARY KEY,
	countryName CHAR(15) not null,
)
GO
CREATE TABLE city
(
cityId INT IDENTITY PRIMARY KEY,
cityName CHAR(15) NOT NULL
)
GO
CREATE TABLE siteInfo
(
s_InfoId UNIQUEIDENTIFIER PRIMARY KEY NOT NULL DEFAULT NEWID(),
s_InfoName CHAR(15) NOT NULL
)
GO

CREATE TABLE [state]
(
	stateId INT IDENTITY PRIMARY KEY,
	stateName CHAR(9) NOT NULL
)
GO
CREATE TABLE [admin]
(
	userId INT IDENTITY PRIMARY KEY,
	[password] VARCHAR(50) NOT NULL,
	userName VARCHAR(40) NOT NULL,
	[name] VARCHAR(50),
	contact VARCHAR(50)
)
GO

--============== Table with PRIMARY KEY & FOREIGN KEY & DEFAULT CONSTRAINT... ============--
CREATE TABLE customer
(
	customerId INT PRIMARY KEY IDENTITY,
	[name] VARCHAR(50) NOT NULL,
	dob DATE NOT NULL,
	genderId INT REFERENCES gender(genderId),
	nid CHAR(10) unique,
	userId INT REFERENCES [admin](userId),
	email VARCHAR(40) NOT NULL,
	phone CHAR(20)NOT NULL,
	[address] VARCHAR(70) NOT NULL,
	cityId INT REFERENCES city(cityId),
	countryId INT REFERENCES country(countryId),
	postalCode NCHAR(12) DEFAULT NULL,
	customerOrderDate DATE NULL,
	customerRemarks VARCHAR(100) NULL
)
GO
--============== Table with CHECK CONSTRAINT & set CONSTRAINT name ============--
CREATE TABLE employee
(
	employeeId INT IDENTITY PRIMARY KEY,
	[name] VARCHAR(50) NOT NULL,
	dob DATE NOT NULL,
	genderId INT REFERENCES gender(genderId),
	nid CHAR(10) UNIQUE CHECK(nid LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	email VARCHAR(40) UNIQUE CONSTRAINT ck_emailCheck CHECK (email LIKE '%@%' ),
	phone CHAR(20),
	[address] VARCHAR(70) NOT NULL,
	cityId INT REFERENCES city(cityId),
	countryId INT REFERENCES country(countryId),
	postalCode CHAR(12) DEFAULT NULL,
	payRate MONEY DEFAULT 0.00,
	userId INT REFERENCES [admin](userId),
	[password] VARCHAR(50) not null
)
GO
--============== Table with composite PRIMARY KEY ============--
CREATE TABLE customerOrderInfo
(
	customerId INT REFERENCES customer(customerId),
	stateId INT REFERENCES [state](stateId),
	productId INT REFERENCES product(productId),
	employeeId INT REFERENCES employee(employeeId),
	PRIMARY KEY(customerId,stateId,productId,employeeId)
)
GO
CREATE TABLE productDetails
(
	product_dId INT IDENTITY(100, 1) PRIMARY KEY,
	product_dType VARCHAR(50) NULL,
	customerId INT REFERENCES customer(customerId),
	productId INT REFERENCES product(productId),
	productsalesDate DATETIME DEFAULT GETDATE(),
	[length] FLOAT NULL,
	weigth FLOAT NULL,
	size VARCHAR NULL,
	pincode1 int NULL DEFAULT 100,
	pincode2 INT NULL,
	serviceType VARCHAR(20) null,
	deliDate DATETIME DEFAULT GETDATE(),
	amount MONEY DEFAULT 0.00,
	discount MONEY DEFAULT 0.00,
	netSale AS (amount * (1-discount)),
	CONSTRAINT discountCheck CHECK(discount >= 0.00),
	productForward DATE NULL,
	productRemarks VARCHAR(100) NULL,
	product_Status CHAR(10) DEFAULT 'continue'
)
GO
CREATE TABLE Stock
(
	stockId INT IDENTITY PRIMARY KEY,
	stockDate DATETIME DEFAULT GETDATE(),
	productId INT REFERENCES Product(productId),
	quantity INT NOT NULL
)
GO
CREATE TABLE area
(
	areaId INT IDENTITY PRIMARY KEY,
	areaName VARCHAR(50) NOT NULL
)
GO
CREATE TABLE vahicles
(
	vahi_Id INT IDENTITY PRIMARY KEY,
	vahi_Name VARCHAR(50) NOT NULL,
	areaId INT REFERENCES area(areaId)
)
GO
CREATE TABLE branchs
(
		branch_Id INT IDENTITY PRIMARY KEY,
	[name] VARCHAR(50) NOT NULL,
	branch_code CHAR(10) UNIQUE CHECK(branch_code LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	email VARCHAR(40),
	phone CHAR(20) NOT NULL,
	[address] VARCHAR(70) NOT NULL,
	cityId INT REFERENCES city(cityId),
	countryId INT REFERENCES country(countryId),
	postalCode CHAR(12) DEFAULT NULL
)
GO
CREATE TABLE percelDetails
(
	vahi_Id INT REFERENCES vahicles(vahi_Id),
	branch_Id INT REFERENCES branchs(branch_id),
	price MONEY DEFAULT 0.00,
	vat FLOAT DEFAULT .05,
	netSalary AS (price * (1 - vat))
	PRIMARY KEY (vahi_Id, branch_Id)
)
GO
CREATE TABLE [location]
(
	locationId INT IDENTITY PRIMARY KEY,
	locationName VARCHAR(40) NOT NULL,
	pincode VARCHAR(10) NOT NULL,
	cityId INT REFERENCES city(cityId),
	stateId INT REFERENCES [state](stateId)
)
go
CREATE TABLE Comments
(
	commentId INT,
	comment NVARCHAR(100) NULL
)
GO

--*********** CREATE A SCHEMA ***********--
CREATE SCHEMA PDMS
GO
--*********** USE SCHEMA IN A TABLE ***********--
CREATE TABLE pdms.tblComments
(
	commentId INT,
	comment NVARCHAR(100) NULL,
	commenterAge INT NULL
)
GO
/*
*******************************  SECTION 03  ***********************
		          ALTER, DROP AND MODIFY TABLES & COLUMNS
***************************************************************
*/


--************ ALTER TABLE SCHEMA AND TRANSFER TO [DBO] ************--
ALTER SCHEMA dbo TRANSFER pdms.tblComments
GO
--************ Update column definition ******************--
ALTER TABLE [state]
ALTER COLUMN stateName VARCHAR(10) NOT NULL
GO
--**************** ADD column with DEFAULT CONSTRAINT ********************--
ALTER TABLE area
ADD areaCharge MONEY DEFAULT 0.00
GO
--****************** ADD CHECK CONSTRAINT WITH DEFINE NAME *****************
ALTER TABLE customer
ADD CONSTRAINT CK_nidValidate CHECK(nid LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
GO
--***************** DROP COLUMN ********************
ALTER TABLE [admin]
DROP COLUMN contact
GO
---************** DROP TABLE *******************

IF OBJECT_ID('siteInfo') IS NOT NULL
DROP TABLE siteInfo
GO
--------------- DROP SCHEMA -------------
DROP SCHEMA pdms
GO
/*
******************  SECTION 04  ************************
		          CREATE CLUSTERED AND NONCLUSTERED INDEX
*******************************************
*/
--********* Clustered Index
CREATE CLUSTERED INDEX IX_Comments
ON Comments
(
	commentId
)
GO
--********** Nonclustered Index
CREATE UNIQUE NONCLUSTERED INDEX IX_productDetails
ON branchs
(
	branch_code,
	phone
)
GO
/*
***************  SECTION 05  **********************
							 CREATE SEQUENCE
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
*/
CREATE SEQUENCE sequenceNumber
	AS INT
	START WITH 1
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 400
	CYCLE
	CACHE 20
GO
------------------- ALTER SEQUENCE -------------------

ALTER SEQUENCE sequenceNumber
	MAXVALUE 400
	CYCLE
	CACHE 12
GO
/*
****************** SECTION 06  *************
							  CREATE A VIEW
&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
*/
CREATE VIEW VW_ProductSalesInfo
AS
SELECT customerId, productId, amount, discount FROM productDetails
GO
----------- VIEW WITH ENCRYPTION, SCHEMABINDING & WITH CHECK OPTION
----------------- A VIEW TO GET TODAY COURSE SALE INFORMATION

CREATE VIEW VW_TodayProductDetails
WITH SCHEMABINDING, ENCRYPTION
AS
SELECT product_dId, customerId, productId, amount, discount, netSale FROM dbo.productDetails
WHERE CONVERT(DATE, deliDate) = CONVERT(DATE, GETDATE())
WITH CHECK OPTION
GO
---------------- ALTER VIEW------------------

ALTER VIEW VW_TodayProductDetails
AS
SELECT customerId, productId, amount, discount, netSale FROM productDetails
GO
/*
---------------- SECTION 07  -------------------
							 STORED PROCEDURE
---------------------------
*/
--************** STORED PROCEDURE FOR INSERT DATA USING PARAMETER ****************
CREATE PROCEDURE spInsertcustomer	@name VARCHAR(50),
									@dob DATE,
									@genderId INT,
									@nid CHAR(10),
									@user INT,																@email VARCHAR(40),
									@phone CHAR(20),
									@address VARCHAR(70),
									@cityId INT,
									@countryId INT,
									@postalCode NCHAR(12),
									@customerOrderDate DATE,
@customerRemarks VARCHAR(100)
									
AS
BEGIN
	INSERT INTO customer([name], dob, genderId, nid,email, phone, [address], cityId, countryId, postalCode,customerOrderDate,customerRemarks) 
	VALUES(@name, @dob, @genderId, @nid, @email, @phone, @address, @cityId, @countryId, @postalCode,@customerOrderDate,@customerRemarks)
END
GO
---------------- STORED PROCEDURE for insert data with OUTPUT parameter ----
CREATE PROCEDURE spInsertemployee	@name VARCHAR(50),
									@dob DATE,
									@genderId INT,
									@nid CHAR(10),
									@email VARCHAR(40),
									@phone CHAR(20),
									@address VARCHAR(70),
									@cityId INT,
									@countryId INT,
									@postalCode NCHAR(12),
									@payRate MONEY,
									@userId INT,
									@password VARCHAR(50),
									@Id INT OUTPUT
AS
BEGIN
	INSERT INTO employee([name], dob, genderId, nid, email, phone, [address], cityId, countryId, postalCode, payRate,userId,[password]) 
	VALUES(@name, @dob, @genderId, @nid, @email, @phone, @address, @cityId, @countryId, @postalCode, @payRate,@userId,@password)
	SELECT @Id = IDENT_CURRENT('employee')
END
GO
---------------- STORED PROCEDURE for UPDATE data -----------------
CREATE PROCEDURE spUpdateCustomer	@customerId INT,
  @customerOrderdate DATE
AS
BEGIN
	UPDATE customer
	SET
	customerOrderdate = @customerOrderdate
	WHERE customerId = @customerId
END
GO
------------ STORED PROCEDURE for DELETE Table data -----------------
CREATE PROCEDURE spDeleteProductDetails	@product_dId INT
AS
BEGIN
	DELETE FROM ProductDetails	
	WHERE product_dId = @product_dId
END
GO
--------------- TRY CATCH IN A STORED PROCEDURE & RAISERROR WITH ERROR NUMBER AND ERROR MESSAGE ---------------
CREATE PROCEDURE spRaisError
AS
BEGIN
	BEGIN TRY
		DELETE FROM product
	END TRY
	BEGIN CATCH
		DECLARE @Error VARCHAR(100) = 'Error' + CONVERT(varchar, ERROR_NUMBER(), 1) + ' : ' + ERROR_MESSAGE()
		RAISERROR(@Error, 1, 1)
	END CATCH
END
GO
----------- ALTER STORED PROCEDURE --------------------------------------
ALTER PROCEDURE spUpdatecustomer @customerId INT,
								 @customerOrderdate DATE,
								 @customerRemarks VARCHAR(100)
AS
BEGIN
	UPDATE customer
	SET
	customerOrderdate = @customerOrderdate,
	customerRemarks = @customerRemarks
	WHERE customerId = @customerId
END
GO
/*
%%%%%%%%%%%%%%%%  SECTION 08  %%%%%%%%%%%%%%%%
								 FUNCTION
-------------------------------------
*/

--****************** A SCALAR FUNCTION ************************
-------- A Scalar Function to get Current Year Total Net Sales
CREATE FUNCTION fnCurrentMonthProductDetilasSales()
RETURNS MONEY
AS
BEGIN
	DECLARE @totalSales MONEY

	SELECT @totalSales = SUM((netSale))
	FROM productDetails
	WHERE month(productDetails.productsalesDate) = month(GETDATE())

	RETURN @totalSales
END
GO
--============== A SIMPLE TABLE VALUED FUNCTION ============--
-- A Inline Table Valued Function to get monthly total sales, discount & net sales using two parameter @year & @month

CREATE FUNCTION fnMonthlyProductDetails(@year INT, @month INT)
RETURNS TABLE
AS
RETURN
(
	SELECT 
			SUM(amount) AS 'Total Sales',
			SUM(netSale) AS 'Net Sales'
	FROM productDetails
	WHERE YEAR(productDetails.productsalesDate) = @year AND MONTH(productDetails.productsalesDate) = @month

)
GO
------------ A MULTISTATEMENT TABLE VALUED FUNCTION ----------------

--***** FUNCTION TO GET MONTHLY NET SALES USING TWO PARAMETER @YEAR & @MONTH
CREATE FUNCTION fnMonthlyProductSalesDetails(@year INT, @month INT)
RETURNS @sales TABLE
(
	[sales Id] INT,
	[sales date] DATETIME,
	[customer name] VARCHAR(50),
	[product name] VARCHAR(50),
	[amount] MONEY,
	discount MONEY,
	[net sale] MONEY
)
AS
BEGIN	
	INSERT INTO @sales
	SELECT
	productDetails.product_dId,
	productDetails.productsalesDate,
	customer.[name],
	product.productName,
	productDetails.amount,
	productDetails.discount,
	productDetails.netSale
	FROM productDetails
	INNER JOIN customer ON customer.customerId = productDetails.customerId
	INNER JOIN product ON product.productId =productDetails.productId
	WHERE YEAR(productDetails.productsalesDate) = @year AND MONTH(productDetails.productsalesDate) = @month

	RETURN
END
GO
--****************** ALTER FUNCTION *********************
ALTER FUNCTION fnMonthlyProductDetails(@year INT, @month INT)
RETURNS TABLE
AS
RETURN
(
	SELECT 
	SUM(amount) AS 'Total Sales',
	SUM(discount) AS 'Total Discount',
	SUM(netSale) AS 'Net Sales'
	FROM productDetails
	WHERE YEAR(productDetails.productsalesDate) = @year AND MONTH(productDetails.productsalesDate) = @month
)
GO
/*
%%%%%%%%%%%%%%%%%%%%%%%%%%% SECTION 09  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
							FOR/AFTER TRIGGER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
*/

-- CREATE TRIGGER ON STOCK TABLE AND UPDATE STOKE IN PRODUCT TABLE
CREATE TRIGGER trStock
ON Stock
FOR INSERT
AS
BEGIN
	DECLARE @pid INT
	DECLARE @stock INT

	SELECT
	@pid = productId,
	@stock = inserted.quantity
	FROM inserted

	UPDATE Product
	SET stock = stock + @stock
	WHERE productId = @pid
	PRINT 'STOKE UPDATED BY STOKE ENTRY'
END
GO
-----------------------------AN AFTER/FOR TRIGGER FOR INSERT,UPDATE,DELETE -------------------
----------------- CREATE TRIGGER ON PRODUCTFORVALUATION TABLE & UPDATE STOCK IN PRODUCT TABLE------------
CREATE TRIGGER trProductStockControl
ON ProductForValuation
FOR INSERT,UPDATE,DELETE
AS
	BEGIN
		DECLARE @pid INT
		DECLARE @qty INT
				IF (EXISTS(SELECT * FROM INSERTED) AND EXISTS(SELECT * FROM DELETED))
					BEGIN
						UPDATE Product
						SET stock = (CASE
										WHEN i.quantity > d.quantity THEN stock - (i.quantity-d.quantity)
										WHEN i.quantity < d.quantity THEN stock + (d.quantity-i.quantity)
										ELSE i.quantity
									END)
						FROM inserted As i
						INNER JOIN deleted AS d
						ON i.productId = d.productId
						WHERE Product.productId = i.productId
						PRINT 'Stock updated by modified sales entry'
					END
				ELSE IF (EXISTS(SELECT * FROM INSERTED) AND NOT EXISTS(SELECT * FROM DELETED))
					BEGIN
						SELECT
						@pid = productid,
						@qty = quantity
						FROM inserted

						UPDATE Product
						SET stock = stock - @qty
						WHERE productId = @pid
						PRINT 'Stock update by new sales'
					END
				ELSE IF (EXISTS(SELECT * FROM DELETED) AND NOT EXISTS(SELECT * FROM INSERTED))
					BEGIN
						SELECT
						@pid = productid,
						@qty = quantity
						FROM deleted

						UPDATE Product
						SET stock = stock + @qty
						WHERE productId = @pid
						PRINT 'Stock update due to deletedsales id'
					END
				ELSE ROLLBACK TRANSACTION
		END
GO
/*
--------------- SECTION 10  ----------------------
							INSTEAD OF TRIGGER
---------------------------------
*/
--------------- TRIGGER FOR GET PRICE FROM ANOTHER TABLE & MANIPULATE DATA IN CURRENT TABLE ------------
CREATE TRIGGER trProductDetails
ON ProductDetails
INSTEAD OF INSERT
AS
BEGIN
	IF ((SELECT COUNT(*) FROM inserted) > 0)
		BEGIN
			INSERT INTO ProductDetails(customerId, productId,amount, discount)
			SELECT
			i.customerId,
			i.productId,
			product.unitPrice,
			discount
			from inserted i
			INNER JOIN product ON product.productId = i.productId
		END
	ELSE
	BEGIN
		PRINT 'Error Occured for Inserting Data Into productDetails Table !'
	END
END
GO
--------------  INSTEAD OF TRIGGER ON VIEW---------------------

CREATE TRIGGER trViewInsteadInsert
ON VW_ProductSalesInfo
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO productDetails(customerId, productId)
	SELECT i.customerId, i.productId FROM inserted i
END
GO
------------- ALTER TRIGGER -----------------
ALTER TRIGGER trViewInsteadInsert
ON VW_ProductSalesInfo
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO productDetails(customerId,productId, discount)
	SELECT i.customerId, i.productId, i.discount FROM inserted i
END
GO


