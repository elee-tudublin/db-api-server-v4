/*
This T-SQL script creates a MS MSQL database with sample data

Tables:

-----------
| AppUser |
-----------
------------
| Category |
------------
    1|
     |
	M|
------------	 
| Product  |
------------

------------
| Link     |
------------
    1|
     |
	M|
------------	 
| Topic    |
------------


*/

/****** Object:  Table [dbo].[AppUser]    Script Date: 19/09/2019 09:51:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUser](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Role] [nvarchar](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 19/09/2019 09:51:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[CategoryDescription] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Link]    Script Date: 19/09/2019 09:51:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Link](
	[LinkId] [int] IDENTITY(1,1) NOT NULL,
	[TopicId] [int] NULL,
	[LinkDate] [datetime] NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Notes] [nvarchar](255) NULL,
	[LinkURL] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[LinkId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19/09/2019 09:51:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[ProductDescription] [nvarchar](255) NULL,
	[ProductStock] [int] NOT NULL,
	[ProductPrice] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 19/09/2019 09:51:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[TopicId] [int] IDENTITY(1,1) NOT NULL,
	[TopicName] [nvarchar](255) NOT NULL,
	[TopicDescription] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[TopicId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AppUser] ON 
GO
INSERT [dbo].[AppUser] ([UserId], [FirstName], [LastName], [Email], [Password], [Role]) VALUES (1, N'Alice', N'Admin', N'alice@web.com', N'password', N'admin')
GO
INSERT [dbo].[AppUser] ([UserId], [FirstName], [LastName], [Email], [Password], [Role]) VALUES (2, N'Bob', N'Manager', N'bob@web.com', N'password', N'manager')
GO
INSERT [dbo].[AppUser] ([UserId], [FirstName], [LastName], [Email], [Password], [Role]) VALUES (3, N'Eve', N'User', N'eve@web.com', N'password', N'user')
GO
SET IDENTITY_INSERT [dbo].[AppUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryDescription]) VALUES (1, N'Books', N'Paper and hard cover, fiction and non-fiction')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryDescription]) VALUES (2, N'Computer', N'Desktop, laptops, and accessories')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryDescription]) VALUES (3, N'Entertainment', N'Home electronicsa, TV, HiFi, etc.')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryDescription]) VALUES (4, N'Kitchen', N'Kitchen + cooking appliances')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryDescription]) VALUES (5, N'Laundry', N'Clothes washers, dryers, and accesories')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryDescription]) VALUES (6, N'Mobile Devices', N'Mobile phones, tablets, and accessories')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryDescription]) VALUES (7, N'Furniture', N'Home and home office furniture')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [ProductDescription], [ProductStock], [ProductPrice]) VALUES (1, 4, N'Kettle', N'Steel Electric Kettle', 100, CAST(55.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [ProductDescription], [ProductStock], [ProductPrice]) VALUES (2, 4, N'Fridge freezer', N'Fridge + freezer large', 45, CAST(799.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [ProductDescription], [ProductStock], [ProductPrice]) VALUES (3, 2, N'Microsoft Surface Laptop 2', N'8GB ram, 512GB ssd', 5, CAST(1299.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [ProductDescription], [ProductStock], [ProductPrice]) VALUES (4, 2, N'13inch Laptop', N'HP laptop,8GB RAM,250GB SSD', 45, CAST(799.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [ProductDescription], [ProductStock], [ProductPrice]) VALUES (5, 6, N'Samsung 10inch Tablet', N'Android6GB ram, 128GB storage, 10inch screen', 5, CAST(99.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [ProductDescription], [ProductStock], [ProductPrice]) VALUES (6, 3, N'60inch TV', N'Sony 4K,OLED,Smart TV', 12, CAST(2799.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [ProductDescription], [ProductStock], [ProductPrice]) VALUES (7, 5, N'Clothes Washing Machine', N'1600rpm spin,A+++ rated,10KG', 50, CAST(699.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [ProductDescription], [ProductStock], [ProductPrice]) VALUES (8, 6, N'iPhone XS', N'128GB', 5, CAST(850.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [ProductDescription], [ProductStock], [ProductPrice]) VALUES (9, 1, N'Azure Web Apps', N'Paperback, January 2019, Cloud publishing', 50, CAST(19.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [ProductDescription], [ProductStock], [ProductPrice]) VALUES (10, 1, N'SQL and No SQL for beginners', N'Paperback, Oct 2018, Cloud publishing', 10, CAST(399.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [ProductDescription], [ProductStock], [ProductPrice]) VALUES (11, 7, N'Bed', N'Super King size,super comfort mattress', 5, CAST(899.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [ProductDescription], [ProductStock], [ProductPrice]) VALUES (12, 2, N'Learning JavaScript', N'Become a JavaScript expert in 2 hours!', 10, CAST(12.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [ProductDescription], [ProductStock], [ProductPrice]) VALUES (13, 7, N'Desk', N'Small computer desk', 5, CAST(99.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [ProductStock]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0.00)) FOR [ProductPrice]
GO
ALTER TABLE [dbo].[Link]  WITH CHECK ADD FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topic] ([TopicId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
