USE [master]
GO
/****** Object:  Database [DB_HomeStudy]    Script Date: 11/6/2018 5:20:37 PM ******/
CREATE DATABASE [DB_HomeStudy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_HomeStudy2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DB_HomeStudy2.mdf' , SIZE = 189440KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_HomeStudy2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DB_HomeStudy2_log.ldf' , SIZE = 57664KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_HomeStudy] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_HomeStudy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_HomeStudy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_HomeStudy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_HomeStudy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_HomeStudy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_HomeStudy] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_HomeStudy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_HomeStudy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_HomeStudy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_HomeStudy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_HomeStudy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_HomeStudy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_HomeStudy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_HomeStudy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_HomeStudy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_HomeStudy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_HomeStudy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_HomeStudy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_HomeStudy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_HomeStudy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_HomeStudy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_HomeStudy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_HomeStudy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_HomeStudy] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_HomeStudy] SET  MULTI_USER 
GO
ALTER DATABASE [DB_HomeStudy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_HomeStudy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_HomeStudy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_HomeStudy] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB_HomeStudy] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_HomeStudy', N'ON'
GO
USE [DB_HomeStudy]
GO
/****** Object:  User [bts]    Script Date: 11/6/2018 5:20:38 PM ******/
CREATE USER [bts] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [bts]
GO
/****** Object:  Schema [HangFire]    Script Date: 11/6/2018 5:20:38 PM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppUser]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUser](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[NormalizedEmail] [nvarchar](max) NULL,
	[NormalizedUserName] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[Avatar] [nvarchar](300) NULL,
	[BirthDay] [datetime2](7) NULL,
	[FullName] [nvarchar](200) NULL,
	[Stop] [bit] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[CreateByUser] [nvarchar](30) NULL,
	[UpdtByUser] [nvarchar](30) NULL,
	[UpdtDate] [datetime2](7) NULL,
 CONSTRAINT [PK_AppUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] NOT NULL,
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Stop] [bit] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[CreateByUser] [nvarchar](30) NULL,
	[UpdtDate] [datetime2](7) NULL,
	[UpdtByUser] [nvarchar](30) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](200) NULL,
	[Tuition] [numeric](18, 0) NULL,
	[Stop] [bit] NOT NULL,
	[CreateDate] [datetime2](7) NULL,
	[CreateByUser] [nvarchar](30) NULL,
	[UpdtDate] [datetime2](7) NULL,
	[UpdtByUser] [nvarchar](30) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RegisterConsultative]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisterConsultative](
	[RegisterId] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](200) NULL,
	[AgeId] [int] NULL,
	[DateLearnTrial] [datetime2](7) NULL,
	[Email] [nvarchar](50) NULL,
	[FinancialResourceId] [int] NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[IsLearnTrial] [bit] NOT NULL,
	[OccupationId] [int] NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[ReasonId] [int] NULL,
	[ShiftStudyId] [int] NULL,
	[Note] [nvarchar](500) NULL,
	[Stop] [bit] NOT NULL,
	[CreateByUser] [nvarchar](30) NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[UpdtByUser] [nvarchar](30) NULL,
	[UpdtDate] [datetime2](7) NULL,
 CONSTRAINT [PK_RegisterConsultative] PRIMARY KEY CLUSTERED 
(
	[RegisterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resource.Audio]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource.Audio](
	[LineId] [int] IDENTITY(1,1) NOT NULL,
	[AudioId] [uniqueidentifier] NOT NULL,
	[AudioName] [nvarchar](200) NULL,
	[Description] [nvarchar](300) NULL,
	[AudioUrl] [nvarchar](200) NULL,
	[MagazineId] [uniqueidentifier] NULL,
	[Stop] [bit] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[CreateByUser] [nvarchar](30) NULL,
	[UpdtDate] [datetime2](7) NULL,
	[UpdtByUser] [nvarchar](30) NULL,
 CONSTRAINT [PK_Resource.Audio] PRIMARY KEY CLUSTERED 
(
	[AudioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resource.Category]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource.Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Stop] [bit] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[CreateByUser] [nvarchar](30) NULL,
	[UpdtDate] [datetime2](7) NULL,
	[UpdtByUser] [nvarchar](30) NULL,
 CONSTRAINT [PK_Resource.Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resource.Channel]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource.Channel](
	[ChannelId] [int] IDENTITY(1,1) NOT NULL,
	[ChannelYouTubeId] [nvarchar](200) NULL,
	[ChannelName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Stop] [bit] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[CreateByUser] [nvarchar](30) NULL,
	[UpdtDate] [datetime2](7) NULL,
	[UpdtByUser] [nvarchar](30) NULL,
 CONSTRAINT [PK_Resource.Channel] PRIMARY KEY CLUSTERED 
(
	[ChannelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resource.Magazine]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource.Magazine](
	[LineId] [int] IDENTITY(1,1) NOT NULL,
	[MagazineId] [uniqueidentifier] NOT NULL,
	[MagazineName] [nvarchar](200) NULL,
	[Description] [nvarchar](300) NULL,
	[MagazineUrl] [nvarchar](200) NULL,
	[Stop] [bit] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[CreateByUser] [nvarchar](30) NULL,
	[UpdtDate] [datetime2](7) NULL,
	[UpdtByUser] [nvarchar](30) NULL,
 CONSTRAINT [PK_Resource.Magazine] PRIMARY KEY CLUSTERED 
(
	[MagazineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resource.Tag]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource.Tag](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Stop] [bit] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[CreateByUser] [nvarchar](30) NULL,
	[UpdtDate] [datetime2](7) NULL,
	[UpdtByUser] [nvarchar](30) NULL,
 CONSTRAINT [PK_Resource.Tag] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resource.Video]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource.Video](
	[LineId] [int] IDENTITY(1,1) NOT NULL,
	[VideoID] [nvarchar](200) NOT NULL,
	[VideoName] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Title] [nvarchar](200) NULL,
	[ChannelId] [int] NOT NULL,
	[CategoryId] [int] NULL,
	[Views] [int] NULL,
	[Likes] [int] NULL,
	[UnLikes] [int] NULL,
	[UrlYoutube] [nvarchar](200) NULL,
	[UrlUseIframe] [nvarchar](200) NULL,
	[UrlImage] [nvarchar](300) NULL,
	[Stop] [bit] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[CreateByUser] [nvarchar](30) NULL,
	[UpdtDate] [datetime2](7) NULL,
	[UpdtByUser] [nvarchar](30) NULL,
 CONSTRAINT [PK_Resource.Video] PRIMARY KEY CLUSTERED 
(
	[LineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resource.VideoTagDetail]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource.VideoTagDetail](
	[LineId] [int] IDENTITY(1,1) NOT NULL,
	[VideoID] [nvarchar](50) NOT NULL,
	[TagId] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Stop] [bit] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[CreateByUser] [nvarchar](30) NULL,
	[UpdtDate] [datetime2](7) NULL,
	[UpdtByUser] [nvarchar](30) NULL,
 CONSTRAINT [PK_Resource.VideoTagDetail] PRIMARY KEY CLUSTERED 
(
	[LineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Test.AnswerWork]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test.AnswerWork](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[Answer] [nvarchar](100) NOT NULL,
	[AnswerType] [int] NULL,
	[Explanation] [nvarchar](300) NULL,
	[Stop] [bit] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[CreateByUser] [nvarchar](30) NULL,
	[UpdtDate] [datetime2](7) NULL,
	[UpdtByUser] [nvarchar](30) NULL,
 CONSTRAINT [PK_Test.AnswerWork] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Test.Exam]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test.Exam](
	[ExamId] [uniqueidentifier] NOT NULL,
	[ExamName] [nvarchar](200) NULL,
	[UserTest] [nvarchar](300) NULL,
	[QtyCorrect] [int] NULL,
	[QtyIncorrect] [int] NULL,
	[TotalScore] [int] NULL,
	[Stop] [bit] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[CreateByUser] [nvarchar](30) NULL,
	[UpdtDate] [datetime2](7) NULL,
	[UpdtByUser] [nvarchar](30) NULL,
 CONSTRAINT [PK_Test.Exam] PRIMARY KEY CLUSTERED 
(
	[ExamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Test.ExamQuestionDetail]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test.ExamQuestionDetail](
	[LineId] [int] IDENTITY(1,1) NOT NULL,
	[ExamId] [uniqueidentifier] NULL,
	[QuestionId] [uniqueidentifier] NULL,
	[Answer] [nvarchar](200) NULL,
	[Result] [nvarchar](200) NULL,
	[IsCorrect] [bit] NULL,
	[Stop] [bit] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[CreateByUser] [nvarchar](30) NULL,
	[UpdtDate] [datetime2](7) NULL,
	[UpdtByUser] [nvarchar](30) NULL,
 CONSTRAINT [PK_Test.ExamQuestionDetail] PRIMARY KEY CLUSTERED 
(
	[LineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Test.ExamStructure]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test.ExamStructure](
	[StructureId] [int] IDENTITY(1,1) NOT NULL,
	[StructureName] [nvarchar](300) NULL,
	[QuestionLineId] [nvarchar](500) NULL,
	[VideoLineId] [int] NULL,
	[Stop] [bit] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[CreateByUser] [nvarchar](30) NULL,
	[UpdtDate] [datetime2](7) NULL,
	[UpdtByUser] [nvarchar](30) NULL,
 CONSTRAINT [PK_Test.ExamStructure] PRIMARY KEY CLUSTERED 
(
	[StructureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Test.Question]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test.Question](
	[LineId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [uniqueidentifier] NOT NULL,
	[QuestionName] [nvarchar](300) NULL,
	[Answer] [nvarchar](200) NULL,
	[AnswerExplain] [nvarchar](300) NULL,
	[VideoId] [nvarchar](100) NULL,
	[Order] [int] NULL,
	[Stop] [bit] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[CreateByUser] [nvarchar](30) NULL,
	[UpdtDate] [datetime2](7) NULL,
	[UpdtByUser] [nvarchar](30) NULL,
 CONSTRAINT [PK_Test.Question] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Test.QuestionDetail]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test.QuestionDetail](
	[LineId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [uniqueidentifier] NULL,
	[AnswerPossobolity] [nvarchar](200) NULL,
	[Order] [int] NULL,
	[Stop] [bit] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[CreateByUser] [nvarchar](30) NULL,
	[UpdtDate] [datetime2](7) NULL,
	[UpdtByUser] [nvarchar](30) NULL,
 CONSTRAINT [PK_Test.QuestionDetail] PRIMARY KEY CLUSTERED 
(
	[LineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [smallint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Counter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Job]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateId] [int] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[List]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Server]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](100) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Set]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[State]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180708152652_ChannelYouTubeIdUdate', N'2.1.0-rtm-30799')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180708152849_ChannelYouTubeIdU', N'2.1.0-rtm-30799')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180708162541_CategoryIdConvertToInt', N'2.1.0-rtm-30799')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180708162737_CategoryIdConvertToInts', N'2.1.0-rtm-30799')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180708163226_CategoryIdConv', N'2.1.0-rtm-30799')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180710095625_updateUser', N'2.1.0-rtm-30799')
INSERT [dbo].[AppUser] ([Id], [UserName], [PasswordHash], [TwoFactorEnabled], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [Avatar], [BirthDay], [FullName], [Stop], [CreateDate], [CreateByUser], [UpdtByUser], [UpdtDate]) VALUES (N'1', N'test', N'Tung@123', 0, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, CAST(N'2018-07-07 00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[AppUser] ([Id], [UserName], [PasswordHash], [TwoFactorEnabled], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [Avatar], [BirthDay], [FullName], [Stop], [CreateDate], [CreateByUser], [UpdtByUser], [UpdtDate]) VALUES (N'2', N'tung', N'Tung@123', 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, CAST(N'2018-07-07 00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[AppUser] ([Id], [UserName], [PasswordHash], [TwoFactorEnabled], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [Avatar], [BirthDay], [FullName], [Stop], [CreateDate], [CreateByUser], [UpdtByUser], [UpdtDate]) VALUES (N'b987b7b1-8de7-40df-90e8-6bc7a2040369', N'admin', N'AQAAAAEAACcQAAAAEC+SFclPRMY+f3m5IfcABy876xknH8Yp/INgjGEdAo++hRKwi/wjy3U0TUm3xXHRVw==', 0, 0, N'ca914aa3-afb0-49a4-b5aa-73aa1a257465', N'admin@gmail.com', 1, 1, NULL, N'ADMIN@GMAIL.COM', N'ADMIN', NULL, 0, N'T2E6DJ6UXF2J2Y7KBFM4V3RXGB4WVAK3', NULL, NULL, NULL, 0, CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[RegisterConsultative] ON 

INSERT [dbo].[RegisterConsultative] ([RegisterId], [Address], [AgeId], [DateLearnTrial], [Email], [FinancialResourceId], [FullName], [IsLearnTrial], [OccupationId], [Phone], [ReasonId], [ShiftStudyId], [Note], [Stop], [CreateByUser], [CreateDate], [UpdtByUser], [UpdtDate]) VALUES (9, NULL, NULL, NULL, N'NguyenVanAn@gmail.com', NULL, N'Nguyen Van An', 1, NULL, N'09043243234', NULL, NULL, NULL, 0, NULL, CAST(N'2018-07-29 09:29:46.3262640' AS DateTime2), NULL, CAST(N'2018-07-29 09:35:32.0476079' AS DateTime2))
INSERT [dbo].[RegisterConsultative] ([RegisterId], [Address], [AgeId], [DateLearnTrial], [Email], [FinancialResourceId], [FullName], [IsLearnTrial], [OccupationId], [Phone], [ReasonId], [ShiftStudyId], [Note], [Stop], [CreateByUser], [CreateDate], [UpdtByUser], [UpdtDate]) VALUES (10, NULL, NULL, NULL, N'tranthanhtung@gmail.com', NULL, N'Trần Thanh Tùng', 0, NULL, N'0906434343', NULL, NULL, NULL, 0, NULL, CAST(N'2018-07-29 09:30:35.6490406' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[RegisterConsultative] OFF
SET IDENTITY_INSERT [dbo].[Resource.Audio] ON 

INSERT [dbo].[Resource.Audio] ([LineId], [AudioId], [AudioName], [Description], [AudioUrl], [MagazineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1, N'd21dbb31-0888-499d-b46d-3dbcc1aa3e32', N'CD Index (Trang 3)', NULL, N'HotEnglish65_01_Hello.mp3', N'48bc4759-6747-4d5a-a44c-ae41499a1e29', 0, CAST(N'2018-08-21 22:38:36.5500000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Audio] ([LineId], [AudioId], [AudioName], [Description], [AudioUrl], [MagazineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (2, N'9540f0a5-a3d0-4673-85fa-de03acf9df09', N'CD Track 2 - Australian man (Trang 6)', NULL, N'HotEnglish65_02_Idioms.mp3', N'48bc4759-6747-4d5a-a44c-ae41499a1e29', 0, CAST(N'2018-08-21 22:39:21.9070000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Audio] ([LineId], [AudioId], [AudioName], [Description], [AudioUrl], [MagazineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (4, N'6a7394be-ec61-4789-afcf-e9bc4ea2c64f', N'CD track 4 Englishman & Irishman (Trang 9)', NULL, N'HotEnglish65_03_Jokes.mp3', N'48bc4759-6747-4d5a-a44c-ae41499a1e29', 0, CAST(N'2018-08-21 22:39:44.9300000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Audio] ([LineId], [AudioId], [AudioName], [Description], [AudioUrl], [MagazineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (3, N'6a7394be-ec61-4789-afcf-e9bc4ea7c64f', N'CD track 3 Englishman & Irishman (Trang 7)', NULL, N'HotEnglish65_03_Jokes.mp3', N'48bc4759-6747-4d5a-a44c-ae41499a1e29', 0, CAST(N'2018-08-21 22:39:44.9300000' AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Resource.Audio] OFF
SET IDENTITY_INSERT [dbo].[Resource.Category] ON 

INSERT [dbo].[Resource.Category] ([CategoryId], [CategoryName], [Description], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (3, N'English Speaking', NULL, 0, CAST(N'2018-08-07 00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Category] ([CategoryId], [CategoryName], [Description], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (5, N'English Gramer', NULL, 0, CAST(N'2018-08-07 00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Category] ([CategoryId], [CategoryName], [Description], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (9, N'English Online', NULL, 0, CAST(N'2018-07-29 00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Category] ([CategoryId], [CategoryName], [Description], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (11, N'English Magazin', NULL, 0, CAST(N'2018-07-29 00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Category] ([CategoryId], [CategoryName], [Description], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (12, N'English National Geographic', NULL, 0, CAST(N'2018-07-29 00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Resource.Category] OFF
SET IDENTITY_INSERT [dbo].[Resource.Channel] ON 

INSERT [dbo].[Resource.Channel] ([ChannelId], [ChannelYouTubeId], [ChannelName], [Description], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (4, N'UCDIJPT98nv7gcWgQ8TeJmrg', N'Dan Hauer', NULL, 0, CAST(N'2018-07-08 00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Channel] ([ChannelId], [ChannelYouTubeId], [ChannelName], [Description], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (5, N'UCrRiVfHqBIIvSgKmgnSY66g', N'mmmEnglish', NULL, 0, CAST(N'2018-07-08 22:37:43.2630000' AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Resource.Channel] OFF
SET IDENTITY_INSERT [dbo].[Resource.Magazine] ON 

INSERT [dbo].[Resource.Magazine] ([LineId], [MagazineId], [MagazineName], [Description], [MagazineUrl], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (2, N'2304c8e4-9ca8-4937-9d36-2ff92b6a4602', N'Mel Gibson''s Apocalypto', N'Hot English will be available on the 1st of every month on our website.
                        Simply key in your personal code and password, and download the files
                        you want so you can read and listen to Hot English magazine', N'HotEnglish66jpg_Page1.jpg', 0, CAST(N'2018-08-21 22:34:12.9000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Magazine] ([LineId], [MagazineId], [MagazineName], [Description], [MagazineUrl], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (3, N'f27c8af2-44d4-4067-856c-5a2d4f9e7ff9', N'The last king of Scotland', N'Hot English will be available on the 1st of every month on our website.
                        Simply key in your personal code and password, and download the files
                        you want so you can read and listen to Hot English magazine', N'HotEnglish67jpg_Page1.jpg', 0, CAST(N'2018-08-21 22:34:44.1330000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Magazine] ([LineId], [MagazineId], [MagazineName], [Description], [MagazineUrl], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1, N'48bc4759-6747-4d5a-a44c-ae41499a1e29', N'The Queen Helen Mirren', N'Hot English will be available on the 1st of every month on our website.
                        Simply key in your personal code and password, and download the files
                        you want so you can read and listen to Hot English magazine', N'HotEnglish65jpg_Page1.jpg', 0, CAST(N'2018-08-21 22:33:19.7930000' AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Resource.Magazine] OFF
SET IDENTITY_INSERT [dbo].[Resource.Video] ON 

INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (49, N'Jio_hWFv1q4&t=265s', N'Dan giải thích lời thoại trong phim', NULL, NULL, 4, 12, 0, 0, NULL, N'https://www.youtube.com/watch?v=Jio_hWFv1q4&t=265s', N'https://www.youtube.com/embed/Jio_hWFv1q4?ecver=1', N'https://i.ytimg.com/vi_webp/Jio_hWFv1q4/maxresdefault.webp', 0, CAST(N'2018-07-08 00:00:00.0000000' AS DateTime2), NULL, CAST(N'2018-07-29 09:02:56.2388477' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (50, N'8NiCrmfiQCA', N'Vinglish', NULL, NULL, 4, 3, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=8NiCrmfiQCA', N'https://www.youtube.com/embed/8NiCrmfiQCA?ecver=1', N'https://i.ytimg.com/vi_webp/8NiCrmfiQCA/maxresdefault.webp', 0, CAST(N'2018-07-08 19:42:37.5500000' AS DateTime2), NULL, CAST(N'2018-07-29 08:55:29.9688639' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (51, N'S0POh5EUg8A', N'Hỏi đáp cùng Dan 2018', NULL, NULL, 4, 3, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=S0POh5EUg8A', N'https://www.youtube.com/embed/S0POh5EUg8A?ecver=1', N'https://i.ytimg.com/vi_webp/S0POh5EUg8A/maxresdefault.webp', 0, CAST(N'2018-07-08 19:49:34.5830000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (52, N'2dy8zyENniw', N'Những từ viết giống nhau, phát âm khác nhau', NULL, NULL, 4, 3, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=2dy8zyENniw', N'https://www.youtube.com/embed/2dy8zyENniw?ecver=1', N'https://i.ytimg.com/vi_webp/2dy8zyENniw/maxresdefault.webp', 0, CAST(N'2018-07-08 19:50:56.1370000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (53, N'sLc_DHalOMs', N'Tiếng Anh ngố hồi sinh', NULL, NULL, 4, 3, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=sLc_DHalOMs', N'https://www.youtube.com/embed/sLc_DHalOMs?ecver=1', N'https://i.ytimg.com/vi_webp/sLc_DHalOMs/maxresdefault.webp', 0, CAST(N'2018-07-08 19:51:58.2100000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (54, N'8-ktHXX0BkI&list=PLD_5T89Ssbn37h4UPUMY3URT3JcH07QAY', N'MY TOP TIPS! Learn & Use More Phrasal Verbs | English Lesson', NULL, NULL, 5, 3, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=8-ktHXX0BkI&list=PLD_5T89Ssbn37h4UPUMY3URT3JcH07QAY', N'https://www.youtube.com/embed/8-ktHXX0BkI?list=PLD_5T89Ssbn37h4UPUMY3URT3JcH07QAY&amp;ecver=1', N'https://i.ytimg.com/vi_webp/8-ktHXX0BkI/maxresdefault.webp', 0, CAST(N'2018-07-08 22:36:45.4400000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (55, N'TVVn9MddtmM&list=PLD_5T89Ssbn2ybbhz8OBntHJ3ckNUJEUk', N'Present Perfect Tense | Simple or Continuous? | FOR & SINCE', NULL, NULL, 5, 3, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=TVVn9MddtmM&list=PLD_5T89Ssbn2ybbhz8OBntHJ3ckNUJEUk', N'https://www.youtube.com/embed/TVVn9MddtmM?list=PLD_5T89Ssbn2ybbhz8OBntHJ3ckNUJEUk&amp;ecver=1', N'https://i.ytimg.com/vi_webp/8-ktHXX0BkI/maxresdefault.webp', 0, CAST(N'2018-07-08 22:39:00.2500000' AS DateTime2), NULL, CAST(N'2018-07-29 10:04:23.5860849' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (56, N'A2ncygNMaFo&list=PLD_5T89Ssbn2PrkhxV8Lh6ngEjlhqRJ-p', N'Tips To Improve Your Grammar! 👉 English Auxiliary Verbs | BE, DO & HAVE', NULL, NULL, 5, 5, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=A2ncygNMaFo&list=PLD_5T89Ssbn2PrkhxV8Lh6ngEjlhqRJ-p', N'https://www.youtube.com/embed/A2ncygNMaFo?list=PLD_5T89Ssbn2PrkhxV8Lh6ngEjlhqRJ-p&amp;ecver=1', N'https://i.ytimg.com/vi_webp/A2ncygNMaFo/maxresdefault.webp', 0, CAST(N'2018-07-08 22:43:29.4730000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (57, N'n4NVPg2kHv4', N'English Pronunciation Training | Improve Your Accent & Speak Clearly', NULL, NULL, 5, 5, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=n4NVPg2kHv4', N'https://www.youtube.com/embed/n4NVPg2kHv4?ecver=1', N'https://i.ytimg.com/vi_webp/n4NVPg2kHv4/maxresdefault.webp', 0, CAST(N'2018-07-08 22:47:16.2800000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (58, N'8-ktHXX0BkI', N'MY TOP TIPS! Learn & Use More Phrasal Verbs | English Lesson', NULL, NULL, 5, 5, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=8-ktHXX0BkI', N'https://www.youtube.com/embed/8-ktHXX0BkI?ecver=1', N'https://i.ytimg.com/vi_webp/8-ktHXX0BkI/maxresdefault.webp', 0, CAST(N'2018-07-08 22:51:50.1700000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (59, N'9T4KHDyAguk', N'Why can’t I speak fluent English? Stop these 7 things now– Speak fluently with confidence', N'Why can’t I speak fluent English?– Stop doing these 7 mistakes – English lesson to Speak fluently and confidently', NULL, 4, 11, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=9T4KHDyAguk', N'https://www.youtube.com/embed/9T4KHDyAguk?ecver=1', N'https://i.ytimg.com/vi_webp/9T4KHDyAguk/maxresdefault.webp', 0, CAST(N'2018-07-29 10:03:24.5944761' AS DateTime2), NULL, CAST(N'2018-07-29 09:02:00.7339502' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (60, N'fBnAMUkNM2k', N'LEARN ENGLISH | MUNIBA MAZARI - We all are Perfectly Imperfect (English Subtitles)', N'Learn English with Muniba Mazari in inspirational and motivational speech. Muniba Mazari is a Pakistani artist, model, activist, motivational speaker, singer, and television host. She uses a wheelchair due to injuries sustained in a car accident at the age of 21 which makes her Pakistan''s first wheelchair-using model. She is also the National Ambassador for UN Women Pakistan - Watch with English Subtitles.', NULL, 4, 9, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=fBnAMUkNM2k', N'https://www.youtube.com/embed/fBnAMUkNM2k?ecver=1', N'https://i.ytimg.com/vi_webp/fBnAMUkNM2k/maxresdefault.webp', 0, CAST(N'2018-07-29 10:11:01.0402185' AS DateTime2), NULL, CAST(N'2018-07-29 10:12:02.6204477' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (61, N'nsG--RMBJLo&t=9s', N'Hot English Magazine Sample', N'Hot English magazine and how it helps you learn English the fun and easy way.', NULL, 4, 11, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=nsG--RMBJLo&t=9s', N'https://www.youtube.com/embed/nsG--RMBJLo', N'https://i.ytimg.com/vi/nsG--RMBJLo/sddefault.jpg', 0, CAST(N'2018-07-29 19:29:21.4812905' AS DateTime2), NULL, CAST(N'2018-07-29 19:54:51.1419772' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (62, N'13cf9sy3OiQ&t=42s', N'Learn Hot English Digital Products', N'Learn Hot English digital products: Learn Hot English can really help you learn English.  Our digital products are great for learning English.  Read the articles / listen to the dialogues / watch the videos / do the exercises.  Scroll forward or backward to find the page you want.  Increase the text size. Click on the audio button  Pause / fast forward / rewind / start again / minimise the play button  Watch a video  Choose the book or magazine you want to read', NULL, 4, 11, NULL, NULL, NULL, N'https://youtu.be/13cf9sy3OiQ', N'https://www.youtube.com/embed/13cf9sy3OiQ', N'https://i.ytimg.com/vi_webp/13cf9sy3OiQ/sddefault.webp', 0, CAST(N'2018-07-29 19:38:24.0190434' AS DateTime2), NULL, CAST(N'2018-07-29 19:56:30.0149509' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (63, N'wfANZTwZUcs', N'Chỉnh lỗi tiếng Anh: every people', N'Mọi người ≠ every people.  Trong clip này mình hướng dẫn "every" và "each." Nhiều người không hiểu sự khác biệt giữa hai từ này rõ lắm, và cũng mắc phải lỗi khi dùng danh từ số nhiều với cả hai.  À, mình cũng sửa một lỗi về cách sử dụng "every time."  Chúc các bạn sửa lỗi thành công nhé!', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/wfANZTwZUcs', N'https://www.youtube.com/embed/wfANZTwZUcs', N'https://i.ytimg.com/vi_webp/wfANZTwZUcs/maxresdefault.webp', 0, CAST(N'2018-07-29 19:50:29.6075179' AS DateTime2), NULL, CAST(N'2018-07-29 19:57:48.0930880' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (64, N'RbDDNudAiSo', N'Chỉnh lỗi tiếng Anh: see, look, watch', N'Đừng nhìn vào tao. ≠ Don''t see me. Các bạn ơi, ba từ "see," "look," và "watch" rất là khác biệt. Hy vọng đã xem clip này các bạn không mắc phải lỗi nữa.', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/RbDDNudAiSo', N'https://www.youtube.com/embed/RbDDNudAiSo', N'https://i.ytimg.com/vi_webp/RbDDNudAiSo/hqdefault.webp', 0, CAST(N'2018-07-29 20:03:25.7712811' AS DateTime2), NULL, CAST(N'2018-07-29 20:04:46.9850238' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (65, N'ACI2QocDXbg', N'Chỉnh lỗi tiếng Anh: clothes', N'Trong clip này mình sửa những lỗi các bạn Việt hay mắc phải khi nói đến quần áo. Ví dụ: cách phát âm "clothes," nghĩa của "t-shirt," và cách dùng "jeans" và "a pair of jeans."', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/ACI2QocDXbg', N'https://www.youtube.com/embed/ACI2QocDXbg', N'https://i.ytimg.com/vi_webp/ACI2QocDXbg/hqdefault.webp', 0, CAST(N'2018-07-29 20:05:58.5579495' AS DateTime2), NULL, CAST(N'2018-08-14 19:54:55.9949372' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (66, N'-tPLdqOczus', N'Tiếng Anh ngố', N'Nhiều khi các bạn nói không sai ngữ pháp, không sai từ vựng, nhưng rất sai so với cách nói của người bản ngữ. Các bạn xem để sửa 7 lỗi phổ biến nhé.', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/-tPLdqOczus', N'https://www.youtube.com/embed/-tPLdqOczus', N'https://i.ytimg.com/vi_webp/-tPLdqOczus/hqdefault.webp', 0, CAST(N'2018-07-29 20:09:23.7139098' AS DateTime2), NULL, CAST(N'2018-08-14 19:57:52.3376470' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (67, N'IJRcpQBLFmI', N'Vinglish', N'Nhiều khi English của các bạn bị Vietnamese ảnh hưởng đến mức nó biến thành Vinglish.', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/IJRcpQBLFmI', N'https://www.youtube.com/embed/IJRcpQBLFmI', N'https://i.ytimg.com/vi_webp/IJRcpQBLFmI/hqdefault.webp', 0, CAST(N'2018-07-29 20:12:11.1178039' AS DateTime2), NULL, CAST(N'2018-08-14 19:55:27.7097930' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (68, N'eZ9-uG0PIDw', N'Vinglish bá đạo', N'Phần hai của chủ đề Vinglish.', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/eZ9-uG0PIDw', N'https://www.youtube.com/embed/eZ9-uG0PIDw', N'https://i.ytimg.com/vi_webp/eZ9-uG0PIDw/hqdefault.webp', 0, CAST(N'2018-07-29 20:13:44.3747677' AS DateTime2), NULL, CAST(N'2018-08-14 19:58:09.7940776' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (69, N'1RDs-ivyXlA', N'Sự trở lại của Tiếng Anh ngố', N'Các bạn có còn nhớ "tiếng Anh ngố" không? Nó đã trở lại rồi, và lần này nó còn ngố hơn lần trước.', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/1RDs-ivyXlA', N'https://www.youtube.com/embed/1RDs-ivyXlA', N'https://i.ytimg.com/vi_webp/1RDs-ivyXlA/hqdefault.webp', 0, CAST(N'2018-07-29 20:15:14.4181258' AS DateTime2), NULL, CAST(N'2018-08-14 19:56:25.9914953' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (70, N'trrPPPjxe-4', N'Tiếng Anh nhập lỗi', N'Picnic, stress, cassette, les, vlog . . . Năm từ tiếng Anh này đã được nhập vào tiếng Việt. Quá tiếc là cách sử dụng của năm từ ấy trong tiếng Việt khiến cho các bạn sử dụng chúng sai trong tiếng Anh.', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/trrPPPjxe-4', N'https://www.youtube.com/embed/trrPPPjxe-4', N'https://i.ytimg.com/vi_webp/trrPPPjxe-4/hqdefault.webp', 0, CAST(N'2018-07-29 20:16:03.7142124' AS DateTime2), NULL, CAST(N'2018-08-14 19:58:30.9789148' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (71, N'-l0ppD_UCzg', N'Vinglish siêu tốc', N'Tập 4 trong seri Vinglish. Nhanh, hay, hữư ích. Xem đi!', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/-l0ppD_UCzg', N'https://www.youtube.com/embed/-l0ppD_UCzg', N'https://i.ytimg.com/vi_webp/-l0ppD_UCzg/hqdefault.webp', 0, CAST(N'2018-07-29 20:16:53.9931007' AS DateTime2), NULL, CAST(N'2018-08-14 19:57:09.1099711' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (72, N'cvBe6Ap2yj8', N'Những từ dễ nhầm lẫn', N'Dan giải thích sự khác biệt giữa: learn/study, early/soon, die/dead, true/right, either/too, win/beat và shy/embarrassed.', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/cvBe6Ap2yj8', N'https://www.youtube.com/embed/cvBe6Ap2yj8', N'https://i.ytimg.com/vi_webp/cvBe6Ap2yj8/hqdefault.webp', 0, CAST(N'2018-07-29 20:19:09.6509390' AS DateTime2), NULL, CAST(N'2018-08-14 19:58:51.1653503' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (73, N'CU-0OvVB3rk', N'Chữa phụ đề Việt', N'Dan nói về Deadpool, Inside Out, Guardians of the Galaxy, 22 Jump Street, Zombieland và Sicario.', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/CU-0OvVB3rk', N'https://www.youtube.com/embed/CU-0OvVB3rk', N'https://i.ytimg.com/vi_webp/CU-0OvVB3rk/hqdefault.webp', 0, CAST(N'2018-07-29 20:27:52.1738567' AS DateTime2), NULL, CAST(N'2018-08-14 19:57:26.0828009' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (74, N'SRsSUH2ogsc', N'Tiếng Anh ngố 3', N'Buy your ass a t-shirt at printstyle.vn/danhauer. Trong video này Dan nói về "rice," "worker," "of course," "I''m fine thank you. And you?" "I think so!"', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/SRsSUH2ogsc', N'https://www.youtube.com/embed/SRsSUH2ogsc', N'https://i.ytimg.com/vi_webp/SRsSUH2ogsc/hqdefault.webp', 0, CAST(N'2018-07-29 20:29:53.6824702' AS DateTime2), NULL, CAST(N'2018-08-14 19:59:10.4781842' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (75, N'hdZK22pR5nU', N'5 Reasons Why The Japanese Are So Polite', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=hdZK22pR5nU', N'https://www.youtube.com/embed/hdZK22pR5nU', N'https://i.ytimg.com/vi_webp/hdZK22pR5nU/hqdefault.webp', 0, CAST(N'2018-08-14 20:03:04.8373959' AS DateTime2), NULL, CAST(N'2018-08-14 20:05:16.8604277' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (76, N'-Blsz2JbdgM', N'10 Countries Where You Can Start A New Life', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=-Blsz2JbdgM', N'https://www.youtube.com/embed/-Blsz2JbdgM', N'https://i.ytimg.com/vi_webp/-Blsz2JbdgM/hqdefault.webp', 0, CAST(N'2018-08-14 20:06:43.3937797' AS DateTime2), NULL, CAST(N'2018-08-14 20:07:07.0434213' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (77, N'rMrZJEuyOCw', N'10 Famous People Who Were Homeless', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=rMrZJEuyOCw', N'https://www.youtube.com/embed/rMrZJEuyOCw', N'https://i.ytimg.com/vi_webp/rMrZJEuyOCw/hqdefault.webp', 0, CAST(N'2018-08-14 20:08:28.7875648' AS DateTime2), NULL, CAST(N'2018-08-14 20:08:47.0707970' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (78, N'wTjCyjmhwo8', N'10 Highest Paid Jobs You Can Do From Home', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=wTjCyjmhwo8', N'https://www.youtube.com/embed/wTjCyjmhwo8', N'https://i.ytimg.com/vi_webp/wTjCyjmhwo8/hqdefault.webp', 0, CAST(N'2018-08-14 20:10:00.1725254' AS DateTime2), NULL, CAST(N'2018-08-14 20:10:18.6741578' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (79, N'Hld557JJVzU', N'10 Illegal Jobs That Pay Extremely Well', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=Hld557JJVzU', N'https://www.youtube.com/embed/Hld557JJVzU', N'https://i.ytimg.com/vi_webp/Hld557JJVzU/hqdefault.webp', 0, CAST(N'2018-08-14 20:11:18.8122635' AS DateTime2), NULL, CAST(N'2018-08-14 20:11:38.1718975' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (80, N'6jyuyX5M28o', N'10 Insane Celebrity Homes', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=6jyuyX5M28o', N'https://www.youtube.com/embed/6jyuyX5M28o', N'https://i.ytimg.com/vi_webp/6jyuyX5M28o/hqdefault.webp', 0, CAST(N'2018-08-14 20:12:40.8684076' AS DateTime2), NULL, CAST(N'2018-08-14 20:12:57.7164372' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (81, N'K8IN699J3kM', N'10 Most Expensive Hotels In The World', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=K8IN699J3kM', N'https://www.youtube.com/embed/K8IN699J3kM', N'https://i.ytimg.com/vi_webp/K8IN699J3kM/sddefault.webp', 0, CAST(N'2018-08-14 20:13:59.0401449' AS DateTime2), NULL, CAST(N'2018-08-14 20:14:17.4169772' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (82, N'YPv_1tCk8P0', N'10 Of The Best Street Foods Around The World', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=YPv_1tCk8P0', N'https://www.youtube.com/embed/YPv_1tCk8P0', N'https://i.ytimg.com/vi_webp/YPv_1tCk8P0/hqdefault.webp', 0, CAST(N'2018-08-14 20:15:31.1739067' AS DateTime2), NULL, CAST(N'2018-08-14 19:16:52.9153272' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (83, N'wb45ZigmSx8', N'10 People Who Got Rich From Stupid Products', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=wb45ZigmSx8', N'https://www.youtube.com/embed/wb45ZigmSx8', N'https://i.ytimg.com/vi_webp/wb45ZigmSx8/hqdefault.webp', 0, CAST(N'2018-08-14 19:17:38.3114069' AS DateTime2), NULL, CAST(N'2018-08-14 19:17:56.6726392' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (84, N'D6wmz6HQBWc', N'10 Teens Who Are Self-Made Millionaires', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=D6wmz6HQBWc', N'https://www.youtube.com/embed/D6wmz6HQBWc', N'https://i.ytimg.com/vi_webp/D6wmz6HQBWc/hqdefault.webp', 0, CAST(N'2018-08-14 19:19:21.7863887' AS DateTime2), NULL, CAST(N'2018-08-14 19:19:42.3004247' AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (85, N'qB7I7TaWHYE', N'10 Things You''re Not Allowed To Do In SAUDI ARABIA [English]', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=qB7I7TaWHYE', N'https://www.youtube.com/embed/qB7I7TaWHYE', N'https://i.ytimg.com/vi_webp/qB7I7TaWHYE/hqdefault.webp', 0, CAST(N'2018-08-14 19:20:44.2169335' AS DateTime2), NULL, CAST(N'2018-08-14 19:21:03.9353681' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Resource.Video] OFF
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'99ab6645-ebee-4a91-b6ca-364fcd4fe7fb', N'Exam --> 10/31/2018 10:48:05 AM', NULL, NULL, NULL, NULL, 0, CAST(N'2018-10-31 10:48:05.2454348' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'8fa2cd26-b812-4144-9481-755f81bd9900', N'Exam --> 10/31/2018 10:48:35 AM', NULL, NULL, NULL, NULL, 0, CAST(N'2018-10-31 10:48:35.2558496' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'faf6690e-b762-475a-b780-7b79daba249e', N'Exam --> 10/31/2018 10:48:35 AM', NULL, NULL, NULL, NULL, 0, CAST(N'2018-10-31 10:48:35.3123957' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'd2e47bc8-9589-4804-b300-86fc6039af56', N'Exam --> 10/31/2018 10:47:38 AM', NULL, NULL, NULL, NULL, 0, CAST(N'2018-10-31 10:47:38.1483687' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'd8cb5baf-1ac8-4e84-8fd4-c3284dda22fd', N'Exam --> 10/31/2018 10:48:15 AM', NULL, NULL, NULL, NULL, 0, CAST(N'2018-10-31 10:48:15.2880840' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'edc3a64c-b2fa-408b-987b-d47828f9a87a', N'Exam --> 10/31/2018 10:47:45 AM', NULL, NULL, NULL, NULL, 0, CAST(N'2018-10-31 10:47:45.2495784' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'c6fbea85-8ad4-4acb-9386-d54025252b02', N'Exam --> 10/31/2018 10:47:55 AM', NULL, NULL, NULL, NULL, 0, CAST(N'2018-10-31 10:47:55.2868023' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'da565a6f-820e-45ef-9d74-e37aea3eb919', N'Exam --> 10/31/2018 10:47:55 AM', NULL, NULL, NULL, NULL, 0, CAST(N'2018-10-31 10:47:55.3423723' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'68aba594-622d-4e40-ab47-efa42bca5ea8', N'Exam --> 10/31/2018 10:48:25 AM', NULL, NULL, NULL, NULL, 0, CAST(N'2018-10-31 10:48:25.2554056' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'e2dd264a-fe20-47fb-bd91-f6e8c930b566', N'Exam --> 10/31/2018 10:47:38 AM', NULL, NULL, NULL, NULL, 0, CAST(N'2018-10-31 10:47:38.1482744' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'81bd18b5-8081-4c0a-9ddf-f86c9202b762', N'Exam --> 10/31/2018 10:48:15 AM', NULL, NULL, NULL, NULL, 0, CAST(N'2018-10-31 10:48:15.3665653' AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Test.ExamQuestionDetail] ON 

INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1, N'19a13613-09ba-48e0-8376-dcf10b1d135b', N'4a19408a-8498-464d-bcd1-02c53a613dfa', N'old-school', N'old-school', 1, 0, CAST(N'2018-08-08 16:53:14.6885573' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (2, N'19a13613-09ba-48e0-8376-dcf10b1d135b', N'788ac91b-f9dc-434c-a14e-9405beb5f270', N'an old dog', N'old-school', 0, 0, CAST(N'2018-08-08 16:53:14.6888879' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (3, N'997a6457-4684-49aa-a9df-594b754f6cc4', N'4a19408a-8498-464d-bcd1-02c53a613dfa', N'school of thought', N'old-school', 0, 0, CAST(N'2018-08-08 16:53:49.7363434' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (4, N'997a6457-4684-49aa-a9df-594b754f6cc4', N'788ac91b-f9dc-434c-a14e-9405beb5f270', N'old-school', N'old-school', 1, 0, CAST(N'2018-08-08 16:53:49.7363469' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (5, N'9daaea0e-700e-4574-a006-31746c190c2d', N'38c822d8-8130-4cba-ae9c-2da0b504bde1', N'school of thought', N'old-school', 0, 0, CAST(N'2018-08-08 17:17:59.0977344' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (6, N'9daaea0e-700e-4574-a006-31746c190c2d', N'afbef51c-1b9c-497c-8dc7-48868d7f2cf7', N'school of thought', N'old-school', 0, 0, CAST(N'2018-08-08 17:17:59.0977382' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (7, N'e8ee5082-272c-4be3-8e18-1d02732a302c', N'38c822d8-8130-4cba-ae9c-2da0b504bde1', N'', N'old-school', 0, 0, CAST(N'2018-08-08 17:18:17.5588767' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (8, N'e8ee5082-272c-4be3-8e18-1d02732a302c', N'afbef51c-1b9c-497c-8dc7-48868d7f2cf7', N'', N'old-school', 0, 0, CAST(N'2018-08-08 17:18:17.5588790' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (9, N'a4128add-8a24-46f5-a289-bf09726a9756', N'38c822d8-8130-4cba-ae9c-2da0b504bde1', N'school of thought', N'old-school', 0, 0, CAST(N'2018-08-08 17:18:29.2638003' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (10, N'a4128add-8a24-46f5-a289-bf09726a9756', N'afbef51c-1b9c-497c-8dc7-48868d7f2cf7', N'old-school', N'old-school', 1, 0, CAST(N'2018-08-08 17:18:29.2638035' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (11, N'36f7f30d-5864-44b2-b8ab-0d8684d79bb1', N'38c822d8-8130-4cba-ae9c-2da0b504bde1', N'school of thought', N'old-school', 0, 0, CAST(N'2018-08-15 16:04:03.9247554' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (12, N'36f7f30d-5864-44b2-b8ab-0d8684d79bb1', N'afbef51c-1b9c-497c-8dc7-48868d7f2cf7', N'old-school', N'old-school', 1, 0, CAST(N'2018-08-15 16:04:03.9251309' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (13, N'592d8bc1-d8d5-4b28-befb-0118c87e6eaf', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'School', N'The Japanese people', 0, 0, CAST(N'2018-08-21 14:57:51.1498480' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (14, N'592d8bc1-d8d5-4b28-befb-0118c87e6eaf', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'Children’s upbringing and schooling', N'Children’s upbringing and schooling', 1, 0, CAST(N'2018-08-21 14:57:51.1501664' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (15, N'592d8bc1-d8d5-4b28-befb-0118c87e6eaf', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'', N'Group culture and rules', 0, 0, CAST(N'2018-08-21 14:57:51.1501687' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (16, N'592d8bc1-d8d5-4b28-befb-0118c87e6eaf', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'It has a biggest city in the world', N'The Japanese philosophy and religion ', 0, 0, CAST(N'2018-08-21 14:57:51.1501741' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (17, N'7b61ce49-51b0-418f-b6dc-3ecf8484027e', N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'20.000$', N'59.000$', 0, 0, CAST(N'2018-08-21 14:58:58.5025148' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (18, N'7b61ce49-51b0-418f-b6dc-3ecf8484027e', N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'Writer and Author', N'Financial Manager', 0, 0, CAST(N'2018-08-21 14:58:58.5025193' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (19, N'7b61ce49-51b0-418f-b6dc-3ecf8484027e', N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'Jobs that get highest paid', N'Jobs that get highest paid', 1, 0, CAST(N'2018-08-21 14:58:58.5025206' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (20, N'7b61ce49-51b0-418f-b6dc-3ecf8484027e', N'2b41e104-aae6-4a00-a0ba-847760647766', N'Hotel Manager', N'Public Relation Specialist', 0, 0, CAST(N'2018-08-21 14:58:58.5025267' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (21, N'7b61ce49-51b0-418f-b6dc-3ecf8484027e', N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'Medical Call Center', N'Medical Call Center', 1, 0, CAST(N'2018-08-21 14:58:58.5025276' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (22, N'7975a19b-a680-463b-9976-7569cac66148', N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'', N'59.000$', 0, 0, CAST(N'2018-08-21 14:59:31.4416600' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (23, N'7975a19b-a680-463b-9976-7569cac66148', N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'', N'Financial Manager', 0, 0, CAST(N'2018-08-21 14:59:31.4416612' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (24, N'7975a19b-a680-463b-9976-7569cac66148', N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'', N'Jobs that get highest paid', 0, 0, CAST(N'2018-08-21 14:59:31.4416616' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (25, N'7975a19b-a680-463b-9976-7569cac66148', N'2b41e104-aae6-4a00-a0ba-847760647766', N'', N'Public Relation Specialist', 0, 0, CAST(N'2018-08-21 14:59:31.4416619' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (26, N'7975a19b-a680-463b-9976-7569cac66148', N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'', N'Medical Call Center', 0, 0, CAST(N'2018-08-21 14:59:31.4416622' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (27, N'97cc4df5-9fb7-45d1-a612-e3d53587d79a', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'', N'The Japanese people', 0, 0, CAST(N'2018-08-21 15:05:08.2410558' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (28, N'97cc4df5-9fb7-45d1-a612-e3d53587d79a', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'', N'The Japanese philosophy and religion ', 0, 0, CAST(N'2018-08-21 15:05:08.2412302' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (29, N'97cc4df5-9fb7-45d1-a612-e3d53587d79a', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'', N'Group culture and rules', 0, 0, CAST(N'2018-08-21 15:05:08.2412325' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (30, N'97cc4df5-9fb7-45d1-a612-e3d53587d79a', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'', N'Children’s upbringing and schooling', 0, 0, CAST(N'2018-08-21 15:05:08.2412402' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (31, N'7f1dbf11-2ee0-47ba-a634-8a73359a280d', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'', N'The Japanese people', 0, 0, CAST(N'2018-08-21 15:09:29.4384694' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (32, N'7f1dbf11-2ee0-47ba-a634-8a73359a280d', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'', N'The Japanese philosophy and religion ', 0, 0, CAST(N'2018-08-21 15:09:29.4384717' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (33, N'7f1dbf11-2ee0-47ba-a634-8a73359a280d', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'', N'Group culture and rules', 0, 0, CAST(N'2018-08-21 15:09:29.4384723' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (34, N'7f1dbf11-2ee0-47ba-a634-8a73359a280d', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'', N'Children’s upbringing and schooling', 0, 0, CAST(N'2018-08-21 15:09:29.4384755' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (35, N'f659195e-710c-4812-8cbd-5222166234b4', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'', N'The Japanese people', 0, 0, CAST(N'2018-08-21 15:13:32.8185108' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (36, N'f659195e-710c-4812-8cbd-5222166234b4', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'', N'The Japanese philosophy and religion ', 0, 0, CAST(N'2018-08-21 15:13:32.8185124' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (37, N'f659195e-710c-4812-8cbd-5222166234b4', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'', N'Group culture and rules', 0, 0, CAST(N'2018-08-21 15:13:32.8185131' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (38, N'f659195e-710c-4812-8cbd-5222166234b4', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'', N'Children’s upbringing and schooling', 0, 0, CAST(N'2018-08-21 15:13:32.8185153' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (39, N'8f46299d-f54b-4b58-875d-373fbf2f44f0', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'', N'The Japanese people', 0, 0, CAST(N'2018-08-21 15:15:10.3129247' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (40, N'8f46299d-f54b-4b58-875d-373fbf2f44f0', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'', N'The Japanese philosophy and religion ', 0, 0, CAST(N'2018-08-21 15:15:10.3129260' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (41, N'8f46299d-f54b-4b58-875d-373fbf2f44f0', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'', N'Group culture and rules', 0, 0, CAST(N'2018-08-21 15:15:10.3129263' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (42, N'8f46299d-f54b-4b58-875d-373fbf2f44f0', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'', N'Children’s upbringing and schooling', 0, 0, CAST(N'2018-08-21 15:15:10.3129295' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (43, N'86e02b0c-de71-4a68-a2b1-472e8e9721fd', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'', N'The Japanese people', 0, 0, CAST(N'2018-08-21 15:17:56.4401277' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (44, N'86e02b0c-de71-4a68-a2b1-472e8e9721fd', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'', N'The Japanese philosophy and religion ', 0, 0, CAST(N'2018-08-21 15:17:56.4401293' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (45, N'86e02b0c-de71-4a68-a2b1-472e8e9721fd', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'', N'Group culture and rules', 0, 0, CAST(N'2018-08-21 15:17:56.4401386' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (46, N'86e02b0c-de71-4a68-a2b1-472e8e9721fd', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'', N'Children’s upbringing and schooling', 0, 0, CAST(N'2018-08-21 15:17:56.4401412' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (47, N'53e8551f-8bed-4e1a-8de0-18ea0f758146', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'', N'The Japanese people', 0, 0, CAST(N'2018-08-21 15:19:40.8664564' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (48, N'53e8551f-8bed-4e1a-8de0-18ea0f758146', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'', N'The Japanese philosophy and religion ', 0, 0, CAST(N'2018-08-21 15:19:40.8664580' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (49, N'53e8551f-8bed-4e1a-8de0-18ea0f758146', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'', N'Group culture and rules', 0, 0, CAST(N'2018-08-21 15:19:40.8664583' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (50, N'53e8551f-8bed-4e1a-8de0-18ea0f758146', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'', N'Children’s upbringing and schooling', 0, 0, CAST(N'2018-08-21 15:19:40.8664618' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (51, N'cc569256-17a3-4ade-b3ee-f389ff439547', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'Crime', N'The Japanese people', 0, 0, CAST(N'2018-08-21 15:20:04.6310419' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (52, N'cc569256-17a3-4ade-b3ee-f389ff439547', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'It has a biggest city in the world', N'The Japanese philosophy and religion ', 0, 0, CAST(N'2018-08-21 15:20:04.6313077' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (53, N'cc569256-17a3-4ade-b3ee-f389ff439547', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'Group culture and rules', N'Group culture and rules', 1, 0, CAST(N'2018-08-21 15:20:04.6313128' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (54, N'cc569256-17a3-4ade-b3ee-f389ff439547', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'Children’s upbringing and schooling', N'Children’s upbringing and schooling', 1, 0, CAST(N'2018-08-21 15:20:04.6313141' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (55, N'828805ee-53f2-46d8-85ac-59ab4b816e1c', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'Crime', N'The Japanese people', 0, 0, CAST(N'2018-08-21 15:30:16.9211963' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (56, N'828805ee-53f2-46d8-85ac-59ab4b816e1c', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'It has a biggest city in the world', N'The Japanese philosophy and religion ', 0, 0, CAST(N'2018-08-21 15:38:48.3006930' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (57, N'828805ee-53f2-46d8-85ac-59ab4b816e1c', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'Group culture and rules', N'Group culture and rules', 1, 0, CAST(N'2018-08-21 15:38:48.3012282' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (58, N'828805ee-53f2-46d8-85ac-59ab4b816e1c', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'They judge you negatively if you have worng behaviour', N'Children’s upbringing and schooling', 0, 0, CAST(N'2018-08-21 15:38:48.3012317' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (59, N'e22110cb-e8f0-4e1b-8833-a99e224a5df8', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'Crime', N'The Japanese people', 0, 0, CAST(N'2018-08-21 15:41:16.6205948' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (60, N'e22110cb-e8f0-4e1b-8833-a99e224a5df8', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'It has a biggest city in the world', N'The Japanese philosophy and religion ', 0, 0, CAST(N'2018-08-21 15:41:27.3168753' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (61, N'e22110cb-e8f0-4e1b-8833-a99e224a5df8', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'Group culture and rules', N'Group culture and rules', 1, 0, CAST(N'2018-08-21 15:41:27.3168827' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (62, N'e22110cb-e8f0-4e1b-8833-a99e224a5df8', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'They judge you negatively if you have worng behaviour', N'Children’s upbringing and schooling', 0, 0, CAST(N'2018-08-21 15:41:27.3168984' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (63, N'0bf2b814-b25a-4678-93a3-4345a1324117', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'', N'The Japanese people', 0, 0, CAST(N'2018-08-21 15:44:55.7448903' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (64, N'0bf2b814-b25a-4678-93a3-4345a1324117', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'', N'The Japanese philosophy and religion ', 0, 0, CAST(N'2018-08-21 15:44:55.7448922' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (65, N'0bf2b814-b25a-4678-93a3-4345a1324117', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'', N'Group culture and rules', 0, 0, CAST(N'2018-08-21 15:44:55.7448925' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (66, N'0bf2b814-b25a-4678-93a3-4345a1324117', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'', N'Children’s upbringing and schooling', 0, 0, CAST(N'2018-08-21 15:44:55.7449281' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1013, N'4646a65f-8aa8-4ff0-a739-55192f17f54d', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'', N'The Japanese people', 0, 0, CAST(N'2018-08-21 15:54:51.7054457' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1014, N'4646a65f-8aa8-4ff0-a739-55192f17f54d', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'', N'The Japanese philosophy and religion ', 0, 0, CAST(N'2018-08-21 15:54:51.7055964' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1015, N'4646a65f-8aa8-4ff0-a739-55192f17f54d', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'', N'Group culture and rules', 0, 0, CAST(N'2018-08-21 15:54:51.7055974' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1016, N'4646a65f-8aa8-4ff0-a739-55192f17f54d', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'', N'Children’s upbringing and schooling', 0, 0, CAST(N'2018-08-21 15:54:51.7056012' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1017, N'b95cbe59-b1da-496a-a81d-8822d799a1a9', N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'How to make a lot of money', N'Jobs that get highest paid', 0, 0, CAST(N'2018-08-21 15:55:09.0966243' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1018, N'b95cbe59-b1da-496a-a81d-8822d799a1a9', N'2b41e104-aae6-4a00-a0ba-847760647766', N'Public Speaking', N'Public Relation Specialist', 0, 0, CAST(N'2018-08-21 15:55:09.0969440' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1019, N'b95cbe59-b1da-496a-a81d-8822d799a1a9', N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'50.000$', N'59.000$', 0, 0, CAST(N'2018-08-21 15:55:09.0969456' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1020, N'b95cbe59-b1da-496a-a81d-8822d799a1a9', N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'Medical Call Center', N'Medical Call Center', 1, 0, CAST(N'2018-08-21 15:55:09.0969462' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1021, N'b95cbe59-b1da-496a-a81d-8822d799a1a9', N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'Writer and Author', N'Financial Manager', 0, 0, CAST(N'2018-08-21 15:55:09.0969472' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1022, N'02043fb3-4c6b-43d0-915a-f4470fc3fa72', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'School', N'The Japanese people', 0, 0, CAST(N'2018-08-21 21:23:54.3064617' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1023, N'02043fb3-4c6b-43d0-915a-f4470fc3fa72', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'It has a biggest city in the world', N'The Japanese philosophy and religion ', 0, 0, CAST(N'2018-08-21 21:23:54.3070728' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1024, N'02043fb3-4c6b-43d0-915a-f4470fc3fa72', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'It has few foreigners among local people', N'Group culture and rules', 0, 0, CAST(N'2018-08-21 21:23:54.3070757' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1025, N'02043fb3-4c6b-43d0-915a-f4470fc3fa72', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'', N'Children’s upbringing and schooling', 0, 0, CAST(N'2018-08-21 21:23:54.3070913' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1026, N'02043fb3-4c6b-43d0-915a-f4470fc3fa72', N'0483578f-5007-4d2e-bd5d-f3466b165d89', N'', N'Treat everyone equally', 0, 0, CAST(N'2018-08-21 21:23:54.3070929' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1027, N'8a832a22-915c-43a3-a8eb-c50ba01cf03f', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'The Japanese people', N'The Japanese people', 1, 0, CAST(N'2018-08-21 21:24:55.4373606' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1028, N'8a832a22-915c-43a3-a8eb-c50ba01cf03f', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'The Japanese philosophy and religion ', N'The Japanese philosophy and religion ', 1, 0, CAST(N'2018-08-21 21:24:55.4373643' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1029, N'8a832a22-915c-43a3-a8eb-c50ba01cf03f', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'', N'Group culture and rules', 0, 0, CAST(N'2018-08-21 21:24:55.4373655' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1030, N'8a832a22-915c-43a3-a8eb-c50ba01cf03f', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'', N'Children’s upbringing and schooling', 0, 0, CAST(N'2018-08-21 21:24:55.4373684' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1031, N'8a832a22-915c-43a3-a8eb-c50ba01cf03f', N'0483578f-5007-4d2e-bd5d-f3466b165d89', N'', N'Treat everyone equally', 0, 0, CAST(N'2018-08-21 21:24:55.4373688' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1032, N'875ea57e-794f-4d12-b0ab-fbd49b875e57', N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'Places to travel', N'Jobs that get highest paid', 0, 0, CAST(N'2018-08-21 21:27:27.7164976' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1033, N'875ea57e-794f-4d12-b0ab-fbd49b875e57', N'2b41e104-aae6-4a00-a0ba-847760647766', N'', N'Public Relation Specialist', 0, 0, CAST(N'2018-08-21 21:27:27.7165034' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1034, N'875ea57e-794f-4d12-b0ab-fbd49b875e57', N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'50.000$', N'59.000$', 0, 0, CAST(N'2018-08-21 21:27:27.7165042' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1035, N'875ea57e-794f-4d12-b0ab-fbd49b875e57', N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'', N'Medical Call Center', 0, 0, CAST(N'2018-08-21 21:27:27.7165054' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1036, N'875ea57e-794f-4d12-b0ab-fbd49b875e57', N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'', N'Financial Manager', 0, 0, CAST(N'2018-08-21 21:27:27.7165058' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1037, N'ea82e2c3-73b8-4047-8d70-c3a1c976875a', N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'Jobs that get highest paid', N'Jobs that get highest paid', 1, 0, CAST(N'2018-08-21 21:31:47.3751693' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1038, N'ea82e2c3-73b8-4047-8d70-c3a1c976875a', N'2b41e104-aae6-4a00-a0ba-847760647766', N'Hotel Manager', N'Public Relation Specialist', 0, 0, CAST(N'2018-08-21 21:31:47.3751738' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1039, N'ea82e2c3-73b8-4047-8d70-c3a1c976875a', N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'59.000$', N'59.000$', 1, 0, CAST(N'2018-08-21 21:31:47.3751750' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1040, N'ea82e2c3-73b8-4047-8d70-c3a1c976875a', N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'', N'Medical Call Center', 0, 0, CAST(N'2018-08-21 21:31:47.3751762' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1041, N'ea82e2c3-73b8-4047-8d70-c3a1c976875a', N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'', N'Financial Manager', 0, 0, CAST(N'2018-08-21 21:31:47.3751771' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1042, N'c6e22d0d-d7a3-498e-bdad-16c32a44d774', N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'', N'Jobs that get highest paid', 0, 0, CAST(N'2018-08-21 21:48:49.2428461' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1043, N'c6e22d0d-d7a3-498e-bdad-16c32a44d774', N'2b41e104-aae6-4a00-a0ba-847760647766', N'', N'Public Relation Specialist', 0, 0, CAST(N'2018-08-21 21:48:49.2428482' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1044, N'c6e22d0d-d7a3-498e-bdad-16c32a44d774', N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'', N'59.000$', 0, 0, CAST(N'2018-08-21 21:48:49.2428486' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1045, N'c6e22d0d-d7a3-498e-bdad-16c32a44d774', N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'The School Office', N'Medical Call Center', 0, 0, CAST(N'2018-08-21 21:48:49.2428490' AS DateTime2), N'admin', NULL, NULL)
GO
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1046, N'c6e22d0d-d7a3-498e-bdad-16c32a44d774', N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'Financial Manager', N'Financial Manager', 1, 0, CAST(N'2018-08-21 21:48:49.2428519' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1047, N'df12fc43-0794-44dc-b79b-31b6f00ab7b7', N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'Places to travel', N'Jobs that get highest paid', 0, 0, CAST(N'2018-08-21 21:50:39.7608859' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1048, N'df12fc43-0794-44dc-b79b-31b6f00ab7b7', N'2b41e104-aae6-4a00-a0ba-847760647766', N'Hotel Manager', N'Public Relation Specialist', 0, 0, CAST(N'2018-08-21 21:50:39.7608921' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1049, N'df12fc43-0794-44dc-b79b-31b6f00ab7b7', N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'29.000$', N'59.000$', 0, 0, CAST(N'2018-08-21 21:50:39.7608937' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1050, N'df12fc43-0794-44dc-b79b-31b6f00ab7b7', N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'Restaurant', N'Medical Call Center', 0, 0, CAST(N'2018-08-21 21:50:39.7608954' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1051, N'df12fc43-0794-44dc-b79b-31b6f00ab7b7', N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'Writer and Author', N'Financial Manager', 0, 0, CAST(N'2018-08-21 21:50:39.7608966' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1052, N'ec16f1fa-8659-427b-b965-40f89f09579c', N'96478619-72d4-4ccd-8658-785ad0d07c19', N'Changing life’s style', N'Place to start a new life', 0, 0, CAST(N'2018-08-22 10:09:28.8677640' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1053, N'ec16f1fa-8659-427b-b965-40f89f09579c', N'86780226-5ac6-4ea2-9780-5666073711ac', N'Singapore', N'HongKong', 0, 0, CAST(N'2018-08-22 10:09:28.8681007' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1054, N'ec16f1fa-8659-427b-b965-40f89f09579c', N'4d06cbff-22b4-443e-8182-ceb0c999cc8e', N'Bahamas', N'Bahamas', 1, 0, CAST(N'2018-08-22 10:09:28.8681030' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1055, N'ec16f1fa-8659-427b-b965-40f89f09579c', N'791fb977-8e9e-4a73-a66d-d4a33e8ee5a3', N'The crime rate is low compared to other places', N'Warm beautiful weather and people are very friendly. ', 0, 0, CAST(N'2018-08-22 10:09:28.8681107' AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1056, N'ec16f1fa-8659-427b-b965-40f89f09579c', N'ee27b26b-a232-4687-97f3-cceaed0c19c8', N'Monaco', N'Jamaica', 0, 0, CAST(N'2018-08-22 10:09:28.8681119' AS DateTime2), N'admin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Test.ExamQuestionDetail] OFF
SET IDENTITY_INSERT [dbo].[Test.ExamStructure] ON 

INSERT [dbo].[Test.ExamStructure] ([StructureId], [StructureName], [QuestionLineId], [VideoLineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (8, N'Dan giải thích lời thoại trong phim', N'5;6;7;8', 49, 0, CAST(N'2018-08-21 14:25:06.3370000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.ExamStructure] ([StructureId], [StructureName], [QuestionLineId], [VideoLineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (9, N'5 Reasons Why The Japanese Are So Polite', N'5;6;7;8;9', 75, 0, CAST(N'2018-08-21 14:25:16.8830000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.ExamStructure] ([StructureId], [StructureName], [QuestionLineId], [VideoLineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (10, N'10 Countries Where You Can Start A New Life', N'10;11;12;13;14', 76, 0, CAST(N'2018-08-21 14:26:09.5330000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.ExamStructure] ([StructureId], [StructureName], [QuestionLineId], [VideoLineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (11, N'10 Famous People Who Were Homeless', N'15;16;17;18;19', 77, 0, CAST(N'2018-08-21 14:26:39.3230000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.ExamStructure] ([StructureId], [StructureName], [QuestionLineId], [VideoLineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (12, N'10 Highest Paid Jobs You Can Do From Home', N'20;21;22;23;24', 78, 0, CAST(N'2018-08-21 14:27:08.6900000' AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Test.ExamStructure] OFF
SET IDENTITY_INSERT [dbo].[Test.Question] ON 

INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (16, N'486ae504-77bd-47d1-9d41-1d3f3f1a747e', N'What was Jewel’s job at that time?', N'Singer and songwriter', NULL, N'rMrZJEuyOCw', 2, 0, CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), N'admin', CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (5, N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'What is the main idea of the video?', N'The Japanese people', NULL, N'Jio_hWFv1q4&t=265s', 1, 0, CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), N'admin', CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (22, N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'What is the median salary of Post-Secondary Teacher?', N'59.000$', NULL, N'wTjCyjmhwo8', 3, 0, CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), N'admin', CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (24, N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'What is the 2nd highest paid jon on the list?', N'Financial Manager', NULL, N'wTjCyjmhwo8', 5, 0, CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), N'admin', CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (11, N'86780226-5ac6-4ea2-9780-5666073711ac', N'The 3rd country that is mentioned on the video is that', N'HongKong', NULL, N'-Blsz2JbdgM', 2, 0, CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), N'admin', CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (18, N'5aa813cf-f365-4263-b1c6-61b42e24173d', N'Where was Jennifer Lopez born?', N'Bronx', NULL, N'rMrZJEuyOCw', 4, 0, CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), N'admin', CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (20, N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'What is the main point of the video clip?', N'Jobs that get highest paid', NULL, N'wTjCyjmhwo8', 1, 0, CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), N'admin', CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (10, N'96478619-72d4-4ccd-8658-785ad0d07c19', N'What is the topic of the video?', N'Place to start a new life', NULL, N'-Blsz2JbdgM', 1, 0, CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), N'admin', CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (19, N'd88b709b-51d5-47dc-b30f-8230c4a129fe', N'Jim Carrey is known as?', N'One of the best-known comedians', NULL, N'rMrZJEuyOCw', 5, 0, CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), N'admin', CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (21, N'2b41e104-aae6-4a00-a0ba-847760647766', N'What is the 8th highest paid job?', N'Public Relation Specialist', NULL, N'wTjCyjmhwo8', 2, 0, CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), N'admin', CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (8, N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'The 3rd reason', N'Children’s upbringing and schooling', NULL, N'Jio_hWFv1q4&t=265s', 4, 0, CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), N'admin', CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (23, N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'Where else can Gisterd Nurse work beside a hospotal?', N'Medical Call Center', NULL, N'wTjCyjmhwo8', 4, 0, CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), N'admin', CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (17, N'f462318e-bd21-4c88-925e-c653a04c8765', N'What made Steve Job was so famous at that time?', N'Created many amazing technologies that have changed millions of lives', NULL, N'rMrZJEuyOCw', 3, 0, CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), N'admin', CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (14, N'ee27b26b-a232-4687-97f3-cceaed0c19c8', N'Which country has high crime rate compare to others?', N'Jamaica', NULL, N'-Blsz2JbdgM', 5, 0, CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), N'admin', CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (12, N'4d06cbff-22b4-443e-8182-ceb0c999cc8e', N'What is the country having no income tax?', N'Bahamas', NULL, N'-Blsz2JbdgM', 3, 0, CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), N'admin', CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (13, N'791fb977-8e9e-4a73-a66d-d4a33e8ee5a3', N'Why is Mexico worth to start a new life?', N'Warm beautiful weather and people are very friendly. ', NULL, N'-Blsz2JbdgM', 4, 0, CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), N'admin', CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (7, N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'The 2nd reason', N'Group culture and rules', NULL, N'Jio_hWFv1q4&t=265s', 3, 0, CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), N'admin', CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (9, N'0483578f-5007-4d2e-bd5d-f3466b165d89', N'The 4th reason', N'Treat everyone equally', NULL, N'hdZK22pR5nU', 5, 0, CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), N'admin', CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (6, N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'The 1st reason which shows that The Japanese are polite', N'The Japanese philosophy and religion ', NULL, N'Jio_hWFv1q4&t=265s', 2, 0, CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), N'admin', CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (15, N'a854feff-8781-4edb-a2fe-fe69a2272e4d', N'What is the video talking about?', N'10 famous people', NULL, N'rMrZJEuyOCw', 1, 0, CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), N'admin', CAST(N'2018-08-21 10:11:46.9100000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Test.Question] OFF
SET IDENTITY_INSERT [dbo].[Test.QuestionDetail] ON 

INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (17, N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'Crime', 1, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (18, N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'School', 2, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (19, N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'The Weather', 3, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (20, N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'The Japanese people', 4, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (21, N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'The Japanese philosophy and religion ', 1, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (22, N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'It has a biggest city in the world', 2, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (23, N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'There’re lots of famous school', 3, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (24, N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'People are very friendly', 4, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (25, N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'It has a high density of people', 1, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (26, N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'People are obedient', 2, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (27, N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'Group culture and rules', 3, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (28, N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'It has few foreigners among local people', 4, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (29, N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'It has similar cluture values', 1, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (30, N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'It’s defined as one culture one civilization', 2, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (31, N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'Children’s upbringing and schooling', 3, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (32, N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'They judge you negatively if you have worng behaviour', 4, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (33, N'0483578f-5007-4d2e-bd5d-f3466b165d89', N'They have been taught strictly from a young', 1, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (34, N'0483578f-5007-4d2e-bd5d-f3466b165d89', N'The japanese parents', 2, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (35, N'0483578f-5007-4d2e-bd5d-f3466b165d89', N'The Japanese school', 3, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (36, N'0483578f-5007-4d2e-bd5d-f3466b165d89', N'Treat everyone equally', 4, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (37, N'96478619-72d4-4ccd-8658-785ad0d07c19', N'Place to start a new life', 1, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (38, N'96478619-72d4-4ccd-8658-785ad0d07c19', N'Changing life’s style', 2, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (39, N'96478619-72d4-4ccd-8658-785ad0d07c19', N'Finding a new job', 3, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (40, N'96478619-72d4-4ccd-8658-785ad0d07c19', N'Traveling', 4, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (41, N'86780226-5ac6-4ea2-9780-5666073711ac', N'Singapore', 1, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (42, N'86780226-5ac6-4ea2-9780-5666073711ac', N'Mexico', 2, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (43, N'86780226-5ac6-4ea2-9780-5666073711ac', N'HongKong', 3, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (44, N'86780226-5ac6-4ea2-9780-5666073711ac', N'America', 4, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (45, N'4d06cbff-22b4-443e-8182-ceb0c999cc8e', N'United Arab', 1, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (46, N'4d06cbff-22b4-443e-8182-ceb0c999cc8e', N'Dubai', 2, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (47, N'4d06cbff-22b4-443e-8182-ceb0c999cc8e', N'Indonesia', 3, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (48, N'4d06cbff-22b4-443e-8182-ceb0c999cc8e', N'Bahamas', 4, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (49, N'791fb977-8e9e-4a73-a66d-d4a33e8ee5a3', N'Warm beautiful weather and people are very friendly', 1, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (50, N'791fb977-8e9e-4a73-a66d-d4a33e8ee5a3', N'The salary is much higher than the others', 2, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (51, N'791fb977-8e9e-4a73-a66d-d4a33e8ee5a3', N'The crime rate is low compared to other places', 3, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (52, N'791fb977-8e9e-4a73-a66d-d4a33e8ee5a3', N'Transport business is amazing', 4, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (53, N'ee27b26b-a232-4687-97f3-cceaed0c19c8', N'Bermuda', 1, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (54, N'ee27b26b-a232-4687-97f3-cceaed0c19c8', N'Jamaica', 2, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (55, N'ee27b26b-a232-4687-97f3-cceaed0c19c8', N'Monaco', 3, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (56, N'ee27b26b-a232-4687-97f3-cceaed0c19c8', N'Japan', 4, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (57, N'a854feff-8781-4edb-a2fe-fe69a2272e4d', N'Revolutional technologies', 1, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (58, N'a854feff-8781-4edb-a2fe-fe69a2272e4d', N'Steve Job', 2, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (59, N'a854feff-8781-4edb-a2fe-fe69a2272e4d', N'10 famous people', 3, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (60, N'a854feff-8781-4edb-a2fe-fe69a2272e4d', N'Homeless people', 4, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (61, N'486ae504-77bd-47d1-9d41-1d3f3f1a747e', N'Singer and songwriter', 1, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (62, N'486ae504-77bd-47d1-9d41-1d3f3f1a747e', N'Cashier', 2, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (63, N'486ae504-77bd-47d1-9d41-1d3f3f1a747e', N'Manager', 3, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (64, N'486ae504-77bd-47d1-9d41-1d3f3f1a747e', N'Actress', 4, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (65, N'f462318e-bd21-4c88-925e-c653a04c8765', N'Droped University to follow his dream', 1, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (66, N'f462318e-bd21-4c88-925e-c653a04c8765', N'CEO of the Apple Cop', 2, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (67, N'f462318e-bd21-4c88-925e-c653a04c8765', N'Created many amazing technologies that have changed millions of lives', 3, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (68, N'f462318e-bd21-4c88-925e-c653a04c8765', N'Made millions of dolars', 4, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (69, N'5aa813cf-f365-4263-b1c6-61b42e24173d', N'California', 1, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (70, N'5aa813cf-f365-4263-b1c6-61b42e24173d', N'Bronx', 2, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (71, N'5aa813cf-f365-4263-b1c6-61b42e24173d', N'Texas', 3, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (72, N'5aa813cf-f365-4263-b1c6-61b42e24173d', N'Mexico', 4, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (73, N'd88b709b-51d5-47dc-b30f-8230c4a129fe', N'One of the best-known comedians', 1, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (74, N'd88b709b-51d5-47dc-b30f-8230c4a129fe', N'The brilliant director', 2, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (75, N'd88b709b-51d5-47dc-b30f-8230c4a129fe', N'The best seller', 3, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (76, N'd88b709b-51d5-47dc-b30f-8230c4a129fe', N'A good doctor', 4, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (77, N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'Places to travel', 1, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (78, N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'Jobs that get highest paid', 2, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (79, N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'How to make a lot of money', 3, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (80, N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'How to build a brand', 4, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (81, N'2b41e104-aae6-4a00-a0ba-847760647766', N'Public Relation Specialist', 1, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (82, N'2b41e104-aae6-4a00-a0ba-847760647766', N'Public Speaking', 2, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (83, N'2b41e104-aae6-4a00-a0ba-847760647766', N'Hotel Manager', 3, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (84, N'2b41e104-aae6-4a00-a0ba-847760647766', N'CEO', 4, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (85, N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'20.000$', 1, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (86, N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'29.000$', 2, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (87, N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'59.000$', 3, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (88, N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'50.000$', 4, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (89, N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'Restaurant', 1, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (90, N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'Medical Call Center', 2, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (91, N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'The School Office', 3, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (92, N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'University', 4, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (93, N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'Tax Preparer', 1, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (94, N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'Graphic Designer', 2, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (95, N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'Writer and Author', 3, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (96, N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'Financial Manager', 4, 0, CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), N'admin', CAST(N'2018-08-21 13:58:21.9800000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Test.QuestionDetail] OFF
SET IDENTITY_INSERT [HangFire].[AggregatedCounter] ON 

INSERT [HangFire].[AggregatedCounter] ([Id], [Key], [Value], [ExpireAt]) VALUES (1, N'stats:succeeded', 28, NULL)
INSERT [HangFire].[AggregatedCounter] ([Id], [Key], [Value], [ExpireAt]) VALUES (2, N'stats:succeeded:2018-10-11', 12, CAST(N'2018-11-11 11:06:30.730' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Id], [Key], [Value], [ExpireAt]) VALUES (3, N'stats:succeeded:2018-10-11-10', 9, CAST(N'2018-10-12 10:59:19.150' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Id], [Key], [Value], [ExpireAt]) VALUES (4, N'stats:succeeded:2018-10-11-11', 3, CAST(N'2018-10-12 11:06:30.730' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Id], [Key], [Value], [ExpireAt]) VALUES (5, N'stats:succeeded:2018-10-12', 16, CAST(N'2018-11-12 06:35:46.340' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Id], [Key], [Value], [ExpireAt]) VALUES (6, N'stats:succeeded:2018-10-12-03', 3, CAST(N'2018-10-13 03:58:26.273' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Id], [Key], [Value], [ExpireAt]) VALUES (7, N'stats:succeeded:2018-10-12-04', 6, CAST(N'2018-10-13 04:18:36.987' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Id], [Key], [Value], [ExpireAt]) VALUES (8, N'stats:succeeded:2018-10-12-06', 7, CAST(N'2018-10-13 06:35:46.340' AS DateTime))
SET IDENTITY_INSERT [HangFire].[AggregatedCounter] OFF
SET IDENTITY_INSERT [HangFire].[Job] ON 

INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (1, 4, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"Reliable!\\\"\"]"}', N'["\"Reliable!\""]', CAST(N'2018-10-11 10:16:22.387' AS DateTime), CAST(N'2018-10-12 10:16:39.313' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (2, 8, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"Simple!\\\"\"]"}', N'["\"Simple!\""]', CAST(N'2018-10-11 10:17:57.897' AS DateTime), CAST(N'2018-10-12 10:17:58.907' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (3, 11, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"Reliable!\\\"\"]"}', N'["\"Reliable!\""]', CAST(N'2018-10-11 10:17:58.450' AS DateTime), CAST(N'2018-10-12 10:18:13.827' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (4, 15, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"Reliable!\\\"\"]"}', N'["\"Reliable!\""]', CAST(N'2018-10-11 10:28:14.760' AS DateTime), CAST(N'2018-10-12 10:30:16.210' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (5, 19, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"Reliable!\\\"\"]"}', N'["\"Reliable!\""]', CAST(N'2018-10-11 10:33:30.670' AS DateTime), CAST(N'2018-10-12 10:33:46.303' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (6, 23, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"Reliable!\\\"\"]"}', N'["\"Reliable!\""]', CAST(N'2018-10-11 10:40:56.950' AS DateTime), CAST(N'2018-10-12 10:41:13.873' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (7, 30, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"Reliable!\\\"\"]"}', N'["\"Reliable!\""]', CAST(N'2018-10-11 10:58:16.437' AS DateTime), CAST(N'2018-10-12 10:58:33.733' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (8, 31, N'Succeeded', N'{"Type":"System.Diagnostics.Debug, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"Scheduled Job completed successfully!\\\"\"]"}', N'["\"Scheduled Job completed successfully!\""]', CAST(N'2018-10-11 10:58:18.407' AS DateTime), CAST(N'2018-10-12 10:58:33.733' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (9, 35, N'Succeeded', N'{"Type":"System.Diagnostics.Debug, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"Scheduled Job completed successfully!\\\"\"]"}', N'["\"Scheduled Job completed successfully!\""]', CAST(N'2018-10-11 10:59:08.883' AS DateTime), CAST(N'2018-10-12 10:59:19.197' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10, 43, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"Reliable!\\\"\"]"}', N'["\"Reliable!\""]', CAST(N'2018-10-11 11:02:42.097' AS DateTime), CAST(N'2018-10-12 11:02:59.540' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (11, 42, N'Succeeded', N'{"Type":"System.Diagnostics.Debug, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"Scheduled Job completed successfully!\\\"\"]"}', N'["\"Scheduled Job completed successfully!\""]', CAST(N'2018-10-11 11:02:44.347' AS DateTime), CAST(N'2018-10-12 11:02:59.540' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (12, 47, N'Succeeded', N'{"Type":"System.Diagnostics.Debug, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"Scheduled Job completed successfully!\\\"\"]"}', N'["\"Scheduled Job completed successfully!\""]', CAST(N'2018-10-11 11:06:20.973' AS DateTime), CAST(N'2018-10-12 11:06:30.743' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (13, 51, N'Succeeded', N'{"Type":"System.Diagnostics.Debug, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"Scheduled Job completed successfully!\\\"\"]"}', N'["\"Scheduled Job completed successfully!\""]', CAST(N'2018-10-12 03:40:28.333' AS DateTime), CAST(N'2018-10-13 03:40:42.887' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (14, 55, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"OK------------------->OK!\\\"\"]"}', N'["\"OK------------------->OK!\""]', CAST(N'2018-10-12 03:50:18.327' AS DateTime), CAST(N'2018-10-13 03:51:05.953' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (15, 59, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"OK------------------->OK!\\\"\"]"}', N'["\"OK------------------->OK!\""]', CAST(N'2018-10-12 03:58:09.323' AS DateTime), CAST(N'2018-10-13 03:58:26.300' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (16, 63, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"OK------------------->OK!\\\"\"]"}', N'["\"OK------------------->OK!\""]', CAST(N'2018-10-12 04:00:30.830' AS DateTime), CAST(N'2018-10-13 04:00:47.937' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (17, 67, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"Simple!-->11:02 AM\\\"\"]"}', N'["\"Simple!-->11:02 AM\""]', CAST(N'2018-10-12 04:02:39.710' AS DateTime), CAST(N'2018-10-13 04:02:41.567' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (18, 70, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"OK------------------->OK!\\\"\"]"}', N'["\"OK------------------->OK!\""]', CAST(N'2018-10-12 04:02:41.087' AS DateTime), CAST(N'2018-10-13 04:02:56.663' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (19, 74, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"Simple!-->11:18:19 AM\\\"\"]"}', N'["\"Simple!-->11:18:19 AM\""]', CAST(N'2018-10-12 04:18:19.670' AS DateTime), CAST(N'2018-10-13 04:18:21.513' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (20, 80, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"OK------------------->11:18:21 AM\\\"\"]"}', N'["\"OK------------------->11:18:21 AM\""]', CAST(N'2018-10-12 04:18:21.073' AS DateTime), CAST(N'2018-10-13 04:18:36.653' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (21, 81, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"Get------------------->11:18:23 AM\\\"\"]"}', N'["\"Get------------------->11:18:23 AM\""]', CAST(N'2018-10-12 04:18:23.483' AS DateTime), CAST(N'2018-10-13 04:18:37.003' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (22, 85, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"Simple!-->1:23:53 PM\\\"\"]"}', N'["\"Simple!-->1:23:53 PM\""]', CAST(N'2018-10-12 06:23:53.870' AS DateTime), CAST(N'2018-10-13 06:23:55.687' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (23, 91, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"OK------------------->1:23:55 PM\\\"\"]"}', N'["\"OK------------------->1:23:55 PM\""]', CAST(N'2018-10-12 06:23:55.230' AS DateTime), CAST(N'2018-10-13 06:24:11.473' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (24, 92, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"Get------------------->1:23:58 PM\\\"\"]"}', N'["\"Get------------------->1:23:58 PM\""]', CAST(N'2018-10-12 06:23:58.257' AS DateTime), CAST(N'2018-10-13 06:24:11.477' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (25, 96, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"Simple!-->1:26:12 PM\\\"\"]"}', N'["\"Simple!-->1:26:12 PM\""]', CAST(N'2018-10-12 06:26:12.080' AS DateTime), CAST(N'2018-10-13 06:26:13.797' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (26, 99, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"OK------------------->1:26:13 PM\\\"\"]"}', N'["\"OK------------------->1:26:13 PM\""]', CAST(N'2018-10-12 06:26:13.367' AS DateTime), CAST(N'2018-10-13 06:26:28.870' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (27, 103, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"Simple!-->1:35:24 PM\\\"\"]"}', N'["\"Simple!-->1:35:24 PM\""]', CAST(N'2018-10-12 06:35:24.170' AS DateTime), CAST(N'2018-10-13 06:35:25.893' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (28, 106, N'Succeeded', N'{"Type":"System.Console, System.Console, Version=4.1.1.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","Method":"WriteLine","ParameterTypes":"[\"System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[\"\\\"OK------------------->1:35:25 PM\\\"\"]"}', N'["\"OK------------------->1:35:25 PM\""]', CAST(N'2018-10-12 06:35:25.460' AS DateTime), CAST(N'2018-10-13 06:35:46.367' AS DateTime))
SET IDENTITY_INSERT [HangFire].[Job] OFF
SET IDENTITY_INSERT [HangFire].[JobParameter] ON 

INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (1, 1, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (2, 1, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (3, 2, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (4, 2, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (5, 3, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (6, 3, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (7, 4, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (8, 4, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (9, 5, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (10, 5, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (11, 6, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (12, 6, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (13, 7, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (14, 7, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (15, 8, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (16, 8, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (17, 9, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (18, 9, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (19, 10, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (20, 10, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (21, 11, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (22, 11, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (23, 12, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (24, 12, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (25, 13, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (26, 13, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (27, 14, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (28, 14, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (29, 15, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (30, 15, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (31, 16, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (32, 16, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (33, 17, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (34, 17, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (35, 18, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (36, 18, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (37, 19, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (38, 19, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (39, 20, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (40, 20, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (41, 21, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (42, 21, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (43, 22, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (44, 22, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (45, 23, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (46, 23, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (47, 24, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (48, 24, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (49, 25, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (50, 25, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (51, 26, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (52, 26, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (53, 27, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (54, 27, N'CurrentUICulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (55, 28, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (56, 28, N'CurrentUICulture', N'"en-US"')
SET IDENTITY_INSERT [HangFire].[JobParameter] OFF
INSERT [HangFire].[Schema] ([Version]) VALUES (5)
SET IDENTITY_INSERT [HangFire].[State] ON 

INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (1, 1, N'Scheduled', NULL, CAST(N'2018-10-11 10:16:23.633' AS DateTime), N'{"EnqueueAt":"2018-10-11T10:16:24.3204733Z","ScheduledAt":"2018-10-11T10:16:22.3204736Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (2, 1, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-11 10:16:38.843' AS DateTime), N'{"EnqueuedAt":"2018-10-11T10:16:38.7865490Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (3, 1, N'Processing', NULL, CAST(N'2018-10-11 10:16:39.117' AS DateTime), N'{"StartedAt":"2018-10-11T10:16:39.0649813Z","ServerId":"csssc1pcl01150:4ebe91b9-9053-44f9-99fe-23daf3be3766","WorkerId":"90fee14f-cd8a-4135-a100-99c144d58b75"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4, 1, N'Succeeded', NULL, CAST(N'2018-10-11 10:16:39.313' AS DateTime), N'{"SucceededAt":"2018-10-11T10:16:39.2524297Z","PerformanceDuration":"49","Latency":"16815"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (5, 2, N'Enqueued', NULL, CAST(N'2018-10-11 10:17:58.323' AS DateTime), N'{"EnqueuedAt":"2018-10-11T10:17:57.0525580Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (6, 3, N'Scheduled', NULL, CAST(N'2018-10-11 10:17:58.513' AS DateTime), N'{"EnqueueAt":"2018-10-11T10:18:00.4493814Z","ScheduledAt":"2018-10-11T10:17:58.4493814Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (7, 2, N'Processing', NULL, CAST(N'2018-10-11 10:17:58.677' AS DateTime), N'{"StartedAt":"2018-10-11T10:17:58.5135440Z","ServerId":"csssc1pcl01150:1c2c9e74-f345-4701-ac93-b5d728ca2407","WorkerId":"e69150d1-3c9b-4608-9def-4ad05fb9d682"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (8, 2, N'Succeeded', NULL, CAST(N'2018-10-11 10:17:58.903' AS DateTime), N'{"SucceededAt":"2018-10-11T10:17:58.8400916Z","PerformanceDuration":"75","Latency":"867"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (9, 3, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-11 10:18:13.360' AS DateTime), N'{"EnqueuedAt":"2018-10-11T10:18:13.3225615Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10, 3, N'Processing', NULL, CAST(N'2018-10-11 10:18:13.623' AS DateTime), N'{"StartedAt":"2018-10-11T10:18:13.5551265Z","ServerId":"csssc1pcl01150:1c2c9e74-f345-4701-ac93-b5d728ca2407","WorkerId":"e69150d1-3c9b-4608-9def-4ad05fb9d682"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (11, 3, N'Succeeded', NULL, CAST(N'2018-10-11 10:18:13.827' AS DateTime), N'{"SucceededAt":"2018-10-11T10:18:13.7713196Z","PerformanceDuration":"42","Latency":"15278"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (12, 4, N'Scheduled', NULL, CAST(N'2018-10-11 10:28:15.177' AS DateTime), N'{"EnqueueAt":"2018-10-11T10:30:13.9148759Z","ScheduledAt":"2018-10-11T10:28:13.9148759Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (13, 4, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-11 10:30:15.750' AS DateTime), N'{"EnqueuedAt":"2018-10-11T10:30:15.6963798Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (14, 4, N'Processing', NULL, CAST(N'2018-10-11 10:30:16.007' AS DateTime), N'{"StartedAt":"2018-10-11T10:30:15.9723231Z","ServerId":"csssc1pcl01150:71350d98-fd91-47e2-b58c-79ec528ca4fe","WorkerId":"d6477847-93cb-4d3d-99bb-80e8757d16cd"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (15, 4, N'Succeeded', NULL, CAST(N'2018-10-11 10:30:16.207' AS DateTime), N'{"SucceededAt":"2018-10-11T10:30:16.1500315Z","PerformanceDuration":"48","Latency":"121341"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (16, 5, N'Scheduled', NULL, CAST(N'2018-10-11 10:33:30.897' AS DateTime), N'{"EnqueueAt":"2018-10-11T10:33:31.5748225Z","ScheduledAt":"2018-10-11T10:33:29.5748225Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (17, 5, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-11 10:33:45.837' AS DateTime), N'{"EnqueuedAt":"2018-10-11T10:33:45.7835029Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (18, 5, N'Processing', NULL, CAST(N'2018-10-11 10:33:46.097' AS DateTime), N'{"StartedAt":"2018-10-11T10:33:46.0366498Z","ServerId":"csssc1pcl01150:bd6f398c-6242-4e51-9ca8-c8d689d6b9f9","WorkerId":"9910d17b-69d6-43a8-a93e-9e08b88e73a1"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (19, 5, N'Succeeded', NULL, CAST(N'2018-10-11 10:33:46.300' AS DateTime), N'{"SucceededAt":"2018-10-11T10:33:46.2426064Z","PerformanceDuration":"56","Latency":"15516"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (20, 6, N'Scheduled', NULL, CAST(N'2018-10-11 10:40:58.113' AS DateTime), N'{"EnqueueAt":"2018-10-11T10:40:58.8877034Z","ScheduledAt":"2018-10-11T10:40:56.8877037Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (21, 6, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-11 10:41:13.390' AS DateTime), N'{"EnqueuedAt":"2018-10-11T10:41:13.3334415Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (22, 6, N'Processing', NULL, CAST(N'2018-10-11 10:41:13.670' AS DateTime), N'{"StartedAt":"2018-10-11T10:41:13.6093011Z","ServerId":"csssc1pcl01150:e84d5306-e4fd-4e01-b06a-053c7c5ceddb","WorkerId":"12123473-a213-4747-b3ad-ea228cc5db21"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23, 6, N'Succeeded', NULL, CAST(N'2018-10-11 10:41:13.870' AS DateTime), N'{"SucceededAt":"2018-10-11T10:41:13.8098892Z","PerformanceDuration":"50","Latency":"16809"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24, 7, N'Scheduled', NULL, CAST(N'2018-10-11 10:58:17.360' AS DateTime), N'{"EnqueueAt":"2018-10-11T10:58:18.3737021Z","ScheduledAt":"2018-10-11T10:58:16.3737021Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (25, 8, N'Scheduled', NULL, CAST(N'2018-10-11 10:58:18.487' AS DateTime), N'{"EnqueueAt":"2018-10-11T10:58:20.4065925Z","ScheduledAt":"2018-10-11T10:58:18.4065925Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (26, 7, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-11 10:58:32.850' AS DateTime), N'{"EnqueuedAt":"2018-10-11T10:58:32.7265151Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (27, 7, N'Processing', NULL, CAST(N'2018-10-11 10:58:33.170' AS DateTime), N'{"StartedAt":"2018-10-11T10:58:33.0525165Z","ServerId":"csssc1pcl01150:75c4bec0-1211-4bac-8711-528bbdc64150","WorkerId":"87bc8f1e-386d-4fbe-9b0a-884849476d10"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (28, 8, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-11 10:58:33.120' AS DateTime), N'{"EnqueuedAt":"2018-10-11T10:58:33.0514828Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (29, 8, N'Processing', NULL, CAST(N'2018-10-11 10:58:33.447' AS DateTime), N'{"StartedAt":"2018-10-11T10:58:33.3550035Z","ServerId":"csssc1pcl01150:75c4bec0-1211-4bac-8711-528bbdc64150","WorkerId":"140a80b0-c23a-4d23-a0d3-53df643f659a"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (30, 7, N'Succeeded', NULL, CAST(N'2018-10-11 10:58:33.730' AS DateTime), N'{"SucceededAt":"2018-10-11T10:58:33.6043311Z","PerformanceDuration":"187","Latency":"16979"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (31, 8, N'Succeeded', NULL, CAST(N'2018-10-11 10:58:33.730' AS DateTime), N'{"SucceededAt":"2018-10-11T10:58:33.6043311Z","PerformanceDuration":"72","Latency":"15125"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (32, 9, N'Scheduled', NULL, CAST(N'2018-10-11 10:59:08.970' AS DateTime), N'{"EnqueueAt":"2018-10-11T10:59:10.8826250Z","ScheduledAt":"2018-10-11T10:59:08.8826250Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33, 9, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-11 10:59:18.653' AS DateTime), N'{"EnqueuedAt":"2018-10-11T10:59:18.6174644Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (34, 9, N'Processing', NULL, CAST(N'2018-10-11 10:59:18.900' AS DateTime), N'{"StartedAt":"2018-10-11T10:59:18.8382944Z","ServerId":"csssc1pcl01150:75c4bec0-1211-4bac-8711-528bbdc64150","WorkerId":"87bc8f1e-386d-4fbe-9b0a-884849476d10"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (35, 9, N'Succeeded', NULL, CAST(N'2018-10-11 10:59:19.197' AS DateTime), N'{"SucceededAt":"2018-10-11T10:59:19.0715289Z","PerformanceDuration":"72","Latency":"10115"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (36, 10, N'Scheduled', NULL, CAST(N'2018-10-11 11:02:43.383' AS DateTime), N'{"EnqueueAt":"2018-10-11T11:02:44.0027695Z","ScheduledAt":"2018-10-11T11:02:42.0027695Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (37, 11, N'Scheduled', NULL, CAST(N'2018-10-11 11:02:44.433' AS DateTime), N'{"EnqueueAt":"2018-10-11T11:02:49.3460704Z","ScheduledAt":"2018-10-11T11:02:44.3460708Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (38, 10, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-11 11:02:58.647' AS DateTime), N'{"EnqueuedAt":"2018-10-11T11:02:58.5896658Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (39, 10, N'Processing', NULL, CAST(N'2018-10-11 11:02:58.960' AS DateTime), N'{"StartedAt":"2018-10-11T11:02:58.8594351Z","ServerId":"csssc1pcl01150:3e81bc3d-94af-496d-a1d7-a143871d61d2","WorkerId":"d0406b6c-0415-4cac-a642-11d1673907b0"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (40, 11, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-11 11:02:58.940' AS DateTime), N'{"EnqueuedAt":"2018-10-11T11:02:58.8600164Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (41, 11, N'Processing', NULL, CAST(N'2018-10-11 11:02:59.263' AS DateTime), N'{"StartedAt":"2018-10-11T11:02:59.1981642Z","ServerId":"csssc1pcl01150:3e81bc3d-94af-496d-a1d7-a143871d61d2","WorkerId":"59f3ae8b-8774-4ead-9442-14408dfce5f0"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (42, 11, N'Succeeded', NULL, CAST(N'2018-10-11 11:02:59.537' AS DateTime), N'{"SucceededAt":"2018-10-11T11:02:59.4419138Z","PerformanceDuration":"53","Latency":"15041"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (43, 10, N'Succeeded', NULL, CAST(N'2018-10-11 11:02:59.537' AS DateTime), N'{"SucceededAt":"2018-10-11T11:02:59.4419131Z","PerformanceDuration":"243","Latency":"17101"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (44, 12, N'Scheduled', NULL, CAST(N'2018-10-11 11:06:21.063' AS DateTime), N'{"EnqueueAt":"2018-10-11T11:06:25.9727178Z","ScheduledAt":"2018-10-11T11:06:20.9727182Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (45, 12, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-11 11:06:30.240' AS DateTime), N'{"EnqueuedAt":"2018-10-11T11:06:30.2040414Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (46, 12, N'Processing', NULL, CAST(N'2018-10-11 11:06:30.577' AS DateTime), N'{"StartedAt":"2018-10-11T11:06:30.4355361Z","ServerId":"csssc1pcl01150:3e81bc3d-94af-496d-a1d7-a143871d61d2","WorkerId":"d0406b6c-0415-4cac-a642-11d1673907b0"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (47, 12, N'Succeeded', NULL, CAST(N'2018-10-11 11:06:30.743' AS DateTime), N'{"SucceededAt":"2018-10-11T11:06:30.6971281Z","PerformanceDuration":"36","Latency":"9687"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (48, 13, N'Scheduled', NULL, CAST(N'2018-10-12 03:40:28.480' AS DateTime), N'{"EnqueueAt":"2018-10-12T03:40:33.3089792Z","ScheduledAt":"2018-10-12T03:40:28.3089795Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (49, 13, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-12 03:40:42.393' AS DateTime), N'{"EnqueuedAt":"2018-10-12T03:40:42.3350956Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (50, 13, N'Processing', NULL, CAST(N'2018-10-12 03:40:42.690' AS DateTime), N'{"StartedAt":"2018-10-12T03:40:42.6402185Z","ServerId":"csssc1pcl01150:e197c254-90f0-48da-b155-7a82b5806630","WorkerId":"e33be408-9d53-4b39-a423-cc48ba299f98"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (51, 13, N'Succeeded', NULL, CAST(N'2018-10-12 03:40:42.883' AS DateTime), N'{"SucceededAt":"2018-10-12T03:40:42.8292366Z","PerformanceDuration":"50","Latency":"14445"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (52, 14, N'Scheduled', NULL, CAST(N'2018-10-12 03:50:19.570' AS DateTime), N'{"EnqueueAt":"2018-10-12T03:50:23.2652623Z","ScheduledAt":"2018-10-12T03:50:18.2652626Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (53, 14, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-12 03:51:05.417' AS DateTime), N'{"EnqueuedAt":"2018-10-12T03:51:05.3515822Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (54, 14, N'Processing', NULL, CAST(N'2018-10-12 03:51:05.723' AS DateTime), N'{"StartedAt":"2018-10-12T03:51:05.6456402Z","ServerId":"csssc1pcl01150:89b46294-da0a-4046-820b-16e038aff541","WorkerId":"a6b3266e-a72c-4b1a-84d8-7870b313ebc9"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (55, 14, N'Succeeded', NULL, CAST(N'2018-10-12 03:51:05.950' AS DateTime), N'{"SucceededAt":"2018-10-12T03:51:05.8919189Z","PerformanceDuration":"66","Latency":"47498"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (56, 15, N'Scheduled', NULL, CAST(N'2018-10-12 03:58:10.470' AS DateTime), N'{"EnqueueAt":"2018-10-12T03:58:14.2662015Z","ScheduledAt":"2018-10-12T03:58:09.2662018Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (57, 15, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-12 03:58:25.830' AS DateTime), N'{"EnqueuedAt":"2018-10-12T03:58:25.7293155Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (58, 15, N'Processing', NULL, CAST(N'2018-10-12 03:58:26.093' AS DateTime), N'{"StartedAt":"2018-10-12T03:58:26.0417947Z","ServerId":"csssc1pcl01150:a86c8308-b5ce-4737-a3dd-e66dfc8530d2","WorkerId":"3c936c61-b449-4e9d-a7fc-e4615673bb2a"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (59, 15, N'Succeeded', NULL, CAST(N'2018-10-12 03:58:26.297' AS DateTime), N'{"SucceededAt":"2018-10-12T03:58:26.2371141Z","PerformanceDuration":"48","Latency":"16865"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (60, 16, N'Scheduled', NULL, CAST(N'2018-10-12 04:00:32.063' AS DateTime), N'{"EnqueueAt":"2018-10-12T04:00:35.7575763Z","ScheduledAt":"2018-10-12T04:00:30.7575763Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (61, 16, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-12 04:00:47.470' AS DateTime), N'{"EnqueuedAt":"2018-10-12T04:00:47.4135641Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (62, 16, N'Processing', NULL, CAST(N'2018-10-12 04:00:47.733' AS DateTime), N'{"StartedAt":"2018-10-12T04:00:47.6680442Z","ServerId":"csssc1pcl01150:0b618004-c2cd-425f-ba3f-6f1a0aee4b6d","WorkerId":"ff586cde-ab93-4c8e-8824-e54c0258ad50"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (63, 16, N'Succeeded', NULL, CAST(N'2018-10-12 04:00:47.933' AS DateTime), N'{"SucceededAt":"2018-10-12T04:00:47.8745734Z","PerformanceDuration":"49","Latency":"16995"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (64, 17, N'Enqueued', NULL, CAST(N'2018-10-12 04:02:40.957' AS DateTime), N'{"EnqueuedAt":"2018-10-12T04:02:39.6314597Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (65, 18, N'Scheduled', NULL, CAST(N'2018-10-12 04:02:41.170' AS DateTime), N'{"EnqueueAt":"2018-10-12T04:02:46.0855482Z","ScheduledAt":"2018-10-12T04:02:41.0855482Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (66, 17, N'Processing', NULL, CAST(N'2018-10-12 04:02:41.350' AS DateTime), N'{"StartedAt":"2018-10-12T04:02:41.1705293Z","ServerId":"csssc1pcl01150:5cf60429-945d-4ce9-aaec-3c08d7e05c74","WorkerId":"8e1bce89-489c-422e-913d-91afbbe3effd"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (67, 17, N'Succeeded', NULL, CAST(N'2018-10-12 04:02:41.563' AS DateTime), N'{"SucceededAt":"2018-10-12T04:02:41.5053836Z","PerformanceDuration":"54","Latency":"1740"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (68, 18, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-12 04:02:56.237' AS DateTime), N'{"EnqueuedAt":"2018-10-12T04:02:56.2008271Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (69, 18, N'Processing', NULL, CAST(N'2018-10-12 04:02:56.473' AS DateTime), N'{"StartedAt":"2018-10-12T04:02:56.4121142Z","ServerId":"csssc1pcl01150:5cf60429-945d-4ce9-aaec-3c08d7e05c74","WorkerId":"8e1bce89-489c-422e-913d-91afbbe3effd"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (70, 18, N'Succeeded', NULL, CAST(N'2018-10-12 04:02:56.663' AS DateTime), N'{"SucceededAt":"2018-10-12T04:02:56.6129426Z","PerformanceDuration":"35","Latency":"15490"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (71, 19, N'Enqueued', NULL, CAST(N'2018-10-12 04:18:20.813' AS DateTime), N'{"EnqueuedAt":"2018-10-12T04:18:19.5941727Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (72, 20, N'Scheduled', NULL, CAST(N'2018-10-12 04:18:21.133' AS DateTime), N'{"EnqueueAt":"2018-10-12T04:18:26.0687748Z","ScheduledAt":"2018-10-12T04:18:21.0687751Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (73, 19, N'Processing', NULL, CAST(N'2018-10-12 04:18:21.287' AS DateTime), N'{"StartedAt":"2018-10-12T04:18:21.0938628Z","ServerId":"csssc1pcl01150:8bb0e319-70a0-42a2-b223-7352686b965e","WorkerId":"5b970732-0c0c-4436-aba8-b84ab5a1b563"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (74, 19, N'Succeeded', NULL, CAST(N'2018-10-12 04:18:21.510' AS DateTime), N'{"SucceededAt":"2018-10-12T04:18:21.4359309Z","PerformanceDuration":"55","Latency":"1710"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (75, 21, N'Scheduled', NULL, CAST(N'2018-10-12 04:18:23.573' AS DateTime), N'{"EnqueueAt":"2018-10-12T04:18:28.4836826Z","ScheduledAt":"2018-10-12T04:18:23.4836826Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (76, 20, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-12 04:18:36.047' AS DateTime), N'{"EnqueuedAt":"2018-10-12T04:18:35.7768287Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (77, 20, N'Processing', NULL, CAST(N'2018-10-12 04:18:36.280' AS DateTime), N'{"StartedAt":"2018-10-12T04:18:36.2186452Z","ServerId":"csssc1pcl01150:8bb0e319-70a0-42a2-b223-7352686b965e","WorkerId":"5b970732-0c0c-4436-aba8-b84ab5a1b563"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (78, 21, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-12 04:18:36.350' AS DateTime), N'{"EnqueuedAt":"2018-10-12T04:18:36.2810731Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (79, 21, N'Processing', NULL, CAST(N'2018-10-12 04:18:36.747' AS DateTime), N'{"StartedAt":"2018-10-12T04:18:36.6226067Z","ServerId":"csssc1pcl01150:8bb0e319-70a0-42a2-b223-7352686b965e","WorkerId":"ecc4f921-f019-4b14-8d7e-14e14486555f"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (80, 20, N'Succeeded', NULL, CAST(N'2018-10-12 04:18:36.653' AS DateTime), N'{"SucceededAt":"2018-10-12T04:18:36.5086334Z","PerformanceDuration":"67","Latency":"15368"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (81, 21, N'Succeeded', NULL, CAST(N'2018-10-12 04:18:37.003' AS DateTime), N'{"SucceededAt":"2018-10-12T04:18:36.9517048Z","PerformanceDuration":"52","Latency":"13416"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (82, 22, N'Enqueued', NULL, CAST(N'2018-10-12 06:23:55.027' AS DateTime), N'{"EnqueuedAt":"2018-10-12T06:23:53.7913357Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (83, 23, N'Scheduled', NULL, CAST(N'2018-10-12 06:23:55.293' AS DateTime), N'{"EnqueueAt":"2018-10-12T06:24:00.2264662Z","ScheduledAt":"2018-10-12T06:23:55.2264662Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (84, 22, N'Processing', NULL, CAST(N'2018-10-12 06:23:55.453' AS DateTime), N'{"StartedAt":"2018-10-12T06:23:55.2707174Z","ServerId":"csssc1pcl01150:545b3075-f5ca-4c7d-838a-baa9f5a1c014","WorkerId":"dbcc1185-2c44-426a-9428-0fd027251c78"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (85, 22, N'Succeeded', NULL, CAST(N'2018-10-12 06:23:55.673' AS DateTime), N'{"SucceededAt":"2018-10-12T06:23:55.6179064Z","PerformanceDuration":"60","Latency":"1687"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (86, 24, N'Scheduled', NULL, CAST(N'2018-10-12 06:23:58.383' AS DateTime), N'{"EnqueueAt":"2018-10-12T06:24:03.2561084Z","ScheduledAt":"2018-10-12T06:23:58.2561087Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (87, 23, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-12 06:24:10.047' AS DateTime), N'{"EnqueuedAt":"2018-10-12T06:24:10.0094080Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (88, 23, N'Processing', NULL, CAST(N'2018-10-12 06:24:10.533' AS DateTime), N'{"StartedAt":"2018-10-12T06:24:10.4700738Z","ServerId":"csssc1pcl01150:545b3075-f5ca-4c7d-838a-baa9f5a1c014","WorkerId":"dbcc1185-2c44-426a-9428-0fd027251c78"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (89, 24, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-12 06:24:10.597' AS DateTime), N'{"EnqueuedAt":"2018-10-12T06:24:10.5332958Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (90, 24, N'Processing', NULL, CAST(N'2018-10-12 06:24:10.887' AS DateTime), N'{"StartedAt":"2018-10-12T06:24:10.8245891Z","ServerId":"csssc1pcl01150:545b3075-f5ca-4c7d-838a-baa9f5a1c014","WorkerId":"2af47f47-6474-41f3-ae68-94a599902930"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (91, 23, N'Succeeded', NULL, CAST(N'2018-10-12 06:24:11.473' AS DateTime), N'{"SucceededAt":"2018-10-12T06:24:11.3784053Z","PerformanceDuration":"694","Latency":"15453"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (92, 24, N'Succeeded', NULL, CAST(N'2018-10-12 06:24:11.477' AS DateTime), N'{"SucceededAt":"2018-10-12T06:24:11.3785945Z","PerformanceDuration":"392","Latency":"12728"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (93, 25, N'Enqueued', NULL, CAST(N'2018-10-12 06:26:13.160' AS DateTime), N'{"EnqueuedAt":"2018-10-12T06:26:12.0063955Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (94, 26, N'Scheduled', NULL, CAST(N'2018-10-12 06:26:13.430' AS DateTime), N'{"EnqueueAt":"2018-10-12T06:26:18.3623756Z","ScheduledAt":"2018-10-12T06:26:13.3623756Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (95, 25, N'Processing', NULL, CAST(N'2018-10-12 06:26:13.580' AS DateTime), N'{"StartedAt":"2018-10-12T06:26:13.3873453Z","ServerId":"csssc1pcl01150:fd371c61-3d63-44ae-a8db-350e866eec07","WorkerId":"a0f89d2f-2374-41d3-b631-0ef8d508b38f"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (96, 25, N'Succeeded', NULL, CAST(N'2018-10-12 06:26:13.793' AS DateTime), N'{"SucceededAt":"2018-10-12T06:26:13.7308461Z","PerformanceDuration":"56","Latency":"1594"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (97, 26, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-12 06:26:28.470' AS DateTime), N'{"EnqueuedAt":"2018-10-12T06:26:28.3442582Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (98, 26, N'Processing', NULL, CAST(N'2018-10-12 06:26:28.693' AS DateTime), N'{"StartedAt":"2018-10-12T06:26:28.6342007Z","ServerId":"csssc1pcl01150:fd371c61-3d63-44ae-a8db-350e866eec07","WorkerId":"a0f89d2f-2374-41d3-b631-0ef8d508b38f"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (99, 26, N'Succeeded', NULL, CAST(N'2018-10-12 06:26:28.870' AS DateTime), N'{"SucceededAt":"2018-10-12T06:26:28.8220081Z","PerformanceDuration":"32","Latency":"15422"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (100, 27, N'Enqueued', NULL, CAST(N'2018-10-12 06:35:25.323' AS DateTime), N'{"EnqueuedAt":"2018-10-12T06:35:24.0968275Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (101, 28, N'Scheduled', NULL, CAST(N'2018-10-12 06:35:25.523' AS DateTime), N'{"EnqueueAt":"2018-10-12T06:35:30.4585778Z","ScheduledAt":"2018-10-12T06:35:25.4585778Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (102, 27, N'Processing', NULL, CAST(N'2018-10-12 06:35:25.680' AS DateTime), N'{"StartedAt":"2018-10-12T06:35:25.5011764Z","ServerId":"csssc1pcl01150:d7d01cd5-6ebf-438f-a174-4689eec5d1e8","WorkerId":"cb71e58b-39da-4a1c-a7a8-1160b75c51c3"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (103, 27, N'Succeeded', NULL, CAST(N'2018-10-12 06:35:25.890' AS DateTime), N'{"SucceededAt":"2018-10-12T06:35:25.8332631Z","PerformanceDuration":"54","Latency":"1608"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (104, 28, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2018-10-12 06:35:43.737' AS DateTime), N'{"EnqueuedAt":"2018-10-12T06:35:43.6584967Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (105, 28, N'Processing', NULL, CAST(N'2018-10-12 06:35:46.133' AS DateTime), N'{"StartedAt":"2018-10-12T06:35:46.0669851Z","ServerId":"csssc1pcl01150:d7d01cd5-6ebf-438f-a174-4689eec5d1e8","WorkerId":"cb71e58b-39da-4a1c-a7a8-1160b75c51c3"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (106, 28, N'Succeeded', NULL, CAST(N'2018-10-12 06:35:46.367' AS DateTime), N'{"SucceededAt":"2018-10-12T06:35:46.2983304Z","PerformanceDuration":"50","Latency":"20788"}')
SET IDENTITY_INSERT [HangFire].[State] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UX_HangFire_CounterAggregated_Key]    Script Date: 11/6/2018 5:20:38 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_HangFire_CounterAggregated_Key] ON [HangFire].[AggregatedCounter]
(
	[Key] ASC
)
INCLUDE ( 	[Value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_Counter_Key]    Script Date: 11/6/2018 5:20:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Counter_Key] ON [HangFire].[Counter]
(
	[Key] ASC
)
INCLUDE ( 	[Value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 11/6/2018 5:20:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
INCLUDE ( 	[Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_Hash_Key]    Script Date: 11/6/2018 5:20:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_Key] ON [HangFire].[Hash]
(
	[Key] ASC
)
INCLUDE ( 	[ExpireAt]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UX_HangFire_Hash_Key_Field]    Script Date: 11/6/2018 5:20:38 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_HangFire_Hash_Key_Field] ON [HangFire].[Hash]
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 11/6/2018 5:20:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_ExpireAt] ON [HangFire].[Job]
(
	[ExpireAt] ASC
)
INCLUDE ( 	[Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 11/6/2018 5:20:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_JobParameter_JobIdAndName]    Script Date: 11/6/2018 5:20:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_JobParameter_JobIdAndName] ON [HangFire].[JobParameter]
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_JobQueue_QueueAndFetchedAt]    Script Date: 11/6/2018 5:20:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_JobQueue_QueueAndFetchedAt] ON [HangFire].[JobQueue]
(
	[Queue] ASC,
	[FetchedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 11/6/2018 5:20:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
INCLUDE ( 	[Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_List_Key]    Script Date: 11/6/2018 5:20:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_Key] ON [HangFire].[List]
(
	[Key] ASC
)
INCLUDE ( 	[ExpireAt],
	[Value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 11/6/2018 5:20:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
INCLUDE ( 	[Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_Set_Key]    Script Date: 11/6/2018 5:20:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Key] ON [HangFire].[Set]
(
	[Key] ASC
)
INCLUDE ( 	[ExpireAt],
	[Value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UX_HangFire_Set_KeyAndValue]    Script Date: 11/6/2018 5:20:38 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_HangFire_Set_KeyAndValue] ON [HangFire].[Set]
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_State_JobId]    Script Date: 11/6/2018 5:20:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_State_JobId] ON [HangFire].[State]
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AppUser] ADD  CONSTRAINT [DF__AppUser__AccessF__6EF57B66]  DEFAULT ((0)) FOR [AccessFailedCount]
GO
ALTER TABLE [dbo].[AppUser] ADD  CONSTRAINT [DF__AppUser__EmailCo__6FE99F9F]  DEFAULT ((0)) FOR [EmailConfirmed]
GO
ALTER TABLE [dbo].[AppUser] ADD  CONSTRAINT [DF__AppUser__Lockout__70DDC3D8]  DEFAULT ((0)) FOR [LockoutEnabled]
GO
ALTER TABLE [dbo].[AppUser] ADD  CONSTRAINT [DF__AppUser__PhoneNu__71D1E811]  DEFAULT ((0)) FOR [PhoneNumberConfirmed]
GO
ALTER TABLE [dbo].[RegisterConsultative] ADD  CONSTRAINT [DF_RegisterConsultative_IsLearnTrial]  DEFAULT ((0)) FOR [IsLearnTrial]
GO
ALTER TABLE [dbo].[Resource.Audio] ADD  CONSTRAINT [DF_Resource.Audio_Stop]  DEFAULT ((0)) FOR [Stop]
GO
ALTER TABLE [dbo].[Resource.Audio] ADD  CONSTRAINT [DF_Resource.Audio_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Resource.Channel] ADD  CONSTRAINT [DF_Resource.Channel_Stop]  DEFAULT ((0)) FOR [Stop]
GO
ALTER TABLE [dbo].[Resource.Channel] ADD  CONSTRAINT [DF_Resource.Channel_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Resource.Magazine] ADD  CONSTRAINT [DF_Resource.Magazine_Stop]  DEFAULT ((0)) FOR [Stop]
GO
ALTER TABLE [dbo].[Resource.Magazine] ADD  CONSTRAINT [DF_Resource.Magazine_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Resource.Video] ADD  CONSTRAINT [DF_Resource.Video_Stop]  DEFAULT ((0)) FOR [Stop]
GO
ALTER TABLE [dbo].[Resource.Video] ADD  CONSTRAINT [DF_Resource.Video_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Test.AnswerWork] ADD  CONSTRAINT [DF_Test.AnswerWork_Stop]  DEFAULT ((0)) FOR [Stop]
GO
ALTER TABLE [dbo].[Test.AnswerWork] ADD  CONSTRAINT [DF_Test.AnswerWork_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Test.Exam] ADD  CONSTRAINT [DF_Test.Exam_Stop]  DEFAULT ((0)) FOR [Stop]
GO
ALTER TABLE [dbo].[Test.Exam] ADD  CONSTRAINT [DF_Test.Exam_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Test.ExamQuestionDetail] ADD  CONSTRAINT [DF_ExamQuestionDetail_Stop]  DEFAULT ((0)) FOR [Stop]
GO
ALTER TABLE [dbo].[Test.ExamQuestionDetail] ADD  CONSTRAINT [DF_ExamQuestionDetail_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Test.ExamStructure] ADD  CONSTRAINT [DF_Test.ExamStructure_Stop]  DEFAULT ((0)) FOR [Stop]
GO
ALTER TABLE [dbo].[Test.ExamStructure] ADD  CONSTRAINT [DF_Test.ExamStructure_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Test.Question] ADD  CONSTRAINT [DF_Test.Question_Stop]  DEFAULT ((0)) FOR [Stop]
GO
ALTER TABLE [dbo].[Test.Question] ADD  CONSTRAINT [DF_Test.Question_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Test.QuestionDetail] ADD  CONSTRAINT [DF_Test.QuestionDetail_Stop]  DEFAULT ((0)) FOR [Stop]
GO
ALTER TABLE [dbo].[Test.QuestionDetail] ADD  CONSTRAINT [DF_Test.QuestionDetail_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
/****** Object:  StoredProcedure [dbo].[proc_InsertDataQuestionDetail]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[proc_InsertDataQuestionDetail]
AS
SELECT * FROM dbo.[Test.QuestionDetail]

--INSERT INTO dbo.[Test.QuestionDetail]
--(
--    QuestionId,
--    AnswerPossobolity,
--    IsCorrect,
--    [Order],
--    Stop,
--    CreateDate,
--    CreateByUser,
--    UpdtDate,
--    UpdtByUser
--)

--SELECT 
--a.QuestionId,
--c.Answer,
--NULL AS IsCorrect,
--c.LineId AS [Order],
--0 AS Stop,
--GETDATE() AS CreateDate,
--'admin' AS CreateByUser,
--GETDATE() AS UpdtDate,
--NULL AS UpdtByUser
--FROM [DB_HomeStudy].dbo.[Test.Question] a
--JOIN [DB_Demo].dbo.[Test.Question] b 
--ON a.QuestionName = LTRIM(RTRIM(b.AnswerChoose)) 
--JOIN [DB_Demo].dbo.[Test.QuestionDetail] c
--ON c.QuestionId = b.QuestionId


GO
/****** Object:  StoredProcedure [dbo].[proc_Test_GetQuestion]    Script Date: 11/6/2018 5:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[proc_Test_GetQuestion]
AS
SELECT a.QuestionId,
       a.[Order],
       a.QuestionName,
       a.Answer,
       b.AnswerPossobolity,
       b.[Order]
FROM dbo.[Test.Question] a
    JOIN dbo.[Test.QuestionDetail] b
        ON a.QuestionId = b.QuestionId
WHERE a.LineId > 4
ORDER BY a.LineId;


GO
USE [master]
GO
ALTER DATABASE [DB_HomeStudy] SET  READ_WRITE 
GO
