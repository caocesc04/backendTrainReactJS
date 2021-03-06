USE [Test]
GO
/****** Object:  StoredProcedure [dbo].[CreateEmployee]    Script Date: 6/21/2019 4:20:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateEmployee] @Employee_id varchar(50),@Employee_Name Nvarchar(100),@Department Nvarchar(50),@Permission Nvarchar(50)
AS
BEGIN
	Insert into EMPLOYEES values (@Employee_id,@Employee_Name,@Department,@Permission)

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 6/21/2019 4:20:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[DeleteEmployee] @id bigint
AS
BEGIN
	Delete EMPLOYEES where ID=@id
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 6/21/2019 4:20:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[DeleteProduct] @id bigint
AS
BEGIN
	Delete Product where ID=@id
END

GO
/****** Object:  StoredProcedure [dbo].[GetAllEmployee]    Script Date: 6/21/2019 4:20:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllEmployee]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from EMPLOYEES
END

GO
/****** Object:  StoredProcedure [dbo].[GetAllProduct]    Script Date: 6/21/2019 4:20:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllProduct] 
AS
BEGIN
	Select * from Product
END

GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeById]    Script Date: 6/21/2019 4:20:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetEmployeeById] @id bigint
AS
BEGIN
	Select * from EMPLOYEES where ID=@id
END

GO
/****** Object:  StoredProcedure [dbo].[GetProductById]    Script Date: 6/21/2019 4:20:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[GetProductById] @id bigint
AS
BEGIN
	Select * from Product where ID=@id
END

GO
/****** Object:  StoredProcedure [dbo].[Login_Employee]    Script Date: 6/21/2019 4:20:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Login_Employee] @Employee_id varchar(50),@password Nvarchar(50)
AS
BEGIN
	IF EXISTS(Select a.ID from ACCOUNT_EMPLOYEES a inner join EMPLOYEES b on a.EMPLOYEE_ID=b.ID WHERE b.EMPLOYEE_ID=@Employee_id AND PASSWORD=@password AND STATUS='TRUE')

	select 'true' as result
else
	select 'false' as result

END
GO
/****** Object:  StoredProcedure [dbo].[PostProduct]    Script Date: 6/21/2019 4:20:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PostProduct] @nameProduct nvarchar(50),@price float,@status nvarchar(50)
AS
BEGIN
	insert into Product values(@nameProduct,@price,@status)
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 6/21/2019 4:20:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateEmployee] @Id bigint,@EmployeeId varchar(50),@EmployeeName Nvarchar(100),@Department Nvarchar(50), @Permission Nvarchar(50)
AS
BEGIN
	Update EMPLOYEES set EMPLOYEE_ID=@EmployeeId,EMPLOYEE_NAME=@EmployeeName,DEPARTMENT=@Department,PERMISSION=@Permission where ID=@Id
END



GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 6/21/2019 4:20:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateProduct] @id bigint,@NameProduct nvarchar(50),@price float,@status nvarchar(50)
AS
BEGIN
	update Product set NameProduct=@NameProduct, Price=@price, Statuss=@status where ID=@id
END

GO
/****** Object:  Table [dbo].[ACCOUNT_EMPLOYEES]    Script Date: 6/21/2019 4:20:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCOUNT_EMPLOYEES](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[EMPLOYEE_ID] [bigint] NOT NULL,
	[PASSWORD] [nvarchar](50) NOT NULL,
	[STATUS] [nvarchar](50) NOT NULL,
	[CREATED_DATE] [date] NULL,
	[CREATED_BY] [nvarchar](50) NULL,
	[MODIFIED_DATE] [date] NULL,
	[MODIFIED_BY] [nvarchar](50) NULL,
 CONSTRAINT [PK_ACCOUNT_EMPLOYEES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EMPLOYEES]    Script Date: 6/21/2019 4:20:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLOYEES](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[EMPLOYEE_ID] [nvarchar](50) NULL,
	[EMPLOYEE_NAME] [nvarchar](100) NULL,
	[DEPARTMENT] [nvarchar](50) NULL,
	[PERMISSION] [nvarchar](50) NULL,
 CONSTRAINT [PK_EMPLOYEES_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/21/2019 4:20:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[NameProduct] [nvarchar](50) NULL,
	[Price] [float] NULL,
	[Statuss] [nvarchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ACCOUNT_EMPLOYEES] ON 

INSERT [dbo].[ACCOUNT_EMPLOYEES] ([ID], [EMPLOYEE_ID], [PASSWORD], [STATUS], [CREATED_DATE], [CREATED_BY], [MODIFIED_DATE], [MODIFIED_BY]) VALUES (1, 1, N'Foxconn168!!', N'True', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ACCOUNT_EMPLOYEES] OFF
SET IDENTITY_INSERT [dbo].[EMPLOYEES] ON 

INSERT [dbo].[EMPLOYEES] ([ID], [EMPLOYEE_ID], [EMPLOYEE_NAME], [DEPARTMENT], [PERMISSION]) VALUES (1, N'V0957307', N'Nguyễn Văn Hiến', N'QE', N'Admin')
INSERT [dbo].[EMPLOYEES] ([ID], [EMPLOYEE_ID], [EMPLOYEE_NAME], [DEPARTMENT], [PERMISSION]) VALUES (64, N'V9999956123', N'Nguyễn Văn Cao', N'QE', N'Admin')
INSERT [dbo].[EMPLOYEES] ([ID], [EMPLOYEE_ID], [EMPLOYEE_NAME], [DEPARTMENT], [PERMISSION]) VALUES (82, N'V095231231', N'App_BigMountant', N'QE', N'Admin')
INSERT [dbo].[EMPLOYEES] ([ID], [EMPLOYEE_ID], [EMPLOYEE_NAME], [DEPARTMENT], [PERMISSION]) VALUES (84, N'V09521246750', N'App_S9', N'QC', N'Admin')
INSERT [dbo].[EMPLOYEES] ([ID], [EMPLOYEE_ID], [EMPLOYEE_NAME], [DEPARTMENT], [PERMISSION]) VALUES (87, N'V0952312908', N'App_SmallMountant', N'ME', N'Admin')
INSERT [dbo].[EMPLOYEES] ([ID], [EMPLOYEE_ID], [EMPLOYEE_NAME], [DEPARTMENT], [PERMISSION]) VALUES (88, N'dsd', N'', N'', N'')
INSERT [dbo].[EMPLOYEES] ([ID], [EMPLOYEE_ID], [EMPLOYEE_NAME], [DEPARTMENT], [PERMISSION]) VALUES (89, N'asdw', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[EMPLOYEES] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [NameProduct], [Price], [Statuss]) VALUES (1, N'ABC', 123, N'ok')
INSERT [dbo].[Product] ([ID], [NameProduct], [Price], [Statuss]) VALUES (2, N'asp', 10, N'fail')
INSERT [dbo].[Product] ([ID], [NameProduct], [Price], [Statuss]) VALUES (4, N'nodejs', 30, N'free')
SET IDENTITY_INSERT [dbo].[Product] OFF
