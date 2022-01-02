use Laborator_1

create table Ta (
	aid int primary key identity(1, 1),
	a2 int unique
);

create table Tb (
	bid int primary key identity(1, 1),
	b2 int
);

create table Tc (
	cid int primary key identity(1, 1),
	aid int foreign key references Ta(aid),
	bid int foreign key references Tb(bid)
)


declare @i int = 1

while(@i < 1000000)
begin
	declare @x int = @i;
	--print(@x)
	insert into Ta (a2) values (@x);
	
	set @i = @i + 1;
end


drop table Ta;

declare @i int = 1

while(@i < 1000000)
begin
	declare @x int = @i*10;
	--print(@x)
	insert into Tb (b2) values (@x);
	
	set @i = @i + 1;
end

select top 100 * from Ta;


declare @i int = 1

while(@i < 1000000)
begin
	--print(@x)
	insert into Tc (aid, bid) values (@i, 100000 - @i);
	
	set @i = @i + 1;
end

alter table Ta add a3 varchar(50);


declare @i int = 1000000

while(@i < 3000000)
begin
	--print(@x)
	insert into Ta (a2, a3) values (@i, 'str' + cast(@i as varchar));
	
	set @i = @i + 1;
end


select * from Ta where aid = 9; --CISeek
select count(*) from Ta where aid != 9;

select count(*) from Ta where aid < 900000 and aid > 10;

select count(*) from Ta where a2 = 9; --NCISeek

declare @a int = (select count(*) from Ta where a2 > 0) - (select count(*) from Ta) --NCIScan
print(@a);

select * from Ta where a2 = (select a2 from Ta where aid = 9);

select count(*) from Ta where a2 > (select a2 from Ta where aid = 9);

select * from Ta where a3 = (select a3 from Ta where a2 = 10);

select count(*) from Ta where a3 is not null; --CIScan

-------------------------------------------

select top(10) * from Tb;

select * from Tb where b2 = 1340; --0.066s

create nonclustered index IDX_NC_Tb_b2 on Tb (b2) --0.000s

------------------------------------------


create view VTaTc as
select Ta.aid, Ta.a2, Tc.bid 
from Ta inner join Tc on Ta.aid = Tc.aid;

create view VTbTc as
select Tb.bid, Tb.b2, Tc.aid 
from Tb inner join Tc on Tb.bid = Tc.aid;


alter view VTaTb as
select count(*) Total 
from Tb inner join Ta on Ta.a2= Tb.b2;

declare @start datetime = getdate();
select * from VTaTb 
declare @end datetime = getdate();
select DATEDIFF(millisecond, @start, @end);

--80ms with indexes
--144ms without indexes