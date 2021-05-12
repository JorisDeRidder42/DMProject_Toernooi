--------------------
-- DROP EN CREATE --
--------------------

-- DROP TABLES
IF OBJECT_ID('ToernooiInschrijven.Rank') IS NOT NULL
	DROP TABLE Spotify1.ArtiestNummer
IF OBJECT_ID('ToernooiInschrijven.Prijs') IS NOT NULL
	DROP TABLE ToernooiInschrijven.
IF OBJECT_ID('ToernooiInschrijven.ToernooiPrijs') IS NOT NULL
	DROP TABLE ToernooiInschrijven.
IF OBJECT_ID('ToernooiInschrijven.Toernooi') IS NOT NULL
	DROP TABLE ToernooiInschrijven.Toernooi
GO

-- DROP + CREATE SCHEMA
DROP SCHEMA IF EXISTS ToernooiInschrijven;
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

CREATE TABLE ToernooiInschrijven.ToernooiPrijs
(
	[toernooiPrijsId] int IDENTITY(1,1) NOT NULL,
	CONSTRAINT PK_ToernooiPrijs PRIMARY KEY (toernooiPrijsId),
	CONSTRAINT FK_ToernooiPrijs_ToernooiPrijs FOREIGN KEY (toernooiPrijsId) REFERENCES ToernooiInschrijven.Toernooi(toernooiId),
	CONSTRAINT FK_ToernooiPrijs_ToernooiPrijs FOREIGN KEY (toernooiPrijsId) REFERENCES ToernooiInschrijven.Prijs(prijsId),	
)

CREATE TABLE ToernooiInschrijven.Prijs
(
	[prijsId] int IDENTITY(1,1) NOT NULL,
	spelerId int NOT NULL,
	CONSTRAINT PK_Prijs PRIMARY KEY (prijsId)
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
CREATE TABLE ToernooiInschrijven.[Rank]
(
	[rankId] int IDENTITY(1,1) NOT NULL,
	ranknaam varchar(20) NULL,
	CONSTRAINT PK_Rank PRIMARY KEY (rankId),
	CONSTRAINT FK_ToernooiInschrijven_Rank FOREIGN KEY (rankId) REFERENCES ToernooiInschrijven.Speler(spelerId)
)


INSERT INTO ToernooiInschrijven.Toernooi
    VALUES ('RL_3V3_1000','Germany', '2021-05-05','20:00:00', '20:30:00','Rocket-league');
INSERT INTO ToernooiInschrijven.Toernooi
    VALUES ('FN_1V1_2000','Spain', '2021-06-05','21:00:00', '21:30:00','Fortnite');
