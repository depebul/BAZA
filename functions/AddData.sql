CREATE PROCEDURE AddWebinar
    @WebinarName VARCHAR(100),
    @WebinarStartDate SMALLDATETIME,
    @WebinarEndDate SMALLDATETIME,
    @WebinarDescription VARCHAR(MAX),
    @WebinarLanguageID INT,
    @WebinarPrice MONEY,
    @WebinarTranslatorID INT,
    @WebinarTeacherID INT,
    @WebinarMeetingLink VARCHAR(100),
    @WebinarAccessDateEnd SMALLDATETIME,
    @WebinarRecordingLink VARCHAR(100)
AS
BEGIN
    INSERT INTO Webinars (WebinarName, WebinarStartDate, WebinarEndDate, WebinarDescription, WebinarLanguageID, WebinarPrice, WebinarTranslatorID, WebinarTeacherID, WebinarMeetingLink, WebinarAccessDateEnd, WebinarRecordingLink)
    VALUES (@WebinarName, @WebinarStartDate, @WebinarEndDate, @WebinarDescription, @WebinarLanguageID, @WebinarPrice, @WebinarTranslatorID, @WebinarTeacherID, @WebinarMeetingLink, @WebinarAccessDateEnd, @WebinarRecordingLink);
END;
GO

CREATE PROCEDURE AddStudies
    @StudiesDescription VARCHAR(MAX),
    @StudiesName VARCHAR(100),
    @StudiesEntryFee MONEY,
    @StudiesStartDate DATE,
    @StudiesEndDate DATE,
    @StudiesCapacity INT
AS
BEGIN
    INSERT INTO Studies (StudiesDescription, StudiesName, StudiesEntryFee, StudiesStartDate, StudiesEndDate, StudiesCapacity)
    VALUES (@StudiesDescription, @StudiesName, @StudiesEntryFee, @StudiesStartDate, @StudiesEndDate, @StudiesCapacity);
END;
GO

CREATE PROCEDURE AddCourse
    @CourseName VARCHAR(100),
    @CourseModuleQuantity INT,
    @CourseDescription VARCHAR(MAX),
    @CourseLanguageID INT,
    @CoursePrice MONEY,
    @CourseStartDate SMALLDATETIME,
    @CourseEndDate SMALLDATETIME,
    @CourseCapacity INT,
    @CourseRecordingLink VARCHAR(100)
AS
BEGIN
    INSERT INTO Courses (CourseName, CourseModuleQuantity, CourseDescription, CourseLanguageID, CoursePrice, CourseStartDate, CourseEndDate, CourseCapacity, CourseRecordingLink)
    VALUES (@CourseName, @CourseModuleQuantity, @CourseDescription, @CourseLanguageID, @CoursePrice, @CourseStartDate, @CourseEndDate, @CourseCapacity, @CourseRecordingLink);
END;
GO

CREATE PROCEDURE AddStudent
@UserID INT
AS
BEGIN
    INSERT INTO Students (UserID)
    VALUES (@UserID);
END;
GO

CREATE PROCEDURE AddEmployee
    @UserID INT,
    @EmployeeTypeID INT,
    @HireDate DATE,
    @Salary MONEY
AS
BEGIN
    INSERT INTO Employees (UserID, EmployeeTypeID, HireDate, Salary)
    VALUES (@UserID, @EmployeeTypeID, @HireDate, @Salary);
END;
GO

CREATE PROCEDURE AddStudiesSession
    @StudiesID INT,
    @SubjectID INT,
    @SessionStartDate DATE,
    @SessionEndDate DATE,
    @SessionCapacity INT,
    @SessionGuestCapacity INT,
    @SessionPrice MONEY
AS
BEGIN
    INSERT INTO StudiesSessions (StudiesID, SubjectID, SessionStartDate, SessionEndDate, SessionCapacity, SessionGuestCapacity, SessionPrice)
    VALUES (@StudiesID, @SubjectID, @SessionStartDate, @SessionEndDate, @SessionCapacity, @SessionGuestCapacity, @SessionPrice);
END;
GO

CREATE PROCEDURE AddStudiesLesson
    @SessionID INT,
    @SubjectID INT,
    @LessonName VARCHAR(100),
    @LessonDescription VARCHAR(MAX),
    @LessonLanguageID INT,
    @LessonMeetingLink VARCHAR(100),
    @LessonMeetingPlace VARCHAR(100),
    @LessonMeetingDateStart SMALLDATETIME,
    @LessonMeetingDateEnd SMALLDATETIME,
    @LessonCapacity INT,
    @LessonGuestCapacity INT,
    @LessonPrice MONEY,
    @LessonGuestPrice MONEY,
    @IsTranslatedToPolish BIT,
    @TranslatorID INT,
    @TeacherID INT,
    @StudiesLessonMeetingTypeID INT
AS
BEGIN
    INSERT INTO StudiesLessons (SessionID, SubjectID, LessonName, LessonDescription, LessonLanguageID, LessonMeetingLink, LessonMeetingPlace, LessonMeetingDateStart, LessonMeetingDateEnd, LessonCapacity, LessonGuestCapacity, LessonPrice, LessonGuestPrice, IsTranslatedToPolish, TranslatorID, TeacherID, StudiesLessonMeetingTypeID)
    VALUES (@SessionID, @SubjectID, @LessonName, @LessonDescription, @LessonLanguageID, @LessonMeetingLink, @LessonMeetingPlace, @LessonMeetingDateStart, @LessonMeetingDateEnd, @LessonCapacity, @LessonGuestCapacity, @LessonPrice, @LessonGuestPrice, @IsTranslatedToPolish, @TranslatorID, @TeacherID, @StudiesLessonMeetingTypeID);
END;
GO