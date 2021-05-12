
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (1,'RL_3V3_1000', '2021-05-05','20:00:00', '20:30:00','Rocket-league');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (2,'FN_1V1_2000', '2021-06-05','21:00:00', '21:30:00','Fortnite');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (3,'LOL_5V5_3000', '2021-07-05','20:00:00', '20:30:00','League of legends');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (4,'VA_5V5_4000', '2021-08-05','21:00:00', '21:30:00','Valorant');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (5,'CSGO_5V5_5000', '2021-08-05','21:00:00', '21:30:00','Counter-strike Global offensive');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (6,'DO_5V5_6000', '2021-09-05','21:00:00', '21:30:00','Dota 2');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (7,'SC_5V5_7000', '2021-10-05','21:00:00', '21:30:00','Counter-strike Global offensive');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (8,'SSB_1V1_8000', '2021-11-05','21:00:00', '21:30:00','Super Smash Bros');

	INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (9,'RL_3V3_1231', '2021-05-22','20:30:00', '21:00:00','Rocket-league');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (10,'FN_3V3_2514', '2021-06-22','21:00:00', '21:30:00','Fortnite');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (11,'LOL_5V5_3143', '2021-07-22','20:00:00', '20:30:00','League of legends');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (12,'VA_5V5_4412', '2021-08-25','20:00:00', '20:30:00','Valorant');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (13,'CSGO_5V5_5531', '2021-08-22','21:00:00', '21:30:00','Counter-strike Global offensive');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (14,'DO_5V5_6532', '2021-09-22','21:00:00', '21:30:00','Dota 2');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (15,'SC_5V5_7435', '2021-10-22','21:00:00', '21:30:00','Counter-strike Global offensive');
INSERT INTO ToernooiInschrijven.Toernooi (toernooiId, toernooiNaam, datum, checkInuur, startuur, gamemode)
    VALUES (16,'SSB_1V1_8343', '2021-11-25','21:00:00', '21:30:00','Super Smash Bros');


SET IDENTITY_INSERT ToernooiInschrijven.Prijs ON
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
	VALUES ('Jelle','Vermeulen', 'JayEnvy','********', 'JayEnvy@hotmail.be','1995-08-15', 'England');

SET IDENTITY_INSERT ToernooiInschrijven.[Rank] ON
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('silver');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES (NUll);
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES (NUll);
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('bronze');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('iron');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('gold');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('platinum');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('diamond');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('champion');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES ('grandchampion');
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES (null);
INSERT INTO ToernooiInschrijven.[Rank](ranknaam)
	VALUES (null);


SET IDENTITY_INSERT ToernooiInschrijven.Prijs ON
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