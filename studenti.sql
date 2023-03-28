CREATE TABLE "sekce" (
    "sekce_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "nazev" TEXT
    
);
INSERT INTO "sekce" ("nazev") VALUES
('Algoritmy'),
('Hry');

CREATE TABLE "clanek_sekce" (
    "clanek_sekce_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "clanek_id" INTEGER,
    "sekce_id" INTEGER
);

INSERT INTO "clanek_sekce" ("clanek_id", "sekce_id") VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 2),
(4, 2);

SELECT "c"."url", "c"."titulek"
FROM "clanky" AS "c"
INNER JOIN "clanek_sekce" AS "cs" ON "cs"."clanek_id" = "c"."clanky_id"
INNER JOIN "sekce" AS "s" ON "cs"."sekce_id" = "s"."sekce_id"
WHERE "s"."nazev" = 'Algoritmy';
