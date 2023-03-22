BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "uzivatele" (
	"uzivatele_id"	INTEGER,
	"jmeno"	TEXT,
	"prijmeni"	TEXT,
	"datum_narozeni"	TEXT,
	"pocet_clanku"	INTEGER,
	PRIMARY KEY("uzivatele_id" AUTOINCREMENT)
);
INSERT INTO "uzivatele" VALUES (1,'Jan','Novák','1984-11-03',17);
INSERT INTO "uzivatele" VALUES (2,'Tomáš','Marný','1942-10-17',12);
INSERT INTO "uzivatele" VALUES (3,'Josef','Nový','1958-7-10',5);
INSERT INTO "uzivatele" VALUES (4,'Alfons','Svoboda','1935-5-15',6);
INSERT INTO "uzivatele" VALUES (5,'Ludmila','Dvořáková','1967-4-17',2);
INSERT INTO "uzivatele" VALUES (6,'Petr','Černý','1995-2-20',1);
INSERT INTO "uzivatele" VALUES (7,'Vladimír','Pokorný','1984-4-18',1);
INSERT INTO "uzivatele" VALUES (8,'Ondřej','Bohatý','1973-5-14',3);
INSERT INTO "uzivatele" VALUES (9,'Vítezslav','Churý','1969-6-2',7);
INSERT INTO "uzivatele" VALUES (10,'Pavel','Procházka','1962-7-3',8);
INSERT INTO "uzivatele" VALUES (11,'Matěj','Horák','1974-9-10',0);
INSERT INTO "uzivatele" VALUES (12,'Jana','Veselá','1976-10-2',1);
INSERT INTO "uzivatele" VALUES (13,'Miroslav','Kučera','1948-11-3',1);
INSERT INTO "uzivatele" VALUES (14,'František','Veselý','1947-5-9',1);
INSERT INTO "uzivatele" VALUES (15,'Michal','Krejčí','1956-3-7',0);
INSERT INTO "uzivatele" VALUES (16,'Lenka','Němcová','1954-2-11',5);
INSERT INTO "uzivatele" VALUES (17,'Věra','Marková','1978-1-21',3);
INSERT INTO "uzivatele" VALUES (18,'Eva','Kučerová','1949-7-26',12);
INSERT INTO "uzivatele" VALUES (19,'Lucie','Novotná','1973-7-28',4);
INSERT INTO "uzivatele" VALUES (20,'Jaroslav','Novotný','1980-8-11',8);
INSERT INTO "uzivatele" VALUES (21,'Petr','Dvořák','1982-9-30',18);
INSERT INTO "uzivatele" VALUES (22,'Jiří','Veselý','1961-1-15',2);
INSERT INTO "uzivatele" VALUES (23,'Martina','Krejčí','1950-8-29',4);
INSERT INTO "uzivatele" VALUES (24,'Marie','Černá','1974-2-26',5);
INSERT INTO "uzivatele" VALUES (25,'Věra','Svobodová','1983-3-2',2);
INSERT INTO "uzivatele" VALUES (26,'Pavel','Dušín','1991-5-1',9);
INSERT INTO "uzivatele" VALUES (27,'Otakar','Kovář','1992-12-17',9);
INSERT INTO "uzivatele" VALUES (28,'Kateřina','Koubová','1956-11-15',4);
INSERT INTO "uzivatele" VALUES (29,'Václav','Blažek','1953-10-20',6);
INSERT INTO "uzivatele" VALUES (30,'Jan','Spáčil','1967-5-6',3);
INSERT INTO "uzivatele" VALUES (31,'Zdeněk','Malačka','1946-3-10',6);
COMMIT;
