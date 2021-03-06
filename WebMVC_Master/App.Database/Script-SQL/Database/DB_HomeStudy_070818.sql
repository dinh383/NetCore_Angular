USE [master]
GO
/****** Object:  Database [DB_HomeStudy]    Script Date: 07/08/2018 00:09:29 ******/
CREATE DATABASE [DB_HomeStudy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tungtt_HomeStudy_Test', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.TUNG\MSSQL\DATA\tungtt_HomeStudy_Test.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'tungtt_HomeStudy_Test_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.TUNG\MSSQL\DATA\tungtt_HomeStudy_Test_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  User [bts]    Script Date: 07/08/2018 00:09:29 ******/
CREATE USER [bts] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [bts]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 07/08/2018 00:09:29 ******/
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
/****** Object:  Table [dbo].[AppUser]    Script Date: 07/08/2018 00:09:29 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 07/08/2018 00:09:29 ******/
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
/****** Object:  Table [dbo].[Course]    Script Date: 07/08/2018 00:09:29 ******/
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
/****** Object:  Table [dbo].[RegisterConsultative]    Script Date: 07/08/2018 00:09:29 ******/
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
/****** Object:  Table [dbo].[Resource.Category]    Script Date: 07/08/2018 00:09:29 ******/
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
/****** Object:  Table [dbo].[Resource.Channel]    Script Date: 07/08/2018 00:09:29 ******/
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
/****** Object:  Table [dbo].[Resource.Tag]    Script Date: 07/08/2018 00:09:29 ******/
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
/****** Object:  Table [dbo].[Resource.Video]    Script Date: 07/08/2018 00:09:29 ******/
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
/****** Object:  Table [dbo].[Resource.VideoTagDetail]    Script Date: 07/08/2018 00:09:29 ******/
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
/****** Object:  Table [dbo].[Test.AnswerWork]    Script Date: 07/08/2018 00:09:29 ******/
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
/****** Object:  Table [dbo].[Test.Exam]    Script Date: 07/08/2018 00:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test.Exam](
	[ExamId] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Test.ExamQuestionDetail]    Script Date: 07/08/2018 00:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test.ExamQuestionDetail](
	[LineId] [int] IDENTITY(1,1) NOT NULL,
	[ExamId] [int] NULL,
	[QuestionId] [int] NULL,
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
/****** Object:  Table [dbo].[Test.ExamStructure]    Script Date: 07/08/2018 00:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test.ExamStructure](
	[StructureId] [int] IDENTITY(1,1) NOT NULL,
	[StructureName] [nvarchar](300) NULL,
	[QuestionId] [nvarchar](500) NULL,
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
/****** Object:  Table [dbo].[Test.Question]    Script Date: 07/08/2018 00:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test.Question](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionName] [nvarchar](300) NULL,
	[Answer] [nvarchar](200) NULL,
	[AnswerExplain] [nvarchar](300) NULL,
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
/****** Object:  Table [dbo].[Test.QuestionDetail]    Script Date: 07/08/2018 00:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test.QuestionDetail](
	[LineId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NULL,
	[AnswerPossobolity] [nvarchar](200) NULL,
	[IsCorrect] [bit] NULL,
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
SET IDENTITY_INSERT [dbo].[Resource.Video] ON 

INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (34, N'Jio_hWFv1q4&t=265s', N'Dan giải thích lời thoại trong phim', NULL, NULL, 4, 3, 0, 0, NULL, N'https://www.youtube.com/watch?v=Jio_hWFv1q4&t=265s', N'https://www.youtube.com/embed/Jio_hWFv1q4?ecver=1', N'https://i.ytimg.com/vi_webp/Jio_hWFv1q4/maxresdefault.webp', 0, CAST(0x070000000000723E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (35, N'8NiCrmfiQCA', N'Vinglish ', NULL, NULL, 4, 3, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=8NiCrmfiQCA', N'https://www.youtube.com/embed/8NiCrmfiQCA?ecver=1', N'https://i.ytimg.com/vi_webp/8NiCrmfiQCA/maxresdefault.webp', 0, CAST(0x07E0E0FE35A5723E0B AS DateTime2), NULL, CAST(0x078F8E0DC0C67A3E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (36, N'S0POh5EUg8A', N'Hỏi đáp cùng Dan 2018', NULL, NULL, 4, 3, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=S0POh5EUg8A', N'https://www.youtube.com/embed/S0POh5EUg8A?ecver=1', N'https://i.ytimg.com/vi_webp/S0POh5EUg8A/maxresdefault.webp', 0, CAST(0x077010912EA6723E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (37, N'2dy8zyENniw', N'Những từ viết giống nhau, phát âm khác nhau', NULL, NULL, 4, 3, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=2dy8zyENniw', N'https://www.youtube.com/embed/2dy8zyENniw?ecver=1', N'https://i.ytimg.com/vi_webp/2dy8zyENniw/maxresdefault.webp', 0, CAST(0x0790372D5FA6723E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (38, N'sLc_DHalOMs', N'Tiếng Anh ngố hồi sinh', NULL, NULL, 4, 3, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=sLc_DHalOMs', N'https://www.youtube.com/embed/sLc_DHalOMs?ecver=1', N'https://i.ytimg.com/vi_webp/sLc_DHalOMs/maxresdefault.webp', 0, CAST(0x0720CE2C84A6723E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (39, N'8-ktHXX0BkI&list=PLD_5T89Ssbn37h4UPUMY3URT3JcH07QAY', N'MY TOP TIPS! Learn & Use More Phrasal Verbs | English Lesson', NULL, NULL, 5, 3, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=8-ktHXX0BkI&list=PLD_5T89Ssbn37h4UPUMY3URT3JcH07QAY', N'https://www.youtube.com/embed/8-ktHXX0BkI?list=PLD_5T89Ssbn37h4UPUMY3URT3JcH07QAY&amp;ecver=1', N'https://i.ytimg.com/vi_webp/8-ktHXX0BkI/maxresdefault.webp', 0, CAST(0x0700606C89BD723E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (40, N'TVVn9MddtmM&list=PLD_5T89Ssbn2ybbhz8OBntHJ3ckNUJEUk', N'Present Perfect Tense | Simple or Continuous? | FOR & SINCE', NULL, NULL, 5, 3, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=TVVn9MddtmM&list=PLD_5T89Ssbn2ybbhz8OBntHJ3ckNUJEUk', N'https://www.youtube.com/embed/TVVn9MddtmM?list=PLD_5T89Ssbn2ybbhz8OBntHJ3ckNUJEUk&amp;ecver=1', N'https://i.ytimg.com/vi_webp/8-ktHXX0BkI/maxresdefault.webp', 0, CAST(0x07A0BFC6D9BD723E0B AS DateTime2), NULL, CAST(0x07711BC86E54873E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (41, N'A2ncygNMaFo&list=PLD_5T89Ssbn2PrkhxV8Lh6ngEjlhqRJ-p', N'Tips To Improve Your Grammar! 👉 English Auxiliary Verbs | BE, DO & HAVE', NULL, NULL, 5, 5, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=A2ncygNMaFo&list=PLD_5T89Ssbn2PrkhxV8Lh6ngEjlhqRJ-p', N'https://www.youtube.com/embed/A2ncygNMaFo?list=PLD_5T89Ssbn2PrkhxV8Lh6ngEjlhqRJ-p&amp;ecver=1', N'https://i.ytimg.com/vi_webp/A2ncygNMaFo/maxresdefault.webp', 0, CAST(0x0710EB3E7ABE723E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (42, N'n4NVPg2kHv4', N'English Pronunciation Training | Improve Your Accent & Speak Clearly', NULL, NULL, 5, 5, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=n4NVPg2kHv4', N'https://www.youtube.com/embed/n4NVPg2kHv4?ecver=1', N'https://i.ytimg.com/vi_webp/n4NVPg2kHv4/maxresdefault.webp', 0, CAST(0x0780EB6E01BF723E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (43, N'8-ktHXX0BkI', N'MY TOP TIPS! Learn & Use More Phrasal Verbs | English Lesson', NULL, NULL, 5, 5, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=8-ktHXX0BkI', N'https://www.youtube.com/embed/8-ktHXX0BkI?ecver=1', N'https://i.ytimg.com/vi_webp/8-ktHXX0BkI/maxresdefault.webp', 0, CAST(0x07A037AFA4BF723E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (47, N'9T4KHDyAguk', N'Why can’t I speak fluent English? Stop these 7 things now– Speak fluently with confidence', N'Why can’t I speak fluent English?– Stop doing these 7 mistakes – English lesson to Speak fluently and confidently', NULL, 4, 9, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=9T4KHDyAguk', N'https://www.youtube.com/embed/9T4KHDyAguk?ecver=1', N'https://i.ytimg.com/vi_webp/9T4KHDyAguk/maxresdefault.webp', 0, CAST(0x07B9B39E4B54873E0B AS DateTime2), NULL, CAST(0x07254DD40B55873E0B AS DateTime2), NULL)
INSERT [dbo].[Resource.Video] ([LineId], [VideoID], [VideoName], [Description], [Title], [ChannelId], [CategoryId], [Views], [Likes], [UnLikes], [UrlYoutube], [UrlUseIframe], [UrlImage], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (48, N'fBnAMUkNM2k', N'LEARN ENGLISH | MUNIBA MAZARI - We all are Perfectly Imperfect (English Subtitles)', N'Learn English with Muniba Mazari in inspirational and motivational speech. Muniba Mazari is a Pakistani artist, model, activist, motivational speaker, singer, and television host. She uses a wheelchair due to injuries sustained in a car accident at the age of 21 which makes her Pakistan''s first wheelchair-using model. She is also the National Ambassador for UN Women Pakistan - Watch with English Subtitles.', NULL, 4, 9, NULL, NULL, NULL, N'https://www.youtube.com/watch?v=fBnAMUkNM2k', N'https://www.youtube.com/embed/fBnAMUkNM2k?ecver=1', N'https://i.ytimg.com/vi_webp/fBnAMUkNM2k/maxresdefault.webp', 0, CAST(0x0789CBAE5B55873E0B AS DateTime2), NULL, CAST(0x073D31638055873E0B AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Resource.Video] OFF
SET IDENTITY_INSERT [dbo].[Test.Exam] ON 

INSERT [dbo].[Test.Exam] ([ExamId], [ExamName], [UserTest], [QtyCorrect], [QtyIncorrect], [TotalScore], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1, N'Test Engilsh', N'Trần Thanh Tùng', NULL, NULL, NULL, 0, CAST(0x07E0AC1FED5B833E0B AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Test.Exam] OFF
SET IDENTITY_INSERT [dbo].[Test.ExamQuestionDetail] ON 

INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1, 1, 1, N'do', N'go', 0, 0, CAST(0x07C015841077833E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.ExamQuestionDetail] ([LineId], [ExamId], [QuestionId], [Answer], [Result], [IsCorrect], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (2, 1, 2, N'love', N'love', 1, 0, CAST(0x0760D9A11B77833E0B AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Test.ExamQuestionDetail] OFF
SET IDENTITY_INSERT [dbo].[Test.ExamStructure] ON 

INSERT [dbo].[Test.ExamStructure] ([StructureId], [StructureName], [QuestionId], [VideoLineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1, N'Test Grammer', N'1;2', 34, 0, CAST(0x0750FEB29A77833E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.ExamStructure] ([StructureId], [StructureName], [QuestionId], [VideoLineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (2, N'Test Grammer', N'1;2', 35, 0, CAST(0x0750FEB29A77833E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.ExamStructure] ([StructureId], [StructureName], [QuestionId], [VideoLineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (3, N'Test Grammer', N'1;2', 36, 0, CAST(0x0750FEB29A77833E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.ExamStructure] ([StructureId], [StructureName], [QuestionId], [VideoLineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (4, N'Test Grammer', N'1;2', 37, 0, CAST(0x0750FEB29A77833E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.ExamStructure] ([StructureId], [StructureName], [QuestionId], [VideoLineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (5, N'Test Grammer', N'1;2', 38, 0, CAST(0x0750FEB29A77833E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.ExamStructure] ([StructureId], [StructureName], [QuestionId], [VideoLineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (6, N'Test Grammer', N'1;2', 39, 0, CAST(0x0750FEB29A77833E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.ExamStructure] ([StructureId], [StructureName], [QuestionId], [VideoLineId], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (7, N'Test Grammer', N'1;2', 40, 0, CAST(0x0750FEB29A77833E0B AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Test.ExamStructure] OFF
SET IDENTITY_INSERT [dbo].[Test.Question] ON 

INSERT [dbo].[Test.Question] ([QuestionId], [QuestionName], [Answer], [AnswerExplain], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1, N'I ... to shool', N'go', N'Lời giải', 0, CAST(0x074031C81D76833E0B AS DateTime2), N'admin', NULL, N'admin')
INSERT [dbo].[Test.Question] ([QuestionId], [QuestionName], [Answer], [AnswerExplain], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (2, N'I ... you', N'love', N'Lời giải', 0, CAST(0x070076B63976833E0B AS DateTime2), N'admin', NULL, N'admin')
SET IDENTITY_INSERT [dbo].[Test.Question] OFF
SET IDENTITY_INSERT [dbo].[Test.QuestionDetail] ON 

INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [IsCorrect], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (1, 1, N'go', NULL, NULL, 0, CAST(0x0770DA1A7E76833E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [IsCorrect], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (2, 1, N'want', NULL, NULL, 0, CAST(0x07900AC68C76833E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [IsCorrect], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (3, 2, N'love', NULL, NULL, 0, CAST(0x07003FF8B076833E0B AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[Test.QuestionDetail] ([LineId], [QuestionId], [AnswerPossobolity], [IsCorrect], [Order], [Stop], [CreateDate], [CreateByUser], [UpdtDate], [UpdtByUser]) VALUES (4, 2, N'like', NULL, NULL, 0, CAST(0x0760ACC8B876833E0B AS DateTime2), NULL, NULL, NULL)
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
ALTER TABLE [dbo].[Resource.Channel] ADD  CONSTRAINT [DF_Resource.Channel_Stop]  DEFAULT ((0)) FOR [Stop]
GO
ALTER TABLE [dbo].[Resource.Channel] ADD  CONSTRAINT [DF_Resource.Channel_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
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
