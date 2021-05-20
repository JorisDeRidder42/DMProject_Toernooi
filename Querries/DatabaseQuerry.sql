--------------------
-- DROP EN CREATE --
--------------------

-- DROP TABLES
--IF OBJECT_ID('ToernooiInschrijven.Rank') IS NOT NULL
	DROP TABLE ToernooiInschrijven.[Rank]
--IF OBJECT_ID('ToernooiInschrijven.Speler') IS NOT NULL
	DROP TABLE ToernooiInschrijven.Speler
--IF OBJECT_ID('ToernooiInschrijven.Prijs') IS NOT NULL
	DROP TABLE ToernooiInschrijven.Prijs
--IF OBJECT_ID('ToernooiInschrijven.ToernooiPrijs') IS NOT NULL
	DROP TABLE ToernooiInschrijven.ToernooiPrijs
--IF OBJECT_ID('ToernooiInschrijven.Toernooi') IS NOT NULL
	DROP TABLE ToernooiInschrijven.Toernooi
	--IF OBJECT_ID('ToernooiInschrijven.GameModeRank') IS NOT NULL
	DROP TABLE ToernooiInschrijven.GameModeRank
--IF OBJECT_ID('ToernooiInschrijven.GameMode') IS NOT NULL
	DROP TABLE ToernooiInschrijven.GameMode

GO

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
)

CREATE TABLE ToernooiInschrijven.GameMode
(
	[gameModeId] int IDENTITY(1,1) NOT NULL,
	gameModeNaam varchar(40) NOT NULL,
	CONSTRAINT PK_GameMode PRIMARY KEY (gameModeId)
)

CREATE TABLE ToernooiInschrijven.GameModeRank
(
	[gameModeRankId] int IDENTITY(1,1) NOT NULL,
	rankId int NOT NULL,
	gameModeId int NOT NULL,
	CONSTRAINT PK_GameModeRank PRIMARY KEY (gameModeRankId),
	CONSTRAINT FK_GameModeRank_Rank FOREIGN KEY (rankId) REFERENCES ToernooiInschrijven.[rank](rankId),
	CONSTRAINT FK_GameModeRank_GameMode FOREIGN KEY (gameModeId) REFERENCES ToernooiInschrijven.GameMode(gameModeId)
)

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
)

CREATE TABLE ToernooiInschrijven.Prijs
(
	[prijsId] int IDENTITY(1,1) NOT NULL,
	spelerId int NOT NULL,
	PrijsPot int NOT NULL,
	CONSTRAINT PK_Prijs PRIMARY KEY (prijsId),
	CONSTRAINT FK_Prijs_Speler FOREIGN KEY (prijsId) REFERENCES ToernooiInschrijven.Speler(spelerId)
)

CREATE TABLE ToernooiInschrijven.Toernooi
(
	[toernooiId] int IDENTITY(1,1) NOT NULL,
	toernooiNaam varchar(15) NOT NULL,
	datum date NOT NULL,
	checkInuur time NOT NULL,
	startuur time NOT NULL,
	gameModeId int NOT NULL,
	CONSTRAINT PK_Toernooi PRIMARY KEY (toernooiId),
	CONSTRAINT FK_Toernooi_GameMode FOREIGN KEY (gameModeId) REFERENCES ToernooiInschrijven.GameMode(gameModeId)
)

CREATE TABLE ToernooiInschrijven.ToernooiPrijs
(
	[toernooiPrijsId] int IDENTITY(1,1) NOT NULL,
	prijsId int NOT NULL,
	toernooiId int NOT NULL,
	CONSTRAINT PK_ToernooiPrijs PRIMARY KEY (toernooiPrijsId),
	CONSTRAINT FK_ToernooiPrijs_Toernooi FOREIGN KEY (toernooiId) REFERENCES ToernooiInschrijven.Toernooi(toernooiId),
	CONSTRAINT FK_ToernooiPrijs_Prijs FOREIGN KEY (prijsId) REFERENCES ToernooiInschrijven.Prijs(prijsId)
)

--- CODE INSERT
--- CODE INSERT
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur)
    VALUES ('RL_3V3_1000', '2021-05-05','20:00:00', '20:30:00');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('FN_1V1_2000', '2021-06-05','21:00:00', '21:30:00',2);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('LOL_5V5_3000', '2021-07-05','20:00:00', '20:30:00',3);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('VA_5V5_4000', '2021-08-05','21:00:00', '21:30:00',4);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('CSGO_5V5_5000', '2021-08-05','21:00:00', '21:30:00',5);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('DO_5V5_6000', '2021-09-05','21:00:00', '21:30:00',6);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('WZ_5V5_7000', '2021-10-05','21:00:00', '21:30:00',7);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('AL_3V3_8000', '2021-11-05','21:00:00', '21:30:00',8);

INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('RL_3V3_1231', '2021-05-22','20:30:00', '21:00:00',1);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('FN_3V3_2514', '2021-06-22','21:00:00', '21:30:00',2);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('LOL_5V5_3143', '2021-07-22','20:00:00', '20:30:00',3);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('VA_5V5_4412', '2021-08-25','20:00:00', '20:30:00',4);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('CSGO_5V5_5531', '2021-08-22','21:00:00', '21:30:00',5);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('DO_5V5_6532', '2021-09-22','21:00:00', '21:30:00',6);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('WZ_5V5_7435', '2021-10-22','21:00:00', '21:30:00',7);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('AL_3V3_8343', '2021-11-25','21:00:00', '21:30:00',8);

INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('RL_3V3_1353', '2021-05-15','21:30:00', '22:00:00',1);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('FN_3V3_2533', '2021-06-15','22:00:00', '22:30:00',2);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('LOL_5V5_3432', '2021-07-15','20:00:00', '20:30:00',3);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('VA_5V5_4532', '2021-08-15','21:00:00', '21:30:00',4);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('CSGO_5V5_5544', '2021-08-15','20:00:00', '20:30:00',5);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('DO_5V5_6464', '2021-09-15','20:00:00', '20:30:00',6);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('WZ_5V5_7123', '2021-10-15','18:00:00', '18:30:00',7);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('AL_3V3_8766', '2021-11-15','19:00:00', '19:30:00',8);

INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('RL_3V3_1533', '2021-06-20','19:30:00', '20:00:00',1);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('FN_3V3_2767', '2021-07-20','18:00:00', '18:30:00',2);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('LOL_5V5_3132', '2021-08-20','20:00:00', '20:30:00',3);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('VA_5V5_4132', '2021-09-20','21:00:00', '21:30:00',4);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('CSGO_5V5_5987', '2021-10-15','21:00:00', '21:30:00',5);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('DO_5V5_6135', '2021-11-20','20:00:00', '20:30:00',6);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('WZ_5V5_7865', '2021-12-20','18:00:00', '18:30:00',7);
INSERT INTO ToernooiInschrijven.Toernooi (toernooiNaam, datum, checkInuur, startuur, gameModeId)
    VALUES ('AL_3V3_8642', '2021-12-25','19:00:00', '19:30:00',8);

INSERT INTO ToernooiInschrijven.Speler(voorNaam, achterNaam, nickNaam, wachtWoord, email, geboorteDatum, geboortePlaats)
	VALUES ('Joris','DeRidder', 'Jeuris42','****************', 'joris.42@hotmail.com','1997-02-21', 'Belgium');
INSERT INTO ToernooiInschrijven.Speler(voorNaam, achterNaam, nickNaam, wachtWoord, email, geboorteDatum, geboortePlaats)
	VALUES ('Dennis','Luyten', 'Kiiro','******', 'DennisLuten@outlook.be','1999-05-12', 'Belgium');
INSERT INTO ToernooiInschrijven.Speler(voorNaam, achterNaam, nickNaam, wachtWoord, email, geboorteDatum, geboortePlaats)
	VALUES ('Jan','Ghesquire', 'Por0','********', 'JanGhesquire@telenet.com','1996-03-18', 'Spain');
INSERT INTO ToernooiInschrijven.Speler(voorNaam, achterNaam, nickNaam, wachtWoord, email, geboorteDatum, geboortePlaats)
	VALUES ('Alec','VanOosterwijck', 'Tankzwaluw','******', 'DenAlec@outlook.be','2000-02-04', 'Belgium');
INSERT INTO ToernooiInschrijven.Speler(voorNaam, achterNaam, nickNaam, wachtWoord, email, geboorteDatum, geboortePlaats)
	VALUES ('Jelle','Vermeulen', 'JayEnvy','********', 'JayEnvy@hotmail.be','1994-07-12', 'England');


--fortnite--
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Unranked');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Open League: Division I');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Open League: Division II');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Open League: Division III');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Open League: Division IV');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Contender League: Division I');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Contender League: Division II');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Contender League: Division III');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Champion League: Division I');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Champion League: Division II');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Champion League: Division III');

--rocket league--
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Unranked');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Bronze');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Silver');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Gold');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Platinum');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Diamond');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Champion');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Grand Champion');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Supersonic Legend');

-- League of legends
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Unranked');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Iron');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Bronze');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Silver');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Gold');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Platinum');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Diamond');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Master');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Grandmaster');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Challenger');

-- valorant
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Unranked');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Iron');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Bronze');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Silver');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Gold');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Platinum');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Diamond');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Immortal');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Radiant');

-- CSGO
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Unranked');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Silver I');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Silver II');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Silver III');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Silver IV');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Silver Elite');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Silver Elite Master');

INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Gold Nova I');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Gold Nova II');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Gold Nova III');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Gold Nova Master');

INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Master Guardian I');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Master Guardian II');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Master Guardian Elite');

INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Distinguished Master Guardian');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Legendary Eagle');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Legendary Eagle Master');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Supreme Master First Class');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Global Elite');

-- dota 2
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Unranked');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Herald');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Guardian');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Crusader');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Archon');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Legend');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Ancient');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Divine');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Immortal');

-- Warzone
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('No ranked system');

--Apex legends
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Unranked');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Bronze');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Silver');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Gold');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Platinum');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Diamond');
INSERT INTO ToernooiInschrijven.[Rank](rankNaam)
	VALUES ('Apex Predator');

-- asscociatie tabel
-- fortnite
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (1,1);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (1,2);
INSERT INTO ToernooiInschrijven.GameModeRank
    VALUES (1,3);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (1,4);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (1,5);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (1,6);
	INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (1,7);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (1,8);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (1,9);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (1,10);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (1,11);

-- Rocket league
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (2,1);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (2,2);
INSERT INTO ToernooiInschrijven.GameModeRank
    VALUES (2,3);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (2,4);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (2,5);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (2,6);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (2,7);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (2,8);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (2,9);

	-- League of legends
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (3,1);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (3,2);
INSERT INTO ToernooiInschrijven.GameModeRank
    VALUES (3,3);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (3,4);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (3,5);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (3,6);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (3,7);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (3,8);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (3,9);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (3,10);

	-- valorant
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (4,1);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (4,2);
INSERT INTO ToernooiInschrijven.GameModeRank
    VALUES (4,3);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (4,4);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (4,5);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (4,6);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (4,7);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (4,8);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (4,9);

-- CSGO
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (5,1);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (5,2);
INSERT INTO ToernooiInschrijven.GameModeRank
    VALUES (5,3);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (5,4);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (5,5);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (5,6);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (5,7);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (5,8);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (5,9);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (5,10);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (5,11);
INSERT INTO ToernooiInschrijven.GameModeRank
    VALUES (5,12);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (5,13);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (5,14);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (5,15);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (5,16);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (5,17);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (5,18);

-- dota 2
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (6,1);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (6,2);
INSERT INTO ToernooiInschrijven.GameModeRank
    VALUES (6,3);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (6,4);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (6,5);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (6,6);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (6,7);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (6,8);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (6,9);

-- warzone
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (7,1);

-- apex legends
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (8,1);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (8,2);
INSERT INTO ToernooiInschrijven.GameModeRank
    VALUES (8,3);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (8,4);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (8,5);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (8,6);
INSERT INTO ToernooiInschrijven.GameModeRank
	VALUES (8,7);


INSERT INTO ToernooiInschrijven.Prijs(PrijsPot, spelerId)
	VALUES (20000,1);
INSERT INTO ToernooiInschrijven.Prijs(PrijsPot, spelerId)
	VALUES (10000,2);
INSERT INTO ToernooiInschrijven.Prijs(PrijsPot, spelerId)
	VALUES (100000,3);
INSERT INTO ToernooiInschrijven.Prijs(PrijsPot, spelerId)
	VALUES (100000,4);
INSERT INTO ToernooiInschrijven.Prijs(PrijsPot, spelerId)
	VALUES (10000,5);

INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,1);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,1);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (3,1);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (4,1);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (5,1);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,2);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,2);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (3,2);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (4,2);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (5,2);


SET IDENTITY_INSERT ToernooiInschrijven.GameMode ON
INSERT INTO ToernooiInschrijven.GameMode(gameModeId, gameModeNaam)
	VALUES (1, 'Rocket-league')
INSERT INTO ToernooiInschrijven.GameMode(gameModeId, gameModeNaam)
	VALUES (2, 'Fortnite')
INSERT INTO ToernooiInschrijven.GameMode(gameModeId, gameModeNaam)
	VALUES (3, 'League of legends')
INSERT INTO ToernooiInschrijven.GameMode(gameModeId, gameModeNaam)
	VALUES (4, 'Valorant')
INSERT INTO ToernooiInschrijven.GameMode(gameModeId, gameModeNaam)
	VALUES (5, 'Counter-strike')
INSERT INTO ToernooiInschrijven.GameMode(gameModeId, gameModeNaam)
	VALUES (6, 'Dota 2')
INSERT INTO ToernooiInschrijven.GameMode(gameModeId, gameModeNaam)
	VALUES (7, 'Call of duty: Warzone')
INSERT INTO ToernooiInschrijven.GameMode(gameModeId, gameModeNaam)
	VALUES (8, 'Apex legends')



INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,33);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,34);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,35);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,36);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,37);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,38);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,39);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,40);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,41);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,42);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,43);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,44);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,45);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,46);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,47);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,48);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,49);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,50);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,51);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,52);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,53);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,54);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,55);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,56);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,57);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,58);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,59);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,60);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,61);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,62);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,63);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,64);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,65);

INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,33);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,34);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,35);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,36);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,37);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,38);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,39);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,40);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,41);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,42);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,43);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,44);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,45);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,46);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,47);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,48);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,49);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,50);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,51);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,52);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,53);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,54);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,55);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,56);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,57);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,58);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,59);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,60);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,61);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,62);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,63);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,64);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,65);


INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (3,33);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (3,34);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (3,35);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (3,36);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (3,37);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (3,38);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (3,39);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (3,40);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (4,41);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (5,42);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (5,43);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,44);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (3,45);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (1,46);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (4,47);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (3,48);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (5,49);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (4,50);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (3,51);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (5,52);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (3,53);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (2,54);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (5,55);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (4,56);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (4,57);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (3,58);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (3,59);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (5,60);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (5,61);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (4,62);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (5,63);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (4,64);
INSERT INTO ToernooiInschrijven.ToernooiPrijs(prijsId, toernooiId)
	VALUES (3,65);