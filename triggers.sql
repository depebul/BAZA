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
        INNER JOIN Courses
        ON Courses.CourseID = OrderSessions.SessionID
        WHERE inserted.AmountPaid = inserted.AmountToPay OR inserted.PostponementDate > GETDATE()
        AND DATEADD(DAY, 3, GETDATE()) < StudiesSessions.SessionStartDay
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
        (SELECT Orders.UserID as StudentID, Courses.CourseID
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
        INSERT INTO StudentBoughtSessions(StudentID, StudiesID)
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
