Create database GameSite;
GO
Use GameSite;
GO
--Create contact table:
CREATE TABLE [dbo].[contacts](
[visitor_email] [varchar](255) PRIMARY KEY NOT NULL,
[visitor_msg] [varchar](1500) NOT NULL
)

GO

create procedure InsertContact
@visitor_email varchar(225),
@visitor_msg varchar(1500)
as
INSERT INTO [GameSite].[dbo].[contacts]
           ([visitor_email]
           ,[visitor_msg])
     VALUES
           (@visitor_email
           ,@visitor_msg)
GO

--create signup table
CREATE TABLE [dbo].[signup](
[visitor_email] [varchar](255) PRIMARY KEY NOT NULL,
[visitor_name] [varchar](225) NOT NULL
)

GO

create procedure InsertSignup
@visitor_email varchar(225),
@visitor_name varchar(225)
as
INSERT INTO [GameSite].[dbo].[signup]
           ([visitor_email]
           ,[visitor_name])
     VALUES
           (@visitor_email
           ,@visitor_name)
GO


execute InsertContact "mickey@mouse.com", "Insert using SP from SSMS";
execute InsertSignup "mickey@mouse.com", "mickey";

select * from contacts;
select * from signup;

CREATE LOGIN [LPuser] WITH PASSWORD='Pa$$word', DEFAULT_DATABASE=[GameSite]
go
use GameSite
go
CREATE USER [LPuser] FOR LOGIN [LPuser] WITH DEFAULT_SCHEMA=[dbo]
GO
GRANT EXECUTE on InsertContact to LPuser
go
GRANT EXECUTE on InsertSignup to LPuser
go