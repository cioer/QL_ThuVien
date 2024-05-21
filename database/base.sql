CREATE TABLE [category] (
  [categoryID] varchar(20) PRIMARY KEY,
  [name] nvarchar(100)
)
GO

CREATE TABLE [book] (
  [bookID] varchar(20) PRIMARY KEY,
  [title] nvarchar(200),
  [catetgoryID] varchar(20)
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
  [name] nvarchar(100)
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
  [firstName] nvarchar(50),
  [lastName] nvarchar(50),
  [email] varchar(50) UNIQUE,
  [status] varchar(10)
)
GO

CREATE TABLE [bookCopy] (
  [bookCopyID] varchar(40) PRIMARY KEY,
  [yearPublished] int,
  [bookID] varchar(20),
  [publisherID] varchar(20)
)
GO

CREATE TABLE [checkout] (
  [checkoutID] varchar(20) PRIMARY KEY,
  [startTime] timestamp,
  [endTime] timestamp,
  [patronID] varchar(20),
  [bookCopyID] varchar(40),
  [isReturn] bool
)
GO

CREATE TABLE [publisher] (
  [publisherID] varchar(20) PRIMARY KEY,
  [name] nvarchar(200)
)
GO

CREATE TABLE [notification] (
  [noteID] varchar(40) PRIMARY KEY,
  [sentAt] timestamp,
  [type] varchar(20),
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

ALTER TABLE [book] ADD FOREIGN KEY ([catetgoryID]) REFERENCES [category] ([categoryID])
GO

ALTER TABLE [book_author] ADD FOREIGN KEY ([authorID]) REFERENCES [author] ([authorID])
GO

ALTER TABLE [book_author] ADD FOREIGN KEY ([bookID]) REFERENCES [book] ([bookID])
GO
