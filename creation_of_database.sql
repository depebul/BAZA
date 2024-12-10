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

-- aktualne
CREATE TABLE CurrencyRates(
    CurrencyID INT PRIMARY KEY,
    CurrencyName VARCHAR(100) NOT NULL,
    RateToPLN MONEY NOT NULL
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
    WebinarDescription VARCHAR(MAX),
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
    CourseDescription VARCHAR(MAX),
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
    ModuleDescription VARCHAR(MAX),
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
    LessonID INT PRIMARY KEY ,
    CourseID INT,
    LessonName VARCHAR(100) NOT NULL,
    LessonDescription VARCHAR(MAX),
    LessonLanguageID INT,
    LessonMeetingLink VARCHAR(100),
    LessonMeetingPlace VARCHAR(100),
    LessonMeetingDateStart DATE NOT NULL,
    LessonMeetingDateEnd DATE NOT NULL,
    LessonCapacity INT,
    CourseLessonMeetingTypeID INT,
    IsTranslatedToPolish BIT,
    TranslatorID INT,
    TeacherID INT,
    FOREIGN KEY (ModuleID) REFERENCES CourseModules (ModuleID),
    FOREIGN KEY (CourseID) REFERENCES Courses (CourseID),
    FOREIGN KEY (LessonLanguageID) REFERENCES Languages (LanguageID),
    FOREIGN KEY (CourseLessonMeetingTypeID) REFERENCES CourseLessonMeetingTypes (CourseLessonMeetingTypeID),
    FOREIGN KEY (TranslatorID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (TeacherID) REFERENCES Employees (EmployeeID),
)

CREATE TABLE CourseModulesPassed(
    StudentID INT,
    ModuleID INT,
    PRIMARY KEY (StudentID, ModuleID),
    FOREIGN KEY (ModuleID) REFERENCES CourseModules (ModuleID),
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID)
)

CREATE TABLE CourseLessonsPassed(
    StudentID INT,
    LessonID INT,
    PRIMARY KEY (StudentID, LessonID),
    FOREIGN KEY (LessonID) REFERENCES CourseLessons (LessonID),
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID)
)

CREATE TABLE WebinarsPassed(
    StudentID INT,
    WebinarID INT,
    PRIMARY KEY (StudentID, WebinarID),
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
    AmountToPay MONEY NOT NULL,
    CurrencyID INT,
    CurrencyRate MONEY,
    PaidDate DATE,
    PostponementDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (CurrencyID) REFERENCES CurrencyRates (CurrencyID)
)

CREATE TABLE OrderWebinars(
    WebinarID INT PRIMARY KEY,
    OrderDetailID INT,
    FOREIGN KEY (OrderDetailID) REFERENCES OrderDetails (OrderDetailID),
    FOREIGN KEY (WebinarID) REFERENCES Webinars (WebinarID)
)

CREATE TABLE OrderCourses(
    CourseID INT PRIMARY KEY,
    OrderDetailID INT,
    FOREIGN KEY (OrderDetailID) REFERENCES OrderDetails (OrderDetailID),
    FOREIGN KEY (CourseID) REFERENCES Courses (CourseID)
)

CREATE TABLE Studies(
    StudiesID INT PRIMARY KEY,
    StudiesDescription VARCHAR(MAX),
    StudiesName VARCHAR(100),
    StudiesEntryFee MONEY,
    StudiesStartDate DATE,
    StudiesEndDate DATE
)

CREATE TABLE Syllabuses(
    SyllabusID INT PRIMARY KEY,
    StudiesID INT,
    SemesterNumber INT NOT NULL,
    FOREIGN KEY (StudiesID) REFERENCES Studies (StudiesID)
)

CREATE TABLE Subjects(
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(100),
    SubjectDescription VARCHAR(MAX),
    SubjectsCount INT NOT NULL,
    CoordinatorID INT,
    SyllabusID INT,
    FOREIGN KEY (CoordinatorID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (SyllabusID) REFERENCES Syllabuses (SyllabusID)
)

CREATE TABLE StudiesLessonMeetingTypes(
    StudiesLessonMeetingTypeID INT PRIMARY KEY,
    StudiesLessonMeetingTypeName VARCHAR(50) NOT NULL
)

CREATE TABLE StudiesLessons(
    StudiesID INT,
    SubjectID INT,
    LessonID INT PRIMARY KEY,
    LessonName VARCHAR(100) NOT NULL,
    LessonDescription VARCHAR(MAX),
    LessonLanguageID INT,
    LessonMeetingLink VARCHAR(100),
    LessonMeetingPlace VARCHAR(100),
    LessonMeetingDateStart DATE NOT NULL,
    LessonMeetingDateEnd DATE NOT NULL,
    LessonCapacity INT,
    LessonGuestCapacity INT,
    LessonPrice MONEY,
    LessonGuestPrice MONEY,
    CourseLessonMeetingTypeID INT,
    IsTranslatedToPolish BIT,
    TranslatorID INT,
    TeacherID INT,
    StudiesLessonMeetingTypeID INT,
    FOREIGN KEY (StudiesID) REFERENCES Studies (StudiesID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects (SubjectID),
    FOREIGN KEY (LessonLanguageID) REFERENCES Languages (LanguageID),
    FOREIGN KEY (CourseLessonMeetingTypeID) REFERENCES CourseLessonMeetingTypes (CourseLessonMeetingTypeID),
    FOREIGN KEY (TranslatorID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (TeacherID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (StudiesLessonMeetingTypeID) REFERENCES StudiesLessonMeetingTypes (StudiesLessonMeetingTypeID),
)

CREATE TABLE StudiesLessonPassed(
    StudentID INT,
    LessonID INT,
    PRIMARY KEY (StudentID, LessonID),
    FOREIGN KEY (LessonID) REFERENCES StudiesLessons (LessonID),
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID)
)

CREATE TABLE StudentStudies(
    StudentID INT,
    StudiesID INT,
    StudentGrade INT,
    PRIMARY KEY (StudentID, StudiesID),
    FOREIGN KEY (StudiesID) REFERENCES Studies (StudiesID),
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID)
)

CREATE TABLE Internships(
    InternshipID INT PRIMARY KEY,
    InternshipCompany VARCHAR(100),
    InternshipStartDate DATE,
    StudiesID INT,
    FOREIGN KEY (StudiesID) REFERENCES Studies (StudiesID)
)

CREATE TABLE InternshipMeetingPassed(
    StudentID INT,
    InternshipID INT,
    PRIMARY KEY (StudentID, InternshipID),
    FOREIGN KEY (InternshipID) REFERENCES Internships (InternshipID),
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID)
)

CREATE TABLE OrderStudies(
    StudiesID INT PRIMARY KEY,
    OrderDetailID INT,
    FOREIGN KEY (OrderDetailID) REFERENCES OrderDetails (OrderDetailID),
    FOREIGN KEY (StudiesID) REFERENCES Studies (StudiesID)
)

CREATE TABLE RODOSigns (
    UserID INT PRIMARY KEY,
    IsSigned BIT NOT NULL,
    SignDate Date,
    FOREIGN KEY (UserID) REFERENCES Users (UserID)
)
