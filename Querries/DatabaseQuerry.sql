--------------------
-- DROP EN CREATE --
--------------------

-- DROP TABLES
IF OBJECT_ID('ToernooiInschrijven.ToernooiRank') IS NOT NULL
	DROP TABLE ToernooiInschrijven.[ToernooiRank]
IF OBJECT_ID('ToernooiInschrijven.Rank') IS NOT NULL
	DROP TABLE ToernooiInschrijven.[Rank]
IF OBJECT_ID('ToernooiInschrijven.ToernooiPrijs') IS NOT NULL
	DROP TABLE ToernooiInschrijven.ToernooiPrijs
IF OBJECT_ID('ToernooiInschrijven.Prijs') IS NOT NULL
	DROP TABLE ToernooiInschrijven.Prijs
IF OBJECT_ID('ToernooiInschrijven.Speler') IS NOT NULL
	DROP TABLE ToernooiInschrijven.Speler
IF OBJECT_ID('ToernooiInschrijven.Toernooi') IS NOT NULL
	DROP TABLE ToernooiInschrijven.Toernooi
GO

-- DROP + CREATE SCHEMA
DROP SCHEMA IF EXISTS ToernooiInschrijven;
--DROP SCHEMA ToernooiInschrijven;
GO
EXECUTE('CREATE SCHEMA ToernooiInschrijven');
GO

CREATE TABLE ToernooiInschrijven.Toernooi
(
	[toernooiId] int IDENTITY(1,1) NOT NULL,
	toernooiNaam varchar(15) NOT NULL,
	datum date NOT NULL,
	checkInuur time NOT NULL,
	startuur time NOT NULL,
	gamemode varchar(40) NOT NULL,
	CONSTRAINT PK_Toernooi PRIMARY KEY (toernooiId)
)

CREATE TABLE ToernooiInschrijven.Speler
(
	[spelerId] int IDENTITY(1,1) NOT NULL,
	voornaam varchar(20) NOT NULL,
	achternaam varchar(50) NOT NULL,
	nicknaam varchar(20) NOT NULL,
	wachtwoord varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	geboortedatum date NOT NULL,
	geboorteplaats varchar(50) NULL,
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

CREATE TABLE ToernooiInschrijven.ToernooiPrijs
(
	[toernooiPrijsId] int IDENTITY(1,1) NOT NULL,
	prijsId int NOT NULL,
	toernooiId int NOT NULL,
	CONSTRAINT PK_ToernooiPrijs PRIMARY KEY (toernooiPrijsId),
	CONSTRAINT FK_ToernooiPrijs_Toernooi FOREIGN KEY (toernooiId) REFERENCES ToernooiInschrijven.Toernooi(toernooiId),
	CONSTRAINT FK_ToernooiPrijs_Prijs FOREIGN KEY (prijsId) REFERENCES ToernooiInschrijven.Prijs(prijsId)
)


CREATE TABLE ToernooiInschrijven.[Rank]
(
	[rankId] int IDENTITY(1,1) NOT NULL,
	ranknaam varchar(40) NULL,
	CONSTRAINT PK_Rank PRIMARY KEY (rankId)
)


CREATE TABLE ToernooiInschrijven.[ToernooiRank]
(
	[toernooiRankId] int IDENTITY(1,1) NOT NULL,
	toernooiId int NOT NULL,
	rankId int NOT NULL,
	CONSTRAINT PK_ToernooiRank PRIMARY KEY (toernooiRankId),
	CONSTRAINT FK_ToernooiRank_Toernooi FOREIGN KEY (toernooiId) REFERENCES ToernooiInschrijven.Toernooi(toernooiId),
	CONSTRAINT FK_ToernooiRank_Rank FOREIGN KEY (rankId) REFERENCES ToernooiInschrijven.[Rank](rankId)
)

--- CODE INSERT
SET IDENTITY_INSERT ToernooiInschrijven.Toernooi ON
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (1,'RL_3V3_1000', '2021-05-05','20:00:00', '20:30:00','Rocket-league');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (2,'FN_1V1_2000', '2021-06-05','21:00:00', '21:30:00','Fortnite');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (3,'LOL_5V5_3000', '2021-07-05','20:00:00', '20:30:00','League of legends');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (4,'VA_5V5_4000', '2021-08-05','21:00:00', '21:30:00','Valorant');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (5,'CSGO_5V5_5000', '2021-08-05','21:00:00', '21:30:00','Counter-strike');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (6,'DO_5V5_6000', '2021-09-05','21:00:00', '21:30:00','Dota 2');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (7,'WZ_5V5_7000', '2021-10-05','21:00:00', '21:30:00','Call of duty: Warzone');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (8,'AL_3V3_8000', '2021-11-05','21:00:00', '21:30:00','Apex Legends');

INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (9,'RL_3V3_1231', '2021-05-22','20:30:00', '21:00:00','Rocket-league');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (10,'FN_3V3_2514', '2021-06-22','21:00:00', '21:30:00','Fortnite');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (11,'LOL_5V5_3143', '2021-07-22','20:00:00', '20:30:00','League of legends');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (12,'VA_5V5_4412', '2021-08-25','20:00:00', '20:30:00','Valorant');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (13,'CSGO_5V5_5531', '2021-08-22','21:00:00', '21:30:00','Counter-strike');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (14,'DO_5V5_6532', '2021-09-22','21:00:00', '21:30:00','Dota 2');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (15,'WZ_5V5_7435', '2021-10-22','21:00:00', '21:30:00','Call of duty: Warzone');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (16,'AL_3V3_8343', '2021-11-25','21:00:00', '21:30:00','Apex Legends');

INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (17,'RL_3V3_1353', '2021-05-15','21:30:00', '22:00:00','Rocket-league');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (18,'FN_3V3_2533', '2021-06-15','22:00:00', '22:30:00','Fortnite');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (19,'LOL_5V5_3432', '2021-07-15','20:00:00', '20:30:00','League of legends');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (20,'VA_5V5_4532', '2021-08-15','21:00:00', '21:30:00','Valorant');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (21,'CSGO_5V5_5544', '2021-08-15','20:00:00', '20:30:00','Counter-strike');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (22,'DO_5V5_6464', '2021-09-15','20:00:00', '20:30:00','Dota 2');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (23,'WZ_5V5_7123', '2021-10-15','18:00:00', '18:30:00','Call of duty: Warzone');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (24,'AL_3V3_8766', '2021-11-15','19:00:00', '19:30:00','Apex Legends');

INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (25,'RL_3V3_1533', '2021-06-20','19:30:00', '20:00:00','Rocket-league');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (26,'FN_3V3_2767', '2021-07-20','18:00:00', '18:30:00','Fortnite');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (27,'LOL_5V5_3132', '2021-08-20','20:00:00', '20:30:00','League of legends');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (28,'VA_5V5_4132', '2021-09-20','21:00:00', '21:30:00','Valorant');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (29,'CSGO_5V5_5987', '2021-10-15','21:00:00', '21:30:00','Counter-strike');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (30,'DO_5V5_6135', '2021-11-20','20:00:00', '20:30:00','Dota 2');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (31,'WZ_5V5_7865', '2021-12-20','18:00:00', '18:30:00','Call of duty: Warzone');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (32,'AL_3V3_8642', '2021-12-25','19:00:00', '19:30:00','Apex Legends');





INSERT INTO ToernooiInschrijven.Speler(voornaam, achternaam, nicknaam, wachtwoord, email, geboortedatum, geboorteplaats)
	VALUES ('Joris','DeRidder', 'Jeuris42','****************', 'joris.42@hotmail.com','1997-02-21', 'Belgium');
INSERT INTO ToernooiInschrijven.Speler(voornaam, achternaam, nicknaam, wachtwoord, email, geboortedatum, geboorteplaats)
	VALUES ('Dennis','Luyten', 'Kiiro','******', 'DennisLuten@outlook.be','1999-05-12', 'Belgium');
INSERT INTO ToernooiInschrijven.Speler(voornaam, achternaam, nicknaam, wachtwoord, email, geboortedatum, geboorteplaats)
	VALUES ('Jan','Ghesquire', 'Por0','********', 'JanGhesquire@telenet.com','1996-03-18', 'Spain');
INSERT INTO ToernooiInschrijven.Speler(voornaam, achternaam, nicknaam, wachtwoord, email, geboortedatum, geboorteplaats)
	VALUES ('Lennert','Verwimp', 'GodzOfMadnezz','**********', 'Lennert07@gmail.be','1995-03-11', 'Belgium');
INSERT INTO ToernooiInschrijven.Speler(voornaam, achternaam, nicknaam, wachtwoord, email, geboortedatum, geboorteplaats)
	VALUES ('Alec','VanOosterwijck', 'Tankzwaluw','******', 'DenAlec@outlook.be','2000-02-04', 'Belgium');
INSERT INTO ToernooiInschrijven.Speler(voornaam, achternaam, nicknaam, wachtwoord, email, geboortedatum, geboorteplaats)
	VALUES ('Jelle','Vermeulen', 'JayEnvy','********', 'JayEnvy@hotmail.be','1994-07-12', 'England');


--fortnite--
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Unranked');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Open League: Division I');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Open League: Division II');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Open League: Division III');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Open League: Division IV');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Contender League: Division I');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Contender League: Division II');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Contender League: Division III');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Champion League: Division I');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Champion League: Division II');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Champion League: Division III');

--rocket league--
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Unranked');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Bronze');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Silver');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Gold');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Platinum');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Diamond');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Champion');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Grand Champion');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Supersonic Legend');

-- League of legends
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Unranked');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Iron');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Bronze');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Silver');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Gold');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Platinum');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Diamond');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Master');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Grandmaster');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Challenger');

-- valorant
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Unranked');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Iron');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Bronze');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Silver');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Gold');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Platinum');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Diamond');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Immortal');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Radiant');

-- CSGO
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Unranked');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Silver I');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Silver II');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Silver III');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Silver IV');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Silver Elite');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Silver Elite Master');

INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Gold Nova I');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Gold Nova II');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Gold Nova III');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Gold Nova Master');

INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Master Guardian I');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Master Guardian II');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Master Guardian Elite');

INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Distinguished Master Guardian');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Legendary Eagle');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Legendary Eagle Master');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Supreme Master First Class');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Global Elite');

-- dota 2
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Unranked');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Herald');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Guardian');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Crusader');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Archon');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Legend');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Ancient');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Divine');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Immortal');

-- Warzone
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES (NULL);

--Apex legends
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Unranked');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Bronze');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Silver');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Gold');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Platinum');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Diamond');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('Apex Predator');

-- asscociatie tabel
-- fortnite
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (1,1);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (1,2);
INSERT INTO ToernooiInschrijven.ToernooiRank
    VALUES (1,3);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (1,4);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (1,5);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (1,6);
	INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (1,7);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (1,8);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (1,9);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (1,10);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (1,11);

-- Rocket league
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (2,1);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (2,2);
INSERT INTO ToernooiInschrijven.ToernooiRank
    VALUES (2,3);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (2,4);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (2,5);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (2,6);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (2,7);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (2,8);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (2,9);

	-- League of legends
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (3,1);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (3,2);
INSERT INTO ToernooiInschrijven.ToernooiRank
    VALUES (3,3);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (3,4);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (3,5);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (3,6);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (3,7);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (3,8);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (3,9);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (3,10);

	-- valorant
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (4,1);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (4,2);
INSERT INTO ToernooiInschrijven.ToernooiRank
    VALUES (4,3);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (4,4);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (4,5);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (4,6);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (4,7);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (4,8);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (4,9);

-- CSGO
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (5,1);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (5,2);
INSERT INTO ToernooiInschrijven.ToernooiRank
    VALUES (5,3);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (5,4);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (5,5);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (5,6);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (5,7);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (5,8);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (5,9);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (5,10);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (5,11);
INSERT INTO ToernooiInschrijven.ToernooiRank
    VALUES (5,12);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (5,13);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (5,14);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (5,15);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (5,16);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (5,17);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (5,18);

-- dota 2
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (6,1);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (6,2);
INSERT INTO ToernooiInschrijven.ToernooiRank
    VALUES (6,3);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (6,4);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (6,5);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (6,6);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (6,7);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (6,8);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (6,9);

-- warzone
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (7,1);

-- apex legends
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (8,1);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (8,2);
INSERT INTO ToernooiInschrijven.ToernooiRank
    VALUES (8,3);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (8,4);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (8,5);
INSERT INTO ToernooiInschrijven.ToernooiRank
	VALUES (8,6);
INSERT INTO ToernooiInschrijven.ToernooiRank
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