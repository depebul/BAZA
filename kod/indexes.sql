CREATE NONCLUSTERED INDEX idx_users_email ON Users(UserEmail);
CREATE NONCLUSTERED INDEX idx_users_city ON Users(UserCity);

CREATE NONCLUSTERED INDEX idx_languages_name ON Languages(LanguageName);

CREATE NONCLUSTERED INDEX idx_currencyrates_name ON CurrencyRates(CurrencyName);

CREATE NONCLUSTERED INDEX idx_employeetypes_name ON EmployeeTypes(EmployeeTypeName);

CREATE NONCLUSTERED INDEX idx_employees_userid ON Employees(UserID);
CREATE NONCLUSTERED INDEX idx_employees_employeetypeid ON Employees(EmployeeTypeID);

CREATE NONCLUSTERED INDEX idx_teachinglanguages_employeeid ON TeachingLanguages(EmployeeID);

CREATE NONCLUSTERED INDEX idx_students_userid ON Students(UserID);

CREATE NONCLUSTERED INDEX idx_studyinglanguages_studentid ON StudyingLanguages(StudentID);

CREATE NONCLUSTERED INDEX idx_translatinglanguages_employeeid ON TranslatingLanguages(EmployeeID);

CREATE NONCLUSTERED INDEX idx_webinars_languageid ON Webinars(WebinarLanguageID);

CREATE NONCLUSTERED INDEX idx_studentboughtwebinars_studentid ON StudentBoughtWebinars(StudentID);

CREATE NONCLUSTERED INDEX idx_cities_cityname ON Cities(CityName);

CREATE NONCLUSTERED INDEX idx_useravailablecities_userid ON UserAvailableCities(UserID);

CREATE NONCLUSTERED INDEX idx_courses_languageid ON Courses(CourseLanguageID);

CREATE NONCLUSTERED INDEX idx_studentboughtcourses_studentid ON StudentBoughtCourses(StudentID);

CREATE NONCLUSTERED INDEX idx_coursemodules_courseid ON CourseModules(CourseID);

CREATE NONCLUSTERED INDEX idx_courselessons_moduleid ON CourseLessons(ModuleID);

CREATE NONCLUSTERED INDEX idx_coursemodulespassed_studentid ON CourseModulesPassed(StudentID);

CREATE NONCLUSTERED INDEX idx_courselessonspassed_studentid ON CourseLessonsPassed(StudentID);

CREATE NONCLUSTERED INDEX idx_webinarspassed_studentid ON WebinarsPassed(StudentID);

CREATE CLUSTERED INDEX idx_orders_userid ON Orders(UserID);

CREATE NONCLUSTERED INDEX idx_orderdetails_orderid ON OrderDetails(OrderID);

CREATE NONCLUSTERED INDEX idx_orderwebinars_orderdetailid ON OrderWebinars(OrderDetailID);

CREATE NONCLUSTERED INDEX idx_ordercourses_orderdetailid ON OrderCourses(OrderDetailID);

CREATE NONCLUSTERED INDEX idx_studies_name ON Studies(StudiesName);

CREATE NONCLUSTERED INDEX idx_syllabuses_studiesid ON Syllabuses(StudiesID);

CREATE NONCLUSTERED INDEX idx_subjects_coordinatorid ON Subjects(CoordinatorID);


CREATE NONCLUSTERED INDEX idx_studiessessions_studiesid ON StudiesSessions(StudiesID);


CREATE NONCLUSTERED INDEX idx_studieslessonspassed_studentid ON StudiesLessonsPassed(StudentID);

CREATE NONCLUSTERED INDEX idx_studentstudiesgrades_studentid ON StudentStudiesGrades(StudentID);

CREATE NONCLUSTERED INDEX idx_studentboughtstudies_studentid ON StudentBoughtStudies(StudentID);

CREATE NONCLUSTERED INDEX idx_studentboughtsessions_studentid ON StudentBoughtSessions(StudentID);

CREATE NONCLUSTERED INDEX idx_internshipmeetingtypes_name ON InternshipMeetingTypes(InternshipMeetingTypeName);

CREATE NONCLUSTERED INDEX idx_internships_studiesid ON Internships(StudiesID);

CREATE NONCLUSTERED INDEX idx_internshipmeetingspassed_studentid ON InternshipMeetingsPassed(StudentID);

CREATE NONCLUSTERED INDEX idx_orderstudies_orderdetailid ON OrderStudies(OrderDetailID);

CREATE NONCLUSTERED INDEX idx_ordersessions_orderdetailid ON OrderSessions(OrderDetailID);

CREATE NONCLUSTERED INDEX idx_rodosigns_userid ON RODOSigns(UserID);