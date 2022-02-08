CREATE TABLE Persoana(
	id INTEGER NOT NULL,
	nume VARCHAR(20) NOT NULL,
	email VARCHAR(120),
	adresa VARCHAR(100) NOT NULL
);

CREATE TABLE Deviz(
	id_d INTEGER NOT NULL,
	data_introducere DATE NOT NULL,
	aparat VARCHAR(30) NOT NULL,
	simptome VARCHAR(50),
	defect VARCHAR(20),
	data_constatare DATE,
	data_finalizare DATE,
	durata INTEGER,
	manopera_ora INTEGER,
	total INTEGER,
	id_client INTEGER NOT NULL,
	id_depanator INTEGER NOT NULL
);

CREATE TABLE Piesa(
	id_p INTEGER NOT NULL,
	descriere VARCHAR(1024),
	fabricant VARCHAR(20),
	cantitate_stoc INTEGER,
	pret_c INTEGER
);

CREATE TABLE Piesa_Deviz(
	id_d INTEGER NOT NULL,
	id_p INTEGER NOT NULL,
	cantitate INTEGER,
	pret_r INTEGER
);

ALTER TABLE Persoana
ADD CONSTRAINT persoana_pk PRIMARY KEY (id);

ALTER TABLE Deviz
ADD CONSTRAINT deviz_pk PRIMARY KEY (id_d);

ALTER TABLE Piesa
ADD CONSTRAINT piesa_pk PRIMARY KEY (id_p);

ALTER TABLE Piesa
ADD CONSTRAINT uq_piesa UNIQUE (descriere, fabricant);

ALTER TABLE Piesa_Deviz
ADD CONSTRAINT piesa_deviz_pk PRIMARY KEY (id_d, id_p);

ALTER TABLE Deviz
ADD CONSTRAINT deviz_fk FOREIGN KEY (id_client) REFERENCES Persoana (id);

ALTER TABLE Deviz
ADD CONSTRAINT deviz_fk2 FOREIGN KEY (id_depanator) REFERENCES Persoana (id);

ALTER TABLE Piesa_deviz
ADD CONSTRAINT piesa_deviz_fk FOREIGN KEY (id_p) REFERENCES Piesa (id_p);

ALTER TABLE Persoana 
ADD telefon VARCHAR(15);

INSERT INTO Persoana (id, nume, email, adresa)
VALUES(11, 'Oskar', 'efilimONova@enhancerONly.com', '4684 Pinewood Avenue, SAN MATEO, CalifORnia');
INSERT INTO Persoana (id, nume, email, adresa)
VALUES(47, 'Anita', 'ismagilov58@somONsuka.com', '411 Crestview Terrace, New Braunfels, Texas');
INSERT INTO Persoana (id, nume, email, adresa)
VALUES(73, 'Mstislav', 'elojosnegros@usbvap.com', '1081 Lang Avenue, Park Valley, Utah');
INSERT INTO Persoana (id, nume, email, adresa)
VALUES(17, 'Saraswati', 'jcirizar@asianmeditatiONs.ru', '2004 Cantebury Drive, ElmsfORd, New YORk');
INSERT INTO Persoana (id, nume, email, adresa)
VALUES(78, 'GregORios', 'wobdee@bestnewbook.site', '4112 Emily Drive, RichmONd, Virginia');
INSERT INTO Persoana (id, nume, email, adresa)
VALUES(12, 'Marlies', 'p305mpdk6@aenikaufa.com', '644 Briarwood Road, BransON, Missouri');
INSERT INTO Persoana (id, nume, email, adresa)
VALUES(50, 'Romuald', 'rqotw@greENDike.com', '4177 Roosevelt Road, Moundridge, Kansas');
INSERT INTO Persoana (id, nume, email, adresa)
VALUES(66, 'Basilius', 'ftsnsb@cudimex.com', '1851 Franklee Lane, Plymouth Meeting, Pennsylvania');
INSERT INTO Persoana (id, nume, email, adresa)
VALUES(45, 'Joel', 'jenben@mobisl.site', '259 VictORia Court, Errol, Maine');
INSERT INTO Persoana (id, nume, email, adresa)
VALUES(46, 'Pia', 'jON23@curcuplas.me', '1885 Grove Street, Bethpage, New YORk');

INSERT INTO Deviz (id_d, data_introducere, aparat, simptome, defect, data_constatare, data_finalizare, durata, manopera_ora, total, id_client, id_depanator)
VALUES(36, '2020-03-24', 'Samsung Galaxy A12', 'memorie insuficientă', '94', NULL, NULL, 9, 84, 135, 11, 12);
INSERT INTO Deviz (id_d, data_introducere, aparat, simptome, defect, data_constatare, data_finalizare, durata, manopera_ora, total, id_client, id_depanator)
VALUES(61, '2020-06-04', 'TelevizOR Samsung 50AU7172', 'Nu receptiONeaza televiziunea', '74', NULL, NULL, 4, 63, 162, 47, 50);
INSERT INTO Deviz (id_d, data_introducere, aparat, simptome, defect, data_constatare, data_finalizare, durata, manopera_ora, total, id_client, id_depanator)
VALUES(62, '2020-06-04', 'TelevizOR Samsung 50AU7172', 'Nu receptiONeaza televiziunea', '74', NULL, NULL, 4, 63, 162, 47, 50);
INSERT INTO Deviz (id_d, data_introducere, aparat, simptome, defect, data_constatare, data_finalizare, durata, manopera_ora, total, id_client, id_depanator)
VALUES(98, '2020-11-24', 'Laptop HP 250 G8', 'nu functiONeaza usb ul', '64', NULL, NULL, 48, 96, 117, 73, 45);
INSERT INTO Deviz (id_d, data_introducere, aparat, simptome, defect, data_constatare, data_finalizare, durata, manopera_ora, total, id_client, id_depanator)
VALUES(86, '2021-03-03', 'TelevizOR LED Star-Light', 'nu proceseaza imaginile', '88', NULL, NULL, 2, 81, 160, 17, 46);
INSERT INTO Deviz (id_d, data_introducere, aparat, simptome, defect, data_constatare, data_finalizare, durata, manopera_ora, total, id_client, id_depanator)
VALUES(87, '2021-08-29', 'Samsung Galaxy S20', 'Aplicațiile rulează foarte greu', '7', NULL, NULL, 89, 70, 108, 78, 66);
INSERT INTO Deviz (id_d, data_introducere, aparat, simptome, defect, data_constatare, data_finalizare, durata, manopera_ora, total, id_client, id_depanator)
VALUES(1, '2020-02-13', 'TelevizOR Samsung 32T4302', 'Nu proceseaza sunetul', '47', NULL, NULL, 6, 14, 94, 12, 50);

INSERT INTO Piesa (id_p, descriere, fabricant, cantitate_stoc, pret_c)
VALUES(58, 'oflijbkclvvblr', 'lknbdfjgogjs', 0, 9);
INSERT INTO Piesa (id_p, descriere, fabricant, cantitate_stoc, pret_c)
VALUES(5, 'oflijbkclvvblr', 'kjvopojogmf', 50, 111);
INSERT INTO Piesa (id_p, descriere, fabricant, cantitate_stoc, pret_c)
VALUES(87, 'oflijbkclvvblr', 'lkjpsORjogfg', 30, 51);
INSERT INTO Piesa (id_p, descriere, fabricant, cantitate_stoc, pret_c)
VALUES(88, 'saopgjmblo', 'jsdkpokewx.vjf', 91, 70);
INSERT INTO Piesa (id_p, descriere, fabricant, cantitate_stoc, pret_c)
VALUES(7, 'soadqnk', 'jsnaORokfdg', 41, 79);
INSERT INTO Piesa (id_p, descriere, fabricant, cantitate_stoc, pret_c)
VALUES(19, 'oajdqofvbijv', 'kapoejqjkckxzc', 62, 48);
INSERT INTO Piesa (id_p, descriere, fabricant, cantitate_stoc, pret_c)
VALUES(64, 'kgdkmvbxcivo', 'lkcpbocvllmznxv', 65, 22);
INSERT INTO Piesa (id_p, descriere, fabricant, cantitate_stoc, pret_c)
VALUES(9, 'snovidhigkbn', 'jaahoijkjfgjd', 10, 11);
INSERT INTO Piesa (id_p, descriere, fabricant, cantitate_stoc, pret_c)
VALUES(17, 'lmnodihegkn', 'jbadlsjdodsojgdob', 56, 45);
INSERT INTO Piesa (id_p, descriere, fabricant, cantitate_stoc, pret_c)
VALUES(95, '.jnkbxbjdfign', 'knlsaoeripewlmfds', 35, 33);
INSERT INTO Piesa (id_p, descriere, fabricant, cantitate_stoc, pret_c)
VALUES(1, 'kjxzoijsfbkc', '.knsSLfj[apflasd', 61, 82);

INSERT INTO Piesa_Deviz (id_d, id_p, cantitate, pret_r)
VALUES(36, 58, 0, 10);
INSERT INTO Piesa_Deviz (id_d, id_p, cantitate, pret_r)
VALUES(61, 5, 81, 10);
INSERT INTO Piesa_Deviz (id_d, id_p, cantitate, pret_r)
VALUES(98, 87, 70, 21);
INSERT INTO Piesa_Deviz (id_d, id_p, cantitate, pret_r)
VALUES(86, 88, 19, 79);
INSERT INTO Piesa_Deviz (id_d, id_p, cantitate, pret_r)
VALUES(87, 7, 98, 38);
INSERT INTO Piesa_Deviz (id_d, id_p, cantitate, pret_r)
VALUES(1, 19, 79, 80);
INSERT INTO Piesa_Deviz (id_d, id_p, cantitate, pret_r)
VALUES(37, 58, 0, 51);
INSERT INTO Piesa_Deviz (id_d, id_p, cantitate, pret_r)
VALUES(38, 58, 0, 51);