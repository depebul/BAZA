CREATE VIEW NearestWebinars AS
SELECT TOP 30
    WebinarID,
    WebinarName,
    WebinarStartDate,
    WebinarEndDate,
    WebinarDescription,
    WebinarTeacherID,
    WebinarMeetingLink
FROM
    Webinars
WHERE
    WebinarStartDate > CURRENT_TIMESTAMP
ORDER BY
    WebinarStartDate DESC;