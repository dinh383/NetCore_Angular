USE [master]
GO
/****** Object:  Database [DB_HomeStudy]    Script Date: 21/08/2018 23:49:51 ******/
CREATE DATABASE [DB_HomeStudy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_HomeStudy', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.TUNG\MSSQL\DATA\DB_HomeStudy.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_HomeStudy_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.TUNG\MSSQL\DATA\DB_HomeStudy_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_HomeStudy] SET COMPATIBILITY_LEVEL = 110
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
ALTER DATABASE [DB_HomeStudy] SET AUTO_CREATE_STATISTICS ON 
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
EXEC sys.sp_db_vardecimal_storage_format N'DB_HomeStudy', N'ON'
GO
USE [DB_HomeStudy]
GO
/****** Object:  User [bts]    Script Date: 21/08/2018 23:49:51 ******/
CREATE USER [bts] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [bts]
GO
/****** Object:  StoredProcedure [dbo].[proc_InsertDataQuestionDetail]    Script Date: 21/08/2018 23:49:51 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_Test_GetQuestion]    Script Date: 21/08/2018 23:49:51 ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 21/08/2018 23:49:51 ******/
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
/****** Object:  Table [dbo].[AppUser]    Script Date: 21/08/2018 23:49:51 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 21/08/2018 23:49:51 ******/
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
/****** Object:  Table [dbo].[Course]    Script Date: 21/08/2018 23:49:51 ******/
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
/****** Object:  Table [dbo].[RegisterConsultative]    Script Date: 21/08/2018 23:49:51 ******/
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
/****** Object:  Table [dbo].[Resource.Audio]    Script Date: 21/08/2018 23:49:51 ******/
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
/****** Object:  Table [dbo].[Resource.Category]    Script Date: 21/08/2018 23:49:51 ******/
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
/****** Object:  Table [dbo].[Resource.Channel]    Script Date: 21/08/2018 23:49:51 ******/
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
/****** Object:  Table [dbo].[Resource.Magazine]    Script Date: 21/08/2018 23:49:51 ******/
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
/****** Object:  Table [dbo].[Resource.Tag]    Script Date: 21/08/2018 23:49:51 ******/
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
/****** Object:  Table [dbo].[Resource.Video]    Script Date: 21/08/2018 23:49:51 ******/
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
/****** Object:  Table [dbo].[Resource.VideoTagDetail]    Script Date: 21/08/2018 23:49:51 ******/
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
/****** Object:  Table [dbo].[Test.AnswerWork]    Script Date: 21/08/2018 23:49:51 ******/
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
/****** Object:  Table [dbo].[Test.Exam]    Script Date: 21/08/2018 23:49:51 ******/
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
/****** Object:  Table [dbo].[Test.ExamQuestionDetail]    Script Date: 21/08/2018 23:49:51 ******/
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
/****** Object:  Table [dbo].[Test.ExamStructure]    Script Date: 21/08/2018 23:49:51 ******/
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
/****** Object:  Table [dbo].[Test.Question]    Script Date: 21/08/2018 23:49:51 ******/
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
/****** Object:  Table [dbo].[Test.QuestionDetail]    Script Date: 21/08/2018 23:49:51 ******/
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
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180708152652_ChannelYouTubeIdUdate', N'2.1.0-rtm-30799')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180708152849_ChannelYouTubeIdU', N'2.1.0-rtm-30799')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180708162541_CategoryIdConvertToInt', N'2.1.0-rtm-30799')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180708162737_CategoryIdConvertToInts', N'2.1.0-rtm-30799')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180708163226_CategoryIdConv', N'2.1.0-rtm-30799')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180710095625_updateUser', N'2.1.0-rtm-30799')
INSERT [dbo].[AppUser] ([Id], [UserName], [PasswordHash], [TwoFactorEnabled], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [Avatar], [BirthDay], [FullName], [Stop], [CreateDate], [CreateByUser], [UpdtByUser], [UpdtDate]) VALUES (N'1', N'test', N'Tung@123', 0, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, CAST(0x070000000000713E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[AppUser] ([Id], [UserName], [PasswordHash], [TwoFactorEnabled], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [Avatar], [BirthDay], [FullName], [Stop], [CreateDate], [CreateByUser], [UpdtByUser], [UpdtDate]) VALUES (N'2', N'tung', N'Tung@123', 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, CAST(0x070000000000713E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[AppUser] ([Id], [UserName], [PasswordHash], [TwoFactorEnabled], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [Avatar], [BirthDay], [FullName], [Stop], [CreateDate], [CreateByUser], [UpdtByUser], [UpdtDate]) VALUES (N'b987b7b1-8de7-40df-90e8-6bc7a2040369', N'admin', N'AQAAAAEAACcQAAAAEC+SFclPRMY+f3m5IfcABy876xknH8Yp/INgjGEdAo++hRKwi/wjy3U0TUm3xXHRVw==', 0, 0, N'ca914aa3-afb0-49a4-b5aa-73aa1a257465', N'admin@gmail.com', 1, 1, NULL, N'ADMIN@GMAIL.COM', N'ADMIN', NULL, 0, N'T2E6DJ6UXF2J2Y7KBFM4V3RXGB4WVAK3', NULL, NULL, NULL, 0, CAST(0x070000000000000000 AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[RegisterConsultative] ON 

INSERT [dbo].[RegisterConsultative] ([RegisterId], [Address], [AgeId], [DateLearnTrial], [Email], [FinancialResourceId], [FullName], [IsLearnTrial], [OccupationId], [Phone], [ReasonId], [ShiftStudyId], [Note], [Stop], [CreateByUser], [CreateDate], [UpdtByUser], [UpdtDate]) VALUES (9, NULL, NULL, NULL, N'NguyenVanAn@gmail.com', NULL, N'Nguyen Van An', 1, NULL, N'09043243234', NULL, NULL, NULL, 0, NULL, CAST(0x07B069A3984F873E0B AS DateTime2), NULL, CAST(0x07AF4DB46650873E0B AS DateTime2))
INSERT [dbo].[RegisterConsultative] ([RegisterId], [Address], [AgeId], [DateLearnTrial], [Email], [FinancialResourceId], [FullName], [IsLearnTrial], [OccupationId], [Phone], [ReasonId], [ShiftStudyId], [Note], [Stop], [CreateByUser], [CreateDate], [UpdtByUser], [UpdtDate]) VALUES (10, NULL, NULL, NULL, N'tranthanhtung@gmail.com', NULL, N'Trần Thanh Tùng', 0, NULL, N'0906434343', NULL, NULL, NULL, 0, NULL, CAST(0x07A67809B64F873E0B AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[RegisterConsultative] OFF
SET IDENTITY_INSERT [dbo].[Resource.Audio] ON 

INSERT [dbo].[Resource.Audio] ([LineId], [AudioId], [AudioName], [Description], [AudioUrl], [MagazineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1, N'd21dbb31-0888-499d-b46d-3dbcc1aa3e32', N'CD Index (Trang 3)', NULL, N'HotEnglish65_01_Hello.mp3', N'48bc4759-6747-4d5a-a44c-ae41499a1e29', 0, CAST(0x07606AA6CBBD9E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Audio] ([LineId], [AudioId], [AudioName], [Description], [AudioUrl], [MagazineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (2, N'9540f0a5-a3d0-4673-85fa-de03acf9df09', N'CD Track 2 - Australian man (Trang 6)', NULL, N'HotEnglish65_02_Idioms.mp3', N'48bc4759-6747-4d5a-a44c-ae41499a1e29', 0, CAST(0x073058AFE6BD9E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Audio] ([LineId], [AudioId], [AudioName], [Description], [AudioUrl], [MagazineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (4, N'6a7394be-ec61-4789-afcf-e9bc4ea2c64f', N'CD track 4 Englishman & Irishman (Trang 9)', NULL, N'HotEnglish65_03_Jokes.mp3', N'48bc4759-6747-4d5a-a44c-ae41499a1e29', 0, CAST(0x07206068F4BD9E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Audio] ([LineId], [AudioId], [AudioName], [Description], [AudioUrl], [MagazineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (3, N'6a7394be-ec61-4789-afcf-e9bc4ea7c64f', N'CD track 3 Englishman & Irishman (Trang 7)', NULL, N'HotEnglish65_03_Jokes.mp3', N'48bc4759-6747-4d5a-a44c-ae41499a1e29', 0, CAST(0x07206068F4BD9E3E0B AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Resource.Audio] OFF
SET IDENTITY_INSERT [dbo].[Resource.Category] ON 

INSERT [dbo].[Resource.Category] ([CategoryId], [CategoryName], [Description], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (3, N'English Speaking', NULL, 0, CAST(0x070000000000903E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Category] ([CategoryId], [CategoryName], [Description], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (5, N'English Gramer', NULL, 0, CAST(0x070000000000903E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Category] ([CategoryId], [CategoryName], [Description], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (9, N'English Online', NULL, 0, CAST(0x070000000000873E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Category] ([CategoryId], [CategoryName], [Description], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (11, N'English Magazin', NULL, 0, CAST(0x070000000000873E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Category] ([CategoryId], [CategoryName], [Description], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (12, N'English National Geographic', NULL, 0, CAST(0x070000000000873E0B AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Resource.Category] OFF
SET IDENTITY_INSERT [dbo].[Resource.Channel] ON 

INSERT [dbo].[Resource.Channel] ([ChannelId], [ChannelYouTubeId], [ChannelName], [Description], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (4, N'UCDIJPT98nv7gcWgQ8TeJmrg', N'Dan Hauer', NULL, 0, CAST(0x070000000000723E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Channel] ([ChannelId], [ChannelYouTubeId], [ChannelName], [Description], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (5, N'UCrRiVfHqBIIvSgKmgnSY66g', N'mmmEnglish', NULL, 0, CAST(0x07F076E3ABBD723E0B AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Resource.Channel] OFF
SET IDENTITY_INSERT [dbo].[Resource.Magazine] ON 

INSERT [dbo].[Resource.Magazine] ([LineId], [MagazineId], [MagazineName], [Description], [MagazineUrl], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (2, N'2304c8e4-9ca8-4937-9d36-2ff92b6a4602', N'Mel Gibson''s Apocalypto', N'Hot English will be available on the 1st of every month on our website.
                        Simply key in your personal code and password, and download the files
                        you want so you can read and listen to Hot English magazine', N'HotEnglish66jpg_Page1.jpg', 0, CAST(0x07409E802EBD9E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Magazine] ([LineId], [MagazineId], [MagazineName], [Description], [MagazineUrl], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (3, N'f27c8af2-44d4-4067-856c-5a2d4f9e7ff9', N'The last king of Scotland', N'Hot English will be available on the 1st of every month on our website.
                        Simply key in your personal code and password, and download the files
                        you want so you can read and listen to Hot English magazine', N'HotEnglish67jpg_Page1.jpg', 0, CAST(0x0750651E41BD9E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Magazine] ([LineId], [MagazineId], [MagazineName], [Description], [MagazineUrl], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1, N'48bc4759-6747-4d5a-a44c-ae41499a1e29', N'The Queen Helen Mirren', N'Hot English will be available on the 1st of every month on our website.
                        Simply key in your personal code and password, and download the files
                        you want so you can read and listen to Hot English magazine', N'HotEnglish65jpg_Page1.jpg', 0, CAST(0x071022D90EBD9E3E0B AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Resource.Magazine] OFF
SET IDENTITY_INSERT [dbo].[Resource.Video] ON 

INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (49, N'Jio_hWFv1q4&t=265s', N'Dan giải thích lời thoại trong phim', NULL, NULL, 4, 12, 0, 0, NULL, N'https://www.youtube.com/watch?v=Jio_hWFv1q4&t=265s', N'https://www.youtube.com/embed/Jio_hWFv1q4?ecver=1', N'https://i.ytimg.com/vi_webp/Jio_hWFv1q4/maxresdefault.webp', 0, CAST(0x070000000000723E0B AS DateTime2), NULL, CAST(0x07FD91F3D84B873E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (50, N'8NiCrmfiQCA', N'Vinglish', NULL, NULL, 4, 3, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=8NiCrmfiQCA', N'https://www.youtube.com/embed/8NiCrmfiQCA?ecver=1', N'https://i.ytimg.com/vi_webp/8NiCrmfiQCA/maxresdefault.webp', 0, CAST(0x07E0E0FE35A5723E0B AS DateTime2), NULL, CAST(0x07BF2CF4CE4A873E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (51, N'S0POh5EUg8A', N'Hỏi đáp cùng Dan 2018', NULL, NULL, 4, 3, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=S0POh5EUg8A', N'https://www.youtube.com/embed/S0POh5EUg8A?ecver=1', N'https://i.ytimg.com/vi_webp/S0POh5EUg8A/maxresdefault.webp', 0, CAST(0x077010912EA6723E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (52, N'2dy8zyENniw', N'Những từ viết giống nhau, phát âm khác nhau', NULL, NULL, 4, 3, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=2dy8zyENniw', N'https://www.youtube.com/embed/2dy8zyENniw?ecver=1', N'https://i.ytimg.com/vi_webp/2dy8zyENniw/maxresdefault.webp', 0, CAST(0x0790372D5FA6723E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (53, N'sLc_DHalOMs', N'Tiếng Anh ngố hồi sinh', NULL, NULL, 4, 3, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=sLc_DHalOMs', N'https://www.youtube.com/embed/sLc_DHalOMs?ecver=1', N'https://i.ytimg.com/vi_webp/sLc_DHalOMs/maxresdefault.webp', 0, CAST(0x0720CE2C84A6723E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (54, N'8-ktHXX0BkI&list=PLD_5T89Ssbn37h4UPUMY3URT3JcH07QAY', N'MY TOP TIPS! Learn & Use More Phrasal Verbs | English Lesson', NULL, NULL, 5, 3, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=8-ktHXX0BkI&list=PLD_5T89Ssbn37h4UPUMY3URT3JcH07QAY', N'https://www.youtube.com/embed/8-ktHXX0BkI?list=PLD_5T89Ssbn37h4UPUMY3URT3JcH07QAY&amp;ecver=1', N'https://i.ytimg.com/vi_webp/8-ktHXX0BkI/maxresdefault.webp', 0, CAST(0x0700606C89BD723E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (55, N'TVVn9MddtmM&list=PLD_5T89Ssbn2ybbhz8OBntHJ3ckNUJEUk', N'Present Perfect Tense | Simple or Continuous? | FOR & SINCE', NULL, NULL, 5, 3, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=TVVn9MddtmM&list=PLD_5T89Ssbn2ybbhz8OBntHJ3ckNUJEUk', N'https://www.youtube.com/embed/TVVn9MddtmM?list=PLD_5T89Ssbn2ybbhz8OBntHJ3ckNUJEUk&amp;ecver=1', N'https://i.ytimg.com/vi_webp/8-ktHXX0BkI/maxresdefault.webp', 0, CAST(0x07A0BFC6D9BD723E0B AS DateTime2), NULL, CAST(0x07711BC86E54873E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (56, N'A2ncygNMaFo&list=PLD_5T89Ssbn2PrkhxV8Lh6ngEjlhqRJ-p', N'Tips To Improve Your Grammar! 👉 English Auxiliary Verbs | BE, DO & HAVE', NULL, NULL, 5, 5, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=A2ncygNMaFo&list=PLD_5T89Ssbn2PrkhxV8Lh6ngEjlhqRJ-p', N'https://www.youtube.com/embed/A2ncygNMaFo?list=PLD_5T89Ssbn2PrkhxV8Lh6ngEjlhqRJ-p&amp;ecver=1', N'https://i.ytimg.com/vi_webp/A2ncygNMaFo/maxresdefault.webp', 0, CAST(0x0710EB3E7ABE723E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (57, N'n4NVPg2kHv4', N'English Pronunciation Training | Improve Your Accent & Speak Clearly', NULL, NULL, 5, 5, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=n4NVPg2kHv4', N'https://www.youtube.com/embed/n4NVPg2kHv4?ecver=1', N'https://i.ytimg.com/vi_webp/n4NVPg2kHv4/maxresdefault.webp', 0, CAST(0x0780EB6E01BF723E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (58, N'8-ktHXX0BkI', N'MY TOP TIPS! Learn & Use More Phrasal Verbs | English Lesson', NULL, NULL, 5, 5, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=8-ktHXX0BkI', N'https://www.youtube.com/embed/8-ktHXX0BkI?ecver=1', N'https://i.ytimg.com/vi_webp/8-ktHXX0BkI/maxresdefault.webp', 0, CAST(0x07A037AFA4BF723E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (59, N'9T4KHDyAguk', N'Why can’t I speak fluent English? Stop these 7 things now– Speak fluently with confidence', N'Why can’t I speak fluent English?– Stop doing these 7 mistakes – English lesson to Speak fluently and confidently', NULL, 4, 11, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=9T4KHDyAguk', N'https://www.youtube.com/embed/9T4KHDyAguk?ecver=1', N'https://i.ytimg.com/vi_webp/9T4KHDyAguk/maxresdefault.webp', 0, CAST(0x07B9B39E4B54873E0B AS DateTime2), NULL, CAST(0x07EE31DEB74B873E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (60, N'fBnAMUkNM2k', N'LEARN ENGLISH | MUNIBA MAZARI - We all are Perfectly Imperfect (English Subtitles)', N'Learn English with Muniba Mazari in inspirational and motivational speech. Muniba Mazari is a Pakistani artist, model, activist, motivational speaker, singer, and television host. She uses a wheelchair due to injuries sustained in a car accident at the age of 21 which makes her Pakistan''s first wheelchair-using model. She is also the National Ambassador for UN Women Pakistan - Watch with English Subtitles.', NULL, 4, 9, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=fBnAMUkNM2k', N'https://www.youtube.com/embed/fBnAMUkNM2k?ecver=1', N'https://i.ytimg.com/vi_webp/fBnAMUkNM2k/maxresdefault.webp', 0, CAST(0x0789CBAE5B55873E0B AS DateTime2), NULL, CAST(0x073D31638055873E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (61, N'nsG--RMBJLo&t=9s', N'Hot English Magazine Sample', N'Hot English magazine and how it helps you learn English the fun and easy way.', NULL, 4, 11, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=nsG--RMBJLo&t=9s', N'https://www.youtube.com/embed/nsG--RMBJLo', N'https://i.ytimg.com/vi/nsG--RMBJLo/sddefault.jpg', 0, CAST(0x07E96E805BA3873E0B AS DateTime2), NULL, CAST(0x077C2140EBA6873E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (62, N'13cf9sy3OiQ&t=42s', N'Learn Hot English Digital Products', N'Learn Hot English digital products: Learn Hot English can really help you learn English.  Our digital products are great for learning English.  Read the articles / listen to the dialogues / watch the videos / do the exercises.  Scroll forward or backward to find the page you want.  Increase the text size. Click on the audio button  Pause / fast forward / rewind / start again / minimise the play button  Watch a video  Choose the book or magazine you want to read', NULL, 4, 11, NULL, NULL, NULL, N'https://youtu.be/13cf9sy3OiQ', N'https://www.youtube.com/embed/13cf9sy3OiQ', N'https://i.ytimg.com/vi_webp/13cf9sy3OiQ/sddefault.webp', 0, CAST(0x07E21FE19EA4873E0B AS DateTime2), NULL, CAST(0x0705F32E26A7873E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (63, N'wfANZTwZUcs', N'Chỉnh lỗi tiếng Anh: every people', N'Mọi người ≠ every people.  Trong clip này mình hướng dẫn "every" và "each." Nhiều người không hiểu sự khác biệt giữa hai từ này rõ lắm, và cũng mắc phải lỗi khi dùng danh từ số nhiều với cả hai.  À, mình cũng sửa một lỗi về cách sử dụng "every time."  Chúc các bạn sửa lỗi thành công nhé!', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/wfANZTwZUcs', N'https://www.youtube.com/embed/wfANZTwZUcs', N'https://i.ytimg.com/vi_webp/wfANZTwZUcs/maxresdefault.webp', 0, CAST(0x07AB235D4FA6873E0B AS DateTime2), NULL, CAST(0x0740BAB854A7873E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (64, N'RbDDNudAiSo', N'Chỉnh lỗi tiếng Anh: see, look, watch', N'Đừng nhìn vào tao. ≠ Don''t see me. Các bạn ơi, ba từ "see," "look," và "watch" rất là khác biệt. Hy vọng đã xem clip này các bạn không mắc phải lỗi nữa.', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/RbDDNudAiSo', N'https://www.youtube.com/embed/RbDDNudAiSo', N'https://i.ytimg.com/vi_webp/RbDDNudAiSo/hqdefault.webp', 0, CAST(0x07AB54FE1DA8873E0B AS DateTime2), NULL, CAST(0x077E90664EA8873E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (65, N'ACI2QocDXbg', N'Chỉnh lỗi tiếng Anh: clothes', N'Trong clip này mình sửa những lỗi các bạn Việt hay mắc phải khi nói đến quần áo. Ví dụ: cách phát âm "clothes," nghĩa của "t-shirt," và cách dùng "jeans" và "a pair of jeans."', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/ACI2QocDXbg', N'https://www.youtube.com/embed/ACI2QocDXbg', N'https://i.ytimg.com/vi_webp/ACI2QocDXbg/hqdefault.webp', 0, CAST(0x07E7B90F79A8873E0B AS DateTime2), NULL, CAST(0x073CA224EEA6973E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (66, N'-tPLdqOczus', N'Tiếng Anh ngố', N'Nhiều khi các bạn nói không sai ngữ pháp, không sai từ vựng, nhưng rất sai so với cách nói của người bản ngữ. Các bạn xem để sửa 7 lỗi phổ biến nhé.', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/-tPLdqOczus', N'https://www.youtube.com/embed/-tPLdqOczus', N'https://i.ytimg.com/vi_webp/-tPLdqOczus/hqdefault.webp', 0, CAST(0x079A0A58F3A8873E0B AS DateTime2), NULL, CAST(0x0756654057A7973E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (67, N'IJRcpQBLFmI', N'Vinglish', N'Nhiều khi English của các bạn bị Vietnamese ảnh hưởng đến mức nó biến thành Vinglish.', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/IJRcpQBLFmI', N'https://www.youtube.com/embed/IJRcpQBLFmI', N'https://i.ytimg.com/vi_webp/IJRcpQBLFmI/hqdefault.webp', 0, CAST(0x0737D91F57A9873E0B AS DateTime2), NULL, CAST(0x07CAEF0B01A7973E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (68, N'eZ9-uG0PIDw', N'Vinglish bá đạo', N'Phần hai của chủ đề Vinglish.', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/eZ9-uG0PIDw', N'https://www.youtube.com/embed/eZ9-uG0PIDw', N'https://i.ytimg.com/vi_webp/eZ9-uG0PIDw/hqdefault.webp', 0, CAST(0x075DBBB58EA9873E0B AS DateTime2), NULL, CAST(0x072809A861A7973E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (69, N'1RDs-ivyXlA', N'Sự trở lại của Tiếng Anh ngố', N'Các bạn có còn nhớ "tiếng Anh ngố" không? Nó đã trở lại rồi, và lần này nó còn ngố hơn lần trước.', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/1RDs-ivyXlA', N'https://www.youtube.com/embed/1RDs-ivyXlA', N'https://i.ytimg.com/vi_webp/1RDs-ivyXlA/hqdefault.webp', 0, CAST(0x070A4261C4A9873E0B AS DateTime2), NULL, CAST(0x07C904C923A7973E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (70, N'trrPPPjxe-4', N'Tiếng Anh nhập lỗi', N'Picnic, stress, cassette, les, vlog . . . Năm từ tiếng Anh này đã được nhập vào tiếng Việt. Quá tiếc là cách sử dụng của năm từ ấy trong tiếng Việt khiến cho các bạn sử dụng chúng sai trong tiếng Anh.', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/trrPPPjxe-4', N'https://www.youtube.com/embed/trrPPPjxe-4', N'https://i.ytimg.com/vi_webp/trrPPPjxe-4/hqdefault.webp', 0, CAST(0x076C3EC3E1A9873E0B AS DateTime2), NULL, CAST(0x07DC95486EA7973E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (71, N'-l0ppD_UCzg', N'Vinglish siêu tốc', N'Tập 4 trong seri Vinglish. Nhanh, hay, hữư ích. Xem đi!', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/-l0ppD_UCzg', N'https://www.youtube.com/embed/-l0ppD_UCzg', N'https://i.ytimg.com/vi_webp/-l0ppD_UCzg/hqdefault.webp', 0, CAST(0x077F31BBFFA9873E0B AS DateTime2), NULL, CAST(0x073F607C3DA7973E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (72, N'cvBe6Ap2yj8', N'Những từ dễ nhầm lẫn', N'Dan giải thích sự khác biệt giữa: learn/study, early/soon, die/dead, true/right, either/too, win/beat và shy/embarrassed.', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/cvBe6Ap2yj8', N'https://www.youtube.com/embed/cvBe6Ap2yj8', N'https://i.ytimg.com/vi_webp/cvBe6Ap2yj8/hqdefault.webp', 0, CAST(0x07CEEF9650AA873E0B AS DateTime2), NULL, CAST(0x077FCA507AA7973E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (73, N'CU-0OvVB3rk', N'Chữa phụ đề Việt', N'Dan nói về Deadpool, Inside Out, Guardians of the Galaxy, 22 Jump Street, Zombieland và Sicario.', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/CU-0OvVB3rk', N'https://www.youtube.com/embed/CU-0OvVB3rk', N'https://i.ytimg.com/vi_webp/CU-0OvVB3rk/hqdefault.webp', 0, CAST(0x07479B0988AB873E0B AS DateTime2), NULL, CAST(0x0769399A47A7973E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (74, N'SRsSUH2ogsc', N'Tiếng Anh ngố 3', N'Buy your ass a t-shirt at printstyle.vn/danhauer. Trong video này Dan nói về "rice," "worker," "of course," "I''m fine thank you. And you?" "I think so!"', NULL, 5, 3, NULL, NULL, NULL, N'https://youtu.be/SRsSUH2ogsc', N'https://www.youtube.com/embed/SRsSUH2ogsc', N'https://i.ytimg.com/vi_webp/SRsSUH2ogsc/hqdefault.webp', 0, CAST(0x077E5976D0AB873E0B AS DateTime2), NULL, CAST(0x0712B2D385A7973E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (75, N'hdZK22pR5nU', N'5 Reasons Why The Japanese Are So Polite', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=hdZK22pR5nU', N'https://www.youtube.com/embed/hdZK22pR5nU', N'https://i.ytimg.com/vi_webp/hdZK22pR5nU/hqdefault.webp', 0, CAST(0x07C7128411A8973E0B AS DateTime2), NULL, CAST(0x0775303560A8973E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (76, N'-Blsz2JbdgM', N'10 Countries Where You Can Start A New Life', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=-Blsz2JbdgM', N'https://www.youtube.com/embed/-Blsz2JbdgM', N'https://i.ytimg.com/vi_webp/-Blsz2JbdgM/hqdefault.webp', 0, CAST(0x078521C993A8973E0B AS DateTime2), NULL, CAST(0x07A5C7E1A1A8973E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (77, N'rMrZJEuyOCw', N'10 Famous People Who Were Homeless', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=rMrZJEuyOCw', N'https://www.youtube.com/embed/rMrZJEuyOCw', N'https://i.ytimg.com/vi_webp/rMrZJEuyOCw/hqdefault.webp', 0, CAST(0x0740F29AD2A8973E0B AS DateTime2), NULL, CAST(0x0702BF80DDA8973E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (78, N'wTjCyjmhwo8', N'10 Highest Paid Jobs You Can Do From Home', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=wTjCyjmhwo8', N'https://www.youtube.com/embed/wTjCyjmhwo8', N'https://i.ytimg.com/vi_webp/wTjCyjmhwo8/hqdefault.webp', 0, CAST(0x07462F1309A9973E0B AS DateTime2), NULL, CAST(0x074A4F1A14A9973E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (79, N'Hld557JJVzU', N'10 Illegal Jobs That Pay Extremely Well', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=Hld557JJVzU', N'https://www.youtube.com/embed/Hld557JJVzU', N'https://i.ytimg.com/vi_webp/Hld557JJVzU/hqdefault.webp', 0, CAST(0x070BA8F237A9973E0B AS DateTime2), NULL, CAST(0x07BFB37C43A9973E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (80, N'6jyuyX5M28o', N'10 Insane Celebrity Homes', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=6jyuyX5M28o', N'https://www.youtube.com/embed/6jyuyX5M28o', N'https://i.ytimg.com/vi_webp/6jyuyX5M28o/hqdefault.webp', 0, CAST(0x072C6EDB68A9973E0B AS DateTime2), NULL, CAST(0x07543CE672A9973E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (81, N'K8IN699J3kM', N'10 Most Expensive Hotels In The World', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=K8IN699J3kM', N'https://www.youtube.com/embed/K8IN699J3kM', N'https://i.ytimg.com/vi_webp/K8IN699J3kM/sddefault.webp', 0, CAST(0x07A97D7397A9973E0B AS DateTime2), NULL, CAST(0x07AC9267A2A9973E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (82, N'YPv_1tCk8P0', N'10 Of The Best Street Foods Around The World', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=YPv_1tCk8P0', N'https://www.youtube.com/embed/YPv_1tCk8P0', N'https://i.ytimg.com/vi_webp/YPv_1tCk8P0/hqdefault.webp', 0, CAST(0x07BBFC5DCEA9973E0B AS DateTime2), NULL, CAST(0x07F854529DA1973E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (83, N'wb45ZigmSx8', N'10 People Who Got Rich From Stupid Products', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=wb45ZigmSx8', N'https://www.youtube.com/embed/wb45ZigmSx8', N'https://i.ytimg.com/vi_webp/wb45ZigmSx8/hqdefault.webp', 0, CAST(0x07553961B8A1973E0B AS DateTime2), NULL, CAST(0x07F8EC52C3A1973E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (84, N'D6wmz6HQBWc', N'10 Teens Who Are Self-Made Millionaires', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=D6wmz6HQBWc', N'https://www.youtube.com/embed/D6wmz6HQBWc', N'https://i.ytimg.com/vi_webp/D6wmz6HQBWc/hqdefault.webp', 0, CAST(0x07CF400EF6A1973E0B AS DateTime2), NULL, CAST(0x0757724802A2973E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (85, N'qB7I7TaWHYE', N'10 Things You''re Not Allowed To Do In SAUDI ARABIA [English]', NULL, NULL, 6, 12, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=qB7I7TaWHYE', N'https://www.youtube.com/embed/qB7I7TaWHYE', N'https://i.ytimg.com/vi_webp/qB7I7TaWHYE/hqdefault.webp', 0, CAST(0x07F7273027A2973E0B AS DateTime2), NULL, CAST(0x0751F3F032A2973E0B AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Resource.Video] OFF
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'592d8bc1-d8d5-4b28-befb-0118c87e6eaf', N'User 1 test', NULL, 1, 3, 4, 0, CAST(0x0760F1B56D7D9E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'36f7f30d-5864-44b2-b8ab-0d8684d79bb1', N'User 1 test', NULL, 1, 1, 2, 0, CAST(0x07473FABAD86983E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'c6e22d0d-d7a3-498e-bdad-16c32a44d774', N'User 1 test', NULL, 1, 4, 5, 0, CAST(0x07208513D7B69E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'53e8551f-8bed-4e1a-8de0-18ea0f758146', N'User 1 test', NULL, 0, 4, 4, 0, CAST(0x075E045C7A809E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'e8ee5082-272c-4be3-8e18-1d02732a302c', N'User 1 test', NULL, 0, 2, 2, 0, CAST(0x07DF193D0C91913E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'9daaea0e-700e-4574-a006-31746c190c2d', N'User 1 test', NULL, 0, 2, 2, 0, CAST(0x0790273C0191913E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'df12fc43-0794-44dc-b79b-31b6f00ab7b7', N'User 1 test', NULL, 0, 5, 5, 0, CAST(0x07583CF318B79E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'8f46299d-f54b-4b58-875d-373fbf2f44f0', N'User 1 test', NULL, 0, 4, 4, 0, CAST(0x07FCD218D97F9E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'7b61ce49-51b0-418f-b6dc-3ecf8484027e', N'User 1 test', NULL, 2, 3, 5, 0, CAST(0x071A54DA957D9E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'0bf2b814-b25a-4678-93a3-4345a1324117', N'User 1 test', NULL, 0, 4, 4, 0, CAST(0x0709244C01849E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'86e02b0c-de71-4a68-a2b1-472e8e9721fd', N'User 1 test', NULL, 0, 4, 4, 0, CAST(0x072ED31D3C809E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'f659195e-710c-4812-8cbd-5222166234b4', N'User 1 test', NULL, 0, 4, 4, 0, CAST(0x07785BFC9E7F9E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'4646a65f-8aa8-4ff0-a739-55192f17f54d', N'User 1 test', NULL, 0, 4, 4, 0, CAST(0x07CE858564859E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'997a6457-4684-49aa-a9df-594b754f6cc4', N'User 1 test', NULL, 1, 1, 2, 0, CAST(0x07DE2859A18D913E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'828805ee-53f2-46d8-85ac-59ab4b816e1c', N'User 1 test', NULL, 1, 3, 4, 0, CAST(0x07CBBA4826839E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'7975a19b-a680-463b-9976-7569cac66148', N'User 1 test', NULL, 0, 5, 5, 0, CAST(0x0721707CA97D9E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'b95cbe59-b1da-496a-a81d-8822d799a1a9', N'User 1 test', NULL, 1, 4, 5, 0, CAST(0x075A38E26E859E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'7f1dbf11-2ee0-47ba-a634-8a73359a280d', N'User 1 test', NULL, 0, 4, 4, 0, CAST(0x074383EB0D7F9E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'e22110cb-e8f0-4e1b-8833-a99e224a5df8', N'User 1 test', NULL, 1, 3, 4, 0, CAST(0x07BC581285839E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'a4128add-8a24-46f5-a289-bf09726a9756', N'User 1 test', NULL, 1, 1, 2, 0, CAST(0x077D21371391913E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'ea82e2c3-73b8-4047-8d70-c3a1c976875a', N'User 1 test', NULL, 2, 3, 5, 0, CAST(0x070CE3FE75B49E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'8a832a22-915c-43a3-a8eb-c50ba01cf03f', N'User 1 test', NULL, 2, 3, 5, 0, CAST(0x073B2B7680B39E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'19a13613-09ba-48e0-8376-dcf10b1d135b', N'User 1 test', NULL, 1, 1, 2, 0, CAST(0x07AD01768C8D913E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'97cc4df5-9fb7-45d1-a612-e3d53587d79a', N'User 1 test', NULL, 0, 4, 4, 0, CAST(0x07C2DA3C727E9E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'cc569256-17a3-4ade-b3ee-f389ff439547', N'User 1 test', NULL, 2, 2, 4, 0, CAST(0x07053F8688809E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'02043fb3-4c6b-43d0-915a-f4470fc3fa72', N'User 1 test', NULL, 0, 5, 5, 0, CAST(0x07610D085CB39E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (N'875ea57e-794f-4d12-b0ab-fbd49b875e57', N'User 1 test', NULL, 0, 5, 5, 0, CAST(0x07401E3ADBB39E3E0B AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Test.ExamQuestionDetail] ON 

INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1, N'19a13613-09ba-48e0-8376-dcf10b1d135b', N'4a19408a-8498-464d-bcd1-02c53a613dfa', N'old-school', N'old-school', 1, 0, CAST(0x07C549758C8D913E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (2, N'19a13613-09ba-48e0-8376-dcf10b1d135b', N'788ac91b-f9dc-434c-a14e-9405beb5f270', N'an old dog', N'old-school', 0, 0, CAST(0x07AF56758C8D913E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (3, N'997a6457-4684-49aa-a9df-594b754f6cc4', N'4a19408a-8498-464d-bcd1-02c53a613dfa', N'school of thought', N'old-school', 0, 0, CAST(0x07EA2759A18D913E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (4, N'997a6457-4684-49aa-a9df-594b754f6cc4', N'788ac91b-f9dc-434c-a14e-9405beb5f270', N'old-school', N'old-school', 1, 0, CAST(0x070D2859A18D913E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (5, N'9daaea0e-700e-4574-a006-31746c190c2d', N'38c822d8-8130-4cba-ae9c-2da0b504bde1', N'school of thought', N'old-school', 0, 0, CAST(0x0740273C0191913E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (6, N'9daaea0e-700e-4574-a006-31746c190c2d', N'afbef51c-1b9c-497c-8dc7-48868d7f2cf7', N'school of thought', N'old-school', 0, 0, CAST(0x0766273C0191913E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (7, N'e8ee5082-272c-4be3-8e18-1d02732a302c', N'38c822d8-8130-4cba-ae9c-2da0b504bde1', N'', N'old-school', 0, 0, CAST(0x079F193D0C91913E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (8, N'e8ee5082-272c-4be3-8e18-1d02732a302c', N'afbef51c-1b9c-497c-8dc7-48868d7f2cf7', N'', N'old-school', 0, 0, CAST(0x07B6193D0C91913E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (9, N'a4128add-8a24-46f5-a289-bf09726a9756', N'38c822d8-8130-4cba-ae9c-2da0b504bde1', N'school of thought', N'old-school', 0, 0, CAST(0x073321371391913E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (10, N'a4128add-8a24-46f5-a289-bf09726a9756', N'afbef51c-1b9c-497c-8dc7-48868d7f2cf7', N'old-school', N'old-school', 1, 0, CAST(0x075321371391913E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (11, N'36f7f30d-5864-44b2-b8ab-0d8684d79bb1', N'38c822d8-8130-4cba-ae9c-2da0b504bde1', N'school of thought', N'old-school', 0, 0, CAST(0x07C276AAAD86983E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (12, N'36f7f30d-5864-44b2-b8ab-0d8684d79bb1', N'afbef51c-1b9c-497c-8dc7-48868d7f2cf7', N'old-school', N'old-school', 1, 0, CAST(0x076D85AAAD86983E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (13, N'592d8bc1-d8d5-4b28-befb-0118c87e6eaf', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'School', N'The Japanese people', 0, 0, CAST(0x07F01EB56D7D9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (14, N'592d8bc1-d8d5-4b28-befb-0118c87e6eaf', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'Children’s upbringing and schooling', N'Children’s upbringing and schooling', 1, 0, CAST(0x07602BB56D7D9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (15, N'592d8bc1-d8d5-4b28-befb-0118c87e6eaf', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'', N'Group culture and rules', 0, 0, CAST(0x07772BB56D7D9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (16, N'592d8bc1-d8d5-4b28-befb-0118c87e6eaf', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'It has a biggest city in the world', N'The Japanese philosophy and religion ', 0, 0, CAST(0x07AD2BB56D7D9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (17, N'7b61ce49-51b0-418f-b6dc-3ecf8484027e', N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'20.000$', N'59.000$', 0, 0, CAST(0x077C52DA957D9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (18, N'7b61ce49-51b0-418f-b6dc-3ecf8484027e', N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'Writer and Author', N'Financial Manager', 0, 0, CAST(0x07A952DA957D9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (19, N'7b61ce49-51b0-418f-b6dc-3ecf8484027e', N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'Jobs that get highest paid', N'Jobs that get highest paid', 1, 0, CAST(0x07B652DA957D9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (20, N'7b61ce49-51b0-418f-b6dc-3ecf8484027e', N'2b41e104-aae6-4a00-a0ba-847760647766', N'Hotel Manager', N'Public Relation Specialist', 0, 0, CAST(0x07F352DA957D9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (21, N'7b61ce49-51b0-418f-b6dc-3ecf8484027e', N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'Medical Call Center', N'Medical Call Center', 1, 0, CAST(0x07FC52DA957D9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (22, N'7975a19b-a680-463b-9976-7569cac66148', N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'', N'59.000$', 0, 0, CAST(0x07D86F7CA97D9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (23, N'7975a19b-a680-463b-9976-7569cac66148', N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'', N'Financial Manager', 0, 0, CAST(0x07E46F7CA97D9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (24, N'7975a19b-a680-463b-9976-7569cac66148', N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'', N'Jobs that get highest paid', 0, 0, CAST(0x07E86F7CA97D9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (25, N'7975a19b-a680-463b-9976-7569cac66148', N'2b41e104-aae6-4a00-a0ba-847760647766', N'', N'Public Relation Specialist', 0, 0, CAST(0x07EB6F7CA97D9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (26, N'7975a19b-a680-463b-9976-7569cac66148', N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'', N'Medical Call Center', 0, 0, CAST(0x07EE6F7CA97D9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (27, N'97cc4df5-9fb7-45d1-a612-e3d53587d79a', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'', N'The Japanese people', 0, 0, CAST(0x073EF23B727E9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (28, N'97cc4df5-9fb7-45d1-a612-e3d53587d79a', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'', N'The Japanese philosophy and religion ', 0, 0, CAST(0x070EF93B727E9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (29, N'97cc4df5-9fb7-45d1-a612-e3d53587d79a', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'', N'Group culture and rules', 0, 0, CAST(0x0725F93B727E9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (30, N'97cc4df5-9fb7-45d1-a612-e3d53587d79a', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'', N'Children’s upbringing and schooling', 0, 0, CAST(0x0772F93B727E9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (31, N'7f1dbf11-2ee0-47ba-a634-8a73359a280d', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'', N'The Japanese people', 0, 0, CAST(0x073682EB0D7F9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (32, N'7f1dbf11-2ee0-47ba-a634-8a73359a280d', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'', N'The Japanese philosophy and religion ', 0, 0, CAST(0x074D82EB0D7F9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (33, N'7f1dbf11-2ee0-47ba-a634-8a73359a280d', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'', N'Group culture and rules', 0, 0, CAST(0x075382EB0D7F9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (34, N'7f1dbf11-2ee0-47ba-a634-8a73359a280d', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'', N'Children’s upbringing and schooling', 0, 0, CAST(0x077382EB0D7F9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (35, N'f659195e-710c-4812-8cbd-5222166234b4', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'', N'The Japanese people', 0, 0, CAST(0x07145BFC9E7F9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (36, N'f659195e-710c-4812-8cbd-5222166234b4', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'', N'The Japanese philosophy and religion ', 0, 0, CAST(0x07245BFC9E7F9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (37, N'f659195e-710c-4812-8cbd-5222166234b4', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'', N'Group culture and rules', 0, 0, CAST(0x072B5BFC9E7F9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (38, N'f659195e-710c-4812-8cbd-5222166234b4', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'', N'Children’s upbringing and schooling', 0, 0, CAST(0x07415BFC9E7F9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (39, N'8f46299d-f54b-4b58-875d-373fbf2f44f0', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'', N'The Japanese people', 0, 0, CAST(0x079FD218D97F9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (40, N'8f46299d-f54b-4b58-875d-373fbf2f44f0', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'', N'The Japanese philosophy and religion ', 0, 0, CAST(0x07ACD218D97F9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (41, N'8f46299d-f54b-4b58-875d-373fbf2f44f0', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'', N'Group culture and rules', 0, 0, CAST(0x07AFD218D97F9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (42, N'8f46299d-f54b-4b58-875d-373fbf2f44f0', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'', N'Children’s upbringing and schooling', 0, 0, CAST(0x07CFD218D97F9E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (43, N'86e02b0c-de71-4a68-a2b1-472e8e9721fd', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'', N'The Japanese people', 0, 0, CAST(0x077DD21D3C809E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (44, N'86e02b0c-de71-4a68-a2b1-472e8e9721fd', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'', N'The Japanese philosophy and religion ', 0, 0, CAST(0x078DD21D3C809E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (45, N'86e02b0c-de71-4a68-a2b1-472e8e9721fd', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'', N'Group culture and rules', 0, 0, CAST(0x07EAD21D3C809E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (46, N'86e02b0c-de71-4a68-a2b1-472e8e9721fd', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'', N'Children’s upbringing and schooling', 0, 0, CAST(0x0704D31D3C809E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (47, N'53e8551f-8bed-4e1a-8de0-18ea0f758146', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'', N'The Japanese people', 0, 0, CAST(0x07F4035C7A809E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (48, N'53e8551f-8bed-4e1a-8de0-18ea0f758146', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'', N'The Japanese philosophy and religion ', 0, 0, CAST(0x0704045C7A809E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (49, N'53e8551f-8bed-4e1a-8de0-18ea0f758146', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'', N'Group culture and rules', 0, 0, CAST(0x0707045C7A809E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (50, N'53e8551f-8bed-4e1a-8de0-18ea0f758146', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'', N'Children’s upbringing and schooling', 0, 0, CAST(0x072A045C7A809E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (51, N'cc569256-17a3-4ade-b3ee-f389ff439547', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'Crime', N'The Japanese people', 0, 0, CAST(0x0713348688809E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (52, N'cc569256-17a3-4ade-b3ee-f389ff439547', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'It has a biggest city in the world', N'The Japanese philosophy and religion ', 0, 0, CAST(0x07753E8688809E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (53, N'cc569256-17a3-4ade-b3ee-f389ff439547', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'Group culture and rules', N'Group culture and rules', 1, 0, CAST(0x07A83E8688809E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (54, N'cc569256-17a3-4ade-b3ee-f389ff439547', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'Children’s upbringing and schooling', N'Children’s upbringing and schooling', 1, 0, CAST(0x07B53E8688809E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (55, N'828805ee-53f2-46d8-85ac-59ab4b816e1c', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'Crime', N'The Japanese people', 0, 0, CAST(0x073B447AF5819E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (56, N'828805ee-53f2-46d8-85ac-59ab4b816e1c', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'It has a biggest city in the world', N'The Japanese philosophy and religion ', 0, 0, CAST(0x07D2954826839E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (57, N'828805ee-53f2-46d8-85ac-59ab4b816e1c', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'Group culture and rules', N'Group culture and rules', 1, 0, CAST(0x07BAAA4826839E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (58, N'828805ee-53f2-46d8-85ac-59ab4b816e1c', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'They judge you negatively if you have worng behaviour', N'Children’s upbringing and schooling', 0, 0, CAST(0x07DDAA4826839E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (59, N'e22110cb-e8f0-4e1b-8833-a99e224a5df8', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'Crime', N'The Japanese people', 0, 0, CAST(0x07FC67B07E839E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (60, N'e22110cb-e8f0-4e1b-8833-a99e224a5df8', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'It has a biggest city in the world', N'The Japanese philosophy and religion ', 0, 0, CAST(0x0771871085839E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (61, N'e22110cb-e8f0-4e1b-8833-a99e224a5df8', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'Group culture and rules', N'Group culture and rules', 1, 0, CAST(0x07BB871085839E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (62, N'e22110cb-e8f0-4e1b-8833-a99e224a5df8', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'They judge you negatively if you have worng behaviour', N'Children’s upbringing and schooling', 0, 0, CAST(0x0758881085839E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (63, N'0bf2b814-b25a-4678-93a3-4345a1324117', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'', N'The Japanese people', 0, 0, CAST(0x07C71E4C01849E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (64, N'0bf2b814-b25a-4678-93a3-4345a1324117', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'', N'The Japanese philosophy and religion ', 0, 0, CAST(0x07DA1E4C01849E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (65, N'0bf2b814-b25a-4678-93a3-4345a1324117', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'', N'Group culture and rules', 0, 0, CAST(0x07DD1E4C01849E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (66, N'0bf2b814-b25a-4678-93a3-4345a1324117', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'', N'Children’s upbringing and schooling', 0, 0, CAST(0x0741204C01849E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1013, N'4646a65f-8aa8-4ff0-a739-55192f17f54d', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'', N'The Japanese people', 0, 0, CAST(0x07F97B8464859E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1014, N'4646a65f-8aa8-4ff0-a739-55192f17f54d', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'', N'The Japanese philosophy and religion ', 0, 0, CAST(0x07DC818464859E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1015, N'4646a65f-8aa8-4ff0-a739-55192f17f54d', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'', N'Group culture and rules', 0, 0, CAST(0x07E6818464859E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1016, N'4646a65f-8aa8-4ff0-a739-55192f17f54d', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'', N'Children’s upbringing and schooling', 0, 0, CAST(0x070C828464859E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1017, N'b95cbe59-b1da-496a-a81d-8822d799a1a9', N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'How to make a lot of money', N'Jobs that get highest paid', 0, 0, CAST(0x07E32AE26E859E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1018, N'b95cbe59-b1da-496a-a81d-8822d799a1a9', N'2b41e104-aae6-4a00-a0ba-847760647766', N'Public Speaking', N'Public Relation Specialist', 0, 0, CAST(0x076037E26E859E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1019, N'b95cbe59-b1da-496a-a81d-8822d799a1a9', N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'50.000$', N'59.000$', 0, 0, CAST(0x077037E26E859E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1020, N'b95cbe59-b1da-496a-a81d-8822d799a1a9', N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'Medical Call Center', N'Medical Call Center', 1, 0, CAST(0x077637E26E859E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1021, N'b95cbe59-b1da-496a-a81d-8822d799a1a9', N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'Writer and Author', N'Financial Manager', 0, 0, CAST(0x078037E26E859E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1022, N'02043fb3-4c6b-43d0-915a-f4470fc3fa72', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'School', N'The Japanese people', 0, 0, CAST(0x072954065CB39E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1023, N'02043fb3-4c6b-43d0-915a-f4470fc3fa72', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'It has a biggest city in the world', N'The Japanese philosophy and religion ', 0, 0, CAST(0x07086C065CB39E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1024, N'02043fb3-4c6b-43d0-915a-f4470fc3fa72', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'It has few foreigners among local people', N'Group culture and rules', 0, 0, CAST(0x07256C065CB39E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1025, N'02043fb3-4c6b-43d0-915a-f4470fc3fa72', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'', N'Children’s upbringing and schooling', 0, 0, CAST(0x07C16C065CB39E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1026, N'02043fb3-4c6b-43d0-915a-f4470fc3fa72', N'0483578f-5007-4d2e-bd5d-f3466b165d89', N'', N'Treat everyone equally', 0, 0, CAST(0x07D16C065CB39E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1027, N'8a832a22-915c-43a3-a8eb-c50ba01cf03f', N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'The Japanese people', N'The Japanese people', 1, 0, CAST(0x07E6297680B39E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1028, N'8a832a22-915c-43a3-a8eb-c50ba01cf03f', N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'The Japanese philosophy and religion ', N'The Japanese philosophy and religion ', 1, 0, CAST(0x070B2A7680B39E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1029, N'8a832a22-915c-43a3-a8eb-c50ba01cf03f', N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'', N'Group culture and rules', 0, 0, CAST(0x07172A7680B39E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1030, N'8a832a22-915c-43a3-a8eb-c50ba01cf03f', N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'', N'Children’s upbringing and schooling', 0, 0, CAST(0x07342A7680B39E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1031, N'8a832a22-915c-43a3-a8eb-c50ba01cf03f', N'0483578f-5007-4d2e-bd5d-f3466b165d89', N'', N'Treat everyone equally', 0, 0, CAST(0x07382A7680B39E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1032, N'875ea57e-794f-4d12-b0ab-fbd49b875e57', N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'Places to travel', N'Jobs that get highest paid', 0, 0, CAST(0x07B01D3ADBB39E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1033, N'875ea57e-794f-4d12-b0ab-fbd49b875e57', N'2b41e104-aae6-4a00-a0ba-847760647766', N'', N'Public Relation Specialist', 0, 0, CAST(0x07EA1D3ADBB39E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1034, N'875ea57e-794f-4d12-b0ab-fbd49b875e57', N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'50.000$', N'59.000$', 0, 0, CAST(0x07F21D3ADBB39E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1035, N'875ea57e-794f-4d12-b0ab-fbd49b875e57', N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'', N'Medical Call Center', 0, 0, CAST(0x07FE1D3ADBB39E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1036, N'875ea57e-794f-4d12-b0ab-fbd49b875e57', N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'', N'Financial Manager', 0, 0, CAST(0x07021E3ADBB39E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1037, N'ea82e2c3-73b8-4047-8d70-c3a1c976875a', N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'Jobs that get highest paid', N'Jobs that get highest paid', 1, 0, CAST(0x078DE2FE75B49E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1038, N'ea82e2c3-73b8-4047-8d70-c3a1c976875a', N'2b41e104-aae6-4a00-a0ba-847760647766', N'Hotel Manager', N'Public Relation Specialist', 0, 0, CAST(0x07BAE2FE75B49E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1039, N'ea82e2c3-73b8-4047-8d70-c3a1c976875a', N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'59.000$', N'59.000$', 1, 0, CAST(0x07C6E2FE75B49E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1040, N'ea82e2c3-73b8-4047-8d70-c3a1c976875a', N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'', N'Medical Call Center', 0, 0, CAST(0x07D2E2FE75B49E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1041, N'ea82e2c3-73b8-4047-8d70-c3a1c976875a', N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'', N'Financial Manager', 0, 0, CAST(0x07DBE2FE75B49E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1042, N'c6e22d0d-d7a3-498e-bdad-16c32a44d774', N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'', N'Jobs that get highest paid', 0, 0, CAST(0x07AD8413D7B69E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1043, N'c6e22d0d-d7a3-498e-bdad-16c32a44d774', N'2b41e104-aae6-4a00-a0ba-847760647766', N'', N'Public Relation Specialist', 0, 0, CAST(0x07C28413D7B69E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1044, N'c6e22d0d-d7a3-498e-bdad-16c32a44d774', N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'', N'59.000$', 0, 0, CAST(0x07C68413D7B69E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1045, N'c6e22d0d-d7a3-498e-bdad-16c32a44d774', N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'The School Office', N'Medical Call Center', 0, 0, CAST(0x07CA8413D7B69E3E0B AS DateTime2), N'admin', NULL, NULL)
GO
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1046, N'c6e22d0d-d7a3-498e-bdad-16c32a44d774', N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'Financial Manager', N'Financial Manager', 1, 0, CAST(0x07E78413D7B69E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1047, N'df12fc43-0794-44dc-b79b-31b6f00ab7b7', N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'Places to travel', N'Jobs that get highest paid', 0, 0, CAST(0x079B3BF318B79E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1048, N'df12fc43-0794-44dc-b79b-31b6f00ab7b7', N'2b41e104-aae6-4a00-a0ba-847760647766', N'Hotel Manager', N'Public Relation Specialist', 0, 0, CAST(0x07D93BF318B79E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1049, N'df12fc43-0794-44dc-b79b-31b6f00ab7b7', N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'29.000$', N'59.000$', 0, 0, CAST(0x07E93BF318B79E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1050, N'df12fc43-0794-44dc-b79b-31b6f00ab7b7', N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'Restaurant', N'Medical Call Center', 0, 0, CAST(0x07FA3BF318B79E3E0B AS DateTime2), N'admin', NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1051, N'df12fc43-0794-44dc-b79b-31b6f00ab7b7', N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'Writer and Author', N'Financial Manager', 0, 0, CAST(0x07063CF318B79E3E0B AS DateTime2), N'admin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Test.ExamQuestionDetail] OFF
SET IDENTITY_INSERT [dbo].[Test.ExamStructure] ON 

INSERT [dbo].[Test.ExamStructure] ([StructureId], [StructureName], [QuestionLineId], [VideoLineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (8, N'Dan giải thích lời thoại trong phim', N'5;6;7;8', 49, 0, CAST(0x07107996DA789E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.ExamStructure] ([StructureId], [StructureName], [QuestionLineId], [VideoLineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (9, N'5 Reasons Why The Japanese Are So Polite', N'5;6;7;8;9', 75, 0, CAST(0x0730AADFE0789E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.ExamStructure] ([StructureId], [StructureName], [QuestionLineId], [VideoLineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (10, N'10 Countries Where You Can Start A New Life', N'10;11;12;13;14', 76, 0, CAST(0x07D06A4100799E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.ExamStructure] ([StructureId], [StructureName], [QuestionLineId], [VideoLineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (11, N'10 Famous People Who Were Homeless', N'15;16;17;18;19', 77, 0, CAST(0x07B0020312799E3E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.ExamStructure] ([StructureId], [StructureName], [QuestionLineId], [VideoLineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (12, N'10 Highest Paid Jobs You Can Do From Home', N'20;21;22;23;24', 78, 0, CAST(0x07200F8423799E3E0B AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Test.ExamStructure] OFF
SET IDENTITY_INSERT [dbo].[Test.Question] ON 

INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (16, N'486ae504-77bd-47d1-9d41-1d3f3f1a747e', N'What was Jewel’s job at that time?', N'Singer and songwriter', NULL, N'rMrZJEuyOCw', 2, 0, CAST(0x07E0F70577559E3E0B AS DateTime2), N'admin', CAST(0x07E0F70577559E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (5, N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'What is the main idea of the video?', N'The Japanese people', NULL, N'Jio_hWFv1q4&t=265s', 1, 0, CAST(0x07E0F70577559E3E0B AS DateTime2), N'admin', CAST(0x07E0F70577559E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (22, N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'What is the median salary of Post-Secondary Teacher?', N'59.000$', NULL, N'wTjCyjmhwo8', 3, 0, CAST(0x07E0F70577559E3E0B AS DateTime2), N'admin', CAST(0x07E0F70577559E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (24, N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'What is the 2nd highest paid jon on the list?', N'Financial Manager', NULL, N'wTjCyjmhwo8', 5, 0, CAST(0x07E0F70577559E3E0B AS DateTime2), N'admin', CAST(0x07E0F70577559E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (11, N'86780226-5ac6-4ea2-9780-5666073711ac', N'The 3rd country that is mentioned on the video is that', N'HongKong', NULL, N'-Blsz2JbdgM', 2, 0, CAST(0x07E0F70577559E3E0B AS DateTime2), N'admin', CAST(0x07E0F70577559E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (18, N'5aa813cf-f365-4263-b1c6-61b42e24173d', N'Where was Jennifer Lopez born?', N'Bronx', NULL, N'rMrZJEuyOCw', 4, 0, CAST(0x07E0F70577559E3E0B AS DateTime2), N'admin', CAST(0x07E0F70577559E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (20, N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'What is the main point of the video clip?', N'Jobs that get highest paid', NULL, N'wTjCyjmhwo8', 1, 0, CAST(0x07E0F70577559E3E0B AS DateTime2), N'admin', CAST(0x07E0F70577559E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (10, N'96478619-72d4-4ccd-8658-785ad0d07c19', N'What is the topic of the video?', N'Place to start a new life', NULL, N'-Blsz2JbdgM', 1, 0, CAST(0x07E0F70577559E3E0B AS DateTime2), N'admin', CAST(0x07E0F70577559E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (19, N'd88b709b-51d5-47dc-b30f-8230c4a129fe', N'Jim Carrey is known as?', N'One of the best-known comedians', NULL, N'rMrZJEuyOCw', 5, 0, CAST(0x07E0F70577559E3E0B AS DateTime2), N'admin', CAST(0x07E0F70577559E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (21, N'2b41e104-aae6-4a00-a0ba-847760647766', N'What is the 8th highest paid job?', N'Public Relation Specialist', NULL, N'wTjCyjmhwo8', 2, 0, CAST(0x07E0F70577559E3E0B AS DateTime2), N'admin', CAST(0x07E0F70577559E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (8, N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'The 3rd reason', N'Children’s upbringing and schooling', NULL, N'Jio_hWFv1q4&t=265s', 4, 0, CAST(0x07E0F70577559E3E0B AS DateTime2), N'admin', CAST(0x07E0F70577559E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (23, N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'Where else can Gisterd Nurse work beside a hospotal?', N'Medical Call Center', NULL, N'wTjCyjmhwo8', 4, 0, CAST(0x07E0F70577559E3E0B AS DateTime2), N'admin', CAST(0x07E0F70577559E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (17, N'f462318e-bd21-4c88-925e-c653a04c8765', N'What made Steve Job was so famous at that time?', N'Created many amazing technologies that have changed millions of lives', NULL, N'rMrZJEuyOCw', 3, 0, CAST(0x07E0F70577559E3E0B AS DateTime2), N'admin', CAST(0x07E0F70577559E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (14, N'ee27b26b-a232-4687-97f3-cceaed0c19c8', N'Which country has high crime rate compare to others?', N'Jamaica', NULL, N'-Blsz2JbdgM', 5, 0, CAST(0x07E0F70577559E3E0B AS DateTime2), N'admin', CAST(0x07E0F70577559E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (12, N'4d06cbff-22b4-443e-8182-ceb0c999cc8e', N'What is the country having no income tax?', N'Bahamas', NULL, N'-Blsz2JbdgM', 3, 0, CAST(0x07E0F70577559E3E0B AS DateTime2), N'admin', CAST(0x07E0F70577559E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (13, N'791fb977-8e9e-4a73-a66d-d4a33e8ee5a3', N'Why is Mexico worth to start a new life?', N'Warm beautiful weather and people are very friendly. ', NULL, N'-Blsz2JbdgM', 4, 0, CAST(0x07E0F70577559E3E0B AS DateTime2), N'admin', CAST(0x07E0F70577559E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (7, N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'The 2nd reason', N'Group culture and rules', NULL, N'Jio_hWFv1q4&t=265s', 3, 0, CAST(0x07E0F70577559E3E0B AS DateTime2), N'admin', CAST(0x07E0F70577559E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (9, N'0483578f-5007-4d2e-bd5d-f3466b165d89', N'The 4th reason', N'Treat everyone equally', NULL, N'hdZK22pR5nU', 5, 0, CAST(0x07E0F70577559E3E0B AS DateTime2), N'admin', CAST(0x07E0F70577559E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (6, N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'The 1st reason which shows that The Japanese are polite', N'The Japanese philosophy and religion ', NULL, N'Jio_hWFv1q4&t=265s', 2, 0, CAST(0x07E0F70577559E3E0B AS DateTime2), N'admin', CAST(0x07E0F70577559E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.Question] ([LineId], [QuestionId], [QuestionName], [Answer], [AnswerExplain], [VideoId], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (15, N'a854feff-8781-4edb-a2fe-fe69a2272e4d', N'What is the video talking about?', N'10 famous people', NULL, N'rMrZJEuyOCw', 1, 0, CAST(0x07E0F70577559E3E0B AS DateTime2), N'admin', CAST(0x07E0F70577559E3E0B AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Test.Question] OFF
SET IDENTITY_INSERT [dbo].[Test.QuestionDetail] ON 

INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (17, N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'Crime', 1, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (18, N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'School', 2, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (19, N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'The Weather', 3, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (20, N'71dc442c-9657-4b09-a7e1-1e73d32e4f21', N'The Japanese people', 4, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (21, N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'The Japanese philosophy and religion ', 1, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (22, N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'It has a biggest city in the world', 2, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (23, N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'There’re lots of famous school', 3, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (24, N'e2cab6e2-e7d1-4f3a-bb33-fa91ee5cc7f3', N'People are very friendly', 4, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (25, N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'It has a high density of people', 1, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (26, N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'People are obedient', 2, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (27, N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'Group culture and rules', 3, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (28, N'3a88f175-47c7-4a79-9b49-d9fa5427415f', N'It has few foreigners among local people', 4, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (29, N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'It has similar cluture values', 1, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (30, N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'It’s defined as one culture one civilization', 2, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (31, N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'Children’s upbringing and schooling', 3, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (32, N'dfd964bc-ee9d-47ea-b71f-9962d9199ba8', N'They judge you negatively if you have worng behaviour', 4, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (33, N'0483578f-5007-4d2e-bd5d-f3466b165d89', N'They have been taught strictly from a young', 1, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (34, N'0483578f-5007-4d2e-bd5d-f3466b165d89', N'The japanese parents', 2, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (35, N'0483578f-5007-4d2e-bd5d-f3466b165d89', N'The Japanese school', 3, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (36, N'0483578f-5007-4d2e-bd5d-f3466b165d89', N'Treat everyone equally', 4, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (37, N'96478619-72d4-4ccd-8658-785ad0d07c19', N'Place to start a new life', 1, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (38, N'96478619-72d4-4ccd-8658-785ad0d07c19', N'Changing life’s style', 2, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (39, N'96478619-72d4-4ccd-8658-785ad0d07c19', N'Finding a new job', 3, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (40, N'96478619-72d4-4ccd-8658-785ad0d07c19', N'Traveling', 4, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (41, N'86780226-5ac6-4ea2-9780-5666073711ac', N'Singapore', 1, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (42, N'86780226-5ac6-4ea2-9780-5666073711ac', N'Mexico', 2, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (43, N'86780226-5ac6-4ea2-9780-5666073711ac', N'HongKong', 3, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (44, N'86780226-5ac6-4ea2-9780-5666073711ac', N'America', 4, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (45, N'4d06cbff-22b4-443e-8182-ceb0c999cc8e', N'United Arab', 1, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (46, N'4d06cbff-22b4-443e-8182-ceb0c999cc8e', N'Dubai', 2, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (47, N'4d06cbff-22b4-443e-8182-ceb0c999cc8e', N'Indonesia', 3, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (48, N'4d06cbff-22b4-443e-8182-ceb0c999cc8e', N'Bahamas', 4, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (49, N'791fb977-8e9e-4a73-a66d-d4a33e8ee5a3', N'Warm beautiful weather and people are very friendly', 1, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (50, N'791fb977-8e9e-4a73-a66d-d4a33e8ee5a3', N'The salary is much higher than the others', 2, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (51, N'791fb977-8e9e-4a73-a66d-d4a33e8ee5a3', N'The crime rate is low compared to other places', 3, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (52, N'791fb977-8e9e-4a73-a66d-d4a33e8ee5a3', N'Transport business is amazing', 4, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (53, N'ee27b26b-a232-4687-97f3-cceaed0c19c8', N'Bermuda', 1, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (54, N'ee27b26b-a232-4687-97f3-cceaed0c19c8', N'Jamaica', 2, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (55, N'ee27b26b-a232-4687-97f3-cceaed0c19c8', N'Monaco', 3, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (56, N'ee27b26b-a232-4687-97f3-cceaed0c19c8', N'Japan', 4, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (57, N'a854feff-8781-4edb-a2fe-fe69a2272e4d', N'Revolutional technologies', 1, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (58, N'a854feff-8781-4edb-a2fe-fe69a2272e4d', N'Steve Job', 2, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (59, N'a854feff-8781-4edb-a2fe-fe69a2272e4d', N'10 famous people', 3, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (60, N'a854feff-8781-4edb-a2fe-fe69a2272e4d', N'Homeless people', 4, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (61, N'486ae504-77bd-47d1-9d41-1d3f3f1a747e', N'Singer and songwriter', 1, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (62, N'486ae504-77bd-47d1-9d41-1d3f3f1a747e', N'Cashier', 2, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (63, N'486ae504-77bd-47d1-9d41-1d3f3f1a747e', N'Manager', 3, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (64, N'486ae504-77bd-47d1-9d41-1d3f3f1a747e', N'Actress', 4, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (65, N'f462318e-bd21-4c88-925e-c653a04c8765', N'Droped University to follow his dream', 1, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (66, N'f462318e-bd21-4c88-925e-c653a04c8765', N'CEO of the Apple Cop', 2, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (67, N'f462318e-bd21-4c88-925e-c653a04c8765', N'Created many amazing technologies that have changed millions of lives', 3, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (68, N'f462318e-bd21-4c88-925e-c653a04c8765', N'Made millions of dolars', 4, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (69, N'5aa813cf-f365-4263-b1c6-61b42e24173d', N'California', 1, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (70, N'5aa813cf-f365-4263-b1c6-61b42e24173d', N'Bronx', 2, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (71, N'5aa813cf-f365-4263-b1c6-61b42e24173d', N'Texas', 3, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (72, N'5aa813cf-f365-4263-b1c6-61b42e24173d', N'Mexico', 4, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (73, N'd88b709b-51d5-47dc-b30f-8230c4a129fe', N'One of the best-known comedians', 1, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (74, N'd88b709b-51d5-47dc-b30f-8230c4a129fe', N'The brilliant director', 2, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (75, N'd88b709b-51d5-47dc-b30f-8230c4a129fe', N'The best seller', 3, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (76, N'd88b709b-51d5-47dc-b30f-8230c4a129fe', N'A good doctor', 4, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (77, N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'Places to travel', 1, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (78, N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'Jobs that get highest paid', 2, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (79, N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'How to make a lot of money', 3, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (80, N'7fb4fb56-7ed4-4d07-83e9-653c691cd772', N'How to build a brand', 4, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (81, N'2b41e104-aae6-4a00-a0ba-847760647766', N'Public Relation Specialist', 1, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (82, N'2b41e104-aae6-4a00-a0ba-847760647766', N'Public Speaking', 2, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (83, N'2b41e104-aae6-4a00-a0ba-847760647766', N'Hotel Manager', 3, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (84, N'2b41e104-aae6-4a00-a0ba-847760647766', N'CEO', 4, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (85, N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'20.000$', 1, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (86, N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'29.000$', 2, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (87, N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'59.000$', 3, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (88, N'8156cc28-513d-4f9b-96c6-1fe7318ad5c4', N'50.000$', 4, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (89, N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'Restaurant', 1, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (90, N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'Medical Call Center', 2, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (91, N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'The School Office', 3, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (92, N'ff0a38b8-0ad3-45e9-a4d4-b70d6ba05df6', N'University', 4, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (93, N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'Tax Preparer', 1, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (94, N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'Graphic Designer', 2, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (95, N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'Writer and Author', 3, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (96, N'23b370a9-e4f8-46ed-b5a0-39f22a419a14', N'Financial Manager', 4, 0, CAST(0x07C005511E759E3E0B AS DateTime2), N'admin', CAST(0x07C005511E759E3E0B AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Test.QuestionDetail] OFF
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
USE [master]
GO
ALTER DATABASE [DB_HomeStudy] SET  READ_WRITE 
GO
