CREATE DATABASE Vehicle_Sales;

USE Vehicle_Sales;

-- Create Vehicle Table
CREATE TABLE Vehicle (
    VIN VARCHAR(20) PRIMARY KEY,
    Make VARCHAR(50),
    ModelYear YEAR,
    Color VARCHAR(50)
);

-- Create Vehicle_Type Table
CREATE TABLE Vehicle_Type (
    TypeID VARCHAR(10) PRIMARY KEY,
    Category VARCHAR(50)
);

-- Create Vehicle_Model Table
CREATE TABLE Vehicle_Model (
    ModelID VARCHAR(10) PRIMARY KEY,
    Model VARCHAR(50),
    BasePrice DECIMAL(10, 2)
);

-- Create Customer Table
CREATE TABLE Customer (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CustomerName VARCHAR(100),
    Address VARCHAR(255),
    Gender VARCHAR(10),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

-- Create Payment Table
CREATE TABLE Payment (
    PaymentID VARCHAR(10) PRIMARY KEY,
    Amount DECIMAL(10, 2),
    Description VARCHAR(255),
    Method VARCHAR(20)
);

-- Create InsuranceProvider Table
CREATE TABLE InsuranceProvider (
    ProviderID VARCHAR(10) PRIMARY KEY,
    Company VARCHAR(100)
);

-- Create Coverage Table
CREATE TABLE Coverage (
    CoverageID VARCHAR(10) PRIMARY KEY,
    CoverageType VARCHAR(50)
);

-- Create Sale Table
CREATE TABLE Sale (
    SaleID VARCHAR(10) PRIMARY KEY,
    VIN VARCHAR(20),
    SalePrice DECIMAL(10, 2),
    FOREIGN KEY (VIN) REFERENCES Vehicle(VIN)
);

-- Create Vehicle_Type_mapping Table
CREATE TABLE Vehicle_Type_mapping (
    VIN VARCHAR(20) PRIMARY KEY,
    TypeID VARCHAR(10),
    FOREIGN KEY (VIN) REFERENCES Vehicle(VIN),
    FOREIGN KEY (TypeID) REFERENCES Vehicle_Type(TypeID)
);

-- Create Vehicle_Model_mapping Table
CREATE TABLE Vehicle_Model_mapping (
    VIN VARCHAR(20) PRIMARY KEY,
    ModelID VARCHAR(10),
    FOREIGN KEY (VIN) REFERENCES Vehicle(VIN),
    FOREIGN KEY (ModelID) REFERENCES Vehicle_Model(ModelID)
);

-- Create Sale_Customer_mapping Table
CREATE TABLE Sale_Customer_mapping (
    SaleID VARCHAR(10) PRIMARY KEY,
    CustomerID VARCHAR(10),
    FOREIGN KEY (SaleID) REFERENCES Sale(SaleID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Create Vehicle_Customer_mapping Table
CREATE TABLE Vehicle_Customer_mapping (
    VIN VARCHAR(20) PRIMARY KEY,
    CustomerID VARCHAR(10),
    FOREIGN KEY (VIN) REFERENCES Vehicle(VIN),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Create Payment_Sale_mapping Table
CREATE TABLE Payment_Sale_mapping (
    PaymentID VARCHAR(10) PRIMARY KEY,
    SaleID VARCHAR(10),
    FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID),
    FOREIGN KEY (SaleID) REFERENCES Sale(SaleID)
);

-- Create Insurance Table
CREATE TABLE Insurance (
    PolicyNumber VARCHAR(20) PRIMARY KEY,
    VIN VARCHAR(20),
    Amount DECIMAL(10, 2),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (VIN) REFERENCES Vehicle(VIN)
);

-- Create Insurance_Provider_mapping Table
CREATE TABLE Insurance_Provider_mapping (
    PolicyNumber VARCHAR(20) PRIMARY KEY,
    ProviderID VARCHAR(10),
    FOREIGN KEY (PolicyNumber) REFERENCES Insurance(PolicyNumber),
    FOREIGN KEY (ProviderID) REFERENCES InsuranceProvider(ProviderID)
);

-- Create Insurance_Coverage_mapping Table
CREATE TABLE Insurance_Coverage_mapping (
    PolicyNumber VARCHAR(20) PRIMARY KEY,
    CoverageID VARCHAR(10),
    FOREIGN KEY (PolicyNumber) REFERENCES Insurance(PolicyNumber),
    FOREIGN KEY (CoverageID) REFERENCES Coverage(CoverageID)
);

-- Create Insurance_Customer_mapping Table
CREATE TABLE Insurance_Customer_mapping (
    PolicyNumber VARCHAR(20) PRIMARY KEY,
    CustomerID VARCHAR(10),
    FOREIGN KEY (PolicyNumber) REFERENCES Insurance(PolicyNumber),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
