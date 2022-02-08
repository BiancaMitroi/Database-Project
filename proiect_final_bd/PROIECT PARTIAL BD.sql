-- Baza de date S04
-- Bianca Mitroi

DROP TABLE Persoana CASCADE CONSTRAINT;
DROP TABLE Deviz CASCADE CONSTRAINT;
DROP TABLE Piesa CASCADE CONSTRAINT;
DROP TABLE Piesa_deviz CASCADE CONSTRAINT;

--4.01

--a)^
CREATE TABLE Persoana(
	id NUMBER NOT NULL,
	nume VARCHAR(20) NOT NULL,
	email VARCHAR(120),
	adresa VARCHAR(100) NOT NULL
);

--b)^
CREATE TABLE Deviz(
	id_d NUMBER NOT NULL,
	data_introducere VARCHAR(20) NOT NULL,
	aparat VARCHAR2(30) NOT NULL,
	simptome VARCHAR(50),
	defect VARCHAR(20),
	data_cONstatare DATE,
	data_finalizare DATE,
	durata NUMBER,
	manopera_ORa NUMBER,
	total NUMBER,
	id_client NUMBER NOT NULL,
	id_depanator NUMBER NOT NULL
);

--c)^
CREATE TABLE Piesa(
	id_p NUMBER NOT NULL,
	descriere VARCHAR2(1024),
	fabricant VARCHAR(20),
	cantitate_stoc NUMBER,
	pret_c NUMBER
);

--d)^
CREATE TABLE Piesa_Deviz(
	id_d NUMBER NOT NULL,
	id_p NUMBER NOT NULL,
	cantitate NUMBER,
	pret_r NUMBER
);

--e)
--^
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
------------------------------
ALTER TABLE Deviz
ADD CONSTRAINT deviz_fk FOREIGN KEY (id_client) REFERENCES Persoana (id);

ALTER TABLE Deviz
ADD CONSTRAINT deviz_fk2 FOREIGN KEY (id_depanator) REFERENCES Persoana (id);

ALTER TABLE Piesa_deviz
ADD CONSTRAINT piesa_deviz_fk FOREIGN KEY (id_p) REFERENCES Piesa (id_p);


--f)
ALTER TABLE Persoana 
ADD telefON VARCHAR(15);

--4.02

--a)
ALTER TABLE Persoana
ADD CONSTRAINT CK_persoana
	CHECK(email LIKE '%@%' AND LENGTH(email) > 10); 

--b)
ALTER TABLE Deviz
ADD CONSTRAINT CK_Deviz
	CHECK (NOT(data_finalizare IS NOT NULL AND data_cONstatare IS NULL));
	
--Umplere tabele

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

INSERT INTO Deviz (id_d, data_introducere, aparat, simptome, defect, data_cONstatare, data_finalizare, durata, manopera_ORa, total, id_client, id_depanator)
VALUES(36, '24/03/2020', 'Samsung Galaxy A12', 'memORie insuficientă', '94', NULL, NULL, 9, 84, 135, 11, 12);
INSERT INTO Deviz (id_d, data_introducere, aparat, simptome, defect, data_cONstatare, data_finalizare, durata, manopera_ORa, total, id_client, id_depanator)
VALUES(61, '04/06/2020', 'TelevizOR Samsung 50AU7172', 'Nu receptiONeaza televiziunea', '74', NULL, NULL, 4, 63, 162, 47, 50);
INSERT INTO Deviz (id_d, data_introducere, aparat, simptome, defect, data_cONstatare, data_finalizare, durata, manopera_ORa, total, id_client, id_depanator)
VALUES(62, '04/06/2020', 'TelevizOR Samsung 50AU7172', 'Nu receptiONeaza televiziunea', '74', NULL, NULL, 4, 63, 162, 47, 50);
INSERT INTO Deviz (id_d, data_introducere, aparat, simptome, defect, data_cONstatare, data_finalizare, durata, manopera_ORa, total, id_client, id_depanator)
VALUES(98, '24/11/2020', 'Laptop HP 250 G8', 'nu functiONeaza usb ul', '64', NULL, NULL, 48, 96, 117, 73, 45);
INSERT INTO Deviz (id_d, data_introducere, aparat, simptome, defect, data_cONstatare, data_finalizare, durata, manopera_ORa, total, id_client, id_depanator)
VALUES(86, '03/03/2021', 'TelevizOR LED Star-Light', 'nu proceseaza imaginile', '88', NULL, NULL, 2, 81, 160, 17, 46);
INSERT INTO Deviz (id_d, data_introducere, aparat, simptome, defect, data_cONstatare, data_finalizare, durata, manopera_ORa, total, id_client, id_depanator)
VALUES(87, '29/08/2021', 'Samsung Galaxy S20', 'Aplicațiile rulează foarte greu', '7', NULL, NULL, 89, 70, 108, 78, 66);
INSERT INTO Deviz (id_d, data_introducere, aparat, simptome, defect, data_cONstatare, data_finalizare, durata, manopera_ORa, total, id_client, id_depanator)
VALUES(1, '13/02/2020', 'TelevizOR Samsung 32T4302', 'Nu proceseaza sunetul', '47', NULL, NULL, 6, 14, 94, 12, 50);

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

--4.03

--a)
SELECT *
FROM Deviz
WHERE total > 100 AND data_introducere >= '01/01/2021'
ORDER BY data_introducere;

--b)
SELECT *
FROM Piesa
WHERE cantitate_stoc = 0
ORDER BY descriere DESC, fabricant;

--4.04

--a)
SELECT d.id_d, p.descriere, p.fabricant, p.pret_c, pd.pret_r
FROM Deviz d JOIN Piesa_Deviz pd ON d.id_d = pd.id_d JOIN Piesa p ON p.id_p = pd.id_p
WHERE p.pret_c < pd.pret_r;

--b)
SELECT distinct p1.id_p "id_p1", p2.id_p "id_p2"
FROM Piesa p1, Piesa p2
WHERE p1.fabricant ^= p2.fabricant AND p1.descriere = p2.descriere AND p1.id_p > p2.id_p;

--4.05

--a)
SELECT *
FROM Piesa
WHERE EXISTS (
	SELECT *
	FROM Piesa_Deviz
	WHERE Piesa_deviz.pret_r < Piesa.pret_c
);

--b)
SELECT DISTINCT Deviz1.total
FROM Deviz Deviz1
  LEFT JOIN Deviz Deviz2
    ON Deviz2.total > Deviz1.total AND Deviz2.total IS NOT NULL
WHERE Deviz2.total IS NULL AND Deviz1.data_introducere >= '01/01/2021';

--4.06
--a) 
SELECT Persoana.nume, Deviz.id_depanator, TO_NUMBER(SUBSTR(TO_CHAR(Deviz.data_introducere), 4, 2)), COUNT(Deviz.id_depanator)
FROM Deviz JOIN Persoana ON (Deviz.id_depanator = Persoana.id)
HAVING COUNT(id_depanator) >= 1
GROUP BY Persoana.nume, Deviz.id_depanator, SUBSTR(TO_CHAR(Deviz.data_introducere), 4, 2);

--b)
SELECT Piesa.descriere, Piesa.fabricant, SUM(Piesa_deviz.cantitate)
FROM Piesa JOIN Piesa_Deviz ON (Piesa.id_p = Piesa_Deviz.id_p) JOIN Deviz ON (Piesa.id_p = Deviz.id_d)
WHERE Deviz.data_introducere >= '01/01/2021' AND data_introducere <= '31/12/2021'
GROUP BY Piesa.descriere, Piesa.fabricant;

--4.07
--a)^
INSERT INTO Deviz (id_d, data_introducere, aparat, simptome, defect, data_constatare, data_finalizare, durata, manopera_ORa, total, id_client, id_depanator)
VALUES(123, '30/09/2021', 'TV Samsung', 'imagine desincronizata', NULL, NULL, NULL, NULL, NULL, NULL, 11, 17);

--b)
DELETE *
FROM Deviz LEFT JOIN Piesa_Deviz ON (Deviz.id_d = Piesa_Deviz.id_d)
WHERE Deviz.data_finalizare < '01/01/2021' AND Piesa_Deviz.cantitate IS NULL;

--c)^
UPDATE Deviz
SET manopera_ORa = 0.95 * manopera_ORa, total = 0.95 * total
WHERE id_d = 1;

--4.08

--a)
CREATE OR REPLACE TRIGGER actualizare_piesa
BEFORE UPDATE OF cantitate ON Piesa_Deviz
BEGIN
	UPDATE Piesa
	SET cantitate_stoc = cantitate_stoc - 1
	WHERE cantitate_stoc <> 0;
END;
	
--b)
CREATE OR REPLACE TRIGGER ACTUALIZARE_DEVIZ
BEFORE INSERT OR UPDATE ON PIESA_DEVIZ
FOR EACH ROW
DECLARE
    CURSOR C IS
    SELECT ID_P
    FROM PIESA
    WHERE CANTITATE_STOC = 0;

    
    V_ID_P PIESA.ID_P % TYPE;

BEGIN
    OPEN C;
    LOOP
        FETCH C INTO V_ID_P;
        
        EXIT WHEN C % NOTFOUND;
        IF :NEW.ID_P = V_ID_P THEN
            RAISE_APPLICATION_ERROR(-234, 'EROARE');
        END IF;
    END LOOP;
    CLOSE C;
END;

--c)
CREATE OR REPLACE TRIGGER TRIGGER_VIEW
INSTEAD OF INSERT OR UPDATE ON PieseDeviz123
DECLARE
    V_NUME PERSOANA.NUME % TYPE := NULL;
    V_ID_D DEVIZ.ID_D % TYPE := NULL;
    V_DESCRIERE PIESA.DESCRIERE % TYPE := NULL;
    V_CANTITATE PIESA_DEVIZ.CANTITATE % TYPE := NULL;
BEGIN
SELECT DISTINCT nume INTO V_NUME FROM PERSOANA WHERE nume = :NEW.client;
IF V_NUME IS NULL THEN
    INSERT INTO PERSOANA(nume)
    VALUES(:NEW.client);
END IF;
SELECT DISTINCT nume INTO V_NUME FROM PERSOANA WHERE nume = :NEW.depanator;
IF V_NUME IS NULL THEN
    INSERT INTO PERSOANA(nume)
    VALUES(:NEW.depanator);
END IF;
SELECT DISTINCT id_d INTO V_ID_D FROM DEVIZ WHERE id_d = :NEW.id_d;
IF V_ID_D IS NULL THEN
    INSERT INTO DEVIZ(id_d, data_introducere, aparat, simptome, defect, data_constatare, data_finalizare, durata, manopera_ora, total) VALUES(:NEW.id_d, :NEW.data_introducere, :NEW.aparat, :NEW.simptome, :NEW.defect, :NEW.data_constatare, :NEW.data_finalizare, :NEW.durata, :NEW.manopera_ora, :NEW.total);
END IF;
SELECT DISTINCT descriere INTO V_DESCRIERE FROM PIESA WHERE descriere = :NEW.descriere;
IF V_DESCRIERE IS NULL THEN
   INSERT INTO PIESA(descriere, fabricant, cantitate_stoc, pret_c) VALUES(:NEW.descriere, :NEW.fabricant, :NEW.cantitate_stoc, :NEW.pret_c);
END IF; 
SELECT DISTINCT cantitate INTO V_CANTITATE FROM PIESA_DEVIZ WHERE cantitate = :NEW.cantitate;
IF V_CANTITATE IS NULL THEN
   INSERT INTO PIESA_DEVIZ(cantitate, pret_r) VALUES(:NEW.cantitate, :NEW.pret_r);
END IF;
END;

--cazuri de test

--04.02

--a)
INSERT INTO PERSOANA(id, nume, email, adresa)
VALUES(11, 'Oskar', 'efil.com', '4684 Pinewood Avenue, SAN MATEO, CalifORnia');
--ORA-02290: check constraint (RO_A544_SQL_S23.CK_PERSOANA) violated

--b)
INSERT INTO Deviz (id_d, data_introducere, aparat, simptome, defect, data_cONstatare, data_finalizare, durata, manopera_ORa, total, id_client, id_depanator)
VALUES(36, '24/03/2020', 'Samsung Galaxy A12', 'memORie insuficientă', '94', '24-Nov-2020', NULL, 9, 84, 135, 11, 12);
--ORA-00001: unique constraint (RO_A544_SQL_S23.DEVIZ_PK) violated

--------------------------------------------------------------

INSERT INTO Piesa (id_p, descriere, fabricant, cantitate_stoc, pret_c)
VALUES(58, 'oflijbkclvvblr', 'oflijbkclvvblr', 0, 15);
--ORA-00001: unique constraint (RO_A544_SQL_S23.PIESA_PK) violated

INSERT INTO Persoana (id, nume, email, adresa)
VALUES(11, 'Oskar', 'efilimONova@enhancerONly.com', '4684 Pinewood Avenue, SAN MATEO, CalifORnia');
--ORA-00001: unique constraint (RO_A544_SQL_S23.PERSOANA_PK) violated

INSERT INTO Deviz (id_d, data_introducere, aparat, simptome, defect, data_cONstatare, data_finalizare, durata, manopera_ORa, total, id_client, id_depanator)
VALUES(36, '24/03/2020', 'Samsung Galaxy A12', 'memORie insuficientă', '94', NULL, NULL, 9, 84, 135, 11, 12);
--ORA-00001: unique constraint (RO_A544_SQL_S23.DEVIZ_PK) violated

INSERT INTO Piesa (id_p, descriere, fabricant, cantitate_stoc, pret_c)
VALUES(58, 'oflijbkclvvblr', 'lknbdfjgogjs', 0, 15);
--ORA-00001: unique constraint (RO_A544_SQL_S23.PIESA_PK) violated

INSERT INTO Piesa_Deviz (id_d, id_p, cantitate, pret_r)
VALUES(61, 5, 81, 99);
--ORA-00001: unique constraint (RO_A544_SQL_S23.PIESA_DEVIZ_PK) violated

delete 
from Persoana
where id = 11;
--ORA-02292: integrity constraint (RO_A544_SQL_S23.DEVIZ_FK) violated - child record found

INSERT INTO Deviz (id_d, data_introducere, aparat, simptome, defect, data_cONstatare, data_finalizare, durata, manopera_ORa, total, id_client, id_depanator)
VALUES(14, '24/03/2020', 'Samsung Galaxy A12', 'memORie insuficientă', '94', NULL, NULL, 9, 84, 135, 23, 12);
--ORA-02291: integrity constraint (RO_A544_SQL_S23.DEVIZ_FK) violated - parent key not found

INSERT INTO Deviz (id_d, data_introducere, aparat, simptome, defect, data_cONstatare, data_finalizare, durata, manopera_ORa, total, id_client, id_depanator)
VALUES(20, '24/03/2020', 'Samsung Galaxy A12', 'memORie insuficientă', '94', NULL, NULL, 9, 84, 135, 11, 14);
--ORA-02291: integrity constraint (RO_A544_SQL_S23.DEVIZ_FK2) violated - parent key not found

INSERT INTO Piesa_Deviz (id_d, id_p, cantitate, pret_r)
VALUES(98, 77, 70, 21);
--ORA-02291: integrity constraint (RO_A544_SQL_S23.PIESA_DEVIZ_FK) violated - parent key not found

------------------------------------------------------------------

--04.08

--a)

UPDATE Piesa_deviz
SET cantitate = cantitate + 1
where id_d = 36;
--1 row(s) updated.

select *
from Piesa_deviz
where id_d = 36;

select *
from Piesa
where id_p = 58;

UPDATE Piesa_deviz
SET cantitate = cantitate + 1
where id_d = 61;
--1 row(s) updated.

select *
from Piesa_deviz
where id_d = 61;

select *
from Piesa
where id_p = 5;

--b)

INSERT INTO Piesa_Deviz (id_d, id_p, cantitate, pret_r)
VALUES(39, 58, 0, 51);

--ORA-21000: error number argument to raise_application_error of -234 is out of range
--ORA-06512: at "RO_A544_SQL_S23.ACTUALIZARE_DEVIZ", line 17
--ORA-04088: error during execution of trigger 'RO_A544_SQL_S23.ACTUALIZARE_DEVIZ'

--c)
INSERT INTO Persoana (id, nume, email, adresa)
VALUES(14, 'Osfal', 'efilimova@enhancerONly.com', '4687 Pinewool Venue, SAN MATEO, CalifORnia');
--1 row(s) inserted.