CREATE TABLE IF NOT EXISTS pobocky(
    id_pobocky INTEGER NOT NULL,
    mesto TEXT NOT NULL,
    nazev TEXT NOT NULL,
    pocet_pracovniku INTEGER NOT NULL,
    primary key(id_pobocky AUTOINCREMENT)
);


CREATE TABLE IF NOT EXISTS statistika_pobocek(
    pocet_pracovniku_celkem INTEGER NOT NULL
);
INSERT INTO statistika_pobocek VALUES(0);

CREATE TRIGGER before_insert_pobocky BEFORE INSERT
ON pobocky FOR EACH ROW
BEGIN
    UPDATE statistika_pobocek
    SET pocet_pracovniku_celkem = pocet_pracovniku_celkem + NEW.pocet_pracovniku;
END;


INSERT INTO pobocky VALUES(null,'Ostrava','ITnetwork',50),
(null,'Brno','ITnetwork',60),(null,'Praha','ITnetwork',70);



SELECT * FROM statistika_pobocek;




CREATE TABLE IF NOT EXISTS historie_pobocek(
    id INTEGER NOT NULL,
    id_pobocky INTEGER NOT NULL,
    mesto TEXT NOT NULL,
    nazev TEXT NOT NULL,
    pocet_pracovniku INTEGER NOT NULL,
    cas_zmeny TEXT NOT NULL,
    akce TEXT NOT NULL,
    PRIMARY KEY(id AUTOINCREMENT)
);


CREATE TRIGGER before_update_pobocky BEFORE UPDATE
ON pobocky FOR EACH ROW
BEGIN
    INSERT INTO historie_pobocek
    VALUES (null,OLD.id_pobocky,OLD.mesto,OLD.nazev,OLD.pocet_pracovniku, DATE('now'),'Update');

    UPDATE statistika_pobocek
    SET pocet_pracovniku_celkem = pocet_pracovniku_celkem - OLD.pocet_pracovniku + NEW.pocet_pracovniku;
END;




UPDATE pobocky SET nazev = 'ITnetwork.cz', pocet_pracovniku = 100 WHERE id_pobocky = 1;


SELECT * FROM historie_pobocek;


SELECT * FROM statistika_pobocek;


CREATE TRIGGER after_delete_pobocky AFTER DELETE
ON pobocky FOR EACH ROW
BEGIN
    INSERT INTO historie_pobocek
    VALUES (null,OLD.id_pobocky,OLD.mesto,OLD.nazev,OLD.pocet_pracovniku, DATE('now'),'Delete');

    UPDATE statistika_pobocek
    SET pocet_pracovniku_celkem = pocet_pracovniku_celkem - OLD.pocet_pracovniku;
END;


DELETE FROM pobocky WHERE id_pobocky = 3;


SELECT * FROM historie_pobocek;


SELECT * FROM statistika_pobocek;



DROP TRIGGER `before_update_pobocky`;


CREATE TRIGGER before_update_pobocky BEFORE UPDATE
ON pobocky FOR EACH ROW

BEGIN
    INSERT INTO historie_pobocek
        VALUES (null,OLD.id_pobocky,OLD.mesto,OLD.nazev,OLD.pocet_pracovniku, DATE('now'),
        CASE WHEN NEW.pocet_pracovniku > OLD.pocet_pracovniku THEN 'Update - zvětšena'
             WHEN NEW.pocet_pracovniku < OLD.pocet_pracovniku THEN 'Update - zmenšena'
             WHEN NEW.pocet_pracovniku = OLD.pocet_pracovniku THEN 'Update - nezměněna'
    END);

    UPDATE statistika_pobocek
    SET pocet_pracovniku_celkem = pocet_pracovniku_celkem - OLD.pocet_pracovniku + NEW.pocet_pracovniku;
END;


UPDATE pobocky SET pocet_pracovniku = 200 WHERE id_pobocky = 1;


UPDATE pobocky SET pocet_pracovniku = 50 WHERE id_pobocky = 2;


