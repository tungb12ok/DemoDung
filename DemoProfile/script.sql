USE [master]
GO
/****** Object:  Database [DemoProject]    Script Date: 8/5/2024 9:19:57 PM ******/
CREATE DATABASE [DemoProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DemoProject', FILENAME = N'/var/opt/mssql/data/DemoProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DemoProject_log', FILENAME = N'/var/opt/mssql/data/DemoProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DemoProject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemoProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DemoProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DemoProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DemoProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DemoProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DemoProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [DemoProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DemoProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemoProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemoProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemoProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DemoProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DemoProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemoProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DemoProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemoProject] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DemoProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemoProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DemoProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DemoProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DemoProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemoProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DemoProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DemoProject] SET RECOVERY FULL 
GO
ALTER DATABASE [DemoProject] SET  MULTI_USER 
GO
ALTER DATABASE [DemoProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DemoProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DemoProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DemoProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DemoProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DemoProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DemoProject', N'ON'
GO
ALTER DATABASE [DemoProject] SET QUERY_STORE = OFF
GO
USE [DemoProject]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 8/5/2024 9:19:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profile]    Script Date: 8/5/2024 9:19:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[profileId] [int] NOT NULL,
	[email] [nvarchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[phoneNumber] [nchar](10) NULL,
	[address] [nvarchar](250) NULL,
	[country] [nvarchar](50) NULL,
	[state] [nvarchar](50) NULL,
	[experience] [nvarchar](50) NULL,
	[addDetail] [nvarchar](500) NULL,
 CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[profileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [username], [password]) VALUES (1, N'tungld', N'123')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Profile] ([profileId], [email], [fullname], [phoneNumber], [address], [country], [state], [experience], [addDetail]) VALUES (1, N'tung020802@gmail.com', N'luc duc tung', N'0987654321', N'HN', N'VN', N'ASIA', N'Junior', N'https://scontent.fhph1-1.fna.fbcdn.net/v/t39.30808-6/454285864_1240216457154796_1156937111106245492_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=A8cQzYsJOVsQ7kNvgH86f_g&_nc_ht=scontent.fhph1-1.fna&oh=00_AYBz0XL885Nnc4UnzcFTy1FlAISVMGVdtslf45mbQ9IVmA&oe=66B6C605')
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Account] FOREIGN KEY([profileId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Account]
GO
USE [master]
GO
ALTER DATABASE [DemoProject] SET  READ_WRITE 
GO
