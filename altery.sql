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
