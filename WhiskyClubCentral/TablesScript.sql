USE [WhiskyClubCentral]
GO

--TABLES--------------------------------------------------------
----------------------------------------------------------------
ALTER TABLE productReview ADD FOREIGN KEY (productReview_client) REFERENCES [dbo].[Client] ([id_client])
ALTER TABLE productReview ADD FOREIGN KEY (product_review) REFERENCES [dbo].[Product] ([id_product])
--PRODUCT
CREATE TABLE Product (
    id_product INT PRIMARY KEY IDENTITY (1, 1),
    name_product VARCHAR (64) NOT NULL,
    type_product INT NOT NULL,
    aged_product INT NOT NULL,
	distillery_product INT NOT NULL,
	container_product INT NOT NULL,
	price_product MONEY NOT NULL,
	special_product BIT NOT NULL DEFAULT 0,
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
	subscription_client INT NOT NULL DEFAULT 4,
	FOREIGN KEY (country_client) REFERENCES [dbo].[CatalogCountry] ([id_Country]),
	FOREIGN KEY (subscription_client) REFERENCES [dbo].[CatalogSubscription] ([id_subscription])
);

--LOCATIONXCLIENT
CREATE TABLE LocationXClient (
    id_locationXClient INT PRIMARY KEY IDENTITY (1, 1),
    id_client VARCHAR (50) NOT NULL,
	location_client GEOGRAPHY NOT NULL,
	location_clientText AS location_client.STAsText(),
);

ALTER TABLE Client ADD  location_client GEOGRAPHY,
						location_clientText AS location_client.STAsText()
FOREIGN KEY ([user_credentials]) REFERENCES [dbo].[Users] ([id_user])
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


USE [WhiskyClubCentral]
GO

INSERT INTO [dbo].[CatalogStatusPurchase]
           ([name_StatusPurchase])
     VALUES
           (<name_StatusPurchase, varchar(64),>)
GO

USE [WhiskyClubCentral]
GO

INSERT INTO [dbo].[CatalogStatusPurchase]
           ([id_StatusPurchase]
           ,[name_StatusPurchase])
     VALUES
           (1
           ,'Pending'),
		   (2
           ,'Processed')
GO



--PURCHASE
CREATE TABLE purchase (
    id_purchase INT PRIMARY KEY IDENTITY (1, 1),
    client_purchase INT NOT NULL,
	date_purchase DATE NOT NULL,
	location_client GEOGRAPHY NOT NULL,
	subtotal MONEY NOT NULL DEFAULT 0,
	shipping MONEY NOT NULL DEFAULT 0,
	total MONEY NOT NULL DEFAULT 0,
	id_PurchasingManager INT,
	id_Dealer INT,
	status_purchase INT NOT NULL DEFAULT 1,
	FOREIGN KEY (client_purchase) REFERENCES [dbo].[Client] ([id_client]),
	FOREIGN KEY (status_purchase) REFERENCES CatalogStatusPurchase (id_StatusPurchase)
);

CREATE TABLE purchaseXProduct (
    id_purchaseXProduct INT PRIMARY KEY IDENTITY (1, 1),
    id_purchase INT NOT NULL,
	id_product INT NOT NULL,
	amount INT NOT NULL,
	subtotal MONEY NOT NULL
	FOREIGN KEY (id_purchase) REFERENCES purchase (id_purchase),
	FOREIGN KEY (id_product) REFERENCES [dbo].[Product] ([id_product])
);
