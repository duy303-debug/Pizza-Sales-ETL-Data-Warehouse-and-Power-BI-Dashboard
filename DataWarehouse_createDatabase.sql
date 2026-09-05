CREATE DATABASE PIZZA_DWH;
GO

USE PIZZA_DWH;
GO

CREATE SCHEMA pizza;
GO

--Create date dimension
CREATE TABLE pizza.DimDate
(
	DateKey INT NOT NULL,
	FullDate DATE NOT NULL,
	Day INT NOT NULL,
	Month INT NOT NULL,
	Quarter INT NOT NULL,
	Year INT NOT NULL,

	CONSTRAINT PK_DimDate

		PRIMARY KEY(Datekey)
);
GO
--Create Product dimension
CREATE TABLE pizza.DimProduct
(
	PizzaKey INT IDENTITY(1,1) NOT NULL,
	PizzaNameID NVARCHAR(50) NOT NULL,
	PizzaName NVARCHAR(50) NOT NULL,
	Size NVARCHAR(5),
	Category NVARCHAR(50) NOT NULL,

	CONSTRAINT PK_DimProduct
		
		PRIMARY KEY(PizzaKey)
);
GO
--Create Time dimension
CREATE TABLE pizza.DimTime
(
	TimeKey INT NOT NULL,
	Hour INT NOT NULL,
	PartOfDay NVARCHAR(50) NOT NULL,

	CONSTRAINT PK_DimTime

		PRIMARY KEY(TimeKey)
);
GO
--Create Fact Sale
CREATE TABLE pizza.FactPizzaSales
(
	SalesKey INT IDENTITY(1,1) NOT NULL,
	OrderID INT NOT NULL,
	PizzaKey INT NOT NULL,
	DateKey INT NOT NULL,
	TimeKey INT NOT NULL,
	UnitPrice DECIMAL(18,4) NOT NULL,
	Quantity INT NOT NULL,
	TotalPrice DECIMAL(18,4) NOT NULL,

	CONSTRAINT PK_FactPizzaSales
		PRIMARY KEY(SalesKey),

	CONSTRAINT FK_FactPizzaSales_DimDate
		FOREIGN KEY(DateKey)
		REFERENCES pizza.DimDate(DateKey),

	CONSTRAINT FK_FactPizzaSales_DimTime
		FOREIGN KEY(TimeKey)
		REFERENCES pizza.DimTime(TimeKey),

	CONSTRAINT FK_FactPizzaSales_DimProduct
		FOREIGN KEY(PizzaKey)
		REFERENCES pizza.DimProduct(PizzaKey)
);
GO