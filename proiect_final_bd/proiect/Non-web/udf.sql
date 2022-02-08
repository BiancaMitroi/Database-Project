DELIMITER $$
CREATE OR REPLACE PROCEDURE Ex3a()
BEGIN
	SELECT *
	FROM Deviz
	WHERE total > 100 AND data_introducere >= '2021-01-01'
	ORDER BY data_introducere;
END $$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE Ex3b()
BEGIN
	SELECT *
	FROM Piesa
	WHERE cantitate_stoc = 0
	ORDER BY descriere DESC, fabricant;
END $$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE Ex4a()
BEGIN
	SELECT d.id_d, p.descriere, p.fabricant, p.pret_c, pd.pret_r
	FROM Deviz d JOIN Piesa_Deviz pd ON d.id_d = pd.id_d JOIN Piesa p ON p.id_p = pd.id_p
	WHERE p.pret_c < pd.pret_r;
END $$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE Ex4b()
BEGIN
	SELECT DISTINCT CONCAT(p1.id_p, CONCAT(' ', p2.id_p)) "pereche"
	FROM Piesa p1, Piesa p2
	WHERE p1.fabricant != p2.fabricant AND p1.descriere = p2.descriere AND p1.id_p > p2.id_p;
END $$
DELIMITER ;


DELIMITER $$
CREATE OR REPLACE PROCEDURE Ex5a()
BEGIN
	SELECT *
	FROM Piesa
	WHERE EXISTS (
		SELECT *
		FROM Piesa_Deviz
		WHERE Piesa_deviz.pret_r < Piesa.pret_c);
END $$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE Ex5b()
BEGIN
	SELECT DISTINCT Deviz1.id_d, Deviz1.total
	FROM Deviz Deviz1 LEFT JOIN Deviz Deviz2 ON Deviz2.total > Deviz1.total AND Deviz2.total IS NOT NULL
	WHERE Deviz2.total IS NULL AND Deviz1.data_introducere >= '01/01/2021';
END $$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE Ex6a()
BEGIN
	SELECT Persoana.nume, Deviz.id_depanator, CAST(SUBSTRING(CAST(Deviz.data_introducere AS CHAR), 4, 2) AS INTEGER) "LUNA", COUNT(Deviz.id_depanator) "NR_DEVIZE"
	FROM Deviz JOIN Persoana ON (Deviz.id_depanator = Persoana.id)
	WHERE COUNT(id_depanator) >= 1
	GROUP BY Persoana.nume, Deviz.id_depanator, CAST(SUBSTRING(CAST(Deviz.data_introducere AS CHAR), 4, 2) AS INTEGER);
END $$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE Ex6b()
BEGIN
	SELECT Piesa.descriere, Piesa.fabricant, SUM(Piesa_deviz.cantitate) "CANTITATE_TOTALA"
	FROM Piesa JOIN Piesa_Deviz ON (Piesa.id_p = Piesa_Deviz.id_p) JOIN Deviz ON (Piesa.id_p = Deviz.id_d)
	WHERE Deviz.data_introducere >= '2021-01-01' AND data_introducere <= '2021-12-31'
	GROUP BY Piesa.descriere, Piesa.fabricant;
END $$
DELIMITER ;
