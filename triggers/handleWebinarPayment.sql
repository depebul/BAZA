-- SQLBook: Code
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
