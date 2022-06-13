USE [WhiskyGermany]
GO 

--catlog
--PRODUCT TYPE
CREATE TABLE CatalogProductType (
    id_ProductType INT PRIMARY KEY IDENTITY (1, 1),
    name_ProductType VARCHAR (64) NOT NULL
);

--CONTAINER
CREATE TABLE CatalogContainer (
    id_Container INT PRIMARY KEY IDENTITY (1, 1),
    description_Container VARCHAR (64) NOT NULL
);

--SUBSCRIPTION
CREATE TABLE CatalogSubscription (
    id_subscription INT PRIMARY KEY IDENTITY (1, 1),
    name_subscription VARCHAR (64) NOT NULL,
	description_subscription VARCHAR (MAX) NOT NULL,
	discount_subscription INT NOT NULL,
	price_subscription MONEY NOT NULL
);

-------------------------------------
--CLIENT
CREATE TABLE Client (
    id_client INT PRIMARY KEY IDENTITY (1, 1),
    name_client VARCHAR (50) NOT NULL,
    location_client GEOGRAPHY NOT NULL,
	location_clientText AS location_client.STAsText(),
	email_client VARCHAR (64) NOT NULL,
	subscription_client INT NOT NULL,
	FOREIGN KEY (subscription_client) REFERENCES [dbo].[CatalogSubscription] ([id_subscription])
);

--STORE
CREATE TABLE Store (
    id_store INT PRIMARY KEY IDENTITY (1, 1),
    name_store VARCHAR (64) NOT NULL,
    location_store GEOGRAPHY NOT NULL,
	location_storeText AS location_store.STAsText()
);

--PRODUCT
CREATE TABLE Product (
    id_product INT PRIMARY KEY IDENTITY (1, 1),
    name_product VARCHAR (64) NOT NULL,
    type_product INT NOT NULL,
    aged_product INT NOT NULL,
	container_product INT NOT NULL,
	price_product MONEY NOT NULL,
	special_product BIT NOT NULL DEFAULT 0,
	FOREIGN KEY (type_product)		REFERENCES [dbo].[CatalogProductType] ([id_ProductType]),
	FOREIGN KEY (container_product)	REFERENCES [dbo].[CatalogContainer] ([id_Container])
);

--PRODUCTxSTORE
CREATE TABLE ProductxStore (
    id_productxStore INT PRIMARY KEY IDENTITY (1, 1),
    aumount INT NOT NULL,
    id_store INT NOT NULL,
	id_product INT NOT NULL,
	FOREIGN KEY (id_store) REFERENCES Store (id_store),
	FOREIGN KEY (id_product)	REFERENCES Product (id_product)
);

