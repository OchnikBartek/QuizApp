-- zad 1
CREATE database Bartosz_Ochnik;

-- zad 2
USE Bartosz_Ochnik;

CREATE TABLE kierunki (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nazwa ENUM('lewo', 'prawo', 'góra', 'dół'),
    ile FLOAT,
    kiedy DATETIME
);

-- zad 3
CREATE TABLE osoby (
    gdzie INT,
    kto VARCHAR(35) NOT NULL,
    stan VARCHAR(20) DEFAULT 'Wysłano',
    FOREIGN KEY (gdzie) REFERENCES kierunki(id)
);

-- zad 4
INSERT INTO kierunki (id, nazwa, ile, kiedy) VALUES
    (1, 'lewo', 15.0/2, '2018-03-17 09:07:48'),
    (2, 'prawo', 400, '2004-11-05 00:00:00'),
    (3, 'góra', 0.75, '2024-05-10 13:00:00'),
    (4, 'dół', 0.25, NOW());


-- zad 5
ALTER TABLE osoby DROP FOREIGN KEY osoby_ibfk_1;

-- zad 6
UPDATE kierunki SET ile = 3.14 WHERE nazwa LIKE '%o%';

-- zad7
-- id to klucz główny i zazwyczaj AUTO_INCREMENT – modyfikacja go bezpośrednio może spowodować konflikt kluczy

-- zad 8
ALTER TABLE osoby ADD COLUMN kol CHAR(2) NOT NULL AFTER gdzie;

-- zad 9
DROP DATABASE Bartosz_Ochnik;
