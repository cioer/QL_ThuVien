USE [master]
GO
/****** Object:  Database [thuvien]    Script Date: 21/05/2024 11:23:06 ******/
CREATE DATABASE [thuvien]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'thuvien', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\thuvien.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'thuvien_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\thuvien_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [thuvien] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [thuvien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [thuvien] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [thuvien] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [thuvien] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [thuvien] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [thuvien] SET ARITHABORT OFF 
GO
ALTER DATABASE [thuvien] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [thuvien] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [thuvien] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [thuvien] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [thuvien] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [thuvien] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [thuvien] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [thuvien] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [thuvien] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [thuvien] SET  DISABLE_BROKER 
GO
ALTER DATABASE [thuvien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [thuvien] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [thuvien] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [thuvien] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [thuvien] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [thuvien] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [thuvien] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [thuvien] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [thuvien] SET  MULTI_USER 
GO
ALTER DATABASE [thuvien] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [thuvien] SET DB_CHAINING OFF 
GO
ALTER DATABASE [thuvien] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [thuvien] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [thuvien] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [thuvien] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [thuvien] SET QUERY_STORE = ON
GO
ALTER DATABASE [thuvien] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [thuvien]
GO
/****** Object:  Table [dbo].[author]    Script Date: 21/05/2024 11:23:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[author](
	[author_id] [varchar](10) NOT NULL,
	[author_name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_author] PRIMARY KEY CLUSTERED 
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book]    Script Date: 21/05/2024 11:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book](
	[book_id] [varchar](10) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[category_id] [varchar](10) NOT NULL,
 CONSTRAINT [PK_book] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_author]    Script Date: 21/05/2024 11:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_author](
	[book_id] [varchar](10) NOT NULL,
	[author_id] [varchar](10) NOT NULL,
 CONSTRAINT [PK_book_author] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC,
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_copy]    Script Date: 21/05/2024 11:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_copy](
	[book_copy_id] [varchar](20) NOT NULL,
	[year_published] [int] NOT NULL,
	[book_id] [varchar](10) NOT NULL,
	[publisher_id] [varchar](10) NOT NULL,
 CONSTRAINT [PK_book_copy] PRIMARY KEY CLUSTERED 
(
	[book_copy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 21/05/2024 11:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [varchar](10) NOT NULL,
	[category_name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[checkout]    Script Date: 21/05/2024 11:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[checkout](
	[checkout_id] [varchar](10) NOT NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
	[book_copy_id] [varchar](20) NOT NULL,
	[patron_account_id] [varchar](10) NOT NULL,
	[is_returned] [bit] NOT NULL,
 CONSTRAINT [PK_checkout] PRIMARY KEY CLUSTERED 
(
	[checkout_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[note]    Script Date: 21/05/2024 11:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[note](
	[note_id] [varchar](10) NOT NULL,
	[sent_at] [date] NOT NULL,
	[type] [varchar](20) NOT NULL,
	[patron_account_id] [varchar](10) NOT NULL,
 CONSTRAINT [PK_notification] PRIMARY KEY CLUSTERED 
(
	[note_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patron_account]    Script Date: 21/05/2024 11:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patron_account](
	[patron_id] [varchar](10) NOT NULL,
	[firt_name] [nvarchar](50) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_patron_account] PRIMARY KEY CLUSTERED 
(
	[patron_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publisher]    Script Date: 21/05/2024 11:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publisher](
	[publisher_id] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_publisher] PRIMARY KEY CLUSTERED 
(
	[publisher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[waitlist]    Script Date: 21/05/2024 11:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[waitlist](
	[patron_id] [varchar](10) NOT NULL,
	[book_id] [varchar](10) NOT NULL,
 CONSTRAINT [PK_waitlist] PRIMARY KEY CLUSTERED 
(
	[patron_id] ASC,
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[book]  WITH CHECK ADD  CONSTRAINT [FK_book_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[book] CHECK CONSTRAINT [FK_book_category]
GO
ALTER TABLE [dbo].[book_author]  WITH CHECK ADD  CONSTRAINT [FK_book_author_author] FOREIGN KEY([author_id])
REFERENCES [dbo].[author] ([author_id])
GO
ALTER TABLE [dbo].[book_author] CHECK CONSTRAINT [FK_book_author_author]
GO
ALTER TABLE [dbo].[book_author]  WITH CHECK ADD  CONSTRAINT [FK_book_author_book] FOREIGN KEY([book_id])
REFERENCES [dbo].[book] ([book_id])
GO
ALTER TABLE [dbo].[book_author] CHECK CONSTRAINT [FK_book_author_book]
GO
ALTER TABLE [dbo].[book_copy]  WITH CHECK ADD  CONSTRAINT [FK_book_copy_book] FOREIGN KEY([book_id])
REFERENCES [dbo].[book] ([book_id])
GO
ALTER TABLE [dbo].[book_copy] CHECK CONSTRAINT [FK_book_copy_book]
GO
ALTER TABLE [dbo].[book_copy]  WITH CHECK ADD  CONSTRAINT [FK_book_copy_publisher] FOREIGN KEY([publisher_id])
REFERENCES [dbo].[publisher] ([publisher_id])
GO
ALTER TABLE [dbo].[book_copy] CHECK CONSTRAINT [FK_book_copy_publisher]
GO
ALTER TABLE [dbo].[checkout]  WITH CHECK ADD  CONSTRAINT [FK_checkout_book_copy] FOREIGN KEY([book_copy_id])
REFERENCES [dbo].[book_copy] ([book_copy_id])
GO
ALTER TABLE [dbo].[checkout] CHECK CONSTRAINT [FK_checkout_book_copy]
GO
ALTER TABLE [dbo].[checkout]  WITH CHECK ADD  CONSTRAINT [FK_checkout_patron_account] FOREIGN KEY([patron_account_id])
REFERENCES [dbo].[patron_account] ([patron_id])
GO
ALTER TABLE [dbo].[checkout] CHECK CONSTRAINT [FK_checkout_patron_account]
GO
ALTER TABLE [dbo].[note]  WITH CHECK ADD  CONSTRAINT [FK_notification_patron_account] FOREIGN KEY([patron_account_id])
REFERENCES [dbo].[patron_account] ([patron_id])
GO
ALTER TABLE [dbo].[note] CHECK CONSTRAINT [FK_notification_patron_account]
GO
ALTER TABLE [dbo].[waitlist]  WITH CHECK ADD  CONSTRAINT [FK_waitlist_book] FOREIGN KEY([book_id])
REFERENCES [dbo].[book] ([book_id])
GO
ALTER TABLE [dbo].[waitlist] CHECK CONSTRAINT [FK_waitlist_book]
GO
ALTER TABLE [dbo].[waitlist]  WITH CHECK ADD  CONSTRAINT [FK_waitlist_patron_account] FOREIGN KEY([patron_id])
REFERENCES [dbo].[patron_account] ([patron_id])
GO
ALTER TABLE [dbo].[waitlist] CHECK CONSTRAINT [FK_waitlist_patron_account]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dùng email làm tài khoản đăng nhập' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patron_account', @level2type=N'CONSTRAINT',@level2name=N'unique_email'
GO
USE [master]
GO
ALTER DATABASE [thuvien] SET  READ_WRITE 
GO
