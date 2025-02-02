# Dokumentacja projekt bazy danych 2024/2025

## Zespół
 - Błażej Naziemiec - 33%
 - Dawid Żak - 33%
 - Szymon Żuk - 33%

Grupa 10, wtorek 18:30


## Role

W bazie danych utworzone są następujące role:

- Administrator
- Lecturer
- Translator
- Student
- SchoolDirector
- Accountant
<div style="page-break-after: always;"></div>

## Uprawnienia

### Administrator

Rola `Administrator` ma następujące uprawnienia:

- Może dodawać, zmieniać i usuwać dane dla: użytkowników
- Może dodawać, zmieniać i usuwać dane dla: pracowników
- Może dodawać, zmieniać i usuwać dane dla: webinarów
- Może dodawać, zmieniać i usuwać dane dla: kursów
- Może dodawać, zmieniać i usuwać dane dla: studiów
- Może dodawać, zmieniać i usuwać dane dla: zamówień
- Może dodawać, zmieniać i usuwać dane dla: szczegółów zamówień
- Może przeglądać dane dla: zamówień
- Może przeglądać dane dla: szczegółów zamówień

```sql
GRANT INSERT, UPDATE, DELETE ON Users TO Administrator;
GRANT INSERT, UPDATE, DELETE ON Employees TO Administrator;
GRANT INSERT, UPDATE, DELETE ON Webinars TO Administrator;
GRANT INSERT, UPDATE, DELETE ON Courses TO Administrator;
GRANT INSERT, UPDATE, DELETE ON Studies TO Administrator;
GRANT INSERT, UPDATE, DELETE ON Orders TO Administrator;
GRANT INSERT, UPDATE, DELETE ON OrderDetails TO Administrator;
GRANT SELECT ON Orders TO Administrator;
GRANT SELECT ON OrderDetails TO Administrator;
```
<div style="page-break-after: always;"></div>

### Lecturer

Rola `Lecturer` ma następujące uprawnienia:

- Może przeglądać dane: studentów
- Może przeglądać dane: zakupionych webinarów przez studentów
- Może przeglądać dane: zaliczonych modułów kursów
- Może przeglądać dane: zaliczonych lekcji kursów
- Może przeglądać dane: zaliczonych webinarów
- Może przeglądać dane: zaliczonych lekcji studiów

```sql
GRANT SELECT ON Students TO Lecturer;
GRANT SELECT ON StudentBoughtWebinars TO Lecturer;
GRANT SELECT ON CourseModulesPassed TO Lecturer;
GRANT SELECT ON CourseLessonsPassed TO Lecturer;
GRANT SELECT ON WebinarsPassed TO Lecturer;
GRANT SELECT ON StudiesLessonPassed TO Lecturer;
```
<div style="page-break-after: always;"></div>

### Translator

Rola `Translator` ma następujące uprawnienia:

- Może przeglądać dane: webinarów
- Może przeglądać dane: kursów
- Może przeglądać dane: studiów

```sql
GRANT SELECT ON Webinars TO Translator;
GRANT SELECT ON Courses TO Translator;
GRANT SELECT ON Studies TO Translator;
```
<div style="page-break-after: always;"></div>

### Student

Rola `Student` ma następujące uprawnienia:

- Może przeglądać dane dla: webinarów
- Może przeglądać dane dla: kursów
- Może przeglądać dane dla: studiów
- Może przeglądać dane dla: zakupionych webinarów przez studentów
- Może przeglądać dane dla: zaliczonych modułów kursów
- Może przeglądać dane dla: zaliczonych lekcji kursów
- Może przeglądać dane dla: zaliczonych webinarów
- Może przeglądać dane dla: zaliczonych lekcji studiów

```sql
GRANT SELECT ON Webinars TO Student;
GRANT SELECT ON Courses TO Student;
GRANT SELECT ON Studies TO Student;
GRANT SELECT ON StudentBoughtWebinars TO Student;
GRANT SELECT ON CourseModulesPassed TO Student;
GRANT SELECT ON CourseLessonsPassed TO Student;
GRANT SELECT ON WebinarsPassed TO Student;
GRANT SELECT ON StudiesLessonPassed TO Student;
```
<div style="page-break-after: always;"></div>

### SchoolDirector

Rola `SchoolDirector` ma następujące uprawnienia:

- Ma pełne uprawnienia (dodawanie, zmienianie, usuwanie, przeglądanie) do danych dla: użytkowników
- Ma pełne uprawnienia (dodawanie, zmienianie, usuwanie, przeglądanie) do danych dla: pracowników
- Ma pełne uprawnienia (dodawanie, zmienianie, usuwanie, przeglądanie) do danych dla: webinarów
- Ma pełne uprawnienia (dodawanie, zmienianie, usuwanie, przeglądanie) do danych dla: kursów
- Ma pełne uprawnienia (dodawanie, zmienianie, usuwanie, przeglądanie) do danych dla: studiów
- Ma pełne uprawnienia (dodawanie, zmienianie, usuwanie, przeglądanie) do danych dla: zamówień
- Ma pełne uprawnienia (dodawanie, zmienianie, usuwanie, przeglądanie) do danych dla: szczegółów zamówień

```sql
GRANT ALL ON Users TO SchoolDirector;
GRANT ALL ON Employees TO SchoolDirector;
GRANT ALL ON Webinars TO SchoolDirector;
GRANT ALL ON Courses TO SchoolDirector;
GRANT ALL ON Studies TO SchoolDirector;
GRANT ALL ON Orders TO SchoolDirector;
GRANT ALL ON OrderDetails TO SchoolDirector;
```
<div style="page-break-after: always;"></div>

### Accountant

Rola `Accountant` ma następujące uprawnienia:

- Może przeglądać dane dla: zamówień
- Może przeglądać dane dla: szczegółów zamówień

```sql
GRANT SELECT ON Orders TO Accountant;
GRANT SELECT ON OrderDetails TO Accountant;
```
<div style="page-break-after: always;"></div>

## Diagram bazy danych

![Diagram bazy danych](BAZA_diagram.png)
<div style="page-break-after: always;"></div>

## Opis tabel

- **Users**: Przechowuje informacje o użytkownikach systemu.
    - **Klucz podstawowy**: UserID
    - **Pola tabeli**:
        - UserID: ID użytkownika
        - UserName: Imię użytkownika
        - UserSurname: Nazwisko użytkownika
        - UserDateOfBirth: Data urodzenia użytkownika
        - UserSex: Płeć użytkownika
        - UserEmail: Adres email użytkownika
        - UserPhoneNumber: Numer telefonu użytkownika
        - UserAddress: Adres użytkownika
        - UserCity: Miasto użytkownika
        - UserCountry: Kraj użytkownika
        - UserPostalCode: Kod pocztowy użytkownika
        
    ```sql
    CREATE TABLE Users
    (
        UserID          INT PRIMARY KEY IDENTITY(1,1),
        UserName        VARCHAR(50)  NOT NULL,
        UserSurname     VARCHAR(50)  NOT NULL,
        UserDateOfBirth DATE         NOT NULL,
        UserSex         CHAR(1)      NOT NULL,
        UserEmail       VARCHAR(100) NOT NULL,
        UserPhoneNumber VARCHAR(20),
        UserAddress     VARCHAR(100) NOT NULL,
        UserCity        VARCHAR(50) NOT NULL,
        UserCountry     VARCHAR(50) NOT NULL,
        UserPostalCode  VARCHAR(10) NOT NULL
    )
    ```
<div style="page-break-after: always;"></div>

- **Languages**: Przechowuje informacje o językach.
    - **Klucz podstawowy**: LanguageID
    - **Pola tabeli**:
        - LanguageID: ID języka
        - LanguageName: Nazwa języka
        
    ```sql
    CREATE TABLE Languages
    (
        LanguageID   INT PRIMARY KEY IDENTITY(1,1),
        LanguageName VARCHAR(50) NOT NULL
    )
    ```
<div style="page-break-after: always;"></div>

- **CurrencyRates**: Przechowuje kursy walut.
    - **Klucz podstawowy**: CurrencyID
    - **Pola tabeli**:
        - CurrencyID: ID waluty
        - CurrencyName: Nazwa waluty
        - RateToPLN: Kurs waluty do PLN
        
    ```sql
    CREATE TABLE CurrencyRates(
        CurrencyID INT PRIMARY KEY IDENTITY(1,1),
        CurrencyName VARCHAR(100) NOT NULL,
        RateToPLN MONEY NOT NULL
    )
    ```
<div style="page-break-after: always;"></div>

- **EmployeeTypes**: Przechowuje typy pracowników.
    - **Klucz podstawowy**: EmployeeTypeID
    - **Pola tabeli**:
        - EmployeeTypeID: ID typu pracownika
        - EmployeeTypeName: Nazwa typu pracownika
        
    ```sql
    CREATE TABLE EmployeeTypes
    (
        EmployeeTypeID   INT PRIMARY KEY IDENTITY(1,1),
        EmployeeTypeName VARCHAR(50) NOT NULL
    )
    ```
<div style="page-break-after: always;"></div>

- **Employees**: Przechowuje informacje o pracownikach.
    - **Klucz podstawowy**: EmployeeID
    - **Klucze obce**: UserID (z tabeli Users), EmployeeTypeID (z tabeli EmployeeTypes)
    - **Pola tabeli**:
        - EmployeeID: ID pracownika
        - UserID: ID użytkownika
        - EmployeeTypeID: ID typu pracownika
        - HireDate: Data zatrudnienia
        - Salary: Wynagrodzenie
        
    ```sql
    CREATE TABLE Employees
    (
        EmployeeID     INT PRIMARY KEY IDENTITY(1,1),
        UserID         INT NOT NULL,
        EmployeeTypeID INT NOT NULL,
        HireDate       DATE NOT NULL,
        Salary         MONEY NOT NULL,
        FOREIGN KEY (UserID) REFERENCES Users (UserID),
        FOREIGN KEY (EmployeeTypeID) REFERENCES EmployeeTypes (EmployeeTypeID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **TeachingLanguages**: Przechowuje informacje o językach, w których uczą pracownicy.
    - **Klucze podstawowe**: EmployeeID, LanguageID
    - **Klucze obce**: EmployeeID (z tabeli Employees), LanguageID (z tabeli Languages)
    - **Pola tabeli**:
        - EmployeeID: ID pracownika
        - LanguageID: ID języka
        
    ```sql
    CREATE TABLE TeachingLanguages(
        EmployeeID INT,
        LanguageID INT,
        PRIMARY KEY (EmployeeID, LanguageID),
        FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
        FOREIGN KEY (LanguageID) REFERENCES Languages (LanguageID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **Students**: Przechowuje informacje o studentach.
    - **Klucz podstawowy**: StudentID
    - **Klucz obcy**: UserID (z tabeli Users)
    - **Pola tabeli**:
        - StudentID: ID studenta
        - UserID: ID użytkownika
        
    ```sql
    CREATE TABLE Students
    (
        StudentID  INT PRIMARY KEY IDENTITY(1,1),
        UserID     INT NOT NULL,
        FOREIGN KEY (UserID) REFERENCES Users (UserID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **StudyingLanguages**: Przechowuje informacje o językach, w których chce uczyć się student.
    - **Klucze podstawowe**: StudentID, LanguageID
    - **Klucze obce**: StudentID (z tabeli Students), LanguageID (z tabeli Languages)
    - **Pola tabeli**:
        - StudentID: ID studenta
        - LanguageID: ID języka
        
    ```sql
    CREATE TABLE StudyingLanguages(
        StudentID INT,
        LanguageID INT,
        PRIMARY KEY (StudentID, LanguageID),
        FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
        FOREIGN KEY (LanguageID) REFERENCES Languages (LanguageID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **TranslatingLanguages**: Przechowuje informacje o języku, jaki może tłumaczyć tłumacz.
    - **Klucze podstawowe**: EmployeeID, LanguageID
    - **Klucze obce**: EmployeeID (z tabeli Employees), LanguageID (z tabeli Languages)
    - **Pola tabeli**:
        - EmployeeID: ID pracownika
        - LanguageID: ID języka
        
     ```sql
    CREATE TABLE TranslatingLanguages(
        EmployeeID INT,
        LanguageID INT,
        PRIMARY KEY (EmployeeID, LanguageID),
        FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
        FOREIGN KEY (LanguageID) REFERENCES Languages (LanguageID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **Webinars**: Przechowuje informacje o webinarach.
    - **Klucz podstawowy**: WebinarID
    - **Klucze obce**: WebinarLanguageID (z tabeli Languages), WebinarTranslatorID (z tabeli Employees), WebinarTeacherID (z tabeli Employees)
    - **Pola tabeli**:
        - WebinarID: ID webinaru
        - WebinarName: Nazwa webinaru
        - WebinarStartDate: Data rozpoczęcia webinaru
        - WebinarEndDate: Data zakończenia webinaru
        - WebinarDescription: Opis webinaru
        - WebinarLanguageID: ID języka webinaru
        - WebinarPrice: Cena webinaru
        - WebinarTranslatorID: ID tłumacza webinaru
        - WebinarTeacherID: ID nauczyciela webinaru
        - WebinarMeetingLink: Link do spotkania webinaru
        - WebinarAccessDateEnd: Data zakończenia dostępu do webinaru
        - WebinarRecordingLink: Link do nagrania webinaru
        
     ```sql
    CREATE TABLE Webinars(
        WebinarID INT PRIMARY KEY IDENTITY(1,1),
        WebinarName VARCHAR(100) NOT NULL,
        WebinarStartDate SMALLDATETIME NOT NULL,
        WebinarEndDate SMALLDATETIME NOT NULL,
        WebinarDescription VARCHAR(MAX) NOT NULL,
        WebinarLanguageID INT NOT NULL,
        WebinarPrice MONEY,
        WebinarTranslatorID INT,
        WebinarTeacherID INT NOT NULL,
        WebinarMeetingLink VARCHAR(100),
        WebinarAccessDateEnd SMALLDATETIME NOT NULL,
        WebinarRecordingLink VARCHAR(100)
        FOREIGN KEY (WebinarLanguageID) REFERENCES Languages (LanguageID),
        FOREIGN KEY (WebinarTranslatorID) REFERENCES Employees (EmployeeID),
        FOREIGN KEY (WebinarTeacherID) REFERENCES Employees (EmployeeID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **StudentBoughtWebinars**: Przechowuje informacje o zakupionych webinarach przez studentów.
    - **Klucze podstawowe**: StudentID, WebinarID
    - **Klucze obce**: StudentID (z tabeli Students), WebinarID (z tabeli Webinars)
    - **Pola tabeli**:
        - StudentID: ID studenta
        - WebinarID: ID webinaru
        - WebinarBoughtDate: Data zakupu webinaru
        - WebinarAccessDateEnd: Data zakończenia dostępu do webinaru
        
     ```sql
    CREATE Table StudentBoughtWebinars(
        StudentID INT,
        WebinarID INT,
        WebinarBoughtDate SMALLDATETIME NOT NULL,
        WebinarAccessDateEnd SMALLDATETIME NOT NULL,
        PRIMARY KEY (StudentID, WebinarID),
        FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
        FOREIGN KEY (WebinarID) REFERENCES Webinars (WebinarID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **Cities**: Przechowuje informacje o miastach.
    - **Klucz podstawowy**: CityID
    - **Pola tabeli**:
        - CityID: ID miasta
        - CityName: Nazwa miasta
        
     ```sql
    CREATE TABLE Cities(
        CityID INT PRIMARY KEY IDENTITY(1,1),
        CityName VARCHAR(50) NOT NULL
    )
    ```
    <div style="page-break-after: always;"></div>

- **UserAvailableCities**: Przechowuje informacje o dostępnych miastach dla użytkowników.
    - **Klucze podstawowe**: UserID, CityID
    - **Klucze obce**: UserID (z tabeli Users), CityID (z tabeli Cities) 
    - **Pola tabeli**:
        - UserID: ID użytkownika
        - CityID: ID miasta
        
     ```sql
    CREATE TABLE UserAvailableCities(
        UserID INT,
        CityID INT,
        PRIMARY KEY (UserID, CityID),
        FOREIGN KEY (UserID) REFERENCES Users (UserID),
        FOREIGN KEY (CityID) REFERENCES Cities (CityID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **Courses**: Przechowuje informacje o kursach.
    - **Klucz podstawowy**: CourseID
    - **Klucz obcy**: CourseLanguageID (z tabeli Languages)
    - **Pola tabeli**:
        - CourseID: ID kursu
        - CourseName: Nazwa kursu
        - CourseModuleQuantity: Ilość modułów kursu
        - CourseDescription: Opis kursu
        - CourseLanguageID: ID języka kursu
        - CoursePrice: Cena kursu
        - CourseStartDate: Data rozpoczęcia kursu
        - CourseEndDate: Data zakończenia kursu
        - CourseCapacity: Maksymalna ilość osób w kursie
        - CourseRecordingLink: Link do nagrania kursu
        
     ```sql
    CREATE TABLE Courses(
        CourseID INT PRIMARY KEY IDENTITY(1,1),
        CourseName VARCHAR(100) NOT NULL,
        CourseModuleQuantity INT NOT NULL,
        CourseDescription VARCHAR(MAX) NOT NULL,
        CourseLanguageID INT NOT NULL,
        CoursePrice MONEY NOT NULL,
        CourseStartDate SMALLDATETIME NOT NULL,
        CourseEndDate SMALLDATETIME NOT NULL,
        CourseCapacity INT NOT NULL,
        CourseRecordingLink VARCHAR(100)
        FOREIGN KEY (CourseLanguageID) REFERENCES Languages (LanguageID),
    )
    ```
    <div style="page-break-after: always;"></div>

- **StudentBoughtCourses**: Przechowuje powiązanie studenta z zakupionymi kursami.
    - **Klucze podstawowe**: StudentID, CourseID
    - **Klucze obce**: StudentID (z tabeli Students), CourseID (z tabeli Courses)
    - **Pola tabeli**:
        - StudentID: ID studenta
        - CourseID: ID kursu

    ```sql
    CREATE Table StudentBoughtCourses(
        StudentID INT,
        CourseID INT,
        PRIMARY KEY (StudentID, CourseID),
        FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
        FOREIGN KEY (CourseID) REFERENCES Courses (CourseID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **CourseModuleMeetingTypes**: Przechowuje typy spotkań modułów kursów.
    - **Klucz podstawowy**: CourseModuleMeetingTypeID
    - **Pola tabeli**:
        - CourseModuleMeetingTypeID: ID typu spotkania modułu
        - CourseModuleMeetingTypeName: Nazwa typu spotkania
        
     ```sql
    CREATE TABLE CourseModuleMeetingTypes(
        CourseModuleMeetingTypeID INT PRIMARY KEY IDENTITY(1,1),
        CourseModuleMeetingTypeName VARCHAR(50) NOT NULL
    )
    ```
    <div style="page-break-after: always;"></div>

- **CourseModules**: Przechowuje informacje o modułach kursów.
    - **Klucz podstawowy**: CourseModuleID
    - **Klucze obce**: CourseID (z tabeli Course), ModuleLanguageID (z tabeli Languages), CourseModuleMeetingTypeID (z tabeli CourseModuleMeetingTypes)
    - **Pola tabeli**:
        - ModuleID: ID modułu
        - CourseID: ID kursu
        - ModuleName: Nazwa modułu
        - ModuleDescription: Opis modułu
        - ModuleLanguageID: ID języka modułu
        - CourseModuleMeetingTypeID: ID typu spotkania modułu
        - CourseModuleLessonQuantity: Ilość lekcji modułu
        
     ```sql
    CREATE TABLE CourseModules(
        ModuleID INT PRIMARY KEY IDENTITY(1,1),
        CourseID INT NOT NULL,
        ModuleName VARCHAR(100) NOT NULL,
        ModuleDescription VARCHAR(MAX) NOT NULL,
        ModuleLanguageID INT NOT NULL,
        CourseModuleMeetingTypeID INT NOT NULL,
        CourseModuleLessonQuantity INT NOT NULL,
        FOREIGN KEY (CourseID) REFERENCES Courses (CourseID),
        FOREIGN KEY (ModuleLanguageID) REFERENCES Languages (LanguageID),
        FOREIGN KEY (CourseModuleMeetingTypeID) REFERENCES CourseModuleMeetingTypes (CourseModuleMeetingTypeID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **CourseLessonMeetingTypes**: Przechowuje typy spotkań lekcji kursów.
    - **Klucz podstawowy**: CourseLessonMeetingTypeID
    - **Pola tabeli**:
        - CourseLessonMeetingTypeID: ID typu spotkania lekcji
        - CourseLessonMeetingTypeName: Nazwa typu spotkania
        
     ```sql
    CREATE TABLE CourseLessonMeetingTypes(
        CourseLessonMeetingTypeID INT PRIMARY KEY IDENTITY(1,1),
        CourseLessonMeetingTypeName VARCHAR(50) NOT NULL
    )
    ```
    <div style="page-break-after: always;"></div>

- **CourseLessons**: Przechowuje informacje o lekcjach kursów.
    - **Klucz podstawowy**: CourseLessonID
    - **Klucze obce**: ModuleID (z tabeli CourseModules), CourseID (z tabeli Courses), LessonLanguageID (z tabeli Languages), CourseLessonMeetingTypeID (z tabeli CourseLessonMeetingTypes) TranslatorID (z tabeli Employees), TeacherID (z tabeli Employees)
    - **Pola tabeli**:
        - LessonID: ID lekcji
        - ModuleID: ID modułu
        - CourseID: ID kursu
        - LessonName: Nazwa lekcji
        - LessonDescription: Opis lekcji
        - LessonLanguageID: ID języka lekcji
        - LessonMeetingLink: Link do spotkania lekcji
        - LessonMeetingPlace: Miejsce spotkania lekcji
        - LessonMeetingDateStart: Data rozpoczęcia spotkania lekcji
        - LessonMeetingDateEnd: Data zakończenia spotkania lekcji
        - LessonCapacity: Maksymalna ilość osób na lekcji
        - CourseLessonMeetingTypeID: ID typu spotkania lekcji
        - IsTranslatedToPolish: Czy lekcja jest tłumaczona na polski
        - TranslatorID: ID tłumacza
        - TeacherID: ID nauczyciela

    ```sql
    CREATE TABLE CourseLessons(
        LessonID INT PRIMARY KEY IDENTITY(1,1),
        ModuleID INT NOT NULL,
        CourseID INT NOT NULL,
        LessonName VARCHAR(100) NOT NULL,
        LessonDescription VARCHAR(MAX) NOT NULL,
        LessonLanguageID INT NOT NULL,
        LessonMeetingLink VARCHAR(100) NOT NULL,
        LessonMeetingPlace VARCHAR(100) NOT NULL,
        LessonMeetingDateStart SMALLDATETIME NOT NULL,
        LessonMeetingDateEnd SMALLDATETIME NOT NULL,
        LessonCapacity INT NOT NULL,
        CourseLessonMeetingTypeID INT NOT NULL,
        IsTranslatedToPolish BIT NOT NULL,
        TranslatorID INT,
        TeacherID INT NOT NULL,
        FOREIGN KEY (ModuleID) REFERENCES CourseModules (ModuleID),
        FOREIGN KEY (CourseID) REFERENCES Courses (CourseID),
        FOREIGN KEY (LessonLanguageID) REFERENCES Languages (LanguageID),
        FOREIGN KEY (CourseLessonMeetingTypeID) REFERENCES CourseLessonMeetingTypes (CourseLessonMeetingTypeID),
        FOREIGN KEY (TranslatorID) REFERENCES Employees (EmployeeID),
        FOREIGN KEY (TeacherID) REFERENCES Employees (EmployeeID),
    )
    ```
    <div style="page-break-after: always;"></div>

- **CourseModulesPassed**: Przechowuje informacje o zaliczonych modułach kursów przez studentów.
    - **Klucze podstawowe**: StudentID, CourseID
    - **Klucze obce**: StudentID (z tabeli Students), ModuleID (z tabeli CourseModules)
    - **Pola tabeli**:
        - StudentID: ID studenta
        - ModuleID: ID modułu

    ```sql
    CREATE TABLE CourseModulesPassed(
        StudentID INT,
        ModuleID INT,
        PRIMARY KEY (StudentID, ModuleID),
        FOREIGN KEY (ModuleID) REFERENCES CourseModules (ModuleID),
        FOREIGN KEY (StudentID) REFERENCES Students (StudentID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **CourseLessonsPassed**: Przechowuje informacje o zaliczonych lekcjach kursów przez studentów.
    - **Klucze podstawowe**: StudentID, LessonID
    - **Klucze obce**: StudentID (z tabeli Students), LessonID (z tabeli CourseLessons)
    - **Pola tabeli**:
        - StudentID: ID studenta
        - LessonID: ID lekcji

    ```sql
    CREATE TABLE CourseLessonsPassed(
        StudentID INT,
        LessonID INT,
        PRIMARY KEY (StudentID, LessonID),
        FOREIGN KEY (LessonID) REFERENCES CourseLessons (LessonID),
        FOREIGN KEY (StudentID) REFERENCES Students (StudentID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **WebinarsPassed**: Przechowuje informacje o zaliczonych webinarach przez studentów.
    - **Klucze podstawowe**: StudentID, WebinarID
    - **Klucze obce**: StudentID (z tabeli Students), WebinarID (z tabeli Webinars)
    - **Pola tabeli**:
        - StudentID: ID studenta
        - WebinarID: ID webinaru

    ```sql
    CREATE TABLE WebinarsPassed(
        StudentID INT,
        WebinarID INT,
        PRIMARY KEY (StudentID, WebinarID),
        FOREIGN KEY (WebinarID) REFERENCES Webinars (WebinarID),
        FOREIGN KEY (StudentID) REFERENCES Students (StudentID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **Orders**: Przechowuje informacje o zamówieniach.
    - **Klucz podstawowy**: OrderID
    - **Klucz obcy**: UserID (z tabeli Users)
    - **Pola tabeli**:
        - OrderID: ID zamówienia
        - UserID: ID użytkownika
        - OrderDate: Data zamówienia
        - OrderPaymentLink: Link do płatności zamówienia

    ```sql
    CREATE TABLE Orders(
        OrderID INT PRIMARY KEY IDENTITY(1,1),
        UserID INT NOT NULL,
        OrderDate SMALLDATETIME NOT NULL,
        OrderPaymentLink VARCHAR(100) NOT NULL,
        FOREIGN KEY (UserID) REFERENCES Users (UserID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **OrderDetails**: Przechowuje szczegóły zamówień.
    - **Klucz podstawowy**: OrderDetailID
    - **Klucze obce**: OrderID (z tabeli Orders), CurrencyID (z tabeli CurrencyRates)
    - **Pola tabeli**:
        - OrderDetailID: ID szczegółu zamówienia
        - OrderID: ID zamówienia
        - AmountPaid: Kwota zapłacona
        - AmountToPay: Kwota do zapłaty
        - CurrencyID: ID waluty
        - CurrencyRate: Kurs waluty
        - PaidDate: Data płatności
        - PostponementDate: Data odroczenia płatności

    ```sql
    CREATE TABLE OrderDetails(
        OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
        OrderID INT NOT NULL,
        AmountPaid MONEY NOT NULL,
        AmountToPay MONEY NOT NULL,
        CurrencyID INT,
        CurrencyRate MONEY,
        PaidDate SMALLDATETIME,
        PostponementDate SMALLDATETIME,
        FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
        FOREIGN KEY (CurrencyID) REFERENCES CurrencyRates (CurrencyID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **OrderWebinars**: Przechowuje informacje o webinarach w zamówieniach.
    - **Klucz podstawowy**: OrderWebinarID
    - **Klucze obce**: OrderDetailID (z tabeli OrderDetails), WebinarID (z tabeli Webinars)
    - **Pola tabeli**:
        - OrderWebinarID: ID webinaru w zamówieniu
        - WebinarID: ID webinaru
        - OrderDetailID: ID szczegółu zamówienia

    ```sql
    CREATE TABLE OrderWebinars(
        OrderWebinarID INT PRIMARY KEY IDENTITY(1,1),
        WebinarID INT NOT NULL,
        OrderDetailID INT NOT NULL,
        FOREIGN KEY (OrderDetailID) REFERENCES OrderDetails (OrderDetailID),
        FOREIGN KEY (WebinarID) REFERENCES Webinars (WebinarID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **OrderCourses**: Przechowuje informacje o zamówionych kursach.
    - **Klucz podstawowy**: OrderCourseID
    - **Klucze obce**: OrderDetailID (z tabeli OrderDetails), CourseID (z tabeli Courses)
    - **Pola tabeli**:
        - OrderCourseID: ID kursu w zamówieniu
        - CourseID: ID kursu
        - OrderDetailID: ID szczegółu zamówienia

    ```sql
    CREATE TABLE OrderCourses(
        OrderCourseID INT PRIMARY KEY IDENTITY(1,1),
        CourseID INT NOT NULL,
        OrderDetailID INT NOT NULL,
        FOREIGN KEY (OrderDetailID) REFERENCES OrderDetails (OrderDetailID),
        FOREIGN KEY (CourseID) REFERENCES Courses (CourseID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **Studies**: Przechowuje informacje o studiach.
    - **Klucz podstawowy**: StudiesID
    - **Pola tabeli**:
        - StudiesID: ID studiów
        - StudiesDescription: Opis studiów
        - StudiesName: Nazwa studiów
        - StudiesEntryFee: Opłata za studia
        - StudiesStartDate: Data rozpoczęcia studiów
        - StudiesEndDate: Data zakończenia studiów
        - StudiesCapacity: Maksymalna ilość osób na studiach

    ```sql
    CREATE TABLE Studies(
        StudiesID INT PRIMARY KEY IDENTITY(1,1),
        StudiesDescription VARCHAR(MAX) NOT NULL,
        StudiesName VARCHAR(100) NOT NULL,
        StudiesEntryFee MONEY NOT NULL,
        StudiesStartDate DATE NOT NULL,
        StudiesEndDate DATE NOT NULL,
        StudiesCapacity INT NOT NULL
    )
    ```
    <div style="page-break-after: always;"></div>

- **Syllabuses**: Przechowuje informacje o sylabusach.
    - **Klucz podstawowy**: SyllabusID
    - **Klucz obcy**: StudiesID (z tabeli Studies)
    - **Pola tabeli**:
        - SyllabusID: ID sylabusa
        - StudiesID: ID studiów
        - SemesterNumber: Numer semestru

    ```sql
    CREATE TABLE Syllabuses(
        SyllabusID INT PRIMARY KEY IDENTITY(1,1),
        StudiesID INT NOT NULL,
        SemesterNumber INT NOT NULL,
        FOREIGN KEY (StudiesID) REFERENCES Studies (StudiesID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **Subjects**: Przechowuje informacje o przedmiotach.
    - **Klucz podstawowy**: SubjectID
    - **Klucze obce**: CoordinatorID (z tabeli Employees), SyllabusID (z tabeli Syllabuses)
    - **Pola tabeli**:
        - SubjectID: ID przedmiotu
        - SubjectName: Nazwa przedmiotu
        - SubjectDescription: Opis przedmiotu
        - SubjectsCount: Liczba zajęć na przedmiocie
        - CoordinatorID: ID koordynatora
        - SyllabusID: ID sylabusa
        
    ```sql
    CREATE TABLE Subjects(
        SubjectID INT PRIMARY KEY IDENTITY(1,1),
        SubjectName VARCHAR(100) NOT NULL,
        SubjectDescription VARCHAR(MAX) NOT NULL,
        SubjectsCount INT NOT NULL,
        CoordinatorID INT NOT NULL,
        SyllabusID INT NOT NULL,
        FOREIGN KEY (CoordinatorID) REFERENCES Employees (EmployeeID),
        FOREIGN KEY (SyllabusID) REFERENCES Syllabuses (SyllabusID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **StudiesLessonMeetingTypes**: Przechowuje typy spotkań lekcji studiów.
    - **Klucz podstawowy**: StudiesLessonMeetingTypeID
    - **Pola tabeli**:
        - StudiesLessonMeetingTypeID: ID typu spotkania lekcji
        - StudiesLessonMeetingTypeName: Nazwa typu spotkania
        
    ```sql
    CREATE TABLE StudiesLessonMeetingTypes(
        StudiesLessonMeetingTypeID INT PRIMARY KEY IDENTITY(1,1),
        StudiesLessonMeetingTypeName VARCHAR(50) NOT NULL
    )
    ```
    <div style="page-break-after: always;"></div>

- **StudiesSessions**: Przechowuje informacje o semestrach na studiach.
    - **Klucz podstawowy**: SessionID
    - **Klucze obce**: StudiesID (z tabeli Studies), SubjectID (z tabeli Subjects)
    - **Pola tabeli**:
        - SessionID: ID semestru
        - StudiesID: ID studiów
        - SubjectID: ID przedmiotu
        - SessionStartDate: Data rozpoczęcia semestru
        - SessionEndDate: Data zakończenia semestru
        - SessionCapacity: Ilość osób na semestrze
        - SessionGuestCapacity: Ilość gości na semestrze
        - SessionPrice: Cena za semestr
        
    ```sql
    CREATE TABLE StudiesSessions(
        SessionID INT PRIMARY KEY IDENTITY(1,1),
        StudiesID INT NOT NULL,
        SubjectID INT NOT NULL,
        SessionStartDate DATE NOT NULL,
        SessionEndDate DATE NOT NULL,
        SessionCapacity INT NOT NULL,
        SessionGuestCapacity INT NOT NULL,
        SessionPrice MONEY NOT NULL,
        FOREIGN KEY (StudiesID) REFERENCES Studies (StudiesID),
        FOREIGN KEY (SubjectID) REFERENCES Subjects (SubjectID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **StudiesLessons**: Przechowuje informacje o lekcjach studiów.
    - **Klucz podstawowy**: LessonID
    - **Klucze obce**: SessionID (z tabeli StudiesSessions), SubjectID (z tabeli Subjects), LessonLanguageID (z tabeli Languages), TranslatorID (z tabeli Employees), TeacherID (z tabeli Employees), StudiesLessonMeetingTypeID (z tabeli StudiesLessonMeetingTypes)
    - **Pola tabeli**:
        - LessonID: ID lekcji
        - SessionID: ID semestru
        - SubjectID: ID przedmiotu
        - LessonName: Nazwa lekcji
        - LessonDescription: Opis lekcji
        - LessonLanguageID: ID języka lekcji
        - LessonMeetingLink: Link do spotkania lekcji
        - LessonMeetingPlace: Miejsce spotkania lekcji
        - LessonMeetingDateStart: Data rozpoczęcia spotkania lekcji
        - LessonMeetingDateEnd: Data zakończenia spotkania lekcji
        - LessonCapacity: Ilość osób na lekcji
        - LessonGuestCapacity: Ilość gości na lekcji
        - LessonPrice: Cena lekcji
        - LessonGuestPrice: Cena dla gości
        - IsTranslatedToPolish: Czy lekcja jest tłumaczona na polski
        - TranslatorID: ID tłumacza
        - TeacherID: ID nauczyciela
        - StudiesLessonMeetingTypeID: ID typu spotkania lekcji
        
    ```sql
    CREATE TABLE StudiesLessons(
        LessonID INT PRIMARY KEY IDENTITY(1,1),
        SessionID INT NOT NULL,
        SubjectID INT NOT NULL,
        LessonName VARCHAR(100) NOT NULL,
        LessonDescription VARCHAR(MAX) NOT NULL,
        LessonLanguageID INT NOT NULL,
        LessonMeetingLink VARCHAR(100),
        LessonMeetingPlace VARCHAR(100),
        LessonMeetingDateStart SMALLDATETIME NOT NULL,
        LessonMeetingDateEnd SMALLDATETIME NOT NULL,
        LessonCapacity INT NOT NULL,
        LessonGuestCapacity INT NOT NULL,
        LessonPrice MONEY NOT NULL,
        LessonGuestPrice MONEY NOT NULL,
        IsTranslatedToPolish BIT NOT NULL,
        TranslatorID INT,
        TeacherID INT NOT NULL,
        StudiesLessonMeetingTypeID INT NOT NULL,
        FOREIGN KEY (SessionID) REFERENCES StudiesSessions (SessionID),
        FOREIGN KEY (SubjectID) REFERENCES Subjects (SubjectID),
        FOREIGN KEY (LessonLanguageID) REFERENCES Languages (LanguageID),
        FOREIGN KEY (TranslatorID) REFERENCES Employees (EmployeeID),
        FOREIGN KEY (TeacherID) REFERENCES Employees (EmployeeID),
        FOREIGN KEY (StudiesLessonMeetingTypeID) REFERENCES StudiesLessonMeetingTypes (StudiesLessonMeetingTypeID),
    )
    ```
    <div style="page-break-after: always;"></div>

- **StudiesLessonsPassed**: Przechowuje informacje o zaliczonych lekcjach studiów przez studentów.
    - **Klucze podstawowe**: StudentID, LessonID
    - **Klucze obce**: StudentID (z tabeli Students), LessonID (z tabeli StudiesLessons)
    - **Pola tabeli**:
        - StudentID: ID studenta
        - LessonID: ID lekcji
        
    ```sql
    CREATE TABLE StudiesLessonsPassed(
        StudentID INT,
        LessonID INT,
        PRIMARY KEY (StudentID, LessonID),
        FOREIGN KEY (LessonID) REFERENCES StudiesLessons (LessonID),
        FOREIGN KEY (StudentID) REFERENCES Students (StudentID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **StudentStudiesGrades**: Przechowuje oceny studentów za studia.
    - **Klucze podstawowe**: StudentID, StudiesID
    - **Klucze obce**: StudentID (z tabeli Students), StudiesID (z tabeli Studies)
    - **Pola tabeli**:
        - StudentID: ID studenta
        - StudiesID: ID studiów
        - StudentGrade: Ocena studenta
        
    ```sql
    CREATE TABLE StudentStudiesGrades(
        StudentID INT,
        StudiesID INT,
        StudentGrade INT NOT NULL,
        PRIMARY KEY (StudentID, StudiesID),
        FOREIGN KEY (StudiesID) REFERENCES Studies (StudiesID),
        FOREIGN KEY (StudentID) REFERENCES Students (StudentID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **StudentBoughtStudies**: Przechowuje informacje o zakupionych studiach przez studentów.
    - **Klucze podstawowe**: StudentID, StudiesID
    - **Klucze obce**: StudentID (z tabeli Students), StudiesID (z tabeli Studies)
    - **Pola tabeli**:
        - StudentID: ID studenta
        - StudiesID: ID studiów
        
    ```sql
    CREATE TABLE StudentBoughtStudies(
        StudentID INT,
        StudiesID INT,
        PRIMARY KEY (StudentID, StudiesID),
        FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
        FOREIGN KEY (StudiesID) REFERENCES Studies (StudiesID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **StudentBoughtSessions**: Przechowuje informacje o zakupionych sesjach przez studentów.
    - **Klucze podstawowe**: StudentID, SessionID
    - **Klucze obce**: StudentID (z tabeli Students), SessionID (z tabeli StudiesSessions)
    - **Pola tabeli**:
        - StudentID: ID studenta
        - SessionID: ID sesji
        
    ```sql
    CREATE TABLE StudentBoughtSessions(
        StudentID INT,
        SessionID INT,
        PRIMARY KEY (StudentID, SessionID),
        FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
        FOREIGN KEY (SessionID) REFERENCES StudiesSessions (SessionID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **InternshipMeetingTypes**: Przechowuje typy spotkań praktyk.
    - **Klucz podstawowy**: InternshipMeetingTypeID
    - **Pola tabeli**:
        - InternshipMeetingTypeID: ID typu spotkania
        - InternshipMeetingTypeName: Nazwa typu spotkania
        
    ```sql
    CREATE TABLE InternshipMeetingTypes(
        InternshipMeetingTypeID INT PRIMARY KEY IDENTITY(1,1),
        InternshipMeetingTypeName VARCHAR(50) NOT NULL
    )
    ```
    <div style="page-break-after: always;"></div>

- **Internships**: Przechowuje informacje o praktykach.
    - **Klucz podstawowy**: InternshipID
    - **Klucze obce**: StudiesID (z tabeli Studies), InternshipMeetingType (z tabeli InternshipMeetingTypes)
    - **Pola tabeli**:
        - InternshipID: ID praktyk
        - InternshipCompany: Firma praktyk
        - InternshipStartDate: Data rozpoczęcia praktyk
        - StudiesID: ID studiów
        - InternshipMeetingType: ID typu spotkania
        
    ```sql
    CREATE TABLE Internships(
        InternshipID INT PRIMARY KEY IDENTITY(1,1),
        InternshipCompany VARCHAR(100) NOT NULL,
        InternshipStartDate DATE NOT NULL,
        StudiesID INT NOT NULL,
        InternshipMeetingType INT NOT NULL,
        FOREIGN KEY (StudiesID) REFERENCES Studies (StudiesID),
        FOREIGN KEY (InternshipMeetingType) REFERENCES InternshipMeetingTypes (InternshipMeetingTypeID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **InternshipMeetingsPassed**: Przechowuje informacje o zaliczonych praktykach przez studentów.
    - **Klucze podstawowe**: StudentID, InternshipID
    - **Klucze obce**: StudentID (z tabeli Students), InternshipID (z tabeli Internships)
    - **Pola tabeli**:
        - StudentID: ID studenta
        - InternshipID: ID praktyk
        
    ```sql
    CREATE TABLE InternshipMeetingsPassed(
        StudentID INT,
        InternshipID INT,
        PRIMARY KEY (StudentID, InternshipID),
        FOREIGN KEY (InternshipID) REFERENCES Internships (InternshipID),
        FOREIGN KEY (StudentID) REFERENCES Students (StudentID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **OrderStudies**: Przechowuje informacje o studiach w zamówieniach.
    - **Klucz podstawowy**: OrderStudiesID
    - **Klucze obce**: OrderDetailID (z tabeli OrderDetails), StudiesID (z tabeli Studies)
    - **Pola tabeli**:
        - OrderStudiesID: ID studiów w zamówieniu
        - StudiesID: ID studiów
        - OrderDetailID: ID szczegółu zamówienia
        
    ```sql
    CREATE TABLE OrderStudies(
        OrderStudiesID INT PRIMARY KEY IDENTITY(1,1),
        StudiesID INT NOT NULL,
        OrderDetailID INT NOT NULL,
        FOREIGN KEY (OrderDetailID) REFERENCES OrderDetails (OrderDetailID),
        FOREIGN KEY (StudiesID) REFERENCES Studies (StudiesID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **OrderSessions**: Przechowuje informacje o sesjach w zamówieniach.
    - **Klucz podstawowy**: OrderSessionID
    - **Klucze obce**: OrderDetailID (z tabeli OrderDetails), SessionID (z tabeli StudiesSessions)
    - **Pola tabeli**:
        - OrderSessionID: ID sesji w zamówieniu
        - SessionID: ID sesji
        - OrderDetailID: ID szczegółu zamówienia
        
    ```sql
    CREATE TABLE OrderSessions(
        OrderSessionID INT PRIMARY KEY IDENTITY(1,1),
        SessionID INT NOT NULL,
        OrderDetailID INT NOT NULL,
        FOREIGN KEY (OrderDetailID) REFERENCES OrderDetails (OrderDetailID),
        FOREIGN KEY (SessionID) REFERENCES StudiesSessions (SessionID)
    )
    ```
    <div style="page-break-after: always;"></div>

- **RODOSigns**: Przechowuje informacje o zgodach RODO użytkowników.
    - **Klucz podstawowy**: SignID
    - **Klucz obcy**: UserID (z tabeli Users)
    - **Pola tabeli**:
        - SignID: ID zgody
        - UserID: ID użytkownika
        - IsSigned: Czy zgoda została wyrażona
        - SignDate: Data wyrażenia zgody
        
    ```sql
    CREATE TABLE RODOSigns (
        SignID INT PRIMARY KEY IDENTITY(1,1),
        UserID INT NOT NULL,
        IsSigned BIT NOT NULL,
        SignDate DATE NOT NULL,
        FOREIGN KEY (UserID) REFERENCES Users (UserID)
    )
    ```
    <div style="page-break-after: always;"></div>


## Widoki

### DebtorsList

Ten widok zapewnia listę dłużników, pokazując kwotę należną dla każdego użytkownika.

```sql
CREATE VIEW DebtorsList AS
SELECT
    Users.UserID,
    Users.UserName,
    Users.UserSurname,
    Orders.OrderID,
    Orders.OrderDate,
    OrderDetails.AmountToPay,
    OrderDetails.AmountPaid,
    (OrderDetails.AmountToPay - OrderDetails.AmountPaid) AS AmountDue
FROM
    Users
INNER JOIN
    Orders ON Users.UserID = Orders.UserID
INNER JOIN
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
WHERE
    OrderDetails.AmountPaid < OrderDetails.AmountToPay;
```
<div style="page-break-after: always;"></div>

### PaymentStatus

Ten widok zapewnia status płatności zamówień, wskazując, czy są opłacone(`Paid`), czy oczekujące(`Pending`).

```sql
CREATE VIEW PaymentStatus AS
SELECT
    Orders.OrderID,
    Orders.UserID,
    Users.UserName,
    Users.UserSurname,
    OrderDetails.AmountPaid,
    OrderDetails.AmountToPay,
    CASE
        WHEN OrderDetails.AmountPaid >= OrderDetails.AmountToPay THEN 'Paid'
        ELSE 'Pending'
    END AS PaymentStatus
FROM
    Orders
INNER JOIN
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
INNER JOIN
    Users ON Orders.UserID = Users.UserID;
```
<div style="page-break-after: always;"></div>


## Funkcje


### GetPaymentStatus

Sprawdzanie statusu płatności

```sql
CREATE FUNCTION GetPaymentStatus()
RETURNS TABLE
AS
RETURN
(
    SELECT
        o.OrderID,
        o.UserID,
        u.UserName,
        u.UserSurname,
        od.AmountPaid,
        od.AmountToPay,
        CASE
            WHEN od.AmountPaid >= od.AmountToPay THEN 'Paid'
            ELSE 'Pending'
        END AS PaymentStatus
    FROM
        Orders o
    JOIN
        OrderDetails od ON o.OrderID = od.OrderID
    JOIN
        Users u ON o.UserID = u.UserID
);
```
<div style="page-break-after: always;"></div>


### GetEnrollmentReports

Wyświetlanie raportu liczby zapisanych osób

```sql
CREATE FUNCTION GetEnrollmentReports()
RETURNS TABLE
AS
RETURN
(
    SELECT
        'Webinar' AS EventType,
        w.WebinarID AS EventID,
        w.WebinarName AS EventName,
        COUNT(sbw.StudentID) AS EnrollmentCount
    FROM Webinars w
    JOIN StudentBoughtWebinars sbw ON w.WebinarID = sbw.WebinarID
    GROUP BY w.WebinarID, w.WebinarName
    UNION ALL
    SELECT
        'Course' AS EventType,
        c.CourseID AS EventID,
        c.CourseName AS EventName,
        COUNT(sbc.StudentID) AS EnrollmentCount
    FROM Courses c
    JOIN StudentBoughtCourses sbc ON c.CourseID = sbc.CourseID
    GROUP BY c.CourseID, c.CourseName
    UNION ALL
    SELECT
        'Study' AS EventType,
        s.StudiesID AS EventID,
        s.StudiesName AS EventName,
        COUNT(sbs.StudentID) AS EnrollmentCount
    FROM Studies s
    JOIN StudentBoughtStudies sbs ON s.StudiesID = sbs.StudiesID
    GROUP BY s.StudiesID, s.StudiesName
);
```
<div style="page-break-after: always;"></div>

### GetAttendanceReports

Tworzenie list obecności oraz raportów dotyczących frekwencji

```sql
CREATE FUNCTION GetAttendanceReports()
RETURNS TABLE
AS
RETURN
(
    SELECT
        'CourseModule' AS EventType,
        cm.ModuleID AS EventID,
        cm.ModuleName AS EventName,
        COUNT(cmp.StudentID) AS AttendanceCount
    FROM CourseModules cm
    JOIN CourseModulesPassed cmp ON cm.ModuleID = cmp.ModuleID
    GROUP BY cm.ModuleID, cm.ModuleName
    UNION ALL
    SELECT
        'StudyLesson' AS EventType,
        sl.LessonID AS EventID,
        sl.LessonName AS EventName,
        COUNT(slp.StudentID) AS AttendanceCount
    FROM StudiesLessons sl
    JOIN StudiesLessonsPassed slp ON sl.LessonID = slp.LessonID
    GROUP BY sl.LessonID, sl.LessonName
);
```
<div style="page-break-after: always;"></div>

### FilteredEvents

Filtrowanie po rodzaju (webinary, kursy, studia), formie (stacjonarne, online, hybrydowe), języku, dostępności miejsc, cenie

```sql
CREATE FUNCTION FilteredEvents()
RETURNS TABLE
AS
RETURN
(
    SELECT WebinarID AS EventID, WebinarName AS EventName, 'Webinar' AS EventType, WebinarLanguageID AS LanguageID, WebinarPrice AS Price, NULL AS Capacity
    FROM Webinars
    UNION
    SELECT CourseID AS EventID, CourseName AS EventName, 'Course' AS EventType, CourseLanguageID AS LanguageID, CoursePrice AS Price, NULL AS Capacity
    FROM Courses
    UNION
    SELECT StudiesID AS EventID, StudiesName AS EventName, 'Studies' AS EventType, NULL AS LanguageID, NULL AS Price, NULL AS Capacity
    FROM Studies
);
```
<div style="page-break-after: always;"></div>

## Procedury

### AddUser

Dodaje nowego użytkownika do systemu

```sql
CREATE PROCEDURE AddUser
    @UserName VARCHAR(50),
    @UserSurname VARCHAR(50),
    @UserDateOfBirth DATE,
    @UserSex CHAR(1),
    @UserEmail VARCHAR(100),
    @UserPhoneNumber VARCHAR(20),
    @UserAddress VARCHAR(100),
    @UserCity VARCHAR(50),
    @UserCountry VARCHAR(50),
    @UserPostalCode VARCHAR(10)
AS
BEGIN
    INSERT INTO Users (UserName, UserSurname, UserDateOfBirth, UserSex, UserEmail, UserPhoneNumber, UserAddress, UserCity, UserCountry, UserPostalCode)
    VALUES (@UserName, @UserSurname, @UserDateOfBirth, @UserSex, @UserEmail, @UserPhoneNumber, @UserAddress, @UserCity, @UserCountry, @UserPostalCode);
END;
```
<div style="page-break-after: always;"></div>

### UpdateUserProfile

Aktualizuje dane profilu użytkownika

```sql
CREATE PROCEDURE UpdateUserProfile
    @UserID INT,
    @UserName VARCHAR(50),
    @UserSurname VARCHAR(50),
    @UserDateOfBirth DATE,
    @UserSex CHAR(1),
    @UserEmail VARCHAR(100),
    @UserPhoneNumber VARCHAR(20),
    @UserAddress VARCHAR(100),
    @UserCity VARCHAR(50),
    @UserCountry VARCHAR(50),
    @UserPostalCode VARCHAR(10)
AS
BEGIN
    UPDATE Users
    SET UserName = @UserName,
        UserSurname = @UserSurname,
        UserDateOfBirth = @UserDateOfBirth,
        UserSex = @UserSex,
        UserEmail = @UserEmail,
        UserPhoneNumber = @UserPhoneNumber,
        UserAddress = @UserAddress,
        UserCity = @UserCity,
        UserCountry = @UserCountry,
        UserPostalCode = @UserPostalCode
    WHERE UserID = @UserID;
END;
```
<div style="page-break-after: always;"></div>

### DeleteUser

Usuwa użytkownika z systemu

```sql
CREATE PROCEDURE DeleteUser
    @UserID INT
AS
BEGIN
    DELETE FROM Users
    WHERE UserID = @UserID;
END;
```
<div style="page-break-after: always;"></div>

### UpdateEventDetails

Aktualizuje szczegóły wydarzenia

```sql
CREATE PROCEDURE UpdateEventDetails
    @EventID INT,
    @EventType VARCHAR(50),
    @EventName VARCHAR(100),
    @EventStartDate DATE,
    @EventEndDate DATE,
    @EventDescription VARCHAR(MAX),
    @EventLanguageID INT,
    @EventPrice MONEY,
    @EventTranslatorID INT,
    @EventTeacherID INT,
    @EventMeetingLink VARCHAR(100)
AS
BEGIN
    IF @EventType = 'Webinar'
    BEGIN
        UPDATE Webinars
        SET WebinarName = @EventName,
            WebinarStartDate = @EventStartDate,
            WebinarEndDate = @EventEndDate,
            WebinarDescription = @EventDescription,
            WebinarLanguageID = @EventLanguageID,
            WebinarPrice = @EventPrice,
            WebinarTranslatorID = @EventTranslatorID,
            WebinarTeacherID = @EventTeacherID,
            WebinarMeetingLink = @EventMeetingLink
        WHERE WebinarID = @EventID;
    END
    ELSE IF @EventType = 'Course'
    BEGIN
        UPDATE Courses
        SET CourseName = @EventName,
            CourseDescription = @EventDescription,
            CourseLanguageID = @EventLanguageID,
            CoursePrice = @EventPrice
        WHERE CourseID = @EventID;
    END
    ELSE IF @EventType = 'Studies'
    BEGIN
        UPDATE Studies
        SET StudiesName = @EventName,
            StudiesDescription = @EventDescription,
            StudiesStartDate = @EventStartDate,
            StudiesEndDate = @EventEndDate
        WHERE StudiesID = @EventID;
    END
END;
```
<div style="page-break-after: always;"></div>

### CreatePaymentLink

Generuje link do płatności

```sql
CREATE PROCEDURE CreatePaymentLink
    @OrderID INT,
    @PaymentLink VARCHAR(100)
AS
BEGIN
    UPDATE Orders
    SET OrderPaymentLink = @PaymentLink
    WHERE OrderID = @OrderID;
END;
```
<div style="page-break-after: always;"></div>

### ProcessPaymentResult

Przetwarza wynik płatności (udana/nieudana)

```sql
CREATE PROCEDURE ProcessPaymentResult
    @OrderDetailID INT,
    @AmountPaid MONEY,
    @PaidDate DATE
AS
BEGIN
    UPDATE OrderDetails
    SET AmountPaid = @AmountPaid,
        PaidDate = @PaidDate
    WHERE OrderDetailID = @OrderDetailID;
END;
```
<div style="page-break-after: always;"></div>

### ApplyPaymentException

Zapisuje wyjątek płatniczy (np. odroczenie)

```sql
CREATE PROCEDURE ApplyPaymentException
    @OrderDetailID INT,
    @PostponementDate DATE
AS
BEGIN
    UPDATE OrderDetails
    SET PostponementDate = @PostponementDate
    WHERE OrderDetailID = @OrderDetailID;
END;
```
<div style="page-break-after: always;"></div>

## Triggery

### HandleWebinarPayment
Ten trigger obsługuje płatności za webinary i dodaje studenta do listy zakupionych webinarów, jeśli płatność jest pełna lub odroczona.

```sql
CREATE TRIGGER HandleWebinarPayment
ON OrderDetails
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT Orders.UserID, Webinars.WebinarID
        FROM inserted
        INNER JOIN Orders
        ON Orders.OrderID = inserted.OrderID
        INNER JOIN OrderWebinars
        ON OrderWebinars.OrderDetailID = inserted.OrderDetailID
        INNER JOIN Webinars
        ON Webinars.WebinarID = OrderWebinars.WebinarID
        WHERE inserted.AmountPaid = inserted.AmountToPay OR inserted.PostponementDate > GETDATE()
        AND WebinarStartDate > GETDATE()
        AND Orders.UserID IN (
            SELECT DISTINCT StudentID FROM StudentBoughtWebinars
            )
       )
    BEGIN
        RAISERROR('Student already bought that webinar', 1, 1)
    END
    ELSE
    BEGIN
        INSERT INTO StudentBoughtWebinars(StudentID, WebinarID, WebinarBoughtDate, WebinarAccessDateEnd)
        (SELECT Orders.UserID as StudentID, Webinars.WebinarID, GETDATE() as WebinarBoughtDate,
                DATEADD(DAY, 30, GETDATE()) as WebinarAccessDateEnd
        FROM inserted
        INNER JOIN Orders
        ON Orders.OrderID = inserted.OrderID
        INNER JOIN OrderWebinars
        ON OrderWebinars.OrderDetailID = inserted.OrderDetailID
        INNER JOIN Webinars
        ON Webinars.WebinarID = OrderWebinars.WebinarID
        WHERE inserted.AmountPaid = inserted.AmountToPay OR inserted.PostponementDate > GETDATE()
        AND WebinarStartDate > GETDATE())
    END
END;
```
<div style="page-break-after: always;"></div>

### HandleCoursePayment
Ten trigger obsługuje płatności za kursy i dodaje studenta do listy zakupionych kursów, jeśli płatność jest pełna lub odroczona.

```sql
CREATE TRIGGER HandleCoursePayment
ON OrderDetails
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT Orders.UserID, Courses.CourseID
        FROM inserted
        INNER JOIN Orders
        ON Orders.OrderID = inserted.OrderID
        INNER JOIN OrderCourses
        ON OrderCourses.OrderDetailID = inserted.OrderDetailID
        INNER JOIN Courses
        ON Courses.CourseID = OrderCourses.CourseID
        WHERE inserted.AmountPaid = inserted.AmountToPay OR inserted.PostponementDate > GETDATE()
        AND DATEADD(DAY, 3, GETDATE()) < Courses.CourseStartDate
        AND Orders.UserID IN (
            SELECT DISTINCT StudentID FROM StudentBoughtCourses
            )
       )
    BEGIN
        RAISERROR('Student already bought that course', 1, 1)
    END
    ELSE
    BEGIN
        INSERT INTO StudentBoughtCourses(StudentID, CourseID)
        (SELECT Orders.UserID as StudentID, Courses.CourseID
        FROM inserted
        INNER JOIN Orders
        ON Orders.OrderID = inserted.OrderID
        INNER JOIN OrderCourses
        ON OrderCourses.OrderDetailID = inserted.OrderDetailID
        INNER JOIN Courses
        ON Courses.CourseID = OrderCourses.CourseID
        WHERE inserted.AmountPaid = inserted.AmountToPay OR inserted.PostponementDate > GETDATE()
        AND DATEADD(DAY, 3, GETDATE()) < Courses.CourseStartDate)
    END
END
```
<div style="page-break-after: always;"></div>

### HandleSessionPayment
Ten trigger obsługuje płatności za sesje studiów i dodaje studenta do listy zakupionych sesji, jeśli płatność jest pełna lub odroczona.

```sql
CREATE TRIGGER HandleSessionPayment
ON OrderDetails
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT Orders.UserID, StudiesSessions.SessionID
        FROM inserted
        INNER JOIN Orders
        ON Orders.OrderID = inserted.OrderID
        INNER JOIN OrderSessions
        ON OrderSessions.OrderDetailID = inserted.OrderDetailID
        INNER JOIN StudiesSessions
        ON StudiesSessions.SessionID = OrderSessions.SessionID
        WHERE inserted.AmountPaid = inserted.AmountToPay OR inserted.PostponementDate > GETDATE()
        AND DATEADD(DAY, 3, GETDATE()) < StudiesSessions.SessionStartDate
        AND Orders.UserID IN (
            SELECT DISTINCT StudentID FROM StudentBoughtSessions
            )
       )
    BEGIN
        RAISERROR('Student already bought that session', 1, 1)
    END
    ELSE
    BEGIN
        INSERT INTO StudentBoughtSessions(StudentID, SessionID)
        (SELECT Orders.UserID as StudentID, StudiesSessions.SessionID
        FROM inserted
        INNER JOIN Orders
        ON Orders.OrderID = inserted.OrderID
        INNER JOIN OrderSessions
        ON OrderSessions.OrderDetailID = inserted.OrderDetailID
        INNER JOIN StudiesSessions
        ON StudiesSessions.SessionID = OrderSessions.SessionID
        WHERE inserted.AmountPaid = inserted.AmountToPay OR inserted.PostponementDate > GETDATE()
        AND DATEADD(DAY, 3, GETDATE()) < StudiesSessions.SessionStartDate)
    END
END;
```
<div style="page-break-after: always;"></div>

### HandleStudiesPayment
Ten trigger obsługuje płatności za studia i dodaje studenta do listy zakupionych studiów, jeśli płatność jest pełna lub odroczona.

```sql
CREATE TRIGGER HandleStudiesPayment
ON OrderDetails
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT Orders.UserID, Studies.StudiesID
        FROM inserted
        INNER JOIN Orders
        ON Orders.OrderID = inserted.OrderID
        INNER JOIN OrderStudies
        ON OrderStudies.OrderDetailID = inserted.OrderDetailID
        INNER JOIN Studies
        ON Studies.StudiesID = OrderStudies.StudiesID
        WHERE inserted.AmountPaid = inserted.AmountToPay OR inserted.PostponementDate > GETDATE()
        AND DATEADD(DAY, 3, Studies.StudiesStartDate) < GETDATE()
        AND Orders.UserID IN (
            SELECT DISTINCT StudentID FROM StudentBoughtSessions
            )
       )
    BEGIN
        RAISERROR('Student already bought that studies', 1, 1)
    END
    ELSE
    BEGIN
        INSERT INTO StudentBoughtStudies(StudentID, StudiesID)
        (SELECT Orders.UserID as StudentID, Studies.StudiesID
        FROM inserted
        INNER JOIN Orders
        ON Orders.OrderID = inserted.OrderID
        INNER JOIN OrderStudies
        ON OrderStudies.OrderDetailID = inserted.OrderDetailID
        INNER JOIN Studies
        ON Studies.StudiesID = OrderStudies.StudiesID
        WHERE inserted.AmountPaid = inserted.AmountToPay OR inserted.PostponementDate > GETDATE()
        AND StudiesStartDate > GETDATE())
    END
END;
```
<div style="page-break-after: always;"></div>

## Indeksy

### Users
Indeksuje po kolumnach `UserEmail` i `UserCity`.

```sql
CREATE NONCLUSTERED INDEX idx_users_email ON Users(UserEmail);
CREATE NONCLUSTERED INDEX idx_users_city ON Users(UserCity);
```

### Languages

Indeksuje po kolumnie `LanguageName`.

```sql
CREATE NONCLUSTERED INDEX idx_languages_name ON Languages(LanguageName);
```

### CurrencyRates

Indeksuje po kolumnie `CurrencyName`.

```sql
CREATE NONCLUSTERED INDEX idx_currencyrates_name ON CurrencyRates(CurrencyName);
```

### EmployeeTypes

Indeksuje po kolumnie `EmployeeTypeName`.

```sql
CREATE NONCLUSTERED INDEX idx_employeetypes_name ON EmployeeTypes(EmployeeTypeName);
```

### Employees
Indeksuje po kolumnach `UserID` i `EmployeeTypeID`.

```sql
CREATE NONCLUSTERED INDEX idx_employees_userid ON Employees(UserID);
CREATE NONCLUSTERED INDEX idx_employees_employeetypeid ON Employees(EmployeeTypeID);
```

### TeachingLanguages

Indeksuje po kolumnie `EmployeeID`.

```sql
CREATE NONCLUSTERED INDEX idx_teachinglanguages_employeeid ON TeachingLanguages(EmployeeID);
```
<div style="page-break-after: always;"></div>

### Students

Indeksuje po kolumnie `UserID`.

```sql
CREATE NONCLUSTERED INDEX idx_students_userid ON Students(UserID);
```

### StudyingLanguages

Indeksuje po kolumnie `StudentID`.

```sql
CREATE NONCLUSTERED INDEX idx_studyinglanguages_studentid ON StudyingLanguages(StudentID);
```

### TranslatingLanguages

Indeksuje po kolumnie `EmployeeID`.

```sql
CREATE NONCLUSTERED INDEX idx_translatinglanguages_employeeid ON TranslatingLanguages(EmployeeID);
```

### Webinars

Indeksuje po kolumnie `WebinarLanguageID`.

```sql
CREATE NONCLUSTERED INDEX idx_webinars_languageid ON Webinars(WebinarLanguageID);
```

### StudentBoughtWebinars

Indeksuje po kolumnie `StudentID`.

```sql
CREATE NONCLUSTERED INDEX idx_studentboughtwebinars_studentid ON StudentBoughtWebinars(StudentID);
```

### Cities

Indeksuje po kolumnie `CityName`.

```sql
CREATE NONCLUSTERED INDEX idx_cities_cityname ON Cities(CityName);
```

<div style="page-break-after: always;"></div>

### UserAvailableCities

Indeksuje po kolumnie `UserID`.

```sql
CREATE NONCLUSTERED INDEX idx_useravailablecities_userid ON UserAvailableCities(UserID);
```

### Courses

Indeksuje po kolumnie `CourseLanguageID`.

```sql
CREATE NONCLUSTERED INDEX idx_courses_languageid ON Courses(CourseLanguageID);
```

### StudentBoughtCourses

Indeksuje po kolumnie `StudentID`.

```sql
CREATE NONCLUSTERED INDEX idx_studentboughtcourses_studentid ON StudentBoughtCourses(StudentID);
```

### CourseModuleMeetingTypes

Indeksuje po kolumnie `MeetingTypeName`.

```sql
CREATE NONCLUSTERED INDEX idx_coursemodulemeetingtypes_name ON CourseModuleMeetingTypes(MeetingTypeName);
```

### CourseModules

Indeksuje po kolumnie `CourseID`.

```sql
CREATE NONCLUSTERED INDEX idx_coursemodules_courseid ON CourseModules(CourseID);
```

### CourseLessonMeetingTypes

Indeksuje po kolumnie `MeetingTypeName`.

```sql
CREATE NONCLUSTERED INDEX idx_courselessonmeetingtypes_name ON CourseLessonMeetingTypes(MeetingTypeName);
```

<div style="page-break-after: always;"></div>

### CourseLessons

Indeksuje po kolumnie `ModuleID`.

```sql
CREATE NONCLUSTERED INDEX idx_courselessons_moduleid ON CourseLessons(ModuleID);
```

### CourseModulesPassed

Indeksuje po kolumnie `StudentID`.

```sql
CREATE NONCLUSTERED INDEX idx_coursemodulespassed_studentid ON CourseModulesPassed(StudentID);
```

### CourseLessonsPassed

Indeksuje po kolumnie `StudentID`.

```sql
CREATE NONCLUSTERED INDEX idx_courselessonspassed_studentid ON CourseLessonsPassed(StudentID);
```

### WebinarsPassed

Indeksuje po kolumnie `StudentID`.

```sql
CREATE NONCLUSTERED INDEX idx_webinarspassed_studentid ON WebinarsPassed(StudentID);
```

### Orders

Indeksuje po kolumnie `UserID`.

```sql
CREATE CLUSTERED INDEX idx_orders_userid ON Orders(UserID);
```

### OrderDetails

Indeksuje po kolumnie `OrderID`.

```sql
CREATE NONCLUSTERED INDEX idx_orderdetails_orderid ON OrderDetails(OrderID);
```

<div style="page-break-after: always;"></div>

### OrderWebinars

Indeksuje po kolumnie `OrderDetailID`.

```sql
CREATE NONCLUSTERED INDEX idx_orderwebinars_orderdetailid ON OrderWebinars(OrderDetailID);
```

### OrderCourses

Indeksuje po kolumnie `OrderDetailID`.

```sql
CREATE NONCLUSTERED INDEX idx_ordercourses_orderdetailid ON OrderCourses(OrderDetailID);
```

### Studies

Indeksuje po kolumnie `StudiesName`.

```sql
CREATE NONCLUSTERED INDEX idx_studies_name ON Studies(StudiesName);
```

### Syllabuses

Indeksuje po kolumnie `StudiesID`.

```sql
CREATE NONCLUSTERED INDEX idx_syllabuses_studiesid ON Syllabuses(StudiesID);
```

### Subjects

Indeksuje po kolumnie `CoordinatorID`.

```sql
CREATE NONCLUSTERED INDEX idx_subjects_coordinatorid ON Subjects(CoordinatorID);
```

### StudiesLessonMeetingTypes

Indeksuje po kolumnie `MeetingTypeName`.

```sql
CREATE NONCLUSTERED INDEX idx_studieslessonmeetingtypes_name ON StudiesLessonMeetingTypes(MeetingTypeName);
```

<div style="page-break-after: always;"></div>

### StudiesSessions

Indeksuje po kolumnie `StudiesID`.

```sql
CREATE NONCLUSTERED INDEX idx_studiessessions_studiesid ON StudiesSessions(StudiesID);
```

### StudentLessons

Indeksuje po kolumnie `StudentID`.

```sql
CREATE NONCLUSTERED INDEX idx_studentlessons_studentid ON StudentLessons(StudentID);
```

### StudiesLessonsPassed

Indeksuje po kolumnie `StudentID`.

```sql
CREATE NONCLUSTERED INDEX idx_studieslessonspassed_studentid ON StudiesLessonsPassed(StudentID);
```

### StudentStudiesGrades

Indeksuje po kolumnie `StudentID`.

```sql
CREATE NONCLUSTERED INDEX idx_studentstudiesgrades_studentid ON StudentStudiesGrades(StudentID);
```

### StudentBoughtStudies

Indeksuje po kolumnie `StudentID`.

```sql
CREATE NONCLUSTERED INDEX idx_studentboughtstudies_studentid ON StudentBoughtStudies(StudentID);
```

### StudentBoughtSessions

Indeksuje po kolumnie `StudentID`.

```sql
CREATE NONCLUSTERED INDEX idx_studentboughtsessions_studentid ON StudentBoughtSessions(StudentID);
```

<div style="page-break-after: always;"></div>

### InternshipMeetingTypes

Indeksuje po kolumnie `InternshipMeetingTypeName`.

```sql
CREATE NONCLUSTERED INDEX idx_internshipmeetingtypes_name ON InternshipMeetingTypes(InternshipMeetingTypeName);
```

### Internships

Indeksuje po kolumnie `StudiesID`.

```sql
CREATE NONCLUSTERED INDEX idx_internships_studiesid ON Internships(StudiesID);
```

### InternshipMeetingsPassed

Indeksuje po kolumnie `StudentID`.

```sql
CREATE NONCLUSTERED INDEX idx_internshipmeetingspassed_studentid ON InternshipMeetingsPassed(StudentID);
```

### OrderStudies

Indeksuje po kolumnie `OrderDetailID`.

```sql
CREATE NONCLUSTERED INDEX idx_orderstudies_orderdetailid ON OrderStudies(OrderDetailID);
```

### OrderSessions

Indeksuje po kolumnie `OrderDetailID`.

```sql
CREATE NONCLUSTERED INDEX idx_ordersessions_orderdetailid ON OrderSessions(OrderDetailID);
```

### RODOSigns

Indeksuje po kolumnie `UserID`.

```sql
CREATE NONCLUSTERED INDEX idx_rodosigns_userid ON RODOSigns(UserID);
```