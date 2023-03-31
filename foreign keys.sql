
--- vytvoreni databaze

CREATE TABLE IF NOT EXISTS `clanky` (
  `clanky_id` INTEGER NOT NULL,
  `autor_id` INTEGER,
  `popis` TEXT,
  `url` TEXT,
  `klicova_slova` TEXT,
  `titulek` TEXT,
  `obsah` TEXT,
  `publikovano` TEXT,
  PRIMARY KEY (`clanky_id` AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS `komentare` (
  `komentare_id` INTEGER,
  `clanek_id` INTEGER,
  `uzivatel_id` INTEGER,
  `obsah` TEXT,
  `datum` TEXT,
  PRIMARY KEY (`komentare_id` AUTOINCREMENT)
);


---- insert nejakych dat

INSERT INTO "clanky" VALUES (1,1,'Co je to algoritmus? Pokud to nevíte, přečtěte si tento článek.','co-je-to-algoritmus','algoritmus, co je to, vysvětlení','Algoritmus','Když se bavíme o algoritmech, pojďme se tedy shodnout na tom, co ten algoritmus vůbec je. Jednoduše řečeno, algoritmus je návod k řešení nějakého problému. Když se na to podíváme z lidského pohledu, algoritmus by mohl být třeba návod, jak ráno vstát. I když to zní jednoduše, je to docela problém. Počítače jsou totiž stroje a ty nemyslí. Musíme tedy dopodrobna popsat všechny kroky algoritmu. Tím se dostáváme k první vlastnosti algoritmu - musí být elementární (skládat se z konečného počtu jednoduchých a snadno srozumitelných kroků, tedy příkazů). "Vstaň z postele" určitě není algoritmus. "Otevři oči, sundej peřinu, posaň se, dej nohy na zem a stoupni si" - to už zní docela podrobně a jednalo by se tedy o pravý algoritmus. My se však budeme pohybovat v IT, takže budeme řešit problémy jako seřaď prvky podle velikosti nebo vyhledej prvek podle jeho obsahu. To jsou totiž 2 základní úlohy, které počítače dělají nejčastěji a které je potřeba dokonale promýšlet a optimalizovat, aby trvaly co nejkratší dobu. Z dalších příkladů algoritmů mě napadá třeba vyřeš kvadratickou rovnici nebo vyřeš sudoku.','2012-03-21 00:00:00'),
                    (2,2,'Bakterie jsou obdoba buněčného automatu v kombinaci s hrou.','bakterie-bunecny-automat','bakterie, automat, algoritmus','Bakterie','Bakterie jsou obdoba buněčného automatu, který vymyslel britský matematik John Horton Conway v roce 1970. Celou tuto hru řídí čtyři jednoduchá pravidla:/n/n

                1. Živá bakterie s méně, než dvěma živými sousedy umírá./n

                2. Živá bakterie s více, než třemi živými sousedy umírá na přemnožení./n

                3. Živá bakterie s dvoumi nebo třemi sousedy přežívá beze změny do další generace./n

                4. Mrtvá bakterie, s přesně třemi živými sousedy, opět ožívá./n

                Tyto zdánlivě naprosto primitivní pravidla dokáží za správného počátečního rozmístění bakterií vytvořit pochodující skupinky, shluky "vystřelující" pochodující pětice, překvapivě složité souměrné exploze, oscilátory (periodicky kmitající skupinky), či nekonečnou podívanou na to, jak složité a dokonalé obrazce dokáží tyto dvě podmínky vytvořit. Celý program je koncipován jako hra, máte za úkol vytvořit co nejdéle žijící kolonii. &lt;a href=&quot;soubory/bakterie.zip&quot;','2012-02-14 00:00:00'),
                (3,3,'Cheese Mouse je oddechová plošinovka.','cheese-mouse-oddechova-plosinovka','myš, sýr, hra','Cheese Mouse','Cheese mouse je plošinovka s "horkou ostrovní atmosférou", kde ovládáte myš a musíte se dostat k sýru. V tom vám ale brání nejrůznější nástrahy a nepřatelé jako hadi, krysy, pirane, ale i roboti, mumie a nejrůznější havěť. Hru s několika petrobarevnými světy jsem dělal ještě na základní škole s Veisenem a může se pochlubit 2. místem v Bonusweb game competition, kde vyhrála 5.000 Kč. Vznikala v Game makeru o letních prázdninách, ještě v bezstarostném dětství, což značně ovlivnilo její grafickou stránku. Rád si ji občas zahraji na odreagování a zlepšní nálady. &lt;a href=&quot;soubory/cheesemouse.zip&quot; /&gt;','2004-06-22 00:00:00'),
                (4,2,'Pacman je remake kultovní hry.','pacman-remake','pacman, remake, pampuch, hra, zdarma','Pacman','Jedná se o naprosto základní verzi této hry s editorem levelů, takže si můžete vytvořit svá vlastní kola. Postupem času ji hodlám ještě trochu upravit a přidat nějaké nové prvky, fullscreen a lepší grafiku. Engine hry bude také základem mého nového projektu Geckon man, který je zatím ve fázi psaní scénáře. &lt;a href=&quot;soubory/pacman.zip&quot; /&gt;','2011-06-03 00:00:00');
INSERT INTO "komentare" VALUES (1,1,4,'Super článek!','2012-04-06 00:00:00'),
                (2,2,4,'Jak je tedy přesně ta podmínka pro vznik bakterie?','2011-01-28 00:00:00'),
                (3,3,1,'Zasekla jsem se v této hře, kde najdu klíč do 3. levelu?','2011-09-30 00:00:00'),
                (4,3,4,'Jak rozjedu plošinu v 5. levelu?','2010-08-01 00:00:00'),
                (5,4,1,'Umřel jsem a nemám hru uloženou, co mám dělat?','2012-04-14 00:00:00'),
                (6,4,3,'Dobrá hra!','2012-04-06 00:00:00'),
                (7,1,3,'Nerozumím tomu!','2011-04-06 00:00:00'),
                (8,1,2,'Super článek!','2012-05-06 00:00:00');



--- pridani foreing key
PRAGMA foreign_keys;
--- zapnutí fk 
PRAGMA foreign_keys = ON;

FOREIGN KEY (nazev_sloupce) # sloupec podřízené tabulky odkazující na klíč nadřízené tabulky
REFERENCES nadrizena_tabulka(nazev_sloupce)
ON UPDATE ... # co se děje při aktualizaci záznamu
ON DELETE ... # co se děje při smazaní záznamu


----
CREATE TABLE nazev(
   ...,
   sloupec INTEGER NOT NULL,
   FOREIGN KEY (sloupec)
   REFERENCES nadrizena_tabulka(nazev_sloupce)
   ON UPDATE ...
   ON DELETE ...
);


--- sqlite neumi pridat fk do existujici tabulky, vytovime tedy novou a prelijeme data
CREATE TABLE IF NOT EXISTS `komentare2` (
  `komentare_id` INTEGER,
  `clanek_id` INTEGER NOT NULL,
  `uzivatel_id` INTEGER,
  `obsah` TEXT,
  `datum` TEXT,
  PRIMARY KEY (`komentare_id` AUTOINCREMENT),
  FOREIGN KEY (`clanek_id`)
  REFERENCES clanky(`clanky_id`)
  ON UPDATE CASCADE
  ON DELETE CASCADE
);

INSERT INTO `komentare2` SELECT * FROM `komentare`;
DROP TABLE `komentare`;
ALTER TABLE `komentare2` RENAME TO `komentare`;


---- testování
SELECT clanky_id, popis, titulek FROM clanky;
SELECT komentare_id, clanek_id, datum FROM komentare WHERE clanek_id = 1;
UPDATE clanky SET clanky_id = 10 WHERE clanky_id = 1;
SELECT komentare_id, clanek_id, datum FROM komentare WHERE clanek_id = 10;
DELETE FROM clanky WHERE clanky_id = 10;

