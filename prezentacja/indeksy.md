# Indeksy

## Users

```sql
CREATE NONCLUSTERED INDEX idx_users_email ON Users(UserEmail);
```

## Employees

```sql
CREATE NONCLUSTERED INDEX idx_employees_userid ON Employees(UserID);
```

## Students

```sql
CREATE NONCLUSTERED INDEX idx_students_userid ON Students(UserID);
```

## Webinars

```sql
CREATE NONCLUSTERED INDEX idx_webinars_languageid ON Webinars(WebinarLanguageID);
```

## Courses

```sql
CREATE NONCLUSTERED INDEX idx_courses_languageid ON Courses(CourseLanguageID);
```

## Orders

```sql
CREATE CLUSTERED INDEX idx_orders_userid ON Orders(UserID);
```

## OrderDetails

```sql
CREATE NONCLUSTERED INDEX idx_orderdetails_orderid ON OrderDetails(OrderID);
```

## StudentBoughtWebinars

```sql
CREATE NONCLUSTERED INDEX idx_studentboughtwebinars_studentid ON StudentBoughtWebinars(StudentID);
```

## CourseModules

```sql
CREATE NONCLUSTERED INDEX idx_coursemodules_courseid ON CourseModules(CourseID);
```

## CourseLessons

```sql
CREATE NONCLUSTERED INDEX idx_courselessons_moduleid ON CourseLessons(ModuleID);
```
