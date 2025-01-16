# BAZA

## Dokumentacja

Plik `dokumentacja.md` zawiera szczegółowy opis projektu bazy danych, w tym:

### Role

W bazie danych utworzone są następujące role:

- Administrator
- Wykładowca
- Tłumacz
- Student
- DyrektorSzkoły
- Księgowy

### Uprawnienia

Każda rola ma przypisane specyficzne uprawnienia do operacji na danych, takie jak dodawanie, edytowanie, usuwanie i przeglądanie danych.

### Opis tabel

Szczegółowy opis każdej tabeli w bazie danych, w tym klucze podstawowe, klucze obce i inne pola.

### Widoki

Definicje widoków ułatwiających dostęp do danych, takich jak:

- **DebtorsList**: Lista dłużników
- **PaymentStatus**: Status płatności
- **RegisteredParticipants**: Lista zarejestrowanych uczestników
- **EventDetails**: Szczegóły wydarzeń
- **AttendanceReports**: Raporty frekwencji
- **TranslatedEvents**: Lista wydarzeń z tłumaczeniem
- **TranslatorEventDetails**: Szczegóły wydarzeń dla tłumacza
- **AvailableEvents**: Lista dostępnych wydarzeń
- **RegisteredEventDetails**: Szczegóły zarejestrowanych wydarzeń
- **CompletionStatus**: Status ukończenia
- **StudentPaymentStatus**: Status płatności dla studentów

### Funkcje

Opis funkcji realizowanych przez system, takich jak:

- Przechowywanie listy dostępnych webinarów, kursów i studiów
- Przechowywanie sylabusów i harmonogramów
- Przechowywanie szczegółów wydarzenia (np. daty, miejsca, linków do spotkań online)
- Przechowywanie statusu zaliczeń (moduły kursowe, frekwencja na studiach)
- Sprawdzanie statusu płatności
- Generowanie raportów finansowych (przychody dla każdego typu wydarzeń)
- Wyświetlanie raportu liczby zapisanych osób
- Tworzenie list obecności oraz raportów dotyczących frekwencji
- Automatyczne weryfikowanie udziału w wydarzeniach online
- Filtrowanie po rodzaju (webinary, kursy, studia), formie (stacjonarne, online, hybrydowe), języku, dostępności miejsc, cenie

### Procedury

Definicje procedur składowanych używanych w systemie, takich jak:

- **AddUser**: Dodaje nowego użytkownika do systemu
- **UpdateUserProfile**: Aktualizuje dane profilu użytkownika
- **DeleteUser**: Usuwa użytkownika z systemu
- **AddRole**: Dodawanie użytkownikowi nowej roli
- **RemoveRole**: Usuwanie użytkownikowi roli
- **AddEvent**: Dodaje nowe wydarzenie (webinar, kurs, studium)
- **UpdateEventDetails**: Aktualizuje szczegóły wydarzenia
- **DeleteEvent**: Usuwa wydarzenie z systemu
- **CreatePaymentLink**: Generuje link do płatności
- **ProcessPaymentResult**: Przetwarza wynik płatności (udana/nieudana)
- **ApplyPaymentException**: Zapisuje wyjątek płatniczy (np. odroczenie)
- **RegisterForEvent**: Rejestruje użytkownika na wydarzenie
- **CancelRegistration**: Anuluje rejestrację na wydarzenie

### Triggery

Opis triggerów zapewniających spójność danych i realizujących specyficzne wymagania klienta, takich jak:

- **HandleWebinarPayment**: Obsługuje płatności za webinary
- **HandleCoursePayment**: Obsługuje płatności za kursy
- **HandleSessionPayment**: Obsługuje płatności za sesje studiów
- **HandleStudiesPayment**: Obsługuje płatności za studia

Więcej szczegółów można znaleźć w pliku `dokumentacja.md`.

## Diagram

![Database Diagram](BAZA_diagram.png)

## Autorzy

- [Dawid Żak](https://github.com/depebul)
- [Szymon Żuk](https://github.com/lythx)
- [Błażej Naziemiec](https://github.com/blizek)
