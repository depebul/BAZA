CREATE TABLE Users
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

CREATE TABLE Languages
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


CREATE TABLE EmployeeTypes
(
    EmployeeTypeID   INT PRIMARY KEY,
    EmployeeTypeName VARCHAR(50) NOT NULL
);

CREATE TABLE Employees
(
    UserID         INT,
    EmployeeID     INT PRIMARY KEY,
    EmployeeTypeID INT,
    HireDate       DATE NOT NULL,
    Salary         MONEY NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users (UserID),
    FOREIGN KEY (EmployeeTypeID) REFERENCES EmployeeTypes (EmployeeTypeID)
);

CREATE TABLE TeachingLanguages(
    EmployeeID INT,
    LanguageID INT,
    PRIMARY KEY (EmployeeID, LanguageID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (LanguageID) REFERENCES Languages (LanguageID)
)

CREATE TABLE Students
(
    UserID     INT,
    StudentID  INT PRIMARY KEY,
    FOREIGN KEY (UserID) REFERENCES Users (UserID)
)

CREATE TABLE StudyingLanguages(
    StudentID INT,
    LanguageID INT,
    PRIMARY KEY (StudentID, LanguageID),
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
    FOREIGN KEY (LanguageID) REFERENCES Languages (LanguageID)
)

CREATE TABLE TranslatingLanguages(
    EmployeeID INT,
    LanguageID INT,
    PRIMARY KEY (EmployeeID, LanguageID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (LanguageID) REFERENCES Languages (LanguageID)
)

CREATE TABLE Webinars(
    WebinarID INT PRIMARY KEY,
    WebinarName VARCHAR(100) NOT NULL,
    WebinarStartDate DATE NOT NULL,
    WebinarEndDate DATE NOT NULL,
    WebinarDescription VARCHAR(500),
    WebinarLanguageID INT,
    WebinarPrice MONEY,
    WebinarTranslatorID INT,
    WebinarTeacherID INT,
    WebinarMeetingLink VARCHAR(100),
    WebinarAccessDateEnd DATE NOT NULL,
    FOREIGN KEY (WebinarLanguageID) REFERENCES Languages (LanguageID),
    FOREIGN KEY (WebinarTranslatorID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (WebinarTeacherID) REFERENCES Employees (EmployeeID)
)

CREATE Table StudentBoughtWebinars(
    StudentID INT,
    WebinarID INT,
    WebinarBoughtDate DATE NOT NULL,
    WebinarAccessDateEnd DATE NOT NULL,
    PRIMARY KEY (StudentID, WebinarID),
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
    FOREIGN KEY (WebinarID) REFERENCES Webinars (WebinarID)
)

CREATE TABLE Cities(
    CityID INT PRIMARY KEY,
    CityName VARCHAR(50) NOT NULL
)

CREATE TABLE UserAvailableCities(
    UserID INT,
    CityID INT,
    PRIMARY KEY (UserID, CityID),
    FOREIGN KEY (UserID) REFERENCES Users (UserID),
    FOREIGN KEY (CityID) REFERENCES Cities (CityID)
)



CREATE TABLE Courses(
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    CourseModuleQuantity INT NOT NULL,
    CourseDescription VARCHAR(500),
    CourseLanguageID INT,
    CoursePrice MONEY NOT NULL,
    FOREIGN KEY (CourseLanguageID) REFERENCES Languages (LanguageID),
)

CREATE TABLE CourseModuleMeetingTypes(
    CourseModuleMeetingTypeID INT PRIMARY KEY,
    CourseModuleMeetingTypeName VARCHAR(50) NOT NULL
)

CREATE TABLE CourseModules(
    CourseID INT,
    ModuleID INT PRIMARY KEY,
    ModuleName VARCHAR(100) NOT NULL,
    ModuleDescription VARCHAR(500),
    ModuleLanguageID INT,
    CourseModuleMeetingTypeID INT,
    CourseModuleLessonQuantity INT NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses (CourseID),
    FOREIGN KEY (ModuleLanguageID) REFERENCES Languages (LanguageID),
    FOREIGN KEY (CourseModuleMeetingTypeID) REFERENCES CourseModuleMeetingTypes (CourseModuleMeetingTypeID)
)

CREATE TABLE CourseLessonMeetingTypes(
    CourseLessonMeetingTypeID INT PRIMARY KEY,
    CourseLessonMeetingTypeName VARCHAR(50) NOT NULL
)

CREATE TABLE CourseLessons(
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
    IsTranslatedToPolish BIT,
    TranslatorID INT,
    FOREIGN KEY (ModuleID) REFERENCES CourseModule (ModuleID),
    FOREIGN KEY (CourseID) REFERENCES Courses (CourseID),
    FOREIGN KEY (LessonLanguageID) REFERENCES Language (LanguageID),
    FOREIGN KEY (CourseLessonMeetingTypeID) REFERENCES CourseLessonMeetingType (CourseLessonMeetingTypeID)
    FOREIGN KEY (TranslatorID) REFERENCES Employees (EmployeeID),
)

CREATE TABLE CourseModulesPassed(
    StudentID INT,
    ModuleID INT,
    FOREIGN KEY (ModuleID) REFERENCES CourseModules (ModuleID),
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID)
)

CREATE TABLE CourseLessonsPassed(
    StudentID INT,
    LessonID INT,
    ModuleID INT,
    FOREIGN KEY (LessonID) REFERENCES CourseLessons (LessonID),
    FOREIGN KEY (ModuleID) REFERENCES CourseModules (ModuleID),
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID)
)

CREATE TABLE WebinarsPassed(
    StudentID INT,
    ModuleID INT,
    FOREIGN KEY (WebinarID) REFERENCES Webinars (WebinarID),
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID)
)

CREATE TABLE Orders(
    OrderID INT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    OrderPaymentLink VARCHAR(100) NOT NULL
)

CREATE TABLE OrderDetails(
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    AmountPaid MONEY NOT NULL,
    PaidDate DATE,
    PostponementDate DATE
)

CREATE TABLE OrderWebinars(
    WebinarID INT PRIMARY KEY,
    OrderDetailID INT,
    FOREIGN KEY (OrderDetailID) REFERENCES OrderDetails (OrderDetailID),
    FOREIGN KEY (WebinarID) REFERENCES Webinars (WebinarID)
)

CREATE TABLE OrderStudies(
    StudiesID INT PRIMARY KEY,
    OrderDetailID INT,
    FOREIGN KEY (OrderDetailID) REFERENCES OrderDetails (OrderDetailID),
    FOREIGN KEY (StudiesID) REFERENCES Studies (StudiesID)
)

CREATE TABLE OrderCourses(
    CourseID INT PRIMARY KEY,
    OrderDetailID INT,
    FOREIGN KEY (OrderDetailID) REFERENCES OrderDetails (OrderDetailID),
    FOREIGN KEY (CourseID) REFERENCES Courses (CourseID)
)

