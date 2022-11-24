-- Aufg. 1

sp_who
sp_lock
sp_helpuser
sp_helprotect

--a)
-- USE iw21s83761
--> geht nicht
-b)
CREATE USER s84623 FOR LOGIN [smb\s84623] WITH default_schema = extern
--c)
CREATE SCHEMA extern AUTHORIZATION s84623
--d)
-- USE iw21s83761
--e)
-- SELECT * FROM Auftrag
--> geht nicht
--f)
GRANT select ON Auftrag TO s84623
--g)
-- SELECT * FROM Auftrag
--h)
sp_helpuser
--i)

--j)
SELECT * FROM Auftrag
UPDATE Auftrag SET Beschreibung = 'Neue Beschreibung' WHERE Aufnr = 5146
--> die Aktion wird nicht fertig ausgeführt und auch nicht abgebrochen
--k)
-- sp_lock
-- sp_who
--l)
-- ROLLBACK
--m)
UPDATE Auftrag SET Beschreibung = 'Neue Beschreibung' WHERE Aufnr = 5146
--> läuft durch
--n)
--DELETE FROM Auftrag WHERE Aufnr = 5001
--o)
GRANT DELETE ON Auftrag TO s84623
--p)
--DELETE FROM Auftrag WHERE Aufnr = 5001
--q)
SELECT * FROM Auftrag
--> Auftrag 5001 fehlt
--r)
GRANT create table TO s84623
--s)
-- CREATE TABLE Auftrag (AuftragID primary key not null); INSERT INTO Auftrag VALUES(5)
--t)
SELECT * FROM extern.Auftrag
--u)
SELECT * FROM Auftrag
--v)
-- DROP TABLE extern.Auftrag
--w)
REVOKE create table FROM s84623
REVOKE delete ON Auftrag FROM s84623
REVOKE select ON Auftrag FROM s84623
DROP SCHEMA extern
DROP USER s84623
--x)