CREATE TABLE Users
(
    UserID          INT PRIMARY KEY,
    UserName        VARCHAR(50)  NOT NULL,
    UserSurname     VARCHAR(50)  NOT NULL,
    UserDateOfBirth DATE         NOT NULL,
    UserSex         CHAR(1)      NOT NULL,
    UserEmail       VARCHAR(100) NOT NULL,
    UserPhoneNumber VARCHAR(20),
    UserAddress     VARCHAR(100) NOT NULL,
    UserCity        VARCHAR(50) NOT NULL,
    UserCountry     VARCHAR(50) NOT NULL,
    UserPostalCode  VARCHAR(10) NOT NULL
)

CREATE TABLE Languages
(
    LanguageID   INT PRIMARY KEY,
    LanguageName VARCHAR(50) NOT NULL
)

CREATE TABLE CurrencyRates(
    CurrencyID INT PRIMARY KEY,
    CurrencyName VARCHAR(100) NOT NULL,
    RateToPLN MONEY NOT NULL
)

CREATE TABLE EmployeeTypes
(
    EmployeeTypeID   INT PRIMARY KEY,
    EmployeeTypeName VARCHAR(50) NOT NULL
)

CREATE TABLE Employees
(
    EmployeeID     INT PRIMARY KEY,
    UserID         INT NOT NULL,
    EmployeeTypeID INT NOT NULL,
    HireDate       DATE NOT NULL,
    Salary         MONEY NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users (UserID),
    FOREIGN KEY (EmployeeTypeID) REFERENCES EmployeeTypes (EmployeeTypeID)
)

CREATE TABLE TeachingLanguages(
    EmployeeID INT,
    LanguageID INT,
    PRIMARY KEY (EmployeeID, LanguageID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (LanguageID) REFERENCES Languages (LanguageID)
)

CREATE TABLE Students
(
    StudentID  INT PRIMARY KEY,
    UserID     INT NOT NULL,
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
    WebinarDescription VARCHAR(MAX) NOT NULL,
    WebinarLanguageID INT NOT NULL,
    WebinarPrice MONEY,
    WebinarTranslatorID INT,
    WebinarTeacherID INT NOT NULL,
    WebinarMeetingLink VARCHAR(100),
    WebinarAccessDateEnd DATE NOT NULL,
    WebinarRecordingLink VARCHAR(100)
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
    CourseDescription VARCHAR(MAX) NOT NULL,
    CourseLanguageID INT NOT NULL,
    CoursePrice MONEY NOT NULL,
    CourseStartDate DATE NOT NULL,
    CourseEndDate DATE NOT NULL,
    CourseCapacity INT NOT NULL,
    CourseRecordingLink VARCHAR(100)
    FOREIGN KEY (CourseLanguageID) REFERENCES Languages (LanguageID),
)

CREATE Table StudentBoughtCourses(
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses (CourseID)
)

CREATE TABLE CourseModuleMeetingTypes(
    CourseModuleMeetingTypeID INT PRIMARY KEY,
    CourseModuleMeetingTypeName VARCHAR(50) NOT NULL
)

CREATE TABLE CourseModules(
    ModuleID INT PRIMARY KEY,
    CourseID INT NOT NULL,
    ModuleName VARCHAR(100) NOT NULL,
    ModuleDescription VARCHAR(MAX) NOT NULL,
    ModuleLanguageID INT NOT NULL,
    CourseModuleMeetingTypeID INT NOT NULL,
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
    LessonID INT PRIMARY KEY,
    ModuleID INT NOT NULL,
    CourseID INT NOT NULL,
    LessonName VARCHAR(100) NOT NULL,
    LessonDescription VARCHAR(MAX) NOT NULL,
    LessonLanguageID INT NOT NULL,
    LessonMeetingLink VARCHAR(100) NOT NULL,
    LessonMeetingPlace VARCHAR(100) NOT NULL,
    LessonMeetingDateStart DATE NOT NULL,
    LessonMeetingDateEnd DATE NOT NULL,
    LessonCapacity INT NOT NULL,
    CourseLessonMeetingTypeID INT NOT NULL,
    IsTranslatedToPolish BIT NOT NULL,
    TranslatorID INT,
    TeacherID INT NOT NULL,
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
    UserID INT NOT NULL,
    OrderDate DATE NOT NULL,
    OrderPaymentLink VARCHAR(100) NOT NULL
    FOREIGN KEY (UserID) REFERENCES Users (UserID)
)

CREATE TABLE OrderDetails(
    OrderDetailID INT PRIMARY KEY,
    OrderID INT NOT NULL,
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
    OrderDetailID INT NOT NULL,
    FOREIGN KEY (OrderDetailID) REFERENCES OrderDetails (OrderDetailID),
    FOREIGN KEY (WebinarID) REFERENCES Webinars (WebinarID)
)

CREATE TABLE OrderCourses(
    CourseID INT PRIMARY KEY,
    OrderDetailID INT NOT NULL,
    FOREIGN KEY (OrderDetailID) REFERENCES OrderDetails (OrderDetailID),
    FOREIGN KEY (CourseID) REFERENCES Courses (CourseID)
)

CREATE TABLE Studies(
    StudiesID INT PRIMARY KEY,
    StudiesDescription VARCHAR(MAX) NOT NULL,
    StudiesName VARCHAR(100) NOT NULL,
    StudiesEntryFee MONEY NOT NULL,
    StudiesStartDate DATE NOT NULL,
    StudiesEndDate DATE NOT NULL,
    StudiesCapacity INT NOT NULL
)

CREATE TABLE Syllabuses(
    SyllabusID INT PRIMARY KEY,
    StudiesID INT NOT NULL,
    SemesterNumber INT NOT NULL,
    FOREIGN KEY (StudiesID) REFERENCES Studies (StudiesID)
)

CREATE TABLE Subjects(
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(100) NOT NULL,
    SubjectDescription VARCHAR(MAX) NOT NULL,
    SubjectsCount INT NOT NULL,
    CoordinatorID INT NOT NULL,
    SyllabusID INT NOT NULL,
    FOREIGN KEY (CoordinatorID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (SyllabusID) REFERENCES Syllabuses (SyllabusID)
)

CREATE TABLE StudiesLessonMeetingTypes(
    StudiesLessonMeetingTypeID INT PRIMARY KEY,
    StudiesLessonMeetingTypeName VARCHAR(50) NOT NULL
)

CREATE TABLE StudiesSessions(
    SessionID INT PRIMARY KEY,
    StudiesID INT NOT NULL,
    SubjectID INT NOT NULL,
    SessionStartDate DATE NOT NULL,
    SessionEndDate DATE NOT NULL,
    SessionCapacity INT NOT NULL,
    SessionGuestCapacity INT NOT NULL,
    SessionPrice MONEY NOT NULL
    FOREIGN KEY (StudiesID) REFERENCES Studies (StudiesID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects (SubjectID)
)

CREATE TABLE StudiesLessons(
    LessonID INT PRIMARY KEY,
    SessionID INT NOT NULL,
    SubjectID INT NOT NULL,
    LessonName VARCHAR(100) NOT NULL,
    LessonDescription VARCHAR(MAX) NOT NULL,
    LessonLanguageID INT NOT NULL,
    LessonMeetingLink VARCHAR(100),
    LessonMeetingPlace VARCHAR(100),
    LessonMeetingDateStart DATE NOT NULL,
    LessonMeetingDateEnd DATE NOT NULL,
    LessonCapacity INT NOT NULL,
    LessonGuestCapacity INT NOT NULL,
    LessonPrice MONEY NOT NULL,
    LessonGuestPrice MONEY NOT NULL,
    IsTranslatedToPolish BIT NOT NULL,
    TranslatorID INT,
    TeacherID INT NOT NULL,
    StudiesLessonMeetingTypeID INT NOT NULL,
    FOREIGN KEY (SessionID) REFERENCES StudiesSessions (SessionID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects (SubjectID),
    FOREIGN KEY (LessonLanguageID) REFERENCES Languages (LanguageID),
    FOREIGN KEY (TranslatorID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (TeacherID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (StudiesLessonMeetingTypeID) REFERENCES StudiesLessonMeetingTypes (StudiesLessonMeetingTypeID),
)

CREATE TABLE StudiesLessonsPassed(
    StudentID INT,
    LessonID INT,
    PRIMARY KEY (StudentID, LessonID),
    FOREIGN KEY (LessonID) REFERENCES StudiesLessons (LessonID),
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID)
)

CREATE TABLE StudentStudiesGrades(
    StudentID INT,
    StudiesID INT,
    StudentGrade INT NOT NULL,
    PRIMARY KEY (StudentID, StudiesID),
    FOREIGN KEY (StudiesID) REFERENCES Studies (StudiesID),
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID)
)

CREATE Table StudentBoughtStudies(
    StudentID INT,
    StudiesID INT,
    PRIMARY KEY (StudentID, StudiesID),
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
    FOREIGN KEY (StudiesID) REFERENCES Studies (StudiesID)
)

CREATE Table StudentBoughtSessions(
    StudentID INT,
    SessionID INT,
    PRIMARY KEY (StudentID, SessionID),
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
    FOREIGN KEY (SessionID) REFERENCES StudiesSessions (SessionID)
)

CREATE TABLE InternshipMeetingTypes(
    InternshipMeetingTypeID INT PRIMARY KEY,
    InternshipMeetingTypeName VARCHAR(50) NOT NULL
)

CREATE TABLE Internships(
    InternshipID INT PRIMARY KEY,
    InternshipCompany VARCHAR(100) NOT NULL,
    InternshipStartDate DATE NOT NULL,
    StudiesID INT NOT NULL,
    InternshipMeetingType INT NOT NULL,
    FOREIGN KEY (StudiesID) REFERENCES Studies (StudiesID),
    FOREIGN KEY (InternshipMeetingType) REFERENCES InternshipMeetingTypes (InternshipMeetingTypeID)
)

CREATE TABLE InternshipMeetingsPassed(
    StudentID INT,
    InternshipID INT,
    PRIMARY KEY (StudentID, InternshipID),
    FOREIGN KEY (InternshipID) REFERENCES Internships (InternshipID),
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID)
)

CREATE TABLE OrderStudies(
    StudiesID INT PRIMARY KEY,
    OrderDetailID INT NOT NULL,
    FOREIGN KEY (OrderDetailID) REFERENCES OrderDetails (OrderDetailID),
    FOREIGN KEY (StudiesID) REFERENCES Studies (StudiesID)
)

CREATE TABLE OrderSessions(
    SessionID INT PRIMARY KEY,
    OrderDetailID INT NOT NULL,
    FOREIGN KEY (OrderDetailID) REFERENCES OrderDetails (OrderDetailID),
    FOREIGN KEY (SessionID) REFERENCES StudiesSessions (SessionID)
)

CREATE TABLE RODOSigns (
    UserID INT PRIMARY KEY,
    IsSigned BIT NOT NULL,
    SignDate DATE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users (UserID)
)
