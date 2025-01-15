# Implementacja Procedur

## AddUser - Dodaje nowego użytkownika do systemu

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

## UpdateUserProfile - Aktualizuje dane profilu użytkownika

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

## DeleteUser - Usuwa użytkownika z systemu

```sql
CREATE PROCEDURE DeleteUser
    @UserID INT
AS
BEGIN
    DELETE FROM Users
    WHERE UserID = @UserID;
END;
```

## AddRole - Dodawanie użytkownikowi nowej roli

```sql
CREATE PROCEDURE AddRole
    @UserID INT,
    @RoleID INT
AS
BEGIN
    INSERT INTO UserRoles (UserID, RoleID)
    VALUES (@UserID, @RoleID);
END;
```

## RemoveRole - Usuwanie użytkownikowi roli

```sql
CREATE PROCEDURE RemoveRole
    @UserID INT,
    @RoleID INT
AS
BEGIN
    DELETE FROM UserRoles
    WHERE UserID = @UserID AND RoleID = @RoleID;
END;
```

## AddEvent - Dodaje nowe wydarzenie (webinar, kurs, studium)

```sql
CREATE PROCEDURE AddEvent
    @EventName VARCHAR(100),
    @EventType VARCHAR(50),
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
        INSERT INTO Webinars (WebinarName, WebinarStartDate, WebinarEndDate, WebinarDescription, WebinarLanguageID, WebinarPrice, WebinarTranslatorID, WebinarTeacherID, WebinarMeetingLink)
        VALUES (@EventName, @EventStartDate, @EventEndDate, @EventDescription, @EventLanguageID, @EventPrice, @EventTranslatorID, @EventTeacherID, @EventMeetingLink);
    END
    ELSE IF @EventType = 'Course'
    BEGIN
        INSERT INTO Courses (CourseName, CourseDescription, CourseLanguageID, CoursePrice)
        VALUES (@EventName, @EventDescription, @EventLanguageID, @EventPrice);
    END
    ELSE IF @EventType = 'Studies'
    BEGIN
        INSERT INTO Studies (StudiesName, StudiesDescription, StudiesStartDate, StudiesEndDate)
        VALUES (@EventName, @EventDescription, @EventStartDate, @EventEndDate);
    END
END;
```

## UpdateEventDetails - Aktualizuje szczegóły wydarzenia

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

## DeleteEvent - Usuwa wydarzenie z systemu

```sql
CREATE PROCEDURE DeleteEvent
    @EventID INT,
    @EventType VARCHAR(50)
AS
BEGIN
    IF @EventType = 'Webinar'
    BEGIN
        DELETE FROM Webinars
        WHERE WebinarID = @EventID;
    END
    ELSE IF @EventType = 'Course'
    BEGIN
        DELETE FROM Courses
        WHERE CourseID = @EventID;
    END
    ELSE IF @EventType = 'Studies'
    BEGIN
        DELETE FROM Studies
        WHERE StudiesID = @EventID;
    END
END;
```

## CreatePaymentLink - Generuje link do płatności

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

## ProcessPaymentResult - Przetwarza wynik płatności (udana/nieudana)

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

## ApplyPaymentException - Zapisuje wyjątek płatniczy (np. odroczenie)

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

## RegisterForEvent - Rejestruje użytkownika na wydarzenie

```sql
CREATE PROCEDURE RegisterForEvent
    @UserID INT,
    @EventID INT,
    @EventType VARCHAR(50)
AS
BEGIN
    IF @EventType = 'Webinar'
    BEGIN
        INSERT INTO StudentBoughtWebinars (StudentID, WebinarID, WebinarBoughtDate, WebinarAccessDateEnd)
        VALUES (@UserID, @EventID, GETDATE(), DATEADD(DAY, 30, GETDATE()));
    END
    ELSE IF @EventType = 'Course'
    BEGIN
        INSERT INTO CourseModulesPassed (StudentID, ModuleID)
        VALUES (@UserID, @EventID);
    END
    ELSE IF @EventType = 'Studies'
    BEGIN
        INSERT INTO StudentStudies (StudentID, StudiesID)
        VALUES (@UserID, @EventID);
    END
END;
```

## CancelRegistration - Anuluje rejestrację na wydarzenie

```sql
CREATE PROCEDURE CancelRegistration
    @UserID INT,
    @EventID INT,
    @EventType VARCHAR(50)
AS
BEGIN
    IF @EventType = 'Webinar'
    BEGIN
        DELETE FROM StudentBoughtWebinars
        WHERE StudentID = @UserID AND WebinarID = @EventID;
    END
    ELSE IF @EventType = 'Course'
    BEGIN
        DELETE FROM CourseModulesPassed
        WHERE StudentID = @UserID AND ModuleID = @EventID;
    END
    ELSE IF @EventType = 'Studies'
    BEGIN
        DELETE FROM StudentStudies
        WHERE StudentID = @UserID AND StudiesID = @EventID;
    END
END;
```
