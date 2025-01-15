-- View for viewing the list of debtors
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

-- View for viewing the payment status
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

-- View for viewing the list of registered participants for a lecturer's events
CREATE VIEW RegisteredParticipants AS
SELECT 
    Webinars.WebinarID AS EventID,
    Webinars.WebinarName AS EventName,
    Users.UserID,
    Users.UserName,
    Users.UserSurname
FROM 
    Webinars
INNER JOIN 
    StudentBoughtWebinars ON Webinars.WebinarID = StudentBoughtWebinars.WebinarID
INNER JOIN 
    Users ON StudentBoughtWebinars.StudentID = Users.UserID
WHERE 
    Webinars.WebinarTeacherID = CURRENT_USER
UNION
SELECT 
    Courses.CourseID AS EventID,
    Courses.CourseName AS EventName,
    Users.UserID,
    Users.UserName,
    Users.UserSurname
FROM 
    Courses
INNER JOIN 
    CourseModulesPassed ON Courses.CourseID = CourseModulesPassed.ModuleID
INNER JOIN 
    Users ON CourseModulesPassed.StudentID = Users.UserID
WHERE 
    Courses.CourseID IN (SELECT CourseID FROM CourseModules WHERE ModuleID = CourseModulesPassed.ModuleID)
UNION
SELECT 
    StudiesLessons.LessonID AS EventID,
    StudiesLessons.LessonName AS EventName,
    Users.UserID,
    Users.UserName,
    Users.UserSurname
FROM 
    StudiesLessons
INNER JOIN 
    StudiesLessonPassed ON StudiesLessons.LessonID = StudiesLessonPassed.LessonID
INNER JOIN 
    Users ON StudiesLessonPassed.StudentID = Users.UserID
WHERE 
    StudiesLessons.TeacherID = CURRENT_USER;

-- View for viewing event details for a lecturer
CREATE VIEW EventDetails AS
SELECT 
    Webinars.WebinarID AS EventID,
    Webinars.WebinarName AS EventName,
    Webinars.WebinarStartDate AS EventDate,
    Webinars.WebinarDescription AS EventDescription,
    Webinars.WebinarTeacherID AS LecturerID
FROM 
    Webinars
WHERE 
    Webinars.WebinarTeacherID = CURRENT_USER
UNION
SELECT 
    Courses.CourseID AS EventID,
    Courses.CourseName AS EventName,
    NULL AS EventDate,
    Courses.CourseDescription AS EventDescription,
    NULL AS LecturerID
FROM 
    Courses
UNION
SELECT 
    StudiesLessons.LessonID AS EventID,
    StudiesLessons.LessonName AS EventName,
    StudiesLessons.LessonMeetingDateStart AS EventDate,
    StudiesLessons.LessonDescription AS EventDescription,
    StudiesLessons.TeacherID AS LecturerID
FROM 
    StudiesLessons
WHERE 
    StudiesLessons.TeacherID = CURRENT_USER;

-- View for viewing attendance reports for a lecturer's events
CREATE VIEW AttendanceReports AS
SELECT 
    Webinars.WebinarID AS EventID,
    Webinars.WebinarName AS EventName,
    Users.UserID,
    Users.UserName,
    Users.UserSurname,
    WebinarsPassed.PassedDate AS AttendanceDate
FROM 
    Webinars
INNER JOIN 
    WebinarsPassed ON Webinars.WebinarID = WebinarsPassed.WebinarID
INNER JOIN 
    Users ON WebinarsPassed.StudentID = Users.UserID
WHERE 
    Webinars.WebinarTeacherID = CURRENT_USER
UNION
SELECT 
    Courses.CourseID AS EventID,
    Courses.CourseName AS EventName,
    Users.UserID,
    Users.UserName,
    Users.UserSurname,
    CourseLessonsPassed.PassedDate AS AttendanceDate
FROM 
    Courses
INNER JOIN 
    CourseLessonsPassed ON Courses.CourseID = CourseLessonsPassed.LessonID
INNER JOIN 
    Users ON CourseLessonsPassed.StudentID = Users.UserID
WHERE 
    Courses.CourseID IN (SELECT CourseID FROM CourseModules WHERE ModuleID = CourseLessonsPassed.LessonID)
UNION
SELECT 
    StudiesLessons.LessonID AS EventID,
    StudiesLessons.LessonName AS EventName,
    Users.UserID,
    Users.UserName,
    Users.UserSurname,
    StudiesLessonPassed.PassedDate AS AttendanceDate
FROM 
    StudiesLessons
INNER JOIN 
    StudiesLessonPassed ON StudiesLessons.LessonID = StudiesLessonPassed.LessonID
INNER JOIN 
    Users ON StudiesLessonPassed.StudentID = Users.UserID
WHERE 
    StudiesLessons.TeacherID = CURRENT_USER;

-- View for viewing the list of events a translator is assigned to
CREATE VIEW TranslatedEvents AS
SELECT 
    Webinars.WebinarID AS EventID,
    Webinars.WebinarName AS EventName,
    Webinars.WebinarStartDate AS EventDate,
    Webinars.WebinarDescription AS EventDescription,
    Webinars.WebinarTranslatorID AS TranslatorID
FROM 
    Webinars
WHERE 
    Webinars.WebinarTranslatorID = CURRENT_USER
UNION
SELECT 
    Courses.CourseID AS EventID,
    Courses.CourseName AS EventName,
    NULL AS EventDate,
    Courses.CourseDescription AS EventDescription,
    NULL AS TranslatorID
FROM 
    Courses
UNION
SELECT 
    StudiesLessons.LessonID AS EventID,
    StudiesLessons.LessonName AS EventName,
    StudiesLessons.LessonMeetingDateStart AS EventDate,
    StudiesLessons.LessonDescription AS EventDescription,
    StudiesLessons.TranslatorID AS TranslatorID
FROM 
    StudiesLessons
WHERE 
    StudiesLessons.TranslatorID = CURRENT_USER;

-- View for viewing event details for a translator
CREATE VIEW TranslatorEventDetails AS
SELECT 
    Webinars.WebinarID AS EventID,
    Webinars.WebinarName AS EventName,
    Webinars.WebinarStartDate AS EventDate,
    Webinars.WebinarDescription AS EventDescription,
    Webinars.WebinarTranslatorID AS TranslatorID
FROM 
    Webinars
WHERE 
    Webinars.WebinarTranslatorID = CURRENT_USER
UNION
SELECT 
    Courses.CourseID AS EventID,
    Courses.CourseName AS EventName,
    NULL AS EventDate,
    Courses.CourseDescription AS EventDescription,
    NULL AS TranslatorID
FROM 
    Courses
UNION
SELECT 
    StudiesLessons.LessonID AS EventID,
    StudiesLessons.LessonName AS EventName,
    StudiesLessons.LessonMeetingDateStart AS EventDate,
    StudiesLessons.LessonDescription AS EventDescription,
    StudiesLessons.TranslatorID AS TranslatorID
FROM 
    StudiesLessons
WHERE 
    StudiesLessons.TranslatorID = CURRENT_USER;

-- View for viewing available events for students
CREATE VIEW AvailableEvents AS
SELECT 
    Webinars.WebinarID AS EventID,
    Webinars.WebinarName AS EventName,
    Webinars.WebinarStartDate AS EventDate,
    Webinars.WebinarDescription AS EventDescription
FROM 
    Webinars
WHERE 
    Webinars.WebinarStartDate > CURRENT_DATE
UNION
SELECT 
    Courses.CourseID AS EventID,
    Courses.CourseName AS EventName,
    NULL AS EventDate,
    Courses.CourseDescription AS EventDescription
FROM 
    Courses
UNION
SELECT 
    StudiesLessons.LessonID AS EventID,
    StudiesLessons.LessonName AS EventName,
    StudiesLessons.LessonMeetingDateStart AS EventDate,
    StudiesLessons.LessonDescription AS EventDescription
FROM 
    StudiesLessons
WHERE 
    StudiesLessons.LessonMeetingDateStart > CURRENT_DATE;

-- View for viewing registered event details for students
CREATE VIEW RegisteredEventDetails AS
SELECT 
    Webinars.WebinarID AS EventID,
    Webinars.WebinarName AS EventName,
    Webinars.WebinarStartDate AS EventDate,
    Webinars.WebinarDescription AS EventDescription,
    StudentBoughtWebinars.StudentID
FROM 
    Webinars
INNER JOIN 
    StudentBoughtWebinars ON Webinars.WebinarID = StudentBoughtWebinars.WebinarID
WHERE 
    StudentBoughtWebinars.StudentID = CURRENT_USER
UNION
SELECT 
    Courses.CourseID AS EventID,
    Courses.CourseName AS EventName,
    NULL AS EventDate,
    Courses.CourseDescription AS EventDescription,
    CourseModulesPassed.StudentID
FROM 
    Courses
INNER JOIN 
    CourseModulesPassed ON Courses.CourseID = CourseModulesPassed.ModuleID
WHERE 
    CourseModulesPassed.StudentID = CURRENT_USER
UNION
SELECT 
    StudiesLessons.LessonID AS EventID,
    StudiesLessons.LessonName AS EventName,
    StudiesLessons.LessonMeetingDateStart AS EventDate,
    StudiesLessons.LessonDescription AS EventDescription,
    StudiesLessonPassed.StudentID
FROM 
    StudiesLessons
INNER JOIN 
    StudiesLessonPassed ON StudiesLessons.LessonID = StudiesLessonPassed.LessonID
WHERE 
    StudiesLessonPassed.StudentID = CURRENT_USER;

-- View for viewing completion status for students
CREATE VIEW CompletionStatus AS
SELECT 
    CourseModulesPassed.StudentID,
    CourseModulesPassed.ModuleID AS ItemID,
    'CourseModule' AS ItemType,
    'Passed' AS Status
FROM 
    CourseModulesPassed
UNION
SELECT 
    CourseLessonsPassed.StudentID,
    CourseLessonsPassed.LessonID AS ItemID,
    'CourseLesson' AS ItemType,
    'Passed' AS Status
FROM 
    CourseLessonsPassed
UNION
SELECT 
    WebinarsPassed.StudentID,
    WebinarsPassed.WebinarID AS ItemID,
    'Webinar' AS ItemType,
    'Passed' AS Status
FROM 
    WebinarsPassed
UNION
SELECT 
    StudiesLessonPassed.StudentID,
    StudiesLessonPassed.LessonID AS ItemID,
    'StudiesLesson' AS ItemType,
    'Passed' AS Status
FROM 
    StudiesLessonPassed;

-- View for viewing payment status for students
CREATE VIEW StudentPaymentStatus AS
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
    Users ON Orders.UserID = Users.UserID
WHERE 
    Orders.UserID = CURRENT_USER;