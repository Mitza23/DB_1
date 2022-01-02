USE Laborator_1


CREATE TABLE  Athletes
(
    athlete_id INT PRIMARY KEY IDENTITY,
    [name] VARCHAR(50),
    birth_date DATE,
    gender VARCHAR(1),
--     coach_id INT NOT NULL,
--     CONSTRAINT FK_Athlete_Coach FOREIGN KEY (shock_id) REFERENCES Shocks(shock_id),
);




CREATE TABLE Forks
(
    fork_id INT PRIMARY KEY IDENTITY(1,1),
    brand VARCHAR(30),
    model VARCHAR(30),
    travel INT,
    diameter INT NOT NULL,
    offset INT NOT NULL
)

CREATE TABLE Shifters
(
    shifter_id INT PRIMARY KEY IDENTITY(1,1),
    brand VARCHAR(30),
    model VARCHAR(30),
    speed_nr INT NOT NULL,
    range VARCHAR(6)
)

CREATE TABLE Brakes
(
    brakes_id INT PRIMARY KEY IDENTITY(1,1),
    brand VARCHAR(30),
    model VARCHAR(30),
    front_pistons INT,
    front_rotor INT,
    rear_pistons INT NOT NULL ,
    rear_rotor INT NOT NULL ,
    oil VARCHAR(30)
)

CREATE TABLE Shocks
(
    shock_id INT PRIMARY KEY IDENTITY(1,1),
    brand VARCHAR(30),
    model VARCHAR(30),
    type VARCHAR(30),
    compensator BIT
)

CREATE TABLE Bikes
(
    bike_id INT PRIMARY KEY IDENTITY(1,1),
    athlete_id INT NOT NULL,
    front_travel INT,
    rear_travel INT,
    wheel_size INT,
    fork_id INT NOT NULL UNIQUE,
    shifter_id INT NOT NULL UNIQUE,
    brakes_id INT NOT NULL UNIQUE ,
    shock_id INT UNIQUE
    CONSTRAINT FK_Bike_Athlete FOREIGN KEY (athlete_id) REFERENCES Athletes(athlete_id),
    CONSTRAINT FK_Bike_Fork FOREIGN KEY (fork_id) REFERENCES Forks(fork_id),
    CONSTRAINT FK_Bike_Shifter FOREIGN KEY (shifter_id) REFERENCES Shifters(shifter_id),
    CONSTRAINT FK_Bike_Brakes FOREIGN KEY (brakes_id) REFERENCES Brakes(brakes_id),
    CONSTRAINT FK_Bike_Shock FOREIGN KEY (shock_id) REFERENCES Shocks(shock_id),
);


CREATE TABLE Races
(
    race_id INT PRIMARY KEY IDENTITY,
    name VARCHAR(50),
    date DATE,
    location VARCHAR(50),
    type VARCHAR(30),
)


CREATE TABLE Coaches
(
    coach_id INT PRIMARY KEY IDENTITY ,
    name VARCHAR(30),
    discipline VARCHAR(30),
    phone_nr VARCHAR(20)
)

CREATE TABLE Participations
(
    race_id INT NOT NULL,
    athlete_id INT NOT NULL,
    place INT,
    prize VARCHAR(30),
    coach_id INT NOT NULL,
    CONSTRAINT FK_Participation_Race FOREIGN KEY (race_id) REFERENCES Races(race_id),
    CONSTRAINT FK_Participation_Athlete FOREIGN KEY (athlete_id) REFERENCES Athletes(athlete_id),
    CONSTRAINT FK_Participation_Coach FOREIGN KEY (coach_id) REFERENCES Coaches(coach_id),
    CONSTRAINT PK_Participation PRIMARY KEY (race_id, athlete_id)
)


CREATE TABLE Tests
(
    test_id INT PRIMARY KEY IDENTITY ,
    date DATE,
    type VARCHAR(50),
    doctor VARCHAR(50)
)

CREATE TABLE Appointments
(
    test_id INT NOT NULL,
    athlete_id INT NOT NULL,
    CONSTRAINT FK_Test_Appointment FOREIGN KEY (test_id) REFERENCES MedicalTests(test_id),
    CONSTRAINT FK_Athlete_Appointment FOREIGN KEY (athlete_id) REFERENCES Athletes(athlete_id),
    CONSTRAINT PK_Appointment PRIMARY KEY (test_id, athlete_id)
)

drop table Appointments
