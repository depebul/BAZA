CREATE FUNCTION GetEventDetails()
RETURNS TABLE
AS
RETURN
(
    SELECT
        'Webinar' AS EventType,
        WebinarID AS EventID,
        WebinarName AS EventName,
        WebinarDate AS EventDate,
        WebinarLocation AS EventLocation,
        WebinarLink AS EventLink
    FROM Webinars
    UNION ALL
    SELECT
        'Course' AS EventType,
        CourseID AS EventID,
        CourseName AS EventName,
        CourseStartDate AS EventDate,
        CourseLocation AS EventLocation,
        CourseLink AS EventLink
    FROM Courses
    UNION ALL
    SELECT
        'Study' AS EventType,
        StudiesID AS EventID,
        StudiesName AS EventName,
        StudiesStartDate AS EventDate,
        StudiesLocation AS EventLocation,
        StudiesLink AS EventLink
    FROM Studies
);