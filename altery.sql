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
