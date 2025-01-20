CREATE FUNCTION GetAvailableEvents()
RETURNS TABLE
AS
RETURN
(
    SELECT
        'Webinar' AS EventType,
        WebinarID AS EventID,
        WebinarName AS EventName,
        WebinarDate AS EventDate,
        WebinarLanguageID AS LanguageID
    FROM Webinars
    UNION ALL
    SELECT
        'Course' AS EventType,
        CourseID AS EventID,
        CourseName AS EventName,
        CourseStartDate AS EventDate,
        CourseLanguageID AS LanguageID
    FROM Courses
    UNION ALL
    SELECT
        'Study' AS EventType,
        StudiesID AS EventID,
        StudiesName AS EventName,
        StudiesStartDate AS EventDate,
        StudiesLanguageID AS LanguageID
    FROM Studies
);