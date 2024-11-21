CREATE TABLE [User]
(
    UserID          INT PRIMARY KEY,
    UserName        VARCHAR(50)  NOT NULL,
    UserSurname     VARCHAR(50)  NOT NULL,
    UserDateOfBirth DATE         NOT NULL,
    UserSex         CHAR(1)      NOT NULL,
    UserEmail       VARCHAR(100) NOT NULL,
    UserPhoneNumber VARCHAR(20),
    UserAddress     VARCHAR(100),
    UserCity        VARCHAR(50),
    UserCountry     VARCHAR(50),
    UserPostalCode  VARCHAR(10)
);

CREATE TABLE Language
(
    LanguageID   INT PRIMARY KEY,
    LanguageName VARCHAR(50) NOT NULL
);

-- CREATE TABLE UserLanguage
-- (
--     UserID     INT,
--     LanguageID INT,
--     PRIMARY KEY (UserID, LanguageID),
--     FOREIGN KEY (UserID) REFERENCES [User] (UserID),
--     FOREIGN KEY (LanguageID) REFERENCES Language (LanguageID)
-- );


CREATE TABLE EmployeeType
(
    EmployeeTypeID   INT PRIMARY KEY,
    EmployeeTypeName VARCHAR(50) NOT NULL
);

CREATE TABLE Employee
(
    UserID         INT,
    EmployeeID     INT PRIMARY KEY,
    EmployeeTypeID INT,
    HireDate       DATE NOT NULL,
    Salary         MONEY NOT NULL,
    FOREIGN KEY (UserID) REFERENCES [User] (UserID),
    FOREIGN KEY (EmployeeTypeID) REFERENCES EmployeeType (EmployeeTypeID)
);

CREATE TABLE TeachingLanguage(
    EmployeeID INT,
    LanguageID INT,
    PRIMARY KEY (EmployeeID, LanguageID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID),
    FOREIGN KEY (LanguageID) REFERENCES Language (LanguageID)
)

CREATE TABLE Student
(
    UserID     INT,
    StudentID  INT PRIMARY KEY,
    FOREIGN KEY (UserID) REFERENCES [User] (UserID)
)

CREATE TABLE StudyingLanguage(
    StudentID INT,
    LanguageID INT,
    PRIMARY KEY (StudentID, LanguageID),
    FOREIGN KEY (StudentID) REFERENCES Student (StudentID),
    FOREIGN KEY (LanguageID) REFERENCES Language (LanguageID)
)

CREATE TABLE TranslatingLanguage(
    EmployeeID INT,
    LanguageID INT,
    PRIMARY KEY (EmployeeID, LanguageID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID),
    FOREIGN KEY (LanguageID) REFERENCES Language (LanguageID)
)

CREATE TABLE Webinar(
    WebinarID INT PRIMARY KEY,
    WebinarName VARCHAR(100) NOT NULL,
    WebinarStartDate DATE NOT NULL,
    WebinarEndDate DATE NOT NULL,
    WebinarDescription VARCHAR(500),
    WebinarLanguageID INT,
    WebinarPrice MONEY NOT NULL,
    WebinarTranslatorID INT,
    WebinarTeacherID INT,
    WebinarMeetingLink VARCHAR(100),
    WebinarAccessDateEnd DATE NOT NULL,
    FOREIGN KEY (WebinarLanguageID) REFERENCES Language (LanguageID),
    FOREIGN KEY (WebinarTranslatorID) REFERENCES Employee (EmployeeID),
    FOREIGN KEY (WebinarTeacherID) REFERENCES Employee (EmployeeID)
)

CREATE Table StudentBoughtWebinars(
    StudentID INT,
    WebinarID INT,
    WebinarBoughtDate DATE NOT NULL,
    WebinarAccessDateEnd DATE NOT NULL,
    PRIMARY KEY (StudentID, WebinarID),
    FOREIGN KEY (StudentID) REFERENCES Student (StudentID),
    FOREIGN KEY (WebinarID) REFERENCES Webinar (WebinarID)
)

CREATE TABLE Cities(
    CityID INT PRIMARY KEY,
    CityName VARCHAR(50) NOT NULL
)

CREATE TABLE UserAvailableCities(
    UserID INT,
    CityID INT,
    PRIMARY KEY (UserID, CityID),
    FOREIGN KEY (UserID) REFERENCES [User] (UserID),
    FOREIGN KEY (CityID) REFERENCES Cities (CityID)
)



CREATE TABLE Courses(
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    CourseModuleQuantity INT NOT NULL,
    CourseDescription VARCHAR(500),
    CourseLanguageID INT,
    CoursePrice MONEY NOT NULL,
    FOREIGN KEY (CourseLanguageID) REFERENCES Language (LanguageID),
)

CREATE TABLE CourseModuleMeetingType(
    CourseModuleMeetingTypeID INT PRIMARY KEY,
    CourseModuleMeetingTypeName VARCHAR(50) NOT NULL
)

CREATE TABLE CourseModule(
    CourseID INT,
    ModuleID INT PRIMARY KEY,
    ModuleName VARCHAR(100) NOT NULL,
    ModuleDescription VARCHAR(500),
    ModuleLanguageID INT,
    CourseModuleMeetingTypeID INT,
    CourseModuleLessonQuantity INT NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses (CourseID),
    FOREIGN KEY (ModuleLanguageID) REFERENCES Language (LanguageID),
    FOREIGN KEY (CourseModuleMeetingTypeID) REFERENCES CourseModuleMeetingType (CourseModuleMeetingTypeID)
)

CREATE TABLE CourseLessonMeetingType(
    CourseLessonMeetingTypeID INT PRIMARY KEY,
    CourseLessonMeetingTypeName VARCHAR(50) NOT NULL
)

CREATE TABLE CourseLesson(
    ModuleID INT,
    LessonID INT,
    CourseID INT,
    LessonName VARCHAR(100) NOT NULL,
    LessonDescription VARCHAR(500),
    LessonLanguageID INT,
    LessonMeetingLink VARCHAR(100),
    LessonMeetingPlace VARCHAR(100),
    LessonMeetingDateStart DATE NOT NULL,
    LessonMeetingDateEnd DATE NOT NULL,
    LessonCapacity INT,
    CourseLessonMeetingTypeID INT,
    FOREIGN KEY (ModuleID) REFERENCES CourseModule (ModuleID),
    FOREIGN KEY (CourseID) REFERENCES Courses (CourseID),
    FOREIGN KEY (LessonLanguageID) REFERENCES Language (LanguageID),
    FOREIGN KEY (CourseLessonMeetingTypeID) REFERENCES CourseLessonMeetingType (CourseLessonMeetingTypeID)
)

