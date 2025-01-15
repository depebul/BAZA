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
    Events.EventID,
    Events.EventName,
    Users.UserID,
    Users.UserName,
    Users.UserSurname
FROM 
    Events
INNER JOIN 
    EventRegistrations ON Events.EventID = EventRegistrations.EventID
INNER JOIN 
    Users ON EventRegistrations.UserID = Users.UserID
WHERE 
    Events.LecturerID = CURRENT_USER;

-- View for viewing event details for a lecturer
CREATE VIEW EventDetails AS
SELECT 
    Events.EventID,
    Events.EventName,
    Events.EventDate,
    Events.EventDescription,
    Events.LecturerID
FROM 
    Events
WHERE 
    Events.LecturerID = CURRENT_USER;

-- View for viewing attendance reports for a lecturer's events
CREATE VIEW AttendanceReports AS
SELECT 
    Events.EventID,
    Events.EventName,
    Users.UserID,
    Users.UserName,
    Users.UserSurname,
    Attendance.AttendanceDate
FROM 
    Events
INNER JOIN 
    Attendance ON Events.EventID = Attendance.EventID
INNER JOIN 
    Users ON Attendance.UserID = Users.UserID
WHERE 
    Events.LecturerID = CURRENT_USER;

-- View for viewing the list of events a translator is assigned to
CREATE VIEW TranslatedEvents AS
SELECT 
    Events.EventID,
    Events.EventName,
    Events.EventDate,
    Events.EventDescription,
    Events.TranslatorID
FROM 
    Events
WHERE 
    Events.TranslatorID = CURRENT_USER;

-- View for viewing event details for a translator
CREATE VIEW TranslatorEventDetails AS
SELECT 
    Events.EventID,
    Events.EventName,
    Events.EventDate,
    Events.EventDescription,
    Events.TranslatorID
FROM 
    Events
WHERE 
    Events.TranslatorID = CURRENT_USER;

-- View for viewing available events for students
CREATE VIEW AvailableEvents AS
SELECT 
    Events.EventID,
    Events.EventName,
    Events.EventDate,
    Events.EventDescription
FROM 
    Events
WHERE 
    Events.EventDate > CURRENT_DATE;

-- View for viewing registered event details for students
CREATE VIEW RegisteredEventDetails AS
SELECT 
    Events.EventID,
    Events.EventName,
    Events.EventDate,
    Events.EventDescription,
    EventRegistrations.UserID
FROM 
    Events
INNER JOIN 
    EventRegistrations ON Events.EventID = EventRegistrations.EventID
WHERE 
    EventRegistrations.UserID = CURRENT_USER;

-- View for viewing completion status for students
CREATE VIEW CompletionStatus AS
SELECT 
    Courses.CourseID,
    Courses.CourseName,
    Users.UserID,
    Users.UserName,
    Users.UserSurname,
    CourseCompletions.CompletionDate
FROM 
    Courses
INNER JOIN 
    CourseCompletions ON Courses.CourseID = CourseCompletions.CourseID
INNER JOIN 
    Users ON CourseCompletions.UserID = Users.UserID
WHERE 
    CourseCompletions.UserID = CURRENT_USER;

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