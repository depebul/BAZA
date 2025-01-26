from faker import Faker
from faker.providers import BaseProvider
import random
from connection import create_connection

conn = create_connection()
cursor = conn.cursor()


def fetch_sql(query_part):
    cursor.execute(f"SELECT * FROM {query_part};")
    return cursor.fetchall()


def users():
    cursor.execute("SELECT * FROM Users;")
    return cursor.fetchall()


def currencies():
    cursor.execute("SELECT * FROM CurrencyRates;")
    return cursor.fetchall()


def languages():
    cursor.execute("SELECT * FROM Languages;")
    return cursor.fetchall()


def employee_types():
    cursor.execute("SELECT * FROM EmployeeTypes;")
    return cursor.fetchall()


def employees():
    cursor.execute("SELECT * FROM Employees;")
    return cursor.fetchall()


def students():
    cursor.execute("SELECT * FROM Students;")
    return cursor.fetchall()


def translating_languages():
    cursor.execute("SELECT * FROM TranslatingLanguages;")
    return cursor.fetchall()


def cities():
    cursor.execute("SELECT * FROM Cities;")
    return cursor.fetchall()


def course_module_meeting_types():
    cursor.execute("SELECT * FROM CourseModuleMeetingTypes;")
    return cursor.fetchall()


def courses():
    cursor.execute("SELECT * FROM Courses;")
    return cursor.fetchall()


def modules():
    cursor.execute("SELECT * FROM CourseModules;")
    return cursor.fetchall()


def translators():
    cursor.execute("SELECT * FROM Translators;")
    return cursor.fetchall()


def teaching_languages():
    cursor.execute("SELECT * FROM TeachingLanguages;")
    return cursor.fetchall()


def course_lessons():
    cursor.execute("SELECT * FROM CourseLessons;")
    return cursor.fetchall()


def course_modules():
    cursor.execute("SELECT * FROM CourseModules;")
    return cursor.fetchall()


def course_modules_passed():
    cursor.execute("SELECT * FROM CourseModulesPassed;")
    return cursor.fetchall()


def studies():
    cursor.execute("SELECT * FROM Studies;")
    return cursor.fetchall()


def sysllabuses():
    cursor.execute("SELECT * FROM Syllabuses;")
    return cursor.fetchall()


def subjects():
    cursor.execute("SELECT * FROM Subjects;")
    return cursor.fetchall()


def sessions():
    cursor.execute("SELECT * FROM StudiesSessions")
    return cursor.fetchall()


def webinars():
    cursor.execute("SELECT * FROM Webinars;")
    return cursor.fetchall()


def studies_lessons():
    cursor.execute("SELECT * FROM StudiesLessons;")
    return cursor.fetchall()


def orders():
    cursor.execute("SELECT * FROM Orders;")
    return cursor.fetchall()


def orderWebinars():
    cursor.execute("SELECT * FROM OrderWebinars;")
    return cursor.fetchall()


def orderCourses():
    cursor.execute("SELECT * FROM OrderCourses;")
    return cursor.fetchall()


def orderStudies():
    cursor.execute("SELECT * FROM OrderStudies;")
    return cursor.fetchall()


def orderSessions():
    cursor.execute("SELECT * FROM OrderSessions;")
    return cursor.fetchall()


def orderDetails():
    cursor.execute("SELECT * FROM OrderDetails;")
    return cursor.fetchall()
