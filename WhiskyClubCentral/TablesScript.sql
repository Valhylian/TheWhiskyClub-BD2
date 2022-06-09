USE [WhiskyClubCentral]
GO

--TABLES--------------------------------------------------------
----------------------------------------------------------------

--PRODUCT
CREATE TABLE Product (
    id_product INT PRIMARY KEY IDENTITY (1, 1),
    name_product VARCHAR (64) NOT NULL,
    type_product INT NOT NULL,
    aged_product INT NOT NULL,
	distillery_product INT NOT NULL,
	container_product INT NOT NULL,
	price_product MONEY NOT NULL,
	FOREIGN KEY (type_product)		REFERENCES [dbo].[CatalogProductType] ([id_ProductType]),
    FOREIGN KEY (distillery_product) REFERENCES [dbo].[CatalogDistillery] (id_Distillery),
	FOREIGN KEY (container_product)	REFERENCES [dbo].[CatalogContainer] ([id_Container])
);

--IMAGES PRODUCT
CREATE TABLE imagesProduct (
    id_image INT PRIMARY KEY IDENTITY (1, 1),
    product_image INT NOT NULL,
    image_ VARBINARY(MAX)  NOT NULL
	FOREIGN KEY (id_image) REFERENCES Product (id_product)
);

--STORE
CREATE TABLE Store (
    id_store INT PRIMARY KEY IDENTITY (1, 1),
    name_store VARCHAR (64) NOT NULL,
    country_store INT NOT NULL,
    location_store GEOGRAPHY NOT NULL,
	location_storeText AS location_store.STAsText(),
	FOREIGN KEY (country_store) REFERENCES [dbo].[CatalogCountry] ([id_Country])
);

--CLIENT
CREATE TABLE Client (
    id_client INT PRIMARY KEY IDENTITY (1, 1),
    name_client VARCHAR (50) NOT NULL,
    country_client INT NOT NULL,
    location_client GEOGRAPHY NOT NULL,
	location_clientText AS location_client.STAsText(),
	email_client VARCHAR (64) NOT NULL,
	subscription_client INT NOT NULL,
	FOREIGN KEY (country_client) REFERENCES [dbo].[CatalogCountry] ([id_Country]),
	FOREIGN KEY (subscription_client) REFERENCES [dbo].[CatalogSubscription] ([id_subscription])
);

--USER
CREATE TABLE Users (
    id_user INT PRIMARY KEY IDENTITY (1, 1),
    nickname VARCHAR (50) NOT NULL,
    password_user VARBINARY(MAX) NOT NULL,
    location_client GEOGRAPHY NOT NULL,
	type_user INT NOT NULL,
	client_user INT NOT NULL,
	FOREIGN KEY (type_user) REFERENCES [dbo].[CatalogUserType] ([id_UserType]),
	FOREIGN KEY (client_user) REFERENCES Client (id_client)
);