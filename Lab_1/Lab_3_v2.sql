USE Laborator_1
go

CREATE Procedure do_column_type -- a
as
    ALTER table Bikes
    ALTER COLUMN brand varchar(50)
go

CREATE Procedure undo_column_type -- a
as
    ALTER table Bikes
    ALTER COLUMN brand varchar(30)
go


CREATE Procedure do_add_column -- b
as
    ALTER table Bikes
    ADD model_year int
go

CREATE Procedure undo_add_column -- b
as
    ALTER table Bikes
    DROP column model_year
go



CREATE Procedure do_default_constraint -- c
as

    ALTER table Bikes
    ADD CONSTRAINT df_model_year DEFAULT YEAR(GETDATE()) for model_year
go

CREATE Procedure undo_default_constraint -- c
as
    ALTER table Bikes
    DROP CONSTRAINT df_model_year
   
go



CREATE Procedure do_create_table --g
as
    CREATE table Practice(
        date date,
        coach_id int not null,
        athlete_id int not null,
        location varchar(50)
    )
go


CREATE Procedure undo_create_table --g
as
    DROP table Practice
go



CREATE Procedure do_primary_key --d
as
    ALTER table Practice
    ADD practice_id int not null identity
    ALTER table Practice
    ADD constraint pk_practice_id PRIMARY KEY (practice_id)
go

CREATE Procedure undo_primary_key --d
as
    ALTER table Practice
    DROP CONSTRAINT pk_practice_id
    ALTER table Practice
    DROP column practice_id
go




CREATE Procedure do_candidate_key -- e
as
    ALTER table Practice
    ADD practice_code varchar(30) not null default('aaa' + @@rowcount)
    ALTER table Practice
    ADD constraint uk_practice_practice_code unique (practice_code)
go

CREATE Procedure undo_candidate_key -- e
as
    ALTER table Practice
    DROP constraint uk_practice_practice_code
    ALTER table Practice
    DROP column practice_code
go



CREATE Procedure do_foreign_key -- f
as
    ALTER table Practice
    ADD constraint fk_practice_athlete foreign key (athlete_id) references Athletes(athlete_id)
go

CREATE Procedure undo_foreign_key -- f
as
    ALTER table Practice
    DROP constraint fk_practice_athlete

go


CREATE TABLE CurrentVersion(
    current_version INT
)
GO


CREATE TABLE Versions(
    version INT not null,
    do varchar(50),
    undo varchar(50)
)
GO

drop table Versions

alter table Versions
add constraint pk_versions primary key (version)


INSERT INTO Versions (version, do, undo)
VALUES (1, 'do_column_type', 'undo_column_type'),
       (2, 'do_add_column', 'undo_add_column'),
       (3, 'do_default_constraint', 'undo_default_constraint'),
       (4, 'do_create_table', 'undo_create_table'),
       (5, 'do_primary_key', 'undo_primary_key'),
       (6, 'do_candidate_key', 'undo_candidate_key'),
       (7, 'do_foreign_key', 'undo_foreign_key');


drop procedure versioning_2

CREATE procedure versioning_2(@version INT) AS
    DECLARE @curr INT
    DECLARE @command VARCHAR(50)
    BEGIN
        IF @version > (select max(version) from Versions)
--            SET @version = (select max(version) from Versions)
            PRINT 'selected version: ' + @version + 'greater than max version ' + (select max(version) from Versions)

        IF @version < (select min(version) from Versions) - 1
           SET @version = (select min(version) from Versions) - 1


        SELECT @curr = current_version
        FROM CurrentVersion

        DECLARE @i int = @curr

        IF @curr< @version
            WHILE @i < @version
            BEGIN
                SET @i = @i + 1
                SELECT @command = do
                FROM Versions
                WHERE version = @i
                PRINT 'executing: ' + @command
                EXEC (@command)
                UPDATE CurrentVersion SET current_version = @i
            END
        ELSE IF @curr > @version
            WHILE @i > @version
            BEGIN
                SELECT @command = undo
                FROM Versions
                WHERE version = @i
                PRINT 'executing: ' + @command
                EXEC (@command)
                SET @i = @i - 1
                UPDATE CurrentVersion SET current_version = @i
            END
    END

go


INSERT INTO CurrentVersion values (5);
delete from CurrentVersion where current_version = 0
UPDATE CurrentVersion SET current_version = 0 where current_version = 1
select * from CurrentVersion
EXEC versioning_2 10;

