# Permissions Documentation

## Roles

The following roles are created in the database:

- Administrator
- Lecturer
- Translator
- Student
- SchoolDirector
- Accountant

## Permissions

### Administrator

The `Administrator` role has the following permissions:

```sql
GRANT INSERT, UPDATE, DELETE ON Users TO Administrator;
GRANT INSERT, UPDATE, DELETE ON Employees TO Administrator;
GRANT INSERT, UPDATE, DELETE ON Webinars TO Administrator;
GRANT INSERT, UPDATE, DELETE ON Courses TO Administrator;
GRANT INSERT, UPDATE, DELETE ON Studies TO Administrator;
GRANT INSERT, UPDATE, DELETE ON Orders TO Administrator;
GRANT INSERT, UPDATE, DELETE ON OrderDetails TO Administrator;
GRANT SELECT ON Orders TO Administrator;
GRANT SELECT ON OrderDetails TO Administrator;
```

### Lecturer

The `Lecturer` role has the following permissions:

```sql
GRANT SELECT ON Students TO Lecturer;
GRANT SELECT ON StudentBoughtWebinars TO Lecturer;
GRANT SELECT ON CourseModulesPassed TO Lecturer;
GRANT SELECT ON CourseLessonsPassed TO Lecturer;
GRANT SELECT ON WebinarsPassed TO Lecturer;
GRANT SELECT ON StudiesLessonPassed TO Lecturer;
```

### Translator

The `Translator` role has the following permissions:

```sql
GRANT SELECT ON Webinars TO Translator;
GRANT SELECT ON Courses TO Translator;
GRANT SELECT ON Studies TO Translator;
```

### Student

The `Student` role has the following permissions:

```sql
GRANT SELECT ON Webinars TO Student;
GRANT SELECT ON Courses TO Student;
GRANT SELECT ON Studies TO Student;
GRANT SELECT ON StudentBoughtWebinars TO Student;
GRANT SELECT ON CourseModulesPassed TO Student;
GRANT SELECT ON CourseLessonsPassed TO Student;
GRANT SELECT ON WebinarsPassed TO Student;
GRANT SELECT ON StudiesLessonPassed TO Student;
```

### SchoolDirector

The `SchoolDirector` role has the following permissions:

```sql
GRANT ALL ON Users TO SchoolDirector;
GRANT ALL ON Employees TO SchoolDirector;
GRANT ALL ON Webinars TO SchoolDirector;
GRANT ALL ON Courses TO SchoolDirector;
GRANT ALL ON Studies TO SchoolDirector;
GRANT ALL ON Orders TO SchoolDirector;
GRANT ALL ON OrderDetails TO SchoolDirector;
```

### Accountant

The `Accountant` role has the following permissions:

```sql
GRANT SELECT ON Orders TO Accountant;
GRANT SELECT ON OrderDetails TO Accountant;
```
