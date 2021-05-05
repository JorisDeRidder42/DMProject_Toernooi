CREATE SCHEMA ToernooiInschrijven
CREATE TABLE ToernooiInschrijven.Toernooi
(
	[toernooiId] int IDENTITY(1,1) NOT NULL,
	toernooiNaam varchar(20) NOT NULL,
	plaats varchar(20) NULL,
	prijzenpot int NULL,
	startdatum date NOT NULL,
	einddatum date NULL,
	CheckInuur time NOT NULL,
	Startuur time NOT NULL,
	Gamemode varchar(20) NOT NULL,
	CONSTRAINT PK_Toernooi PRIMARY KEY (toernooiId)
)

CREATE TABLE ToernooiInschrijven.Prijs
(
	[prijsId] int IDENTITY(1,1) NOT NULL,
	toernooiId int NOT NULL,
	prijsnaam varchar (20) NOT NULL,
	spelerId int NOT NULL,
	CONSTRAINT PK_Prijs PRIMARY KEY (prijsId),
	CONSTRAINT FK_Prijs_Toernooi FOREIGN KEY (toernooiId) REFERENCES ToernooiInschrijven.Toernooi(toernooiId)
)

CREATE TABLE ToernooiInschrijven.Speler
(
	[spelerId] int IDENTITY(1,1) NOT NULL,
	voornaam varchar(20) NOT NULL,
	achternaam varchar(20) NOT NULL,
	nicknaam varchar(20) NOT NULL,
	geboortedatum date NULL,
	geboorteplaats varchar(20) NULL,
	CONSTRAINT PK_Speler PRIMARY KEY (spelerId),
	CONSTRAINT FK_ToernooiInschrijven_Speler FOREIGN KEY (spelerId) REFERENCES ToernooiInschrijven.Prijs(prijsId)
)
CREATE TABLE ToernooiInschrijven.[Role]
(
	[roleId] int IDENTITY(1,1) NOT NULL,
	rolenaam varchar(20) NULL,
	CONSTRAINT PK_Role PRIMARY KEY (roleId),
	CONSTRAINT FK_ToernooiInschrijven_Role FOREIGN KEY (roleId) REFERENCES ToernooiInschrijven.Speler(spelerId)
)