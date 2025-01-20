CREATE FUNCTION GetCompletionStatus()
RETURNS TABLE
AS
RETURN
(
    SELECT
        'CourseModule' AS CompletionType,
        cm.ModuleID AS CompletionID,
        cm.ModuleName AS CompletionName,
        cmp.StudentID,
        cmp.CompletionDate
    FROM CourseModules cm
    JOIN CourseModulesPassed cmp ON cm.ModuleID = cmp.ModuleID
    UNION ALL
    SELECT
        'StudyAttendance' AS CompletionType,
        sl.LessonID AS CompletionID,
        sl.LessonName AS CompletionName,
        slp.StudentID,
        slp.AttendanceDate AS CompletionDate
    FROM StudiesLessons sl
    JOIN StudiesLessonsPassed slp ON sl.LessonID = slp.LessonID
);