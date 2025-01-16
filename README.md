# BAZA

## Wstęp

Projekt systemu bazodanowego dla firmy oferującej różnego rodzaju kursy i szkolenia. System obsługuje zarówno kursy stacjonarne, jak i online, a także integruje się z zewnętrznym systemem płatności.

## Funkcje systemu

- **Przechowywanie listy dostępnych webinarów, kursów i studiów.**
- **Przechowywanie sylabusów i harmonogramów.**
- **Przechowywanie szczegółów wydarzenia** (np. daty, miejsca, linków do spotkań online).
- **Przechowywanie statusu zaliczeń** (moduły kursowe, frekwencja na studiach).
- **Sprawdzanie statusu płatności.**
- **Generowanie raportów finansowych** (przychody dla każdego typu wydarzeń).
- **Wyświetlanie raportu liczby zapisanych osób.**
- **Tworzenie list obecności oraz raportów dotyczących frekwencji.**
- **Automatyczne weryfikowanie udziału w wydarzeniach online.**
- **Filtrowanie po rodzaju** (webinary, kursy, studia), formie (stacjonarne, online, hybrydowe), języku, dostępności miejsc, cenie.

## Procedury

- **AddUser** - Dodaje nowego użytkownika do systemu.
- **UpdateUserProfile** - Aktualizuje dane profilu użytkownika.
- **DeleteUser** - Usuwa użytkownika z systemu.
- **AddRole** - Dodawanie użytkownikowi nowej roli.
- **RemoveRole** - Usuwanie użytkownikowi roli.
- **AddEvent** - Dodaje nowe wydarzenie (webinar, kurs, studium).
- **UpdateEventDetails** - Aktualizuje szczegóły wydarzenia.
- **DeleteEvent** - Usuwa wydarzenie z systemu.
- **CreatePaymentLink** - Generuje link do płatności.
- **ProcessPaymentResult** - Przetwarza wynik płatności (udana/nieudana).
- **ApplyPaymentException** - Zapisuje wyjątek płatniczy (np. odroczenie).
- **RegisterForEvent** - Rejestruje użytkownika na wydarzenie.
- **CancelRegistration** - Anuluje rejestrację na wydarzenie.

## Struktura bazy danych

### Tabele

- **Users**: Przechowuje informacje o użytkownikach.
- **Languages**: Przechowuje informacje o językach.
- **CurrencyRates**: Przechowuje kursy walut.
- **EmployeeTypes**: Przechowuje typy pracowników.
- **Employees**: Przechowuje informacje o pracownikach.
- **TeachingLanguages**: Przechowuje informacje o językach, w których uczą pracownicy.
- **Students**: Przechowuje informacje o studentach.
- **StudyingLanguages**: Przechowuje informacje o językach, w których uczą się studenci.
- **TranslatingLanguages**: Przechowuje informacje o językach, które tłumaczą pracownicy.
- **Webinars**: Przechowuje informacje o webinarach.
- **StudentBoughtWebinars**: Przechowuje informacje o zakupionych webinarach przez studentów.
- **Cities**: Przechowuje informacje o miastach.
- **UserAvailableCities**: Przechowuje informacje o dostępnych miastach dla użytkowników.
- **Courses**: Przechowuje informacje o kursach.
- **CourseModuleMeetingTypes**: Przechowuje typy spotkań modułów kursów.
- **CourseModules**: Przechowuje informacje o modułach kursów.
- **CourseLessonMeetingTypes**: Przechowuje typy spotkań lekcji kursów.
- **CourseLessons**: Przechowuje informacje o lekcjach kursów.
- **CourseModulesPassed**: Przechowuje informacje o zaliczonych modułach kursów przez studentów.
- **CourseLessonsPassed**: Przechowuje informacje o zaliczonych lekcjach kursów przez studentów.
- **WebinarsPassed**: Przechowuje informacje o zaliczonych webinarach przez studentów.
- **Orders**: Przechowuje informacje o zamówieniach.
- **OrderDetails**: Przechowuje szczegóły zamówień.
- **OrderWebinars**: Przechowuje informacje o webinarach w zamówieniach.
- **OrderCourses**: Przechowuje informacje o kursach w zamówieniach.
- **Studies**: Przechowuje informacje o studiach.
- **Syllabuses**: Przechowuje informacje o sylabusach.
- **Subjects**: Przechowuje informacje o przedmiotach.
- **StudiesLessonMeetingTypes**: Przechowuje typy spotkań lekcji studiów.
- **StudiesLessons**: Przechowuje informacje o lekcjach studiów.
- **StudiesLessonPassed**: Przechowuje informacje o zaliczonych lekcjach studiów przez studentów.
- **StudentStudies**: Przechowuje informacje o studiach studentów.
- **Internships**: Przechowuje informacje o praktykach.
- **InternshipMeetingPassed**: Przechowuje informacje o zaliczonych praktykach przez studentów.
- **OrderStudies**: Przechowuje informacje o studiach w zamówieniach.
- **RODOSigns**: Przechowuje informacje o zgodach RODO użytkowników.

### Triggery

- **HandleWebinarPayment**: Obsługuje płatności za webinary.

## Diagram

![Database Diagram](BAZA_diagram.png)

## Autorzy

- [Dawid Żak](https://github.com/depebul)
- [Szymon Żuk](https://github.com/lythx)
- [Błażej Naziemiec](https://github.com/blizek)
