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