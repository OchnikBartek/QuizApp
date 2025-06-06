/*
AUTOR: Bartosz Ochnik
STWORZENIE MOJEJ BAZY DANYCH - Wypozyczalnia Samochodow
Tworzenie i korzystanie z bazy danych "CarRentals" */
CREATE DATABASE IF NOT EXISTS CarRentals;
USE CarRentals;

-- 1) Polecenia CREATE:
-- Tworzenie tabeli Klienci
CREATE TABLE Klienci(
                        id_klienta INT PRIMARY KEY AUTO_INCREMENT,
                        imie VARCHAR(30) NOT NULL,
                        nazwisko VARCHAR(30) NOT NULL,
                        email VARCHAR(30) UNIQUE NOT NULL,
                        telefon VARCHAR(15),
                        adres VARCHAR(50)
);

-- Tworzenie tabeli Pojazdy
CREATE TABLE Pojazdy(
                        nr_rejestracyjny VARCHAR(10) PRIMARY KEY,
                        marka VARCHAR(25) NOT NULL,
                        model VARCHAR(30) NOT NULL,
                        typ ENUM('Sedan', 'SUV', 'Kombi', 'Sportowy', 'Motocykl') NOT NULL,
                        cena INT NOT NULL,
                        status ENUM('Dostepny','Wypozyczony','W naprawie') DEFAULT 'Dostepny'
);

-- Tworzenie tabeli Rezerwacje

CREATE TABLE Rezerwacje(
                           nr_rezerwacji INT PRIMARY KEY AUTO_INCREMENT,
                           id_klienta INT,
                           nr_rejestracyjny VARCHAR(10),
                           data_rozpoczecia DATE NOT NULL,
                           data_zakonczenia DATE NOT NULL,
                           status ENUM('W trakcie', 'Przed rozpoczeciem', 'Zakonczona', 'Anulowana') DEFAULT 'Przed rozpoczeciem',
                           FOREIGN KEY (id_klienta) REFERENCES Klienci(id_klienta),
                           FOREIGN KEY (nr_rejestracyjny) REFERENCES Pojazdy(nr_rejestracyjny)

);

-- Tworzenie tabeli Platnosci

CREATE TABLE Platnosci(
                          nr_platnosci INT PRIMARY KEY AUTO_INCREMENT,
                          nr_rezerwacji INT,
                          kwota DECIMAL(10,2) NOT NULL,
                          data_platnosci DATE NOT NULL DEFAULT (CURDATE()),
                          status ENUM('Oplacone' ,'Oczekujace', 'Anulowane') DEFAULT 'Oczekujace',
                          metoda ENUM('Karta' , 'Gotowka', 'Przelew') NOT NULL,
                          FOREIGN KEY (nr_rezerwacji) REFERENCES Rezerwacje(nr_rezerwacji)
);

-- 2) Polecenia INSERT:
-- Wstawianie rekordów do tabeli Klienci
INSERT INTO Klienci (imie, nazwisko, email, telefon, adres) VALUES
('Jan', 'Kowalski', 'jan.kowalski1@email.com', '600111001', 'Warszawa, ul. Długa 1'),
('Anna', 'Nowak', 'anna.nowak2@email.com', '600111002', 'Kraków, ul. Krótka 2'),
('Piotr', 'Wiśniewski', 'piotr.w@email.com', '600111003', 'Gdańsk, ul. Leśna 3'),
('Katarzyna', 'Wójcik', 'k.wojcik@email.com', '600111004', 'Poznań, ul. Polna 4'),
('Tomasz', 'Kowalczyk', 'tom.k@email.com', '600111005', 'Wrocław, ul. Miodowa 5'),
('Ewa', 'Kamińska', 'ewa.k@email.com', '600111006', 'Szczecin, ul. Jagodowa 6'),
('Marek', 'Lewandowski', 'marek.l@email.com', '600111007', 'Bydgoszcz, ul. Lipowa 7'),
('Agnieszka', 'Zielińska', 'agnieszka.z@email.com', '600111008', 'Lublin, ul. Różana 8'),
('Jakub', 'Szymański', 'jakub.s@email.com', '600111009', 'Katowice, ul. Sosnowa 9'),
('Magdalena', 'Woźniak', 'magda.w@email.com', '600111010', 'Łódź, ul. Klonowa 10'),
('Grzegorz', 'Dąbrowski', 'grzegorz.d@email.com', '600111011', 'Rzeszów, ul. Akacjowa 11'),
('Paulina', 'Kozłowska', 'paulina.k@email.com', '600111012', 'Opole, ul. Brzozowa 12'),
('Paweł', 'Jankowski', 'pawel.j@email.com', '600111013', 'Radom, ul. Dębowa 13'),
('Natalia', 'Mazur', 'natalia.m@email.com', '600111014', 'Toruń, ul. Jesionowa 14'),
('Rafał', 'Krawczyk', 'rafal.k@email.com', '600111015', 'Zielona Góra, ul. Modrzewiowa 15'),
('Karolina', 'Piotrowska', 'karolina.p@email.com', '600111016', 'Gorzów Wlkp., ul. Topolowa 16'),
('Łukasz', 'Grabowski', 'lukasz.g@email.com', '600111017', 'Siedlce, ul. Świerkowa 17'),
('Justyna', 'Nowicka', 'justyna.n@email.com', '600111018', 'Legnica, ul. Bukowa 18'),
('Adrian', 'Pawlak', 'adrian.p@email.com', '600111019', 'Elbląg, ul. Malinowa 19'),
('Oliwia', 'Michalska', 'oliwia.m@email.com', '600111020', 'Kielce, ul. Wrzosowa 20'),
('Michał', 'Witkowski', 'michal.w@email.com', '600111021', 'Koszalin, ul. Makowa 21'),
('Aleksandra', 'Walczak', 'ola.w@email.com', '600111022', 'Olsztyn, ul. Liliowa 22'),
('Damian', 'Baran', 'damian.b@email.com', '600111023', 'Częstochowa, ul. Azaliowa 23'),
('Martyna', 'Sikora', 'martyna.s@email.com', '600111024', 'Płock, ul. Tulipanowa 24'),
('Sebastian', 'Szulc', 'sebastian.s@email.com', '600111025', 'Tarnów, ul. Bławatna 25'),
('Weronika', 'Król', 'weronika.k@email.com', '600111026', 'Gniezno, ul. Konwaliowa 26'),
('Mateusz', 'Adamski', 'mateusz.a@email.com', '600111027', 'Zamość, ul. Wiśniowa 27'),
('Izabela', 'Głowacka', 'izabela.g@email.com', '600111028', 'Piła, ul. Czereśniowa 28'),
('Kacper', 'Zając', 'kacper.z@email.com', '600111029', 'Sopot, ul. Borówkowa 29'),
('Julia', 'Sadowska', 'julia.s@email.com', '600111030', 'Ostrołęka, ul. Orzechowa 30');



INSERT INTO Pojazdy (nr_rejestracyjny, marka, model, typ, cena, status) VALUES
('WZ1001', 'Toyota', 'Corolla', 'Sedan', 150, 'Dostepny'),
('WZ1002', 'BMW', 'X5', 'SUV', 300, 'Wypozyczony'),
('WZ1003', 'Audi', 'A4', 'Sedan', 250, 'Dostepny'),
('WZ1004', 'Ford', 'Focus', 'Kombi', 180, 'Dostepny'),
('WZ1005', 'Mazda', 'MX-5', 'Sportowy', 350, 'Dostepny'),
('WZ1006', 'Kia', 'Sportage', 'SUV', 220, 'W naprawie'),
('WZ1007', 'Hyundai', 'i30', 'Sedan', 160, 'Dostepny'),
('WZ1008', 'Renault', 'Clio', 'Kombi', 140, 'Dostepny'),
('WZ1009', 'Volkswagen', 'Passat', 'Sedan', 200, 'Wypozyczony'),
('WZ1010', 'Skoda', 'Octavia', 'Kombi', 170, 'Dostepny'),
('WZ1011', 'Peugeot', '208', 'Sedan', 130, 'Dostepny'),
('WZ1012', 'Honda', 'Civic', 'Sedan', 190, 'Dostepny'),
('WZ1013', 'Lexus', 'RX', 'SUV', 400, 'Dostepny'),
('WZ1014', 'Mercedes', 'C-Class', 'Sedan', 350, 'W naprawie'),
('WZ1015', 'Opel', 'Astra', 'Kombi', 160, 'Dostepny'),
('WZ1016', 'Suzuki', 'Swift', 'Sedan', 120, 'Dostepny'),
('WZ1017', 'Fiat', '500', 'Sedan', 110, 'Dostepny'),
('WZ1018', 'Ducati', 'Monster', 'Motocykl', 300, 'Dostepny'),
('WZ1019', 'Yamaha', 'MT-07', 'Motocykl', 280, 'Dostepny'),
('WZ1020', 'Tesla', 'Model 3', 'Sedan', 500, 'Dostepny');

INSERT INTO Rezerwacje (id_klienta, nr_rejestracyjny, data_rozpoczecia, data_zakonczenia, status) VALUES
(1, 'WZ1001', '2025-06-01', '2025-06-05', 'Zakonczona'),
(2, 'WZ1002', '2025-06-02', '2025-06-07', 'Zakonczona'),
(3, 'WZ1003', '2025-06-04', '2025-06-10', 'Zakonczona'),
(4, 'WZ1004', '2025-06-06', '2025-06-11', 'Zakonczona'),
(5, 'WZ1005', '2025-06-08', '2025-06-14', 'Zakonczona'),
(6, 'WZ1006', '2025-06-10', '2025-06-15', 'Anulowana'),
(7, 'WZ1007', '2025-06-11', '2025-06-16', 'Zakonczona'),
(8, 'WZ1008', '2025-06-12', '2025-06-17', 'Zakonczona'),
(9, 'WZ1009', '2025-06-13', '2025-06-18', 'Zakonczona'),
(10, 'WZ1010', '2025-06-14', '2025-06-19', 'Zakonczona'),
(11, 'WZ1011', '2025-06-15', '2025-06-20', 'Zakonczona'),
(12, 'WZ1012', '2025-06-16', '2025-06-22', 'Zakonczona'),
(13, 'WZ1013', '2025-06-17', '2025-06-23', 'W trakcie'),
(14, 'WZ1014', '2025-06-18', '2025-06-24', 'W trakcie'),
(15, 'WZ1015', '2025-06-19', '2025-06-25', 'W trakcie'),
(16, 'WZ1016', '2025-06-20', '2025-06-26', 'W trakcie'),
(17, 'WZ1017', '2025-06-21', '2025-06-27', 'Przed rozpoczeciem'),
(18, 'WZ1018', '2025-06-22', '2025-06-28', 'Przed rozpoczeciem'),
(19, 'WZ1019', '2025-06-23', '2025-06-29', 'Przed rozpoczeciem'),
(20, 'WZ1020', '2025-06-24', '2025-06-30', 'Przed rozpoczeciem'),
(21, 'WZ1001', '2025-06-25', '2025-06-27', 'Przed rozpoczeciem'),
(22, 'WZ1002', '2025-06-26', '2025-06-29', 'Przed rozpoczeciem'),
(23, 'WZ1003', '2025-06-27', '2025-07-01', 'Przed rozpoczeciem'),
(24, 'WZ1004', '2025-06-28', '2025-07-02', 'Przed rozpoczeciem'),
(25, 'WZ1005', '2025-06-29', '2025-07-03', 'Przed rozpoczeciem'),
(26, 'WZ1006', '2025-06-30', '2025-07-04', 'Przed rozpoczeciem'),
(27, 'WZ1007', '2025-07-01', '2025-07-05', 'Przed rozpoczeciem'),
(28, 'WZ1008', '2025-07-02', '2025-07-06', 'Przed rozpoczeciem'),
(29, 'WZ1009', '2025-07-03', '2025-07-07', 'Przed rozpoczeciem'),
(30, 'WZ1010', '2025-07-04', '2025-07-08', 'Przed rozpoczeciem'),
(1, 'WZ1011', '2025-07-05', '2025-07-09', 'Przed rozpoczeciem'),
(2, 'WZ1012', '2025-07-06', '2025-07-10', 'Przed rozpoczeciem'),
(3, 'WZ1013', '2025-07-07', '2025-07-11', 'Przed rozpoczeciem'),
(4, 'WZ1014', '2025-07-08', '2025-07-12', 'Przed rozpoczeciem'),
(5, 'WZ1015', '2025-07-09', '2025-07-13', 'Przed rozpoczeciem'),
(6, 'WZ1016', '2025-07-10', '2025-07-14', 'Przed rozpoczeciem'),
(7, 'WZ1017', '2025-07-11', '2025-07-15', 'Przed rozpoczeciem'),
(8, 'WZ1018', '2025-07-12', '2025-07-16', 'Przed rozpoczeciem'),
(9, 'WZ1019', '2025-07-13', '2025-07-17', 'Przed rozpoczeciem'),
(10, 'WZ1020', '2025-07-14', '2025-07-18', 'Przed rozpoczeciem');
INSERT INTO Platnosci (nr_rezerwacji, kwota, data_platnosci, status, metoda) VALUES
(1, 750.00, '2025-06-01', 'Oplacone', 'Karta'),
(2, 1500.00, '2025-06-02', 'Oplacone', 'Przelew'),
(3, 1250.00, '2025-06-04', 'Oplacone', 'Gotowka'),
(4, 900.00, '2025-06-06', 'Oplacone', 'Karta'),
(5, 1750.00, '2025-06-08', 'Oplacone', 'Karta'),
(6, 0.00, '2025-06-10', 'Anulowane', 'Gotowka'),
(7, 800.00, '2025-06-11', 'Oplacone', 'Gotowka'),
(8, 850.00, '2025-06-12', 'Oplacone', 'Karta'),
(9, 1000.00, '2025-06-13', 'Oplacone', 'Przelew'),
(10, 850.00, '2025-06-14', 'Oplacone', 'Gotowka'),
(11, 650.00, '2025-06-15', 'Oplacone', 'Przelew'),
(12, 950.00, '2025-06-16', 'Oplacone', 'Karta'),
(13, 1200.00, '2025-06-17', 'Oplacone', 'Przelew'),
(14, 1400.00, '2025-06-18', 'Oczekujace', 'Gotowka'),
(15, 800.00, '2025-06-19', 'Oczekujace', 'Karta'),
(16, 600.00, '2025-06-20', 'Oczekujace', 'Gotowka'),
(17, 330.00, '2025-06-21', 'Oczekujace', 'Karta'),
(18, 600.00, '2025-06-22', 'Oczekujace', 'Gotowka'),
(19, 560.00, '2025-06-23', 'Oczekujace', 'Przelew'),
(20, 1000.00, '2025-06-24', 'Oczekujace', 'Gotowka'),
(21, 450.00, '2025-06-25', 'Oczekujace', 'Karta'),
(22, 1350.00, '2025-06-26', 'Oczekujace', 'Karta'),
(23, 1000.00, '2025-06-27', 'Oczekujace', 'Przelew'),
(24, 960.00, '2025-06-28', 'Oczekujace', 'Gotowka'),
(25, 1700.00, '2025-06-29', 'Oczekujace', 'Gotowka'),
(26, 1200.00, '2025-06-30', 'Oczekujace', 'Karta'),
(27, 880.00, '2025-07-01', 'Oczekujace', 'Przelew'),
(28, 940.00, '2025-07-02', 'Oczekujace', 'Karta'),
(29, 1100.00, '2025-07-03', 'Oczekujace', 'Gotowka'),
(30, 1020.00, '2025-07-04', 'Oczekujace', 'Karta'),
(31, 650.00, '2025-07-05', 'Oczekujace', 'Gotowka'),
(32, 950.00, '2025-07-06', 'Oczekujace', 'Przelew'),
(33, 1800.00, '2025-07-07', 'Oczekujace', 'Karta'),
(34, 1300.00, '2025-07-08', 'Oczekujace', 'Gotowka'),
(35, 850.00, '2025-07-09', 'Oczekujace', 'Gotowka'),
(36, 580.00, '2025-07-10', 'Oczekujace', 'Karta'),
(37, 720.00, '2025-07-11', 'Oczekujace', 'Gotowka'),
(38, 740.00, '2025-07-12', 'Oczekujace', 'Przelew'),
(39, 780.00, '2025-07-13', 'Oczekujace', 'Karta'),
(40, 1000.00, '2025-07-14', 'Oczekujace', 'Gotowka');

-- 3) SKRYPTY
-- WIDOKI

-- Tworzenie widoku Lista_trwajacych_wypozyczen
CREATE OR REPLACE VIEW trwajace_wypozyczenia
AS
SELECT Klienci.imie, Klienci.nazwisko, Pojazdy.marka, Pojazdy.model, Pojazdy.nr_rejestracyjny, Rezerwacje.data_zakonczenia
FROM Rezerwacje
         INNER JOIN Klienci ON Rezerwacje.id_klienta = Klienci.id_klienta
         INNER JOIN Pojazdy ON Rezerwacje.nr_rejestracyjny = Pojazdy.nr_rejestracyjny
WHERE Rezerwacje.status = 'W trakcie';

-- Wybieranie danych z widoku
SELECT * FROM trwajace_wypozyczenia;

-- Tworzenie widoku Przelewy nieoplacone, gdzie pokazywani są klienci, którzy za wynajem płacą "z góry"

CREATE OR REPLACE VIEW Przelewy_nieoplacone
AS
SELECT Platnosci.nr_rezerwacji, Klienci.imie, Klienci.nazwisko,Klienci.email, Platnosci.kwota,
       Rezerwacje.data_rozpoczecia AS Termin_platnosci
FROM Platnosci
         INNER JOIN Rezerwacje ON Platnosci.nr_rezerwacji = Rezerwacje.nr_rezerwacji
         INNER JOIN Klienci  ON Rezerwacje.id_klienta = Klienci.id_klienta
WHERE Platnosci.status = 'Oczekujace' AND metoda = 'Przelew' ORDER BY Rezerwacje.data_rozpoczecia;

SELECT * FROM Przelewy_nieoplacone;

-- Tworzenie widoku pojazdów, które są dostępne
CREATE OR REPLACE VIEW dostepne_pojazdy AS
SELECT
    P.nr_rejestracyjny,
    P.marka,
    P.model,
    COALESCE(MIN(R.data_rozpoczecia), 'Niezarezerwowany') AS dostepny_do_dnia
FROM Pojazdy P
        LEFT JOIN Rezerwacje R
        ON P.nr_rejestracyjny = R.nr_rejestracyjny
        AND R.data_rozpoczecia > CURRENT_DATE
WHERE P.status = 'Dostepny'
  AND P.nr_rejestracyjny NOT IN (
    SELECT nr_rejestracyjny
    FROM Rezerwacje
    WHERE CURRENT_DATE BETWEEN data_rozpoczecia AND data_zakonczenia
)
GROUP BY P.nr_rejestracyjny, P.marka, P.model;


SELECT * FROM dostepne_pojazdy;

-- widoek srednia cena wynajmu zalezna od typu

CREATE OR REPLACE VIEW srednia_cena_po_typie
AS
SELECT typ, AVG(cena) AS srednia_cena_za_dobe FROM Pojazdy
GROUP BY typ;

SELECT * FROM srednia_cena_po_typie;

-- widok zestawienia platnosci
CREATE OR REPLACE VIEW zestawienie_platnosci
AS
SELECT Platnosci.nr_platnosci, Klienci.imie, Klienci.nazwisko, Platnosci.kwota, Platnosci.data_platnosci, Platnosci.status,Platnosci.metoda
FROM Platnosci
         INNER JOIN Rezerwacje ON Platnosci.nr_rezerwacji = Rezerwacje.nr_rezerwacji
         INNER JOIN Klienci ON Rezerwacje.id_klienta = Klienci.id_klienta
WHERE Platnosci.status IN ('Oplacone', 'Oczekujace', 'Anulowane')
ORDER BY Platnosci.data_platnosci;

SELECT * FROM zestawienie_platnosci;

-- widok aktualnie zarezerwowanych pojazdów
CREATE OR REPLACE VIEW pojazdy_z_aktywnymi_rezerwacjami
AS
SELECT Klienci.imie, Klienci.nazwisko,Pojazdy.nr_rejestracyjny, Pojazdy.marka, Pojazdy.model, Rezerwacje.data_rozpoczecia, Rezerwacje.data_zakonczenia
FROM Pojazdy
         INNER JOIN Rezerwacje ON Pojazdy.nr_rejestracyjny = Rezerwacje.nr_rejestracyjny
         INNER JOIN Klienci ON Rezerwacje.id_klienta = Klienci.id_klienta
WHERE Rezerwacje.status IN ('W trakcie', 'Przed rozpoczeciem');

SELECT * FROM pojazdy_z_aktywnymi_rezerwacjami;

-- FUNKCJE
-- funkcja sprawdzajaca jaka jest cena za wynajem pojazdu w porownaninu do sredniej

DELIMITER $$
CREATE FUNCTION srednia_cena_za_dobe(typ_pojazdu VARCHAR(10), kwota INT)
    RETURNS VARCHAR(50)
    DETERMINISTIC
BEGIN
    DECLARE srednia DECIMAL(10,2);

    -- Pobranie średniej ceny dla podanego typu pojazdu
    SELECT AVG(cena) INTO srednia FROM Pojazdy WHERE typ = typ_pojazdu;
-- Porównanie ceny wynajmu pojazdu z średnią dla danego typu
    IF kwota < srednia THEN
        RETURN 'Taniej niż średnia';
    ELSEIF kwota = srednia THEN
        RETURN 'Cena na poziomie średniej';
    ELSE
        RETURN 'Drożej niż średnia';
    END IF;

END $$
DELIMITER ;

SELECT srednia_cena_za_dobe('Sedan', 80);


-- funkcja sprawdzajaca czy mozna utworzyc dana rezerwacje
DROP FUNCTION IF EXISTS mozlwiosc_rezerwacji;
DELIMITER $$

CREATE FUNCTION mozlwiosc_rezerwacji(data_rozp DATE, data_zak DATE, nr_poj INT)
    RETURNS INT
    DETERMINISTIC
BEGIN
    DECLARE ilosc INT;
    DECLARE cena_dzienna INT;
    DECLARE rezerwacja_niedostepna INT;

    SELECT cena INTO cena_dzienna FROM Pojazdy WHERE nr_rejestracyjny = nr_poj;

    IF cena_dzienna IS NULL THEN
        RETURN -1; -- Wartość -1 oznacza błąd (np. brak pojazdu w bazie)
    END IF;

    -- Sprawdzenie, czy pojazd jest dostępny w wybranym okresie
    SELECT COUNT(*) INTO rezerwacja_niedostepna
    FROM Rezerwacje
    WHERE nr_rejestracyjny = nr_poj
      AND (
        (data_rozp BETWEEN data_rozpoczecia AND data_zakonczenia)
            OR
        (data_zak BETWEEN data_rozpoczecia AND data_zakonczenia)
            OR
        (data_rozp <= data_rozpoczecia AND data_zak >= data_zakonczenia)
        );

    IF rezerwacja_niedostepna > 0 THEN
        RETURN -2; -- Wartość -2 oznacza brak dostępności pojazdu
    END IF;

    -- Obliczenie liczby dni
    SET ilosc = DATEDIFF(data_zak, data_rozp) + 1;

    IF ilosc <= 0 THEN
        RETURN -3; -- Wartość -3 oznacza błąd dat
    END IF;

    -- Obliczenie całkowitej kwoty
    RETURN cena_dzienna * ilosc;

END $$

DELIMITER ;

SELECT mozlwiosc_rezerwacji('2025-07-08','2025-07-12',1003);

-- funkcja generujaca rezerwacje oraz platnosc dla danej rezerwacji
DROP FUNCTION IF EXISTS generuj_rezerwacje;

DELIMITER $$

CREATE FUNCTION generuj_rezerwacje(
    data_rozp DATE,
    data_zak DATE,
    nr_poj INT,
    id_k INT,
    metoda_platnosci ENUM('Karta', 'Gotowka', 'Przelew')
)
    RETURNS VARCHAR(50)
    DETERMINISTIC
BEGIN
    DECLARE nr_rez INT;
    DECLARE kwota INT;

    -- Wywołanie funkcji sprawdzającej możliwość rezerwacji
    SET kwota = mozlwiosc_rezerwacji(data_rozp, data_zak, nr_poj);

    -- Sprawdzamy, czy rezerwacja została pomyślnie utworzona
    IF kwota > 0 THEN
        -- Tworzenie nowej rezerwacji
        INSERT INTO Rezerwacje (id_klienta, nr_rejestracyjny, data_rozpoczecia, data_zakonczenia)
        VALUES (id_k, nr_poj, data_rozp, data_zak);

        -- Pobranie numeru nowo utworzonej rezerwacji
        SELECT nr_rezerwacji INTO nr_rez
        FROM Rezerwacje
        WHERE nr_rejestracyjny = nr_poj
          AND id_klienta = id_k
          AND data_rozpoczecia = data_rozp
          AND data_zakonczenia = data_zak;

        -- Tworzenie płatności dla tej rezerwacji
        IF metoda_platnosci = 'Gotowka' THEN
            INSERT INTO Platnosci (nr_rezerwacji, kwota, data_platnosci, status, metoda)
            SELECT nr_rez, kwota,data_rozp, 'Oczekujace', metoda_platnosci;
        ELSE
            INSERT INTO Platnosci (nr_rezerwacji, kwota, data_platnosci, status, metoda)
            SELECT nr_rez, kwota,CURDATE(), 'Oczekujace', metoda_platnosci;

        END IF;

        -- Potwierdzenie
        RETURN 'Rezerwacja oraz płatność została wygenerowana.';
    ELSE
        -- Zwracamy odpowiedni status w przypadku błędu
        IF kwota = -1 THEN
            RETURN 'Błąd: Pojazd nie istnieje';
        ELSEIF kwota = -2 THEN
            RETURN 'Błąd: Pojazd niedostępny w wybranym terminie';
        ELSEIF kwota = -3 THEN
            RETURN 'Błąd: Data zakończenia musi być późniejsza niż data rozpoczęcia';
        END IF;
    END IF;

END $$

DELIMITER ;

SELECT generuj_rezerwacje('2025-07-01','2025-07-03',1004, 8, 'Karta') AS Utworzenie_rezerwacji;

-- procedura aktualizujaca status rezerwacji oraz automatyzacja jej
DELIMITER $$
CREATE PROCEDURE aktualizuj_statusy()
BEGIN
    -- Ustaw status na 'przed rozpoczęciem' dla rezerwacji w przyszłości
    UPDATE Rezerwacje
    SET status = 'Przed rozpoczeciem'
    WHERE data_rozpoczecia > CURDATE();

    -- Ustaw status na 'w trakcie' dla trwających obecnie rezerwacji
    UPDATE Rezerwacje
    SET status = 'W trakcie'
    WHERE data_rozpoczecia <= CURDATE()
      AND data_zakonczenia >= CURDATE();

    -- Ustaw status na 'zakończona' dla zakończonych rezerwacji
    UPDATE Rezerwacje
    SET status = 'Zakonczona'
    WHERE data_zakonczenia < CURDATE();
END$$

DELIMITER ;
SELECT DISTINCT status FROM Rezerwacje;

CALL aktualizuj_statusy();

CREATE EVENT aktualizuj_statusy_event
    ON SCHEDULE EVERY 1 DAY
    DO
    CALL aktualizuj_statusy();

DROP TRIGGER aktualizuj_status_pojazdu;
-- Trigger aktualizujący status pojazdu po zakończeniu rezerwacji
DELIMITER $$

CREATE TRIGGER aktualizuj_status_pojazdu
    AFTER UPDATE ON Rezerwacje
    FOR EACH ROW
BEGIN
    IF NEW.nr_rejestracyjny IS NOT NULL THEN
        IF NEW.status IN ('Zakonczona', 'Anulowana') THEN
            UPDATE Pojazdy
            SET status = 'Dostepny'
            WHERE nr_rejestracyjny = NEW.nr_rejestracyjny;
        ELSEIF NEW.status = 'W trakcie' THEN
            UPDATE Pojazdy
            SET status = 'Wypozyczony'
            WHERE nr_rejestracyjny = NEW.nr_rejestracyjny;
        ELSEIF NEW.status = 'Przed rozpoczeciem' THEN
            UPDATE Pojazdy
            SET status = 'Dostepny'
            WHERE nr_rejestracyjny = NEW.nr_rejestracyjny;
        END IF;
    END IF;
END $$

DELIMITER ;
-- utworzenie indeksu dla szybszej pracy bazy danych (nie bylo to konieczne z uwagi na maly cwiczeniowy rozmiar bazy)
CREATE UNIQUE INDEX idx_nr_rej ON Pojazdy(nr_rejestracyjny);


-- Analiza danych

-- utworzenie procedury obliczajacej dochod w danym zakresie dat
DROP PROCEDURE IF EXISTS dochod_w_danym_zakresie;

DELIMITER $$

CREATE PROCEDURE dochod_w_danym_zakresie(IN data_poczatkowa DATE, IN data_koncowa DATE)
BEGIN
    DECLARE alias_nazwa VARCHAR(255);

    SET alias_nazwa = CONCAT('Dochod_', DATE_FORMAT(data_poczatkowa, '%Y_%m_%d'),
                             '_do_',
                             DATE_FORMAT(data_koncowa, '%Y_%m_%d'));

    SELECT alias_nazwa AS zakres_dochodu, SUM(kwota) AS dochod
    FROM Platnosci
    WHERE data_platnosci BETWEEN data_poczatkowa AND data_koncowa;
END $$

DELIMITER ;

CALL dochod_w_danym_zakresie('2025-03-10','2025-03-11');

-- utworzenie widoku ktory generuje tabele miesiecznych dochodow

CREATE OR REPLACE VIEW raport_miesieczny_dochod AS
SELECT
    DATE_FORMAT(data_platnosci, '%Y-%m') AS miesiac,
    SUM(kwota) AS dochod
FROM Platnosci
GROUP BY miesiac
ORDER BY miesiac ;

SELECT * FROM raport_miesieczny_dochod;

-- widok przedtawiajacy najczesciej wypozyczane pojazdy

CREATE OR REPLACE VIEW raport_najczesciej_wypozyczone_pojazdy AS
SELECT Pojazdy.marka, Pojazdy.model, COUNT(Rezerwacje.nr_rejestracyjny) AS liczba_wypozyczen
FROM Pojazdy
         INNER JOIN Rezerwacje ON Pojazdy.nr_rejestracyjny = Rezerwacje.nr_rejestracyjny
GROUP BY Pojazdy.marka, Pojazdy.model, Pojazdy.nr_rejestracyjny
ORDER BY liczba_wypozyczen DESC;

SELECT * FROM raport_najczesciej_wypozyczone_pojazdy ;

-- widok przedstawijacy klientow ktorzy dokonali najwiecej rezerwacji

CREATE OR REPLACE VIEW raport_najaktywniejsi_klienci AS
SELECT Klienci.id_klienta, Klienci.imie, Klienci.nazwisko, COUNT(Rezerwacje.id_klienta) AS liczba_wypozyczen
FROM Klienci
         INNER JOIN Rezerwacje  on Klienci.id_klienta = Rezerwacje.id_klienta
GROUP BY Klienci.id_klienta, Klienci.imie, Klienci.nazwisko, Rezerwacje.id_klienta
ORDER BY liczba_wypozyczen DESC;

SELECT * FROM raport_najaktywniejsi_klienci;

-- widok przedtawiajacy sredni czas wypozyczenia auta w zaleznosci od jego typu

CREATE OR REPLACE VIEW raport_srednia_dlugosc_wypozyczenia AS
SELECT Pojazdy.typ, AVG(DATEDIFF(Rezerwacje.data_zakonczenia, Rezerwacje.data_rozpoczecia)) AS srednia_dlugosc_wypozyczenia_w_dniach
FROM Pojazdy
         INNER JOIN Rezerwacje ON Pojazdy.nr_rejestracyjny = Rezerwacje.nr_rejestracyjny
WHERE Rezerwacje.status = 'Zakonczona'
GROUP BY Pojazdy.typ
ORDER BY srednia_dlugosc_wypozyczenia_w_dniach DESC ;

SELECT * FROM raport_srednia_dlugosc_wypozyczenia;


