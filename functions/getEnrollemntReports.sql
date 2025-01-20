CREATE FUNCTION GetEnrollmentReports()
RETURNS TABLE
AS
RETURN
(
    SELECT
        'Webinar' AS EventType,
        w.WebinarID AS EventID,
        w.WebinarName AS EventName,
        COUNT(sbw.StudentID) AS EnrollmentCount
    FROM Webinars w
    JOIN StudentBoughtWebinars sbw ON w.WebinarID = sbw.WebinarID
    GROUP BY w.WebinarID, w.WebinarName
    UNION ALL
    SELECT
        'Course' AS EventType,
        c.CourseID AS EventID,
        c.CourseName AS EventName,
        COUNT(sbc.StudentID) AS EnrollmentCount
    FROM Courses c
    JOIN StudentBoughtCourses sbc ON c.CourseID = sbc.CourseID
    GROUP BY c.CourseID, c.CourseName
    UNION ALL
    SELECT
        'Study' AS EventType,
        s.StudiesID AS EventID,
        s.StudiesName AS EventName,
        COUNT(sbs.StudentID) AS EnrollmentCount
    FROM Studies s
    JOIN StudentBoughtStudies sbs ON s.StudiesID = sbs.StudiesID
    GROUP BY s.StudiesID, s.StudiesName
);