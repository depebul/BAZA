CREATE FUNCTION GetAttendanceReports()
RETURNS TABLE
AS
RETURN
(
    SELECT
        'CourseModule' AS EventType,
        cm.ModuleID AS EventID,
        cm.ModuleName AS EventName,
        COUNT(cmp.StudentID) AS AttendanceCount
    FROM CourseModules cm
    JOIN CourseModulesPassed cmp ON cm.ModuleID = cmp.ModuleID
    GROUP BY cm.ModuleID, cm.ModuleName
    UNION ALL
    SELECT
        'StudyLesson' AS EventType,
        sl.LessonID AS EventID,
        sl.LessonName AS EventName,
        COUNT(slp.StudentID) AS AttendanceCount
    FROM StudiesLessons sl
    JOIN StudiesLessonsPassed slp ON sl.LessonID = slp.LessonID
    GROUP BY sl.LessonID, sl.LessonName
);