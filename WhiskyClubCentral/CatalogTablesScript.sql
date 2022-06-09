USE [WhiskyClubCentral]
GO

--CATALOG TABLES----------------------------------------------------
--------------------------------------------------------------------

--PRODUCT TYPE
CREATE TABLE CatalogProductType (
    id_ProductType INT PRIMARY KEY IDENTITY (1, 1),
    name_ProductType VARCHAR (64) NOT NULL
);

--Distillery
CREATE TABLE CatalogDistillery (
    id_Distillery INT PRIMARY KEY IDENTITY (1, 1),
    name_Distillery VARCHAR (64) NOT NULL
);

--CONTAINER
CREATE TABLE CatalogContainer (
    id_Container INT PRIMARY KEY IDENTITY (1, 1),
    description_Container VARCHAR (64) NOT NULL
);

--COUNTRY
CREATE TABLE CatalogCountry (
    id_Country INT PRIMARY KEY IDENTITY (1, 1),
    name_Country VARCHAR (64) NOT NULL,
	money_type VARCHAR (64) NOT NULL,
	dollar_equivalent INT NOT NULL
);

--SUBSCRIPTION
CREATE TABLE CatalogSubscription (
    id__subscription INT PRIMARY KEY IDENTITY (1, 1),
    name_subscription VARCHAR (64) NOT NULL,
	description_subscription VARCHAR (64) NOT NULL,
	discount_subscription INT NOT NULL,
	price_subscription MONEY NOT NULL
);

--USER TYPE
CREATE TABLE CatalogUserType (
    id_UserType INT PRIMARY KEY IDENTITY (1, 1),
    name_UserType VARCHAR (64) NOT NULL,
	description_UserType VARCHAR (64) NOT NULL
);
