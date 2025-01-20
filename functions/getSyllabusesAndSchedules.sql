CREATE FUNCTION GetSyllabusesAndSchedules()
RETURNS TABLE
AS
RETURN
(
    SELECT
        s.StudiesID,
        s.StudiesName,
        sy.SyllabusID,
        sy.SyllabusContent,
        sl.ScheduleID,
        sl.ScheduleContent
    FROM Studies s
    JOIN Syllabuses sy ON s.StudiesID = sy.StudiesID
    JOIN Schedules sl ON s.StudiesID = sl.StudiesID
);