USE Laborator_1


INSERT INTO Athletes (name, birth_date, gender)
VALUES ('Alex', '2000-05-13', 'M'),
       ('Tudor', '2001-07-20', 'M'),
       ('Ana', '1999-02-04', 'F'),
       ('Teodora', '2000-03-02', 'F'),
       ('Victor', '2002-10-30', 'M'),
       ('Mircea', '2003-12-22', 'M'),
       ('Mara', '1999-05-09', 'F');

INSERT INTO Forks (brand, model, travel, diameter, offset)
VALUES ('Fox', '36', 150, 36, 44),
       ('Fox', '36', 150, 36, 44),
       ('Fox', '36', 160, 36, 44),
       ('Fox', '36', 160, 36, 44),
       ('RockShox', 'Sid', 120, 32, 44),
       ('RockShox', 'Pike', 130, 34, 44),
       ('RockShox', 'Zeb', 180, 38, 44),
       ('RockShox', 'Zeb', 170, 38, 44),
       ('RockShox', 'Zeb', 170, 38, 44),
       ('RockShox', 'Sid', 100, 30, 44),
       ('Fox', '32', 120, 36, 44),
       ('Fox', '32', 120, 36, 44),
       ('Fox', '38', 170, 38, 44);

INSERT INTO Forks (brand, model, travel, diameter, offset)
VALUES ('Fox', '40', 200, 40, 44);

INSERT INTO Shifters (brand, model, speed_nr, range)
VALUES ('Shimano', 'XT', 12, '10-51t'),
       ('Shimano', 'XTR', 12, '10-51t'),
       ('Sram', 'GX', 12, '10-52t'),
       ('Sram', 'NX', 12, '10-50t'),
       ('Sram', 'XO1', 12, '10-52t'),
       ('Sram', 'SX', 12, '10-50t'),
       ('Shimano', 'Saint', 10, '11-36t'),
       ('Shimano', 'Saint', 10, '10-32t'),
       ('Sram', 'XX1', 12, '10-52t');

INSERT INTO Brakes (brand, model, front_pistons, front_rotor, rear_pistons, rear_rotor, oil)
VALUES ('Sram', 'Code RS', 4, 200, 4, 200, 'DOT 5.1'),
       ('Sram', 'Code RS', 4, 200, 4, 200, 'DOT 5.1'),
       ('Sram', 'G2R', 4, 180, 2, 160, 'DOT 5.1'),
       ('Shimano', 'Deore', 4, 180, 2, 160, 'Mineral'),
       ('Shimano', 'Saint', 4, 200, 4, 200, 'Mineral'),
       ('Shimano', 'XTR', 4, 180, 4, 160, 'Mineral'),
       ('Shimano', 'Deore', 2, 180, 2, 160, 'Mineral'),
       ('Shimano', 'Deore', 4, 140, 2, 140, 'Mineral'),
       ('Sram', 'Code RS', 4, 200, 4, null, 'DOT 5.1');

INSERT INTO Races (name, date, location, type)
VALUES ('Maratonul Fagetului', '2022-04-21', 'Faget, Cluj-Napoca', 'XCM'),
       ('La Salina Race', '2022-10-05', 'Crama La Salina, Turda', 'XCO'),
       ('Napoca Cup', '2022-03-13', 'Hoia, Cluj-Napoca', 'XCO'),
       ('Apuseni Cup', '2022-07-20', 'Buscat, Baisoara', 'Enduro'),
       ('Garmin Cup', '2022-03-23', 'Cluj-Napoca', 'XCO'),
       ('Muntele Mic Cup', '2022-06-15', 'We Ski, Muntele Mic', 'DH');

INSERT INTO Races (name, date, location, type) VALUES ('Garmin Cup', '2022-03-23', 'Cluj-Napoca', 'XCO')

INSERT INTO Coaches (name, discipline, phone_nr, city)
VALUES ('Mirel', 'XCO', '00445', 'Cluj-Napoca'),
       ('Aurel', 'Enduro', '03445', 'Cluj-Napoca'),
       ('Dorel', 'DH', '56220', 'Baisoara'),
       ('Viorel', 'XCM', '78110', 'Cluj-Napoca'),
       ('Martinel', 'Enduro', '78114', 'Feleac'),
       ('Teodorel', 'XCO', '78115', 'Gherla');


INSERT INTO Participations (race_id, athlete_id, place, prize, coach_id)
VALUES (9, 4, 3, 300, 1),
       (10, 2, null, 100, 4),
       (11, 3, null, 500, 10),
       (15, 5, 1, 600, 9);

select * from Participations

select *
from Athletes;

select *
from Races;

select *
from Coaches;

INSERT INTO Bikes (athlete_id, front_travel, rear_travel, wheel_size, fork_id, shifter_id, brakes_id, shock_id)
VALUES (1, 150, 140, 290, 1, 1, 1, null);

INSERT INTO Bikes (athlete_id, front_travel, rear_travel, wheel_size, fork_id, shifter_id, brakes_id, shock_id)
VALUES (1, 150, 140, 290, 1, 1, 27, null),
       (2, 200, 200, 290, 14, 3, 29, null),
       (3, 120, 0, 290, 10, 5, 33, null);

INSERT INTO Participations (race_id, athlete_id, place, prize, coach_id)
VALUES (9, 1, null, 300, 1)

select * from Races;

select * from Bikes;

select * from Shifters;

select athlete_id
from Athletes;

select  COUNT(*)
from Forks;

ALTER TABLE Athletes
ADD activity INT NOT NULL DEFAULT 0;

ALTER TABLE Coaches
ADD city VARCHAR(30) NOT NULL DEFAULT 'Cluj-Napoca'

INSERT INTO Coaches (city)
VALUES ('Turda'),
       ('Baisoara');

select * from Coaches

DELETE Coaches
WHERE name is null

-- All girls activity is increased as they have been for longer in the team
UPDATE Athletes
SET Athletes.activity = 3
WHERE gender = 'F';

select *
from Athletes;

-- All boys born after 2001 get point for activity
UPDATE Athletes
SET Athletes.activity = 2
WHERE gender = 'M' AND birth_date > '2001-12-31'

-- Athletes without name are removed as they are errors
DELETE Athletes
WHERE Athletes.name IS NULL

-- All races of a certain type are removed from the calendar because of lack of specialized athletes
DELETE Races WHERE type IN ('XCO', 'XCM')

select * from Races

select * from Brakes

-- Smaller brakes should get less pistons
UPDATE Brakes
SET front_pistons = 2
WHERE front_rotor BETWEEN 100 AND 140

select * from Shifters

-- All racing spec shifters are removed
DELETE Shifters
WHERE model LIKE '%R'

-- All brands that the team uses
SELECT brand from Shifters
UNION
SELECT brand from Forks
UNION
SELECT brand from Brakes

-- Coaches that live near Cluj-Napoca
SELECT name, phone_nr from Coaches
WHERE city = 'Gherla' OR city = 'Feleac'

-- Races where we also have coaches
SELECT city from Coaches
INTERSECT
SELECT location from Races

-- The type of oil needed for brakes used on 29' bikes
SELECT oil FROM Brakes
WHERE brakes_id IN (
    SELECT brakes_id from Bikes
    WHERE wheel_size='290'
    )

select location from Races;

-- The bikes which will not take part in a planned race
SELECT * FROM Bikes
WHERE athlete_id IN (
    SELECT athlete_id
    from Bikes
    EXCEPT
    SELECT athlete_id
    from Participations
    WHERE place is null
)

-- The bikes which have taken part in a race
SELECT * FROM Bikes
WHERE athlete_id NOT IN (
    SELECT athlete_id
    from Bikes
    EXCEPT
    SELECT athlete_id
    from Participations
    WHERE place is null
)

-- Athletes and the corresponding coaches for the following races
SELECT C.name, A.name
FROM ( select * from Participations P where p.place is null) as FP
INNER JOIN Athletes A on A.athlete_id = FP.athlete_id
INNER JOIN Coaches C on C.coach_id = FP.coach_id;


-- Athletes that participate at a race whose type the coach is specialized in
SELECT A.name, P.race_id, C.name, C.discipline, R.name, R.type
FROM Athletes A
LEFT JOIN Participations P on A.athlete_id = P.athlete_id
LEFT JOIN Coaches C on C.coach_id = P.coach_id
LEFT JOIN Races R on P.race_id = R.race_id and R.type = C.discipline;

INSERT INTO MedicalTests (date, type, doctor)
VALUES ('2021-03-23', 'performance', 'Augustin'),
       ('2021-07-10', 'doping', 'Valeriu'),
       ('2021-10-09', 'performance', 'Augustin');

INSERT INTO MedicalTests (date, type, doctor)
VALUES ('2021-06-10', 'doping', 'Valeriu'),
       ('2021-08-10', 'doping', 'Valeriu');

EXEC sp_rename 'Tests', 'MedicalTests';

INSERT INTO Appointments (test_id, athlete_id)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (2, 1),
       (2, 3),
       (3, 1),
       (3, 2),
       (3, 3);


SELECT Ap.test_id, A.name
FROM (Appointments Ap
RIGHT JOIN Athletes A on A.athlete_id = Ap.athlete_id)


SELECT Ap.test_id, A.name, P.race_id
FROM ((Appointments Ap
RIGHT JOIN Athletes A on A.athlete_id = Ap.athlete_id)
RIGHT JOIN Participations P on P.athlete_id = Ap.athlete_id)

select * from Participations

-- Atheltes to be and their appointments
SELECT case when ap.test_id is null then 'Not Appointed' else 'Appointed' end as apt, A.name, T.date as 'Test date'
-- select *
FROM Appointments Ap
-- RIGHT JOIN Participations P on P.athlete_id = Ap.athlete_id
RIGHT JOIN MedicalTests T on Ap.test_id = T.test_id
RIGHT JOIN Athletes A on A.athlete_id = Ap.athlete_id


-- Situation of testing and racing
SELECT T.type, T.date, A.name, R.name, R.date
-- select *
FROM MedicalTests T
FULL JOIN Appointments Ap on T.test_id = Ap.test_id
FULL JOIN Athletes A on A.athlete_id = Ap.athlete_id
FULL JOIN Participations P on A.athlete_id = P.athlete_id
FULL JOIN Races R on R.race_id = P.race_id
ORDER BY R.date


-- 5 Athletes that participate in a race
SELECT top 5 A.name
FROM Athletes A
WHERE athlete_id IN
    (SELECT P.athlete_id
     FROM Participations P)

-- Athletes that will be tested before a race
SELECT A.name, datediff(year, A.birth_date, cast(getdate() as Date)) Age
FROM Athletes A
WHERE athlete_id IN
    (SELECT P.athlete_id
     FROM Participations P
     WHERE P.race_id IN (
         SELECT R.race_id --, R.date, T.date, T.test_id
         FROM Races R
         LEFT JOIN MedicalTests T on R.date > T.date
         ))

ALTER TABLE Bikes
ADD brand VARCHAR(30);

ALTER TABLE Bikes
DROP COLUMN Brand

UPDATE Bikes SET brand = 'Santa Cruz' WHERE bike_id %2 = 1
UPDATE Bikes SET brand = 'Yeti' WHERE bike_id %2 = 0

-- Bike brands that have front brake rotor larger than 190mm and are used by an athlete that is appointed to a performance test
SELECT distinct B.brand
FROM Bikes B
WHERE EXISTS(SELECT Br.front_rotor
             FROM Brakes Br
             WHERE B.brakes_id = Br.brakes_id
               AND Br.front_rotor > 190)
  AND B.athlete_id NOT IN (SELECT A.athlete_id
                           FROM Appointments A
                                    INNER JOIN MedicalTests T on T.test_id = A.test_id
                           WHERE T.type = 'performance')


select * from Bikes


-- 3 Athletes that use bikes with large front brakes and Fox forks
SELECT  top 3 A.name
FROM Athletes A
WHERE EXISTS(SELECT B.bike_id
             FROM Bikes B
                      INNER JOIN Brakes B2 on B.brakes_id = B2.brakes_id AND B2.front_rotor > 180
             WHERE B.athlete_id = A.athlete_id
               AND B.fork_id IN (SELECT fork_id
                                 FROM Forks F
                                 WHERE F.brand = 'Fox'
             ))

select * from Races
select * from Participations INNER JOIN Races R2 on R2.race_id = Participations.race_id

-- Races that are in Baisoara and prizes are higher than 100 with participation from the team
SELECT DISTINCT name, prize
FROM (SELECT R.name, R.location, P.prize
FROM Races R INNER JOIN Participations P on R.race_id = P.race_id
WHERE P.prize > 100 AND P.place IS NOT NULL) T
WHERE location LIKE '%Baisoara%'

-- All females that will be tested at Valeriu after the 1st of August
select distinct A2.name
from (select * from MedicalTests where doctor = 'Valeriu' and date > '2021-08-01') T
inner join Appointments A on T.test_id = A.test_id
inner join Athletes A2 on A2.athlete_id = A.athlete_id
where A2.gender = 'F'

-- All races names
select name
from Races
group by name

-- Athletes that participated at at lest 2 races with prizes > 100
select A.name
from Participations P INNER JOIN Athletes A on A.athlete_id = P.athlete_id
where P.prize > 100
group by A.name having count(*) >= 2

-- Total points won by each athlete that earned more than 50 and had XCO coaches
select A.name, sum(101 - p.place) Winnings
from Participations P INNER JOIN Athletes A on A.athlete_id = P.athlete_id and P.place is not null
group by A.name, P.coach_id
having sum(101 - p.place) > 50 and P.coach_id in ( select coach_id from Coaches where discipline = 'XCO')
order by A.name

select min(A.birth_date) from Athletes A group by A.name

-- All bikes that have front travel > 160 and 4 piston brakes in the front
select B.brand
from Bikes B inner join Forks F on F.fork_id = B.fork_id
group by B.brand, B.brakes_id
having min(F.travel) > 160 and B.brakes_id in ( select brakes_id from Brakes where front_pistons = 4)

-- The boy that has different points than any girl
select A.name, sum(101 - p.place) Winnings
from Athletes A
         INNER JOIN Participations P on A.athlete_id = P.athlete_id
where A.gender = 'M'
group by A.name
having sum(101 - p.place) != all (select sum(101 - p.place) Winnings
                                 from Athletes A
                                          INNER JOIN Participations P on A.athlete_id = P.athlete_id
                                 where A.gender = 'F'
                                 group by A.name)

select A.name, sum(101 - p.place) Winnings
from Athletes A
         INNER JOIN Participations P on A.athlete_id = P.athlete_id
where A.gender = 'M'
group by A.name
having sum(101 - p.place) not in (select sum(101 - p.place) Winnings
                                 from Athletes A
                                          INNER JOIN Participations P on A.athlete_id = P.athlete_id
                                 where A.gender = 'F'
                                 group by A.name)
order by sum(101 - p.place) desc

-- The RockShox fork that has different travel than any Fox fork
select *
from Forks F
where F.brand = 'RockShox'
  and F.travel != all (select F1.travel
                      from Forks F1
                      where F1.brand = 'Fox')

select *
from Forks F
where F.brand = 'RockShox'
  and F.travel not in (select F1.travel
                      from Forks F1
                      where F1.brand = 'Fox')

-- Select the athletes that are not the youngest
select *
from Athletes A
where A.birth_date < any ( select A2.birth_date
                           from Athletes A2
                           where A.athlete_id != A2.athlete_id)

select A.name, A.birth_date
from Athletes A
group by A.name, A.birth_date, A.athlete_id
having A.birth_date < ( select max(A2.birth_date)
                           from Athletes A2
                           where A.athlete_id != A2.athlete_id)

-- Bikes which don't have the largest wheel size
select B.brand
from Bikes B
where B.wheel_size < any (select wheel_size from Bikes)

select B.brand
from Bikes B
group by B.brand, B.wheel_size
having B.wheel_size < (select max(wheel_size) from Bikes)
