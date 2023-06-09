CREATE TABLE "uzivatele" (
	"uzivatele_id"	INTEGER,
	"jmeno"	TEXT,
	"prijmeni"	TEXT,
	"datum_narozeni"	TEXT,
	"pocet_clanku"	INTEGER,
	PRIMARY KEY("uzivatele_id" AUTOINCREMENT)
)

INSERT INTO "uzivatele" (
        "jmeno",
        "prijmeni",
        "datum_narozeni",
        "pocet_clanku"
)
VALUES
('Jan',  'Novák',  '1984-11-03', 17),
('Tomáš', 'Marný', '1942-10-17', 12),
('Josef', 'Nový', '1958-7-10', 5),
('Alfons', 'Svoboda', '1935-5-15', 6),
('Ludmila', 'Dvořáková', '1967-4-17', 2),
('Petr', 'Černý', '1995-2-20', 1),
('Vladimír', 'Pokorný', '1984-4-18', 1),
('Ondřej', 'Bohatý', '1973-5-14', 3),
('Vítezslav', 'Churý', '1969-6-2', 7),
('Pavel', 'Procházka', '1962-7-3', 8),
('Matěj', 'Horák', '1974-9-10', 0),
('Jana', 'Veselá', '1976-10-2', 1),
('Miroslav', 'Kučera', '1948-11-3', 1),
('František', 'Veselý', '1947-5-9', 1),
('Michal', 'Krejčí', '1956-3-7', 0),
('Lenka', 'Němcová', '1954-2-11', 5),
('Věra', 'Marková', '1978-1-21', 3),
('Eva', 'Kučerová', '1949-7-26', 12),
('Lucie', 'Novotná', '1973-7-28', 4),
('Jaroslav', 'Novotný', '1980-8-11', 8),
('Petr', 'Dvořák', '1982-9-30', 18),
('Jiří', 'Veselý', '1961-1-15', 2),
('Martina', 'Krejčí', '1950-8-29', 4),
('Marie', 'Černá', '1974-2-26', 5),
('Věra', 'Svobodová', '1983-3-2', 2),
('Pavel', 'Dušín', '1991-5-1', 9),
('Otakar', 'Kovář', '1992-12-17', 9),
('Kateřina', 'Koubová', '1956-11-15', 4),
('Václav', 'Blažek', '1953-10-20', 6),
('Jan', 'Spáčil', '1967-5-6', 3),
('Zdeněk', 'Malačka', '1946-3-10', 6);

DELETE FROM `uzivatele`;
DELETE FROM SQLITE_SEQUENCE WHERE name = "uzivatele";

SELECT * FROM "uzivatele" WHERE "datum_narozeni" >= '1960-1-1' AND "pocet_clanku" > 5;
SELECT "prijmeni" FROM "uzivatele" WHERE "prijmeni" LIKE 's%';
SELECT "prijmeni" FROM "uzivatele" WHERE "prijmeni" LIKE '_o___';
SELECT "jmeno", "prijmeni" FROM "uzivatele" WHERE "jmeno" IN ('Petr', 'Jan', 'Kateřina');
SELECT "jmeno", "prijmeni", "datum_narozeni" FROM "uzivatele" WHERE "datum_narozeni" BETWEEN '1980-1-1' AND '1990-1-1';


-- databaze__pro_web 4.1
INSERT INTO `uzivatele` VALUES(5, "Mára", "marek.zahradnik@centrum.cz", "&'dhfiggg!/#@");

SELECT heslo FROM uzivatele WHERE uzivatele_id = 5;

SELECT * FROM komentare WHERE obsah LIKE "%!" AND datum BETWEEN "2012-01-01" AND "2012-12-31";


-- insane_racing 4.2
UPDATE uzivatele SET prezdivka = "Muscles&Money99" WHERE prezdivka = "UsedArm67";

PRAGMA foreign_keys = 0;
DELETE FROM meny WHERE zkratka != "USD";
INSERT INTO meny VALUES(null, "Souhrnná koruna", "SOK", 0.987654321);

UPDATE vyhry SET penize = penize * 0.9 WHERE penize > 500000;

-- simple money
UPDATE address 
	SET street = "Na vyhlídce", house_number = 1, city = "Kocourkov", zip = 99999 
	WHERE street = "Jilmová" 
	AND house_number = 25 
	AND city = "Čáslav" 
	AND zip = 28601;
	
SELECT * FROM item WHERE title LIKE "%Lednička%" AND price < 8000;

UPDATE item SET price = price * 1.2 WHERE price < 1000;
/* nebo  UPDATE item SET price = price * 1.1 WHERE price >= 1000 AND price <= 8000; */
UPDATE item SET price = price * 1.1 WHERE price BETWEEN 1000 AND 8000; 
UPDATE item SET price = price * 1.05 WHERE price > 8000;


-- ASC, DESC
-- LIMIT
SELECT "jmeno", "prijmeni", "pocet_clanku" 
FROM "uzivatele" 
ORDER BY "pocet_clanku" DESC, "prijmeni" 
LIMIT 10;

-- AVG, SUM, MIN, MAX
SELECT AVG("pocet_clanku") FROM "uzivatele";

SELECT "jmeno", COUNT(*) FROM "uzivatele" GROUP BY "jmeno";

INSERT INTO "uzivatele" ("pocet_clanku") VALUES ('Mnoho');


-- sql 
CREATE TABLE `uzivatele` (
  `uzivatele_id` int AUTO_INCREMENT,
  `jmeno` varchar(60),
  `prijmeni` varchar(60),
  `datum_narozeni` date,
  `pocet_clanku` int,
  PRIMARY KEY (`uzivatele_id`)
);

-- vs sqlite 
CREATE TABLE "uzivatele" (
        "uzivatele_id" INTEGER PRIMARY KEY AUTOINCREMENT,
        "jmeno" TEXT,
        "prijmeni" TEXT,
        "datum_narozeni" TEXT,
        "pocet_clanku" INTEGER
);


-- stops(id, name)
-- route(num, company, pos, stop)



//5. Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart, without changing routes. Change the query so that it shows the services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop FROM
	route AS a JOIN route AS b ON (a.company = b.company AND a.num = b.num)
	WHERE a.stop = 53 AND b.stop = 149

//6. The query shown is similar to the previous one, however by joining two copies of the stops table we can refer to stops by name rather than by number. Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'
SELECT a.company, a.num, astop.name, bstop.name FROM
	route AS a JOIN route AS b ON (a.company = b.company AND a.num = b.num)
			   JOIN stops AS astop ON (a.stop = astop.id)
			   JOIN stops AS bstop ON (b.stop = bstop.id)
	WHERE astop.name = 'Craiglockhart' AND bstop.name = 'London Road'

//7. Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
//Query by name
SELECT DISTINCT a.company, a.num FROM
	route AS a JOIN route AS b ON (a.company = b.company AND a.num = b.num)
			   JOIN stops AS astop ON (a.stop = astop.id)
			   JOIN stops AS bstop ON (b.stop = bstop.id)
	WHERE astop.name = 'Haymarket' AND bstop.name = 'Leith'
	GROUP BY a.num

//Query by id
SELECT DISTINCT a.company, a.num FROM
	route AS a JOIN route AS b ON (a.company = b.company AND a.num = b.num)			   
	WHERE a.stop = 115 AND b.stop = 137

//8. Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
SELECT DISTINCT a.company, a.num FROM
	route AS a JOIN route AS b ON (a.company = b.company AND a.num = b.num)
			   JOIN stops AS astop ON (a.stop = astop.id)
			   JOIN stops AS bstop ON (b.stop = bstop.id)
	WHERE astop.name = 'Craiglockhart' AND bstop.name = 'Tollcross'

//9. Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself. Include the company and bus no. of the relevant services.
SELECT DISTINCT bstop.name, a.company, a.num FROM
	route AS a JOIN route AS b ON (a.company = b.company AND a.num = b.num)
			   JOIN stops AS astop ON (a.stop = astop.id)
			   JOIN stops AS bstop ON (b.stop = bstop.id)
	WHERE astop.name = 'Craiglockhart'

//10. Find the routes involving two buses that can go from Craiglockhart to Sighthill.
//Show the bus no. and company for the first bus, the name of the stop for the transfer,
//and the bus no. and company for the second bus.
//Not working properly
SELECT a.num, a.company, bstop.name, c.num, c.company FROM
	route AS a JOIN route AS b ON (a.company = b.company AND a.num = b.num)
			   JOIN route AS c ON (b.stop = c.stop)
			   JOIN route AS d ON (c.company = d.company AND c.num = d.num)
			   JOIN stops AS astop ON (a.stop = astop.id)
			   JOIN stops AS bstop ON (b.stop = bstop.id)
			   JOIN stops AS cstop ON (c.stop = cstop.id)
			   JOIN stops AS dstop ON (d.stop = dstop.id)
	WHERE astop.name = 'Craiglockhart' AND dstop.name = 'Sighthill' AND bstop.id = cstop.id 