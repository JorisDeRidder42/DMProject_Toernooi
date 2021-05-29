--------------------
-- DROP EN CREATE --
--------------------

---- DROP TABLES
----IF OBJECT_ID('ToernooiInschrijven.Rank') IS NOT NULL
--	DROP TABLE ToernooiInschrijven.[Rank]
----IF OBJECT_ID('ToernooiInschrijven.Speler') IS NOT NULL
--	DROP TABLE ToernooiInschrijven.Speler
----IF OBJECT_ID('ToernooiInschrijven.Prijs') IS NOT NULL
--	DROP TABLE ToernooiInschrijven.Prijs
----IF OBJECT_ID('ToernooiInschrijven.ToernooiPrijs') IS NOT NULL
--	DROP TABLE ToernooiInschrijven.ToernooiPrijs
----IF OBJECT_ID('ToernooiInschrijven.Toernooi') IS NOT NULL
--	DROP TABLE ToernooiInschrijven.Toernooi
--	--IF OBJECT_ID('ToernooiInschrijven.GameModeRank') IS NOT NULL
--	DROP TABLE ToernooiInschrijven.GameModeRank
----IF OBJECT_ID('ToernooiInschrijven.GameMode') IS NOT NULL
--	DROP TABLE ToernooiInschrijven.GameMode
--GO

-- DROP + CREATE SCHEMA
DROP SCHEMA IF EXISTS ToernooiInschrijven;
--DROP SCHEMA ToernooiInschrijven;
GO
EXECUTE('CREATE SCHEMA ToernooiInschrijven');
GO

----
CREATE TABLE ToernooiInschrijven.[Rank]
(
	[rankId] int IDENTITY(1,1) NOT NULL,
	rankNaam varchar(40) NOT NULL,
	CONSTRAINT PK_Rank PRIMARY KEY (rankId)
); 
GO

CREATE TABLE ToernooiInschrijven.GameMode
(
	[gameModeId] int IDENTITY(1,1) NOT NULL,
	gameModeNaam varchar(40) NOT NULL,
	CONSTRAINT PK_GameMode PRIMARY KEY (gameModeId)
); 
GO

CREATE TABLE ToernooiInschrijven.GameModeRank
(
	[gameModeRankId] int IDENTITY(1,1) NOT NULL,
	rankId int NOT NULL,
	gameModeId int NOT NULL,
	CONSTRAINT PK_GameModeRank PRIMARY KEY (gameModeRankId),
	CONSTRAINT FK1_GameModeRank_Rank FOREIGN KEY (rankId) REFERENCES ToernooiInschrijven.[rank](rankId),
	CONSTRAINT FK2_GameModeRank_GameMode FOREIGN KEY (gameModeId) REFERENCES ToernooiInschrijven.GameMode(gameModeId)
); 
GO

CREATE TABLE ToernooiInschrijven.Speler
(
	[spelerId] int IDENTITY(1,1) NOT NULL,
	voornaam varchar(20) NOT NULL,
	achternaam varchar(20) NOT NULL,
	nicknaam varchar(20) NOT NULL,
	wachtwoord varchar(20) NOT NULL,
	email varchar(30) NOT NULL,
	geboortedatum date NOT NULL,
	geboorteplaats varchar(30) NULL,
	CONSTRAINT PK_Speler PRIMARY KEY (spelerId)
); 
GO

CREATE TABLE ToernooiInschrijven.Prijs
(
	[prijsId] int IDENTITY(1,1) NOT NULL,
	spelerId int NOT NULL,
	prijsPot int NOT NULL,
	CONSTRAINT PK_Prijs PRIMARY KEY (prijsId),
	CONSTRAINT FK3_Prijs_Speler FOREIGN KEY (prijsId) REFERENCES ToernooiInschrijven.Speler(spelerId)
); 
GO

CREATE TABLE ToernooiInschrijven.Toernooi
(
	[toernooiId] int IDENTITY(1,1) NOT NULL,
	toernooiNaam varchar(15) NOT NULL,
	datum date NOT NULL,
	checkInuur time NOT NULL,
	startuur time NOT NULL,
	gameModeId int NOT NULL,
	CONSTRAINT PK_Toernooi PRIMARY KEY (toernooiId),
	CONSTRAINT FK4_Toernooi_GameMode FOREIGN KEY (gameModeId) REFERENCES ToernooiInschrijven.GameMode(gameModeId)
); 
GO

CREATE TABLE ToernooiInschrijven.ToernooiPrijs
(
	[toernooiPrijsId] int IDENTITY(1,1) NOT NULL,
	prijsId int NOT NULL,
	toernooiId int NOT NULL,
	CONSTRAINT PK_ToernooiPrijs PRIMARY KEY (toernooiPrijsId),
	CONSTRAINT FK5_ToernooiPrijs_Toernooi FOREIGN KEY (toernooiId) REFERENCES ToernooiInschrijven.Toernooi(toernooiId) ON DELETE CASCADE,
	CONSTRAINT FK6_ToernooiPrijs_Prijs FOREIGN KEY (prijsId) REFERENCES ToernooiInschrijven.Prijs(prijsId)
); 
GO

--- CODE INSERT
SET IDENTITY_INSERT ToernooiInschrijven.GameMode OFF
INSERT INTO ToernooiInschrijven.GameMode
	VALUES ('Rocket League'),
	 ('Fortnite'),
	 ('League of legends'),
	 ('Valorant'),
	 ('Counter-strike'),
	 ('Dota 2'),
	 ('Call of duty: Warzone'),
	 ('Apex legends');
SET IDENTITY_INSERT ToernooiInschrijven.GameMode OFF


INSERT INTO ToernooiInschrijven.Toernooi(toernooiNaam, datum, checkInuur, startuur, gameModeId)
	VALUES ('RL_3V3_1000', '2021-05-05','20:00:00', '20:30:00',1), -- id 1
    ('FN_1V1_2000', '2021-06-05','21:00:00', '21:30:00',2), -- id 2
    ('LOL_5V5_3000', '2021-07-05','20:00:00', '20:30:00',3),
    ('VA_5V5_4000', '2021-08-05','21:00:00', '21:30:00',4),
    ('CSGO_5V5_5000', '2021-08-05','21:00:00', '21:30:00',5),
    ('DO_5V5_6000', '2021-09-05','21:00:00', '21:30:00',6),
    ('WZ_5V5_7000', '2021-10-05','21:00:00', '21:30:00',7),
    ('AL_3V3_8000', '2021-11-05','21:00:00', '21:30:00',8);

INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
	VALUES ('RL_3V3_1231', '2021-05-22','20:30:00', '21:00:00',1),
			('FN_3V3_2514', '2021-06-22','21:00:00', '21:30:00',2),
			('LOL_5V5_3143', '2021-07-22','20:00:00', '20:30:00',3),
			('VA_5V5_4412', '2021-08-25','20:00:00', '20:30:00',4),
			('CSGO_5V5_5531', '2021-08-22','21:00:00', '21:30:00',5),
			('DO_5V5_6532', '2021-09-22','21:00:00', '21:30:00',6),
			('WZ_5V5_7435', '2021-10-22','21:00:00', '21:30:00',7),
			('AL_3V3_8343', '2021-11-25','21:00:00', '21:30:00',8);

INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('RL_3V3_1353', '2021-05-15','21:30:00', '22:00:00',1),
		('FN_3V3_2533', '2021-06-15','22:00:00', '22:30:00',2),
		('LOL_5V5_3432', '2021-07-15','20:00:00', '20:30:00',3),
		('VA_5V5_4532', '2021-08-15','21:00:00', '21:30:00',4),
		('CSGO_5V5_5544', '2021-08-15','20:00:00', '20:30:00',5),
		('DO_5V5_6464', '2021-09-15','20:00:00', '20:30:00',6),
		('WZ_5V5_7123', '2021-10-15','18:00:00', '18:30:00',7),
		('AL_3V3_8766', '2021-11-15','19:00:00', '19:30:00',8);

INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('RL_3V3_1533', '2021-06-20','19:30:00', '20:00:00',1),
    ('FN_3V3_2767', '2021-07-20','18:00:00', '18:30:00',2),
    ('LOL_5V5_3132', '2021-08-20','20:00:00', '20:30:00',3),
    ('VA_5V5_4132', '2021-09-20','21:00:00', '21:30:00',4),
    ('CSGO_5V5_5987', '2021-10-15','21:00:00', '21:30:00',5),
    ('DO_5V5_6135', '2021-11-20','20:00:00', '20:30:00',6),
    ('WZ_5V5_7865', '2021-12-20','18:00:00', '18:30:00',7),
	('AL_3V3_8642', '2021-12-25','19:00:00', '19:30:00',8);

INSERT INTO ToernooiInschrijven.Speler(voorNaam, achterNaam, nickNaam, wachtWoord, email, geboorteDatum, geboortePlaats)
	VALUES ('Joris','DeRidder', 'Jeuris42','****************', 'joris.42@hotmail.com','1997-02-21', 'Belgium'),
	('Dennis','Luyten', 'Kiiro','******', 'DennisLuten@outlook.be','1999-05-12', 'Belgium'),
	('Jan','Ghesquire', 'Por0','********', 'JanGhesquire@telenet.com','1996-03-18', 'Spain'),
	('Alec','VanOosterwijck', 'Tankzwaluw','******', 'DenAlec@outlook.be','2000-02-04', 'Belgium'),
	('Jelle','Vermeulen', 'JayEnvy','********', 'JayEnvy@hotmail.be','1994-07-12', 'England');


--fortnite--
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Unranked'),
	('Open League: Division I'),
	('Open League: Division II'),
	('Open League: Division III'),
	('Open League: Division IV'),
	('Contender League: Division I'),
	('Contender League: Division II'),
	('Contender League: Division III'),
	('Champion League: Division I'),
	('Champion League: Division II'),
	('Champion League: Division III');

--rocket league--
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Unranked'),
	('Bronze'),
	('Silver'),
	('Gold'),
	('Platinum'),
	('Diamond'),
	('Champion'),
	('Grand Champion'),
	('Supersonic Legend');

-- League of legends
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Unranked'),
	('Iron'),
	('Bronze'),
	('Silver'),
	('Gold'),
	('Platinum'),
	('Diamond'),
	('Master'),
	('Grandmaster'),
	('Challenger');

-- valorant
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Unranked'),
	('Iron'),
	('Bronze'),
	('Silver'),
	('Gold'),
	('Platinum'),
	('Diamond'),
	('Immortal'),
	('Radiant');

-- CSGO
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Unranked'),
	('Silver I'),
	('Silver II'),
	('Silver III'),
	('Silver IV'),
	('Silver Elite'),
	('Silver Elite Master'),

	('Gold Nova I'),
	('Gold Nova II'),
	('Gold Nova III'),
	('Gold Nova Master'),

	('Master Guardian I'),
	('Master Guardian II'),
	('Master Guardian Elite'),

	('Distinguished Master Guardian'),
	('Legendary Eagle'),
	('Legendary Eagle Master'),
	('Supreme Master First Class'),
	('Global Elite');

-- dota 2
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Unranked'),
	('Herald'),
	('Guardian'),
	('Crusader'),
	('Archon'),
	('Legend'),
	('Ancient'),
	('Divine'),
	('Immortal');

-- Warzone
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('No ranked system');

--Apex legends
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Unranked'),
	('Bronze'),
	('Silver'),
	('Gold'),
	('Platinum'),
	('Diamond'),
	('Apex Predator');

-- asscociatie tabel
-- fortnite
INSERT INTO ToernooiInschrijven.GameModeRank (gameModeId, rankId)
	VALUES (2,1),
	(2,2),
    (2,3),
	(2,4),
	(2,5),
	(2,6),
	(2,7),
	(2,8),
	(2,9),
	(2,10),
	(2,11),
-- Rocket league
	(1,12),
	(1,13),
    (1,14),
	(1,15),
	(1,16),
	(1,17),
	(1,18),
	(1,19),
	(1,20),
-- League of legends
	(3,21),
	(3,22),
    (3,23),
	(3,24),
	(3,25),
	(3,26),
	(3,27),
	(3,28),
	(3,29),
	(3,30),
-- valorant
	(4,31),
	(4,32),
    (4,33),
	(4,34),
	(4,35),
	(4,36),
	(4,37),
	(4,38),
	(4,39),
-- CSGO
	(5,40),
	(5,41),
	(5,42),
	(5,43),
	(5,44),
	(5,45),
	(5,46),
	(5,47),
	(5,48),
	(5,49),
	(5,50),
    (5,51),
	(5,52),
	(5,53),
	(5,54),
	(5,55),
	(5,56),
	(5,57),
-- dota 2
	(6,58),
	(6,59),
    (6,60),
	(6,61),
	(6,62),
	(6,63),
	(6,64),
	(6,65),
	(6,66),
-- warzone
	(7,67),
-- apex legends
	(8,68),
	(8,69),
	(8,70),
	(8,71),
	(8,72),
	(8,73),
	(8,74);

INSERT INTO ToernooiInschrijven.Prijs(PrijsPot, spelerId)
	VALUES (10000,1),
	(8000,2),
	(6000,3),
	(4000,4),
	(2000,5);

INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,1),
	(2,1),
	(3,1),
	(1,2),
	(2,2),
	(3,2),
	(1,3),
	(2,3),
	(3,3),
	(1,4),
	(2,4),
	(3,4),
	(1,5),
	(2,5),
	(3,5),
	(1,11),
	(1,12),
	(1,13),
	(1,14),
	(1,15),
	(1,16),
	(1,17),
	(1,18),
	(1,19),
	(1,20),
	(1,21),
	(1,22),
	(1,23),
	(1,24),
	(1,25),
	(1,26),
	(1,27),
	(1,28),
	(1,29),
	(1,30),
	(1,31);