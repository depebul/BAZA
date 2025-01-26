CREATE VIEW FinancialReports AS
SELECT
    'Webinar' AS EventType,
    WebinarID AS EventID,
    SUM(AmountPaid) AS TotalRevenue
FROM OrderWebinars
         INNER JOIN OrderDetails ON OrderWebinars.OrderDetailID = OrderDetails.OrderDetailID
GROUP BY WebinarID
UNION
SELECT
    'Course' AS EventType,
    CourseID AS EventID,
    SUM(AmountPaid) AS TotalRevenue
FROM OrderCourses
         INNER JOIN OrderDetails ON OrderCourses.OrderDetailID = OrderDetails.OrderDetailID
GROUP BY CourseID
UNION
SELECT
    'Studies' AS EventType,
    StudiesID AS EventID,
    SUM(AmountPaid) AS TotalRevenue
FROM OrderStudies
         INNER JOIN OrderDetails ON OrderStudies.OrderDetailID = OrderDetails.OrderDetailID
GROUP BY StudiesID;