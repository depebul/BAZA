# Implementacja Funkcji

## Przechowywanie listy dostępnych webinarów, kursów i studiów

```sql
CREATE VIEW AvailableWebinarsCoursesStudies AS
SELECT WebinarID AS ID, WebinarName AS Name, 'Webinar' AS Type
FROM Webinars
UNION
SELECT CourseID AS ID, CourseName AS Name, 'Course' AS Type
FROM Courses
UNION
SELECT StudiesID AS ID, StudiesName AS Name, 'Studies' AS Type
FROM Studies;
```

## Przechowywanie sylabusów i harmonogramów

```sql
CREATE VIEW SyllabusesAndSchedules AS
SELECT SyllabusID, StudiesID, SemesterNumber
FROM Syllabuses
UNION
SELECT LessonID, StudiesID, LessonMeetingDateStart, LessonMeetingDateEnd
FROM StudiesLessons;
```

## Przechowywanie szczegółów wydarzenia (np. daty, miejsca, linków do spotkań online)

```sql
CREATE VIEW EventDetails AS
SELECT WebinarID AS EventID, WebinarName AS EventName, WebinarStartDate AS StartDate, WebinarEndDate AS EndDate, WebinarMeetingLink AS MeetingLink, WebinarDescription AS Description
FROM Webinars
UNION
SELECT CourseID AS EventID, CourseName AS EventName, NULL AS StartDate, NULL AS EndDate, NULL AS MeetingLink, CourseDescription AS Description
FROM Courses
UNION
SELECT StudiesID AS EventID, StudiesName AS EventName, StudiesStartDate AS StartDate, StudiesEndDate AS EndDate, NULL AS MeetingLink, StudiesDescription AS Description;
```

## Przechowywanie statusu zaliczeń (moduły kursowe, frekwencja na studiach)

```sql
CREATE VIEW CompletionStatus AS
SELECT StudentID, ModuleID AS ItemID, 'CourseModule' AS ItemType, 'Passed' AS Status
FROM CourseModulesPassed
UNION
SELECT StudentID, LessonID AS ItemID, 'CourseLesson' AS ItemType, 'Passed' AS Status
FROM CourseLessonsPassed
UNION
SELECT StudentID, WebinarID AS ItemID, 'Webinar' AS ItemType, 'Passed' AS Status
FROM WebinarsPassed
UNION
SELECT StudentID, LessonID AS ItemID, 'StudiesLesson' AS ItemType, 'Passed' AS Status
FROM StudiesLessonPassed;
```

## Sprawdzanie statusu płatności

```sql
CREATE VIEW PaymentStatus AS
SELECT OrderID, UserID, AmountPaid, AmountToPay,
CASE
    WHEN AmountPaid >= AmountToPay THEN 'Paid'
    ELSE 'Pending'
END AS Status
FROM OrderDetails;
```

## Generowanie raportów finansowych (przychody dla każdego typu wydarzeń)

```sql
CREATE VIEW FinancialReports AS
SELECT 'Webinar' AS EventType, WebinarID AS EventID, SUM(AmountPaid) AS TotalRevenue
FROM OrderWebinars
INNER JOIN OrderDetails ON OrderWebinars.OrderDetailID = OrderDetails.OrderDetailID
GROUP BY WebinarID
UNION
SELECT 'Course' AS EventType, CourseID AS EventID, SUM(AmountPaid) AS TotalRevenue
FROM OrderCourses
INNER JOIN OrderDetails ON OrderCourses.OrderDetailID = OrderDetails.OrderDetailID
GROUP BY CourseID
UNION
SELECT 'Studies' AS EventType, StudiesID AS EventID, SUM(AmountPaid) AS TotalRevenue
FROM OrderStudies
INNER JOIN OrderDetails ON OrderStudies.OrderDetailID = OrderDetails.OrderDetailID
GROUP BY StudiesID;
```

## Wyświetlanie raportu liczby zapisanych osób

```sql
CREATE VIEW EnrollmentReport AS
SELECT 'Webinar' AS EventType, WebinarID AS EventID, COUNT(StudentID) AS EnrollmentCount
FROM StudentBoughtWebinars
GROUP BY WebinarID
UNION
SELECT 'Course' AS EventType, CourseID AS EventID, COUNT(StudentID) AS EnrollmentCount
FROM CourseModulesPassed
GROUP BY CourseID
UNION
SELECT 'Studies' AS EventType, StudiesID AS EventID, COUNT(StudentID) AS EnrollmentCount
FROM StudentStudies
GROUP BY StudiesID;
```

## Tworzenie list obecności oraz raportów dotyczących frekwencji

```sql
CREATE VIEW AttendanceReports AS
SELECT 'CourseLesson' AS EventType, LessonID AS EventID, COUNT(StudentID) AS AttendanceCount
FROM CourseLessonsPassed
GROUP BY LessonID
UNION
SELECT 'StudiesLesson' AS EventType, LessonID AS EventID, COUNT(StudentID) AS AttendanceCount
FROM StudiesLessonPassed
GROUP BY LessonID;
```

## Automatyczne weryfikowanie udziału w wydarzeniach online

```sql
CREATE TRIGGER VerifyOnlineParticipation
ON StudentBoughtWebinars
AFTER INSERT
AS
BEGIN
    UPDATE StudentBoughtWebinars
    SET WebinarAccessDateEnd = DATEADD(DAY, 30, WebinarBoughtDate)
    WHERE WebinarAccessDateEnd IS NULL;
END;
```

## Filtrowanie po rodzaju (webinary, kursy, studia), formie (stacjonarne, online, hybrydowe), języku, dostępności miejsc, cenie

```sql
CREATE VIEW FilteredEvents AS
SELECT WebinarID AS EventID, WebinarName AS EventName, 'Webinar' AS EventType, WebinarLanguageID AS LanguageID, WebinarPrice AS Price, NULL AS Capacity
FROM Webinars
UNION
SELECT CourseID AS EventID, CourseName AS EventName, 'Course' AS EventType, CourseLanguageID AS LanguageID, CoursePrice AS Price, NULL AS Capacity
FROM Courses
UNION
SELECT StudiesID AS EventID, StudiesName AS EventName, 'Studies' AS EventType, NULL AS LanguageID, NULL AS Price, NULL AS Capacity
FROM Studies;
```
