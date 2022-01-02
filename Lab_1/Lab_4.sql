-- Create database Lab_4
-- Drop database Lab_4
Use Laborator_1


if exists(select *
          from sys.objects
          where object_id = object_id(N'[FK_TestRunTables_Tables]')
            and OBJECTPROPERTY(object_id, N'IsForeignKey') = 1)
ALTER TABLE [TestRunTables]
    DROP CONSTRAINT FK_TestRunTables_Tables

GO



if exists(select *
          from sys.objects
          where object_id = object_id(N'[FK_TestTables_Tables]')
            and OBJECTPROPERTY(object_id, N'IsForeignKey') = 1)
ALTER TABLE [TestTables]
    DROP CONSTRAINT FK_TestTables_Tables

GO



if exists(select *
          from sys.objects
          where object_id = object_id(N'[FK_TestRunTables_TestRuns]')
            and OBJECTPROPERTY(object_id, N'IsForeignKey') = 1)
ALTER TABLE [TestRunTables]
    DROP CONSTRAINT FK_TestRunTables_TestRuns

GO



if exists(select *
          from sys.objects
          where object_id = object_id(N'[FK_TestRunViews_TestRuns]')
            and OBJECTPROPERTY(object_id, N'IsForeignKey') = 1)
ALTER TABLE [TestRunViews]
    DROP CONSTRAINT FK_TestRunViews_TestRuns

GO



if exists(select *
          from sys.objects
          where object_id = object_id(N'[FK_TestTables_Tests]')
            and OBJECTPROPERTY(object_id, N'IsForeignKey') = 1)
ALTER TABLE [TestTables]
    DROP CONSTRAINT FK_TestTables_Tests

GO



if exists(select *
          from sys.objects
          where object_id = object_id(N'[FK_TestViews_Tests]')
            and OBJECTPROPERTY(object_id, N'IsForeignKey') = 1)
ALTER TABLE [TestViews]
    DROP CONSTRAINT FK_TestViews_Tests

GO



if exists(select *
          from sys.objects
          where object_id = object_id(N'[FK_TestRunViews_Views]')
            and OBJECTPROPERTY(object_id, N'IsForeignKey') = 1)
ALTER TABLE [TestRunViews]
    DROP CONSTRAINT FK_TestRunViews_Views

GO



if exists(select *
          from sys.objects
          where object_id = object_id(N'[FK_TestViews_Views]')
            and OBJECTPROPERTY(object_id, N'IsForeignKey') = 1)
ALTER TABLE [TestViews]
    DROP CONSTRAINT FK_TestViews_Views

GO



if exists(select *
          from sys.objects
          where object_id = object_id(N'[Tables]')
            and OBJECTPROPERTY(object_id, N'IsUserTable') = 1)
    drop table [Tables]

GO



if exists(select *
          from sys.objects
          where object_id = object_id(N'[TestRunTables]')
            and OBJECTPROPERTY(object_id, N'IsUserTable') = 1)
    drop table [TestRunTables]

GO



if exists(select *
          from sys.objects
          where object_id = object_id(N'[TestRunViews]')
            and OBJECTPROPERTY(object_id, N'IsUserTable') = 1)
    drop table [TestRunViews]

GO



if exists(select *
          from sys.objects
          where object_id = object_id(N'[TestRuns]')
            and OBJECTPROPERTY(object_id, N'IsUserTable') = 1)
    drop table [TestRuns]

GO



if exists(select *
          from sys.objects
          where object_id = object_id(N'[TestTables]')
            and OBJECTPROPERTY(object_id, N'IsUserTable') = 1)
    drop table [TestTables]

GO



if exists(select *
          from sys.objects
          where object_id = object_id(N'[TestViews]')
            and OBJECTPROPERTY(object_id, N'IsUserTable') = 1)
    drop table [TestViews]

GO



if exists(select *
          from sys.objects
          where object_id = object_id(N'[Tests]')
            and OBJECTPROPERTY(object_id, N'IsUserTable') = 1)
    drop table [Tests]

GO



if exists(select *
          from sys.objects
          where object_id = object_id(N'[Views]')
            and OBJECTPROPERTY(object_id, N'IsUserTable') = 1)
    drop table [Views]

GO



CREATE TABLE [Tables]
(

    [TableID] [int] IDENTITY (1, 1)                               NOT NULL,

    [Name]    [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL

) ON [PRIMARY]

GO



CREATE TABLE [TestRunTables]
(

    [TestRunID] [int]      NOT NULL,

    [TableID]   [int]      NOT NULL,

    [StartAt]   [datetime] NOT NULL,

    [EndAt]     [datetime] NOT NULL

) ON [PRIMARY]

GO



CREATE TABLE [TestRunViews]
(

    [TestRunID] [int]      NOT NULL,

    [ViewID]    [int]      NOT NULL,

    [StartAt]   [datetime] NOT NULL,

    [EndAt]     [datetime] NOT NULL

) ON [PRIMARY]

GO



CREATE TABLE [TestRuns]
(

    [TestRunID]   [int] IDENTITY (1, 1)                                 NOT NULL,

    [Description] [nvarchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,

    [StartAt]     [datetime]                                            NULL,

    [EndAt]       [datetime]                                            NULL

) ON [PRIMARY]

GO



CREATE TABLE [TestTables]
(

    [TestID]   [int] NOT NULL,

    [TableID]  [int] NOT NULL,

    [NoOfRows] [int] NOT NULL,

    [Position] [int] NOT NULL

) ON [PRIMARY]

GO



CREATE TABLE [TestViews]
(

    [TestID] [int] NOT NULL,

    [ViewID] [int] NOT NULL

) ON [PRIMARY]

GO



CREATE TABLE [Tests]
(

    [TestID] [int] IDENTITY (1, 1)                               NOT NULL,

    [Name]   [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL

) ON [PRIMARY]

GO



CREATE TABLE [Views]
(

    [ViewID] [int] IDENTITY (1, 1)                               NOT NULL,

    [Name]   [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL

) ON [PRIMARY]

GO



ALTER TABLE [Tables]
    WITH NOCHECK ADD
        CONSTRAINT [PK_Tables] PRIMARY KEY CLUSTERED
            (
             [TableID]
                ) ON [PRIMARY]

GO



ALTER TABLE [TestRunTables]
    WITH NOCHECK ADD
        CONSTRAINT [PK_TestRunTables] PRIMARY KEY CLUSTERED
            (
             [TestRunID],
             [TableID]
                ) ON [PRIMARY]

GO



ALTER TABLE [TestRunViews]
    WITH NOCHECK ADD
        CONSTRAINT [PK_TestRunViews] PRIMARY KEY CLUSTERED
            (
             [TestRunID],
             [ViewID]
                ) ON [PRIMARY]

GO



ALTER TABLE [TestRuns]
    WITH NOCHECK ADD
        CONSTRAINT [PK_TestRuns] PRIMARY KEY CLUSTERED
            (
             [TestRunID]
                ) ON [PRIMARY]

GO



ALTER TABLE [TestTables]
    WITH NOCHECK ADD
        CONSTRAINT [PK_TestTables] PRIMARY KEY CLUSTERED
            (
             [TestID],
             [TableID]
                ) ON [PRIMARY]

GO



ALTER TABLE [TestViews]
    WITH NOCHECK ADD
        CONSTRAINT [PK_TestViews] PRIMARY KEY CLUSTERED
            (
             [TestID],
             [ViewID]
                ) ON [PRIMARY]

GO



ALTER TABLE [Tests]
    WITH NOCHECK ADD
        CONSTRAINT [PK_Tests] PRIMARY KEY CLUSTERED
            (
             [TestID]
                ) ON [PRIMARY]

GO



ALTER TABLE [Views]
    WITH NOCHECK ADD
        CONSTRAINT [PK_Views] PRIMARY KEY CLUSTERED
            (
             [ViewID]
                ) ON [PRIMARY]

GO



ALTER TABLE [TestRunTables]
    ADD
        CONSTRAINT [FK_TestRunTables_Tables] FOREIGN KEY
            (
             [TableID]
                ) REFERENCES [Tables] (
                                       [TableID]
                ) ON DELETE CASCADE ON UPDATE CASCADE,

        CONSTRAINT [FK_TestRunTables_TestRuns] FOREIGN KEY
            (
             [TestRunID]
                ) REFERENCES [TestRuns] (
                                         [TestRunID]
                ) ON DELETE CASCADE ON UPDATE CASCADE

GO



ALTER TABLE [TestRunViews]
    ADD
        CONSTRAINT [FK_TestRunViews_TestRuns] FOREIGN KEY
            (
             [TestRunID]
                ) REFERENCES [TestRuns] (
                                         [TestRunID]
                ) ON DELETE CASCADE ON UPDATE CASCADE,

        CONSTRAINT [FK_TestRunViews_Views] FOREIGN KEY
            (
             [ViewID]
                ) REFERENCES [Views] (
                                      [ViewID]
                ) ON DELETE CASCADE ON UPDATE CASCADE

GO



ALTER TABLE [TestTables]
    ADD
        CONSTRAINT [FK_TestTables_Tables] FOREIGN KEY
            (
             [TableID]
                ) REFERENCES [Tables] (
                                       [TableID]
                ) ON DELETE CASCADE ON UPDATE CASCADE,

        CONSTRAINT [FK_TestTables_Tests] FOREIGN KEY
            (
             [TestID]
                ) REFERENCES [Tests] (
                                      [TestID]
                ) ON DELETE CASCADE ON UPDATE CASCADE

GO



ALTER TABLE [TestViews]
    ADD
        CONSTRAINT [FK_TestViews_Tests] FOREIGN KEY
            (
             [TestID]
                ) REFERENCES [Tests] (
                                      [TestID]
                ),

        CONSTRAINT [FK_TestViews_Views] FOREIGN KEY
            (
             [ViewID]
                ) REFERENCES [Views] (
                                      [ViewID]
                )

GO


CREATE TABLE Observations
(
    athlete_id int      not null,
    date       datetime not null,
    [text]     varchar(500)
)

ALTER table Observations
    add constraint PK_Observations PRIMARY KEY (athlete_id, [date]),
        constraint FK_Observations_Athletes foreign key (athlete_id) references Athletes (athlete_id);


INSERT INTO Tables (Name)
VALUES ('Athletes'),
       ('Bikes'),
       ('Observations')

INSERT INTO Tests (Name)
VALUES ('Test_Athletes'),
       ('Test_Bikes'),
       ('Test_Observations')


CREATE VIEW Athletes_Female AS
SELECT A.name
FROM Athletes A
WHERE A.gender = 'F';

CREATE VIEW All_Brands AS
SELECT brand
from Shifters
UNION
SELECT brand
from Forks
UNION
SELECT brand
from Brakes

CREATE VIEW XCO_Points AS
select A.name, sum(101 - p.place) Winnings
from Participations P
         INNER JOIN Athletes A on A.athlete_id = P.athlete_id and P.place is not null
group by A.name, P.coach_id
having P.coach_id in (select coach_id from Coaches where discipline = 'XCO')

INSERT INTO Views (Name)
VALUES ('Athletes_Female'),
       ('All_Brands'),
       ('XCO_Points');

INSERT INTO Tests (Name)
VALUES ('Test_Athletes_Female'),
       ('Test_All_Brands'),
       ('Test_XCO_Points');

INSERT INTO Tests (Name)
VALUES ('Test_Bikes_And_Athletes_Female');

select *
from Tests;

select *
from Tables;

select *
from Views;

INSERT INTO TestTables (TestID, TableID, NoOfRows, Position)
VALUES (1, 1, 4, 1),
       (2, 2, 5, 1),
       (3, 3, 5, 1),
       (7, 2, 2, 1);

select * from TestTables

INSERT INTO TestViews (TestID, ViewID)
VALUES (4, 1),
       (5, 2),
       (6, 3),
       (7, 1);

select * from TestViews

alter PROCEDURE insert_Athletes(@nrRows INT)
as
DECLARE @cnt INT = 0;
BEGIN
    WHILE @cnt < @nrRows
        BEGIN
            INSERT INTO Athletes (name, birth_date, gender)
            SELECT 'name' + cast(@cnt as varchar), CAST(GETDATE() AS Date),
                   IIF(@cnt % 3 = 0, 'F', 'M');
            SET @cnt = @cnt + 1;
        END
END
go


CREATE PROCEDURE insert_Bikes(@nrRows INT)
as
DECLARE @cnt INT = 0;
BEGIN
    WHILE @cnt < @nrRows
        BEGIN
            INSERT INTO Bikes (athlete_id, front_travel, rear_travel, wheel_size, fork_id, shifter_id, brakes_id,
                               shock_id, brand)
            select (select top 1 athlete_id
                    from Athletes order by athlete_id),
                   100 + 10 * @cnt,
                   100 + 10 * (@cnt - 1),
                   290,
                   (select top 1 fork_id from Forks),
                   (select top 1 shifter_id from Shifters),
                   (select top 1 brakes_id from Brakes),
                   (select top 1 shock_id from Shocks),
                   'Test';
            SET @cnt = @cnt + 1;
        END
END
go


CREATE PROCEDURE insert_Observations(@nrRows INT)
as
DECLARE @cnt INT = 0;
BEGIN
    WHILE @cnt < @nrRows
        BEGIN
            INSERT INTO Observations (athlete_id, date, text)
            select (select top 1 athlete_id from Athletes ),
                   CAST(GETDATE() AS Date),
                   'TEST Observation: ' + @cnt + 'registered in ' + CAST(GETDATE() AS varchar);
            SET @cnt = @cnt + 1;
        END
END
go

-- declare @test varchar(300)
-- select @test = CAST(string_agg(t2.COLUMN_NAME, ', ') as varchar) from
-- ((select *
-- from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
-- where CONSTRAINT_TYPE = 'PRIMARY KEY'
-- and TABLE_NAME = 'Observations') t1
-- inner join
-- INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE t2 on t1.CONSTRAINT_NAME = t2.CONSTRAINT_NAME);
-- print (@test)

drop procedure remove_Rows

alter PROCEDURE remove_Rows(@tableName varchar(30), @nrRows INT)
as
DECLARE @columns varchar(500);
DECLARE @cmd varchar(500);
BEGIN
    select @columns = CAST(string_agg(t2.COLUMN_NAME, ', ') as varchar) from
    ((select *
    from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    where CONSTRAINT_TYPE = 'PRIMARY KEY'
    and TABLE_NAME = @tableName) t1
    inner join
    INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE t2 on t1.CONSTRAINT_NAME = t2.CONSTRAINT_NAME);
    set @cmd = 'with T as (select top ' + cast(@nrRows as varchar) + ' * from ' + @tableName + ' order by ' + @columns +
               ' desc) delete from T';
    print('executing:' + @cmd);
    EXEC (@cmd);
END
go


alter PROCEDURE run_Test(@testName varchar(50))
as
DECLARE @cnt INT = 0;
DECLARE @poz INT = 0;
DECLARE @table int;
DECLARE @view int;
DECLARE @insertCmd varchar(1000);
DECLARE @removeCmd varchar(1000);
DECLARE @testId INT;
DECLARE @tableName varchar(30);
DECLARE @time datetime;
DECLARE @time2 datetime;
DECLARE @testRunId INT;
DECLARE @nrRows INT;
DECLARE @cmd varchar(1000);
BEGIN
    select @time = GETDATE();
    insert into TestRuns (Description, StartAt) values (@testName + 'done at: ' + cast(@time as varchar), @time);
    select @testRunId = @@IDENTITY;
    select @testId = testID from Tests where Name = @testName;
    print('testId: ' + cast(@testId as varchar));
    select @poz = max(Position) from TestTables where TestID = @testId;
--     print ('before while')
    WHILE @cnt < @poz
        BEGIN
            print (@cnt);

            select @table = TableID from TestTables where TestID = @testId and Position = @cnt + 1;
            print(@table);

            select @nrRows = NoOfRows from TestTables where TestID = @testId and Position = @cnt + 1;
            print(@nrRows);

            select @tableName = Name from Tables where TableID = @table;
            print(@tableName);

            select @time = GETDATE();
            set @cmd = 'insert_' + @tableName + ' @nrRows = ' + cast(@nrRows as varchar);
            print('executing: ' + @cmd);
            EXEC (@cmd);
            print('executing remove')
            EXEC remove_Rows @tableName, @nrRows;
            select @time2 = GETDATE();
            insert into TestRunTables (TestRunID, TableID, StartAt, EndAt) values (@testRunId, @table, @time, @time2);
            SET @cnt = @cnt + 1;
            print('cnt ' + cast(@cnt as varchar));
        END
    print('END TABLES')
    select @poz = count(*) from TestViews where TestID = @testId;
    if @poz > 0
        Begin
            set @cnt = 0;
            WHILE @cnt < @poz
                BEGIN
                    select @table = ViewID from TestViews where TestID = @testId;
                    select @tableName = Name from Views where ViewID = @table;
                    select @time = GETDATE();
                    EXEC ('select * from ' + @tableName);
                    select @time2 = GETDATE();
                    insert into TestRunViews (TestRunID, ViewID, StartAt, EndAt)
                    values (@testRunId, @table, @time, @time2);
                    SET @cnt = @cnt + 1;
                END
        end
    select @time = GETDATE();
    update TestRuns set EndAt = @time where TestRunID = @testRunId;
END
go

select *
from Tests inner join TestTables TT on Tests.TestID = TT.TestID
declare @cmd varchar(300) = 'insert_Athletes @nrRows = 4';
begin
exec (@cmd);
end
select * from Athletes;
delete from Athletes where name like 'name%';
execute run_Test 'Test_Bikes_And_Athletes_Female'
truncate table TestRunTables;
truncate table TestRunViews;
truncate table TestRuns;
delete from TestRuns;
select * from TestRuns;
select * from TestRunTables;
select * from TestRunViews;