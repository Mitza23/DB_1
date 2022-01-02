USE Laborator_1
go

CREATE Procedure do_v1 -- a
as
    ALTER table Bikes
    ALTER COLUMN brand varchar(50)
go

CREATE Procedure undo_v1 -- a
as
    ALTER table Bikes
    ALTER COLUMN brand varchar(30) 
go


CREATE Procedure do_v2 -- b,c
as
    ALTER table Bikes
    ADD model_year int 
    ALTER table Bikes
    ADD CONSTRAINT df_model_year DEFAULT YEAR(GETDATE()) for model_year 
go

CREATE Procedure undo_v2 -- b,c
as
    ALTER table Bikes
    DROP CONSTRAINT df_model_year 
    ALTER table Bikes
    DROP column model_year 
go


CREATE Procedure do_v3 --d, g
as
    CREATE table Practice(
        practice_id int identity,
        date date,
        coach_id int not null,
        athlete_id int not null,
        location varchar(50)
    ) 

    ALTER table Practice
    ADD constraint pk_practice_id PRIMARY KEY(practice_id) 
go

CREATE Procedure undo_v3 --d, g
as
    ALTER table Practice
    DROP CONSTRAINT pk_practice_id 
    DROP table Practice 
go


CREATE Procedure do_v4 -- e, f
as
    ALTER table Practice
    ADD practice_code varchar(30) not null unique 

    ALTER table Practice
    ADD constraint fk_practice_athlete foreign key (athlete_id) references Athletes(athlete_id) 
go

CREATE Procedure undo_v4 -- e, f
as
    ALTER table Practice
    DROP constraint fk_practice_athlete 

    ALTER table Practice
    DROP column practice_code 
go


CREATE TABLE Version(
    current_version INT
) 
GO

CREATE procedure versioning(@version INT) AS
    DECLARE @curr INT
    BEGIN
        SELECT @curr = current_version
        FROM Version

        DECLARE @i int = @curr

        IF @curr< @version
            WHILE @i < @version
            BEGIN
                SET @i = @i + 1
                EXEC ('do_v' + @i)
            END
        ELSE IF @curr > @version
            WHILE @i > @version
            BEGIN
                EXEC ('undo_v' + @i)
                SET @i = @i - 1
            END
        UPDATE Version SET current_version = @version
    END

delete from Version where current_version = 0
select * from Version
INSERT INTO Version values (1);
EXEC versioning 0;

