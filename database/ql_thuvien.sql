drop database ql_thuvien
go

create database ql_thuvien
go

use ql_thuvien
go

CREATE TABLE [category] (
  [categoryID] varchar(20) PRIMARY KEY,
  [name] nvarchar(100) NOT NULL
)
GO

CREATE TABLE [book] (
  [bookID] varchar(20) PRIMARY KEY,
  [title] nvarchar(200) NOT NULL,
  [categoryID] varchar(20),
  [url] varchar(256)
)
GO

CREATE TABLE [book_author] (
  [bookID] varchar(20),
  [authorID] varchar(20),
  PRIMARY KEY ([bookID], [authorID])
)
GO

CREATE TABLE [author] (
  [authorID] varchar(20) PRIMARY KEY,
  [name] nvarchar(100) NOT NULL
)
GO

CREATE TABLE [waitlist] (
  [patronID] varchar(20),
  [bookID] varchar(20),
  PRIMARY KEY ([patronID], [bookID])
)
GO

CREATE TABLE [patron_account] (
  [patronID] varchar(20) PRIMARY KEY,
  [firstName] nvarchar(50) NOT NULL,
  [lastName] nvarchar(50) NOT NULL,
  [email] varchar(50) UNIQUE,
  [pass] varchar(200) NOT NULL,
  [status] varchar(10) DEFAULT 'offline'
)
GO

CREATE TABLE [bookCopy] (
  [bookCopyID] varchar(40) PRIMARY KEY,
  [yearPublished] int NOT NULL,
  [bookID] varchar(20),
  [publisherID] varchar(20)
)
GO

CREATE TABLE [checkout] (
  [checkoutID] varchar(20) PRIMARY KEY,
  [startTime] datetime,
  [endTime] datetime,
  [patronID] varchar(20),
  [bookCopyID] varchar(40),
  [isReturn] bit
)
GO

CREATE TABLE [publisher] (
  [publisherID] varchar(20) PRIMARY KEY,
  [name] nvarchar(200) NOT NULL
)
GO

CREATE TABLE [notification] (
  [noteID] varchar(40) PRIMARY KEY,
  [sentAt] date,
  [type] varchar(20) NOT NULL,
  [patronID] varchar(20)
)
GO

ALTER TABLE [notification] ADD FOREIGN KEY ([patronID]) REFERENCES [patron_account] ([patronID])
GO

ALTER TABLE [bookCopy] ADD FOREIGN KEY ([publisherID]) REFERENCES [publisher] ([publisherID])
GO

ALTER TABLE [checkout] ADD FOREIGN KEY ([bookCopyID]) REFERENCES [bookCopy] ([bookCopyID])
GO

ALTER TABLE [checkout] ADD FOREIGN KEY ([patronID]) REFERENCES [patron_account] ([patronID])
GO

ALTER TABLE [bookCopy] ADD FOREIGN KEY ([bookID]) REFERENCES [book] ([bookID])
GO

ALTER TABLE [waitlist] ADD FOREIGN KEY ([patronID]) REFERENCES [patron_account] ([patronID])
GO

ALTER TABLE [waitlist] ADD FOREIGN KEY ([bookID]) REFERENCES [book] ([bookID])
GO

ALTER TABLE [book] ADD FOREIGN KEY ([categoryID]) REFERENCES [category] ([categoryID])
GO

ALTER TABLE [book_author] ADD FOREIGN KEY ([authorID]) REFERENCES [author] ([authorID])
GO

ALTER TABLE [book_author] ADD FOREIGN KEY ([bookID]) REFERENCES [book] ([bookID])
GO
