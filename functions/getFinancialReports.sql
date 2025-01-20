CREATE FUNCTION GetFinancialReports()
RETURNS TABLE
AS
RETURN
(
    SELECT
        'Webinar' AS EventType,
        w.WebinarID AS EventID,
        w.WebinarName AS EventName,
        SUM(od.AmountPaid) AS TotalRevenue
    FROM Webinars w
    JOIN OrderDetails od ON w.WebinarID = od.EventID
    GROUP BY w.WebinarID, w.WebinarName
    UNION ALL
    SELECT
        'Course' AS EventType,
        c.CourseID AS EventID,
        c.CourseName AS EventName,
        SUM(od.AmountPaid) AS TotalRevenue
    FROM Courses c
    JOIN OrderDetails od ON c.CourseID = od.EventID
    GROUP BY c.CourseID, c.CourseName
    UNION ALL
    SELECT
        'Study' AS EventType,
        s.StudiesID AS EventID,
        s.StudiesName AS EventName,
        SUM(od.AmountPaid) AS TotalRevenue
    FROM Studies s
    JOIN OrderDetails od ON s.StudiesID = od.EventID
    GROUP BY s.StudiesID, s.StudiesName
);