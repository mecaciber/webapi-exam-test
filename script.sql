USE [master]
GO
/****** Object:  Database [DevBlocks]    Script Date: 06/06/2017 18:35:02 ******/
CREATE DATABASE [DevBlocks]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DevBlocks', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DevBlocks.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DevBlocks_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DevBlocks_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DevBlocks] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DevBlocks].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DevBlocks] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DevBlocks] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DevBlocks] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DevBlocks] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DevBlocks] SET ARITHABORT OFF 
GO
ALTER DATABASE [DevBlocks] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DevBlocks] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DevBlocks] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DevBlocks] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DevBlocks] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DevBlocks] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DevBlocks] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DevBlocks] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DevBlocks] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DevBlocks] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DevBlocks] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DevBlocks] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DevBlocks] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DevBlocks] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DevBlocks] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DevBlocks] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DevBlocks] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DevBlocks] SET RECOVERY FULL 
GO
ALTER DATABASE [DevBlocks] SET  MULTI_USER 
GO
ALTER DATABASE [DevBlocks] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DevBlocks] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DevBlocks] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DevBlocks] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DevBlocks] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DevBlocks] SET QUERY_STORE = OFF
GO
USE [DevBlocks]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DevBlocks]
GO
/****** Object:  Table [dbo].[Examenes]    Script Date: 06/06/2017 18:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Examenes](
	[IdExamen] [int] IDENTITY(1,1) NOT NULL,
	[strMateria] [varchar](50) NOT NULL,
	[dteFechaCreacion] [datetime] NOT NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Examenes] PRIMARY KEY CLUSTERED 
(
	[IdExamen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExamenesContestados]    Script Date: 06/06/2017 18:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamenesContestados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idExamen] [int] NOT NULL,
	[idPregunta] [int] NOT NULL,
	[idRespuesta] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[dteFechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_ExamenesContestados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 06/06/2017 18:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[idPregunta] [int] IDENTITY(1,1) NOT NULL,
	[strDescripcion] [varchar](100) NOT NULL,
	[idExamen] [int] NOT NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[idPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 06/06/2017 18:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[idRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[strDescripcion] [varchar](100) NOT NULL,
	[bitCorrecta] [bit] NOT NULL,
	[idPregunta] [int] NOT NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[idRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 06/06/2017 18:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[strUsuario] [varchar](50) NOT NULL,
	[strContraseña] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Examenes] ON 

INSERT [dbo].[Examenes] ([IdExamen], [strMateria], [dteFechaCreacion], [IdUsuario]) VALUES (1, N'Matematicas', CAST(N'2017-06-06T01:34:30.530' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Examenes] OFF
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([idPregunta], [strDescripcion], [idExamen]) VALUES (1, N'Cuanto es 1 + 1?', 1)
INSERT [dbo].[Preguntas] ([idPregunta], [strDescripcion], [idExamen]) VALUES (2, N'Cuanto es 5 x 6?', 1)
INSERT [dbo].[Preguntas] ([idPregunta], [strDescripcion], [idExamen]) VALUES (3, N'Cuanto es 100 / 4?', 1)
INSERT [dbo].[Preguntas] ([idPregunta], [strDescripcion], [idExamen]) VALUES (4, N'Cuanto es 55 - 12?', 1)
INSERT [dbo].[Preguntas] ([idPregunta], [strDescripcion], [idExamen]) VALUES (5, N'Cuanto es 7 al cuadrado?', 1)
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([idRespuesta], [strDescripcion], [bitCorrecta], [idPregunta]) VALUES (1, N'5', 0, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [strDescripcion], [bitCorrecta], [idPregunta]) VALUES (2, N'2', 1, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [strDescripcion], [bitCorrecta], [idPregunta]) VALUES (3, N'A', 0, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [strDescripcion], [bitCorrecta], [idPregunta]) VALUES (4, N'12', 0, 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [strDescripcion], [bitCorrecta], [idPregunta]) VALUES (5, N'30', 1, 2)
INSERT [dbo].[Respuestas] ([idRespuesta], [strDescripcion], [bitCorrecta], [idPregunta]) VALUES (6, N'60', 0, 2)
INSERT [dbo].[Respuestas] ([idRespuesta], [strDescripcion], [bitCorrecta], [idPregunta]) VALUES (7, N'300', 0, 2)
INSERT [dbo].[Respuestas] ([idRespuesta], [strDescripcion], [bitCorrecta], [idPregunta]) VALUES (8, N'10', 0, 3)
INSERT [dbo].[Respuestas] ([idRespuesta], [strDescripcion], [bitCorrecta], [idPregunta]) VALUES (9, N'ABC', 0, 3)
INSERT [dbo].[Respuestas] ([idRespuesta], [strDescripcion], [bitCorrecta], [idPregunta]) VALUES (11, N'100', 0, 3)
INSERT [dbo].[Respuestas] ([idRespuesta], [strDescripcion], [bitCorrecta], [idPregunta]) VALUES (12, N'50', 0, 3)
INSERT [dbo].[Respuestas] ([idRespuesta], [strDescripcion], [bitCorrecta], [idPregunta]) VALUES (13, N'25', 1, 3)
INSERT [dbo].[Respuestas] ([idRespuesta], [strDescripcion], [bitCorrecta], [idPregunta]) VALUES (15, N'1', 0, 4)
INSERT [dbo].[Respuestas] ([idRespuesta], [strDescripcion], [bitCorrecta], [idPregunta]) VALUES (16, N'50', 0, 4)
INSERT [dbo].[Respuestas] ([idRespuesta], [strDescripcion], [bitCorrecta], [idPregunta]) VALUES (17, N'43', 1, 4)
INSERT [dbo].[Respuestas] ([idRespuesta], [strDescripcion], [bitCorrecta], [idPregunta]) VALUES (18, N'25', 0, 5)
INSERT [dbo].[Respuestas] ([idRespuesta], [strDescripcion], [bitCorrecta], [idPregunta]) VALUES (19, N'36', 0, 5)
INSERT [dbo].[Respuestas] ([idRespuesta], [strDescripcion], [bitCorrecta], [idPregunta]) VALUES (20, N'64', 0, 5)
INSERT [dbo].[Respuestas] ([idRespuesta], [strDescripcion], [bitCorrecta], [idPregunta]) VALUES (21, N'49', 1, 5)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([idUsuario], [strUsuario], [strContraseña]) VALUES (1, N'test', N'test')
INSERT [dbo].[Usuarios] ([idUsuario], [strUsuario], [strContraseña]) VALUES (2, N'prueba', N'prueba')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
ALTER TABLE [dbo].[Examenes] ADD  CONSTRAINT [DF_Examenes_dteFechaCreacion]  DEFAULT (getdate()) FOR [dteFechaCreacion]
GO
ALTER TABLE [dbo].[ExamenesContestados] ADD  CONSTRAINT [DF_ExamenesContestados_dteFechaRegistro]  DEFAULT (getdate()) FOR [dteFechaRegistro]
GO
ALTER TABLE [dbo].[Examenes]  WITH CHECK ADD  CONSTRAINT [FK_Examenes_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Examenes] CHECK CONSTRAINT [FK_Examenes_Usuarios]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Examenes] FOREIGN KEY([idExamen])
REFERENCES [dbo].[Examenes] ([IdExamen])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Examenes]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([idPregunta])
REFERENCES [dbo].[Preguntas] ([idPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaExamen]    Script Date: 06/06/2017 18:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertaExamen]
@materia VARCHAR(50),
@idUsuario INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Examenes (strMateria, IdUsuario) VALUES(@materia, @idUsuario);

	SELECT @@IDENTITY;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaExamenContestado]    Script Date: 06/06/2017 18:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertaExamenContestado]
@idExamen INT,
@idPregunta INT,
@idRespuestas INT,
@idUsuario INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO ExamenesContestados (idExamen, idPregunta, idRespuesta, idUsuario) 
	VALUES(@idExamen, @idPregunta, @idRespuestas, @idUsuario);

	SELECT @@IDENTITY;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaPregunta]    Script Date: 06/06/2017 18:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertaPregunta]
@descripcion VARCHAR(100),
@idExamen INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Preguntas VALUES(@descripcion, @idExamen);

	SELECT @@IDENTITY;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaRespuesta]    Script Date: 06/06/2017 18:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertaRespuesta]
@descripcion VARCHAR(100),
@esCorrecta BIT,
@idPregunta INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Respuestas VALUES(@descripcion, @esCorrecta, @idPregunta);

	SELECT @@IDENTITY;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaUsuario]    Script Date: 06/06/2017 18:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertaUsuario]
@usuario VARCHAR(50),
@contraseña VARCHAR(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Usuarios VALUES(@usuario, @contraseña);

	SELECT @@IDENTITY;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerExamen]    Script Date: 06/06/2017 18:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ObtenerExamen]
@idExamen INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Examenes
	WHERE IdExamen = @idExamen;

	SELECT * FROM Preguntas
	Where idExamen = @idExamen;

	SELECT * FROM Respuestas 
	WHERE idPregunta in (
		SELECT idPregunta FROM Preguntas
		WHERE idExamen = @idExamen
	);

END

GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerExamenes]    Script Date: 06/06/2017 18:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ObtenerExamenes]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Examenes
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerUsuarios]    Script Date: 06/06/2017 18:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ObtenerUsuarios]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Usuarios
	
END

GO
USE [master]
GO
ALTER DATABASE [DevBlocks] SET  READ_WRITE 
GO
