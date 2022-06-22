USE [WhiskyClubCentral]
GO

/****** Object:  Table [dbo].[productReview]    Script Date: 6/21/2022 2:23:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[productReview](
	[id_productReview] [int] IDENTITY(1,1) NOT NULL,
	[productReview_client] [int] NOT NULL,
	[review] [text] NOT NULL,
	[date_review] [date] NOT NULL,
	[product_review] [int] NOT NULL,
 CONSTRAINT [PK_productReview] PRIMARY KEY CLUSTERED 
(
	[id_productReview] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[productReview]  WITH CHECK ADD  CONSTRAINT [FK__productRe__produ__54CB950F] FOREIGN KEY([productReview_client])
REFERENCES [dbo].[Client] ([id_client])
GO

ALTER TABLE [dbo].[productReview] CHECK CONSTRAINT [FK__productRe__produ__54CB950F]
GO

ALTER TABLE [dbo].[productReview]  WITH CHECK ADD  CONSTRAINT [FK__productRe__produ__55BFB948] FOREIGN KEY([product_review])
REFERENCES [dbo].[Product] ([id_product])
GO

ALTER TABLE [dbo].[productReview] CHECK CONSTRAINT [FK__productRe__produ__55BFB948]
GO


