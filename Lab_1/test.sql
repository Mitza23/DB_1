USE Laborator_1
go
select * from Version

drop table Practice
exec undo_v2
exec undo_v1

select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_TYPE = 'FOREIGN KEY'

UPDATE Version
SET current_version = 0

select datepart(year, getdate())