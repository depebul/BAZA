-- SQLBook: Code
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