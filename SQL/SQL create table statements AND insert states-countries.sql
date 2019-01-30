--DROP TABLE IF EXISTS DriverContractor;
--DROP TABLE IF EXISTS Equipment;
--DROP TABLE IF EXISTS Driver;
--DROP TABLE IF EXISTS Contractor;
--DROP TABLE IF EXISTS HomeState;
--DROP TABLE IF EXISTS Country;

CREATE TABLE Country (
	CountryAbb CHAR(2) NOT NULL CONSTRAINT PK_Country PRIMARY KEY
	,CountryName VARCHAR(40) NULL
	,LastUpdatedBy VARCHAR(20) NULl
	,LastUpdated DATE NULL
	);

CREATE TABLE HomeState (
	StateAbb CHAR(2) NOT NULL CONSTRAINT PK_State PRIMARY KEY
	,StateName VARCHAR(30) NULL
	,LastUpdatedBy VARCHAR(20) NULL
	,LastUpdated DATE NULL
	);

INSERT INTO Country VALUES
	('EE', 'Estonia', 'Zachary Curry', GETDATE())
	,('DE', 'Germany', 'Zachary Curry', GETDATE())
	,('IE', 'Ireland', 'Zachary Curry', GETDATE())
	,('SE', 'Sweden', 'Zachary Curry', GETDATE())
	,('US', 'United States', 'Zachary Curry', GETDATE())
	;

INSERT INTO HomeState VALUES
	('CA', 'California', 'Zachary Curry', GETDATE())
	,('FL', 'Florida', 'Zachary Curry', GETDATE())
	,('NY', 'New York', 'Zachary Curry', GETDATE())
	,('TX', 'Texas', 'Zachary Curry', GETDATE())
	,('VA', 'Virginia', 'Zachary Curry', GETDATE())
	;

CREATE TABLE Contractor (
	ContractorID INTEGER IDENTITY NOT NULL
		CONSTRAINT PK_Contractor_ContractorID 
		PRIMARY KEY
	,FirstName VARCHAR(20) NOT NULL
	,LastName VARCHAR(20) NOT NULL
	,MiddleInitial CHAR(1) NULL
	,HouseNumber INTEGER NULL
	,Street VARCHAR(50) NULL
	,CityCounty VARCHAR(40) NULL
	,StateAbb CHAR(2) NULL
		CONSTRAINT FK_Contractor_StateAbb
		REFERENCES HomeState(StateAbb)
	,CountryAbb CHAR(2) NULL
		CONSTRAINT FK_Contractor_CountryAbb
		REFERENCES Country(CountryAbb)
	,ZipCode CHAR(5) NULL
	,Fee DECIMAL(8,2) NULL
	,LastUpdatedBy VARCHAR(20) NULL
	,LastUpdated DATE NULL
	);

CREATE TABLE Driver (
	DriverID INTEGER IDENTITY NOT NULL
		CONSTRAINT PK_Driver_DriverID 
		PRIMARY KEY
	,FirstName VARCHAR(20) NOT NULL
	,LastName VARCHAR(20) NOT NULL
	,MiddleInitial CHAR(1) NULL
	,HouseNumber INTEGER NULL
	,Street VARCHAR(50) NULL
	,CityCounty VARCHAR(40) NULL
	,StateAbb CHAR(2) NULL
		CONSTRAINT FK_Driver_StateAbb
		REFERENCES HomeState(StateAbb)
	,CountryAbb CHAR(2) NULL
		CONSTRAINT FK_Driver_CountryAbb
		REFERENCES Country(CountryAbb)
	,ZipCode CHAR(5) NULL
	,DateOfBirth DATE NULL
	,CDL VARCHAR(40) NULL
	,CDLDate DATE NULL
	,LastUpdatedBy VARCHAR(20) NULL
	,LastUpdated DATE NULL
	);

CREATE TABLE Equipment (
	ID INTEGER IDENTITY NOT NULL
		CONSTRAINT PK_Equipment_ID 
		PRIMARY KEY
	,VinNumber VARCHAR(40) NULL
	,Make VARCHAR(35) NULL
	,Model VARCHAR(30) NULL
	,EquipmentYear INTEGER NULL
	,PriceAcquired DECIMAL(8,2) NULL
	,LicenseNumber VARCHAR(10) NULL
	,DriverID INTEGER NULL
		CONSTRAINT FK_Equipment_DriverID
		REFERENCES Driver(DriverID)
	,LastUpdatedBy VARCHAR(20) NULL
	,LastUpdated DATE NOT NULL
	);

CREATE TABLE DriverContractor (
	ContractorID INTEGER NOT NULL
		CONSTRAINT FK_DriverContractor_ContractorID
		REFERENCES Contractor(ContractorID)
	,DriverID INTEGER NOT NULL
		CONSTRAINT FK_DriverContractor_DriverID
		REFERENCES Driver(DriverID)
	,HireDate DATE NULL
	,TerminationDate DATE NULL
	,Salary DECIMAL(10,2) NULL
	,LastUpdatedBy VARCHAR(20) NULL
	,LastUpdated DATE NULL
	,CONSTRAINT PK_DCID PRIMARY KEY (ContractorID, DriverID)
	);