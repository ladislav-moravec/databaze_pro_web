ALTER TABLE "komentare" ADD COLUMN "palce" INTEGER;


CREATE TABLE "komentare_bez_palce" (
    "komentare_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "clanek_id" INTEGER,
    "uzivatel_id" INTEGER,
    "obsah" TEXT,
    "datum" TEXT
);
INSERT INTO "komentare_bez_palce" SELECT "komentare_id","clanek_id","uzivatel_id","obsah","datum" FROM "komentare";
DROP TABLE "komentare";
ALTER TABLE "komentare_bez_palce" RENAME TO "komentare";


UPDATE SQLITE_SEQUENCE SET seq = 1233 WHERE name = 'uzivatele';


BEGIN TRANSACTION;

--odečtení peněz
UPDATE "ucty"
SET "zustatek" = "zustatek" - 100
WHERE "cislo_uctu" = 123456789;

--přičtení peněz
UPDATE "ucty"
SET "zustatek" = "zustatek" + 100
WHERE "cislo_uctu" = 987654321;

COMMIT;


-- ve skutečnosti se jeden prikaz chova jako by s BEGIN  TRANSACTION;
UPDATE "uzivatele" SET "email" = 'ema@centrum.com' WHERE "prezdivka" = 'Ema';
-- a na konci s COMMIT;



CREATE VIEW "algoritmy" AS
SELECT *
FROM "clanky"
WHERE "clanky_id" IN
(
    SELECT "clanek_id"
    FROM "clanek_sekce"
    WHERE "sekce_id" =
    (
        SELECT "sekce_id"
        FROM "sekce"
        WHERE "nazev" = 'Algoritmy'
    )
);

SELECT "titulek" FROM "algoritmy";


SELECT "titulek" FROM "clanky" WHERE "clanky_id" = 2;

SELECT "titulek" FROM "clanky" WHERE "url" = 'bakterie-bunecny-automat';

CREATE INDEX "url_index" ON "clanky" ("url");


SELECT vybrane_sloupce
FROM nazev_tabulky
WHERE vyhledavaci_podminka
GROUP BY seskupeni_podle_sloupce
HAVING podminka_seskupeni;


-- spravne having

CREATE TABLE IF NOT EXISTS detail_objednavky(
 id_objednavky int not null,
 id_zbozi int not null,
 pocet_kusu int not null,
 cena_za_kus int not null,
 primary key (id_objednavky, id_zbozi)
);


INSERT INTO detail_objednavky VALUES (1,1,15,159),(1,8,2,199),(2,5,3,1959),(2,1,4,2499),(3,24,1,99);



SELECT id_objednavky,
    SUM(pocet_kusu) AS kusy,
    SUM(pocet_kusu*cena_za_kus) AS cena_celkem
FROM detail_objednavky
GROUP BY id_objednavky;



SELECT id_objednavky,
    SUM(pocet_kusu) AS kusy,
    SUM(pocet_kusu*cena_za_kus) AS cena_celkem
FROM detail_objednavky
GROUP BY id_objednavky
HAVING cena_celkem > 100;




SELECT id_objednavky,
    SUM(pocet_kusu) AS kusy,
    SUM(pocet_kusu*cena_za_kus) AS cena_celkem
FROM detail_objednavky
GROUP BY id_objednavky
HAVING cena_celkem > 100 AND kusy > 10;


-- spravne having a where

CREATE TABLE IF NOT EXISTS zakaznik(
    id_zakaznika integer not null,
    jmeno varchar(50) not null,
    prijmeni varchar(50) not null,
    vek int not null,
    mesto varchar(50) not null,
    primary key(id_zakaznika autoincrement)
);


INSERT INTO zakaznik
VALUES
(null,'Matěj','Eliáš',20,'Ostrava'),(null,'Karel','Svoboda',21,'Ostrava'),
(null,'Jiří','Novák',17,'Ostrava'),(null,'Petr','Novotný',45,'Praha'),
(null,'Jan','Horák',14,'Praha'),(null,'Prokop','Buben',34,'Brno');

SELECT mesto, COUNT(id_zakaznika)
FROM zakaznik
GROUP BY mesto;


SELECT mesto, COUNT(id_zakaznika) AS pocet
FROM zakaznik
GROUP BY mesto
HAVING pocet > 1;


SELECT mesto, COUNT(id_zakaznika) AS pocet
FROM zakaznik
WHERE vek > 17
GROUP BY mesto
HAVING pocet > 1;



-- triggery 

CREATE TRIGGER nazev_triggeru {BEFORE,AFTER} {UPDATE,INSERT,DELETE}
ON nazev_pridruzene_tabulky FOR EACH ROW
BEGIN
    telo_triggeru;
END $


DROP TRIGGER [IF EXISTS] nazev_triggeru;


