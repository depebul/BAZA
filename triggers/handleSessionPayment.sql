-- SQLBook: Code
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