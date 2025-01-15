from faker import Faker
from faker.providers import BaseProvider
import random
from connection import create_connection

conn = create_connection()
cursor = conn.cursor()


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
