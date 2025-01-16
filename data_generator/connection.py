import pyodbc
from dotenv import load_dotenv
import os

load_dotenv()


def create_connection():
    server = os.getenv("SERVER")
    port = os.getenv("PORT")
    database = os.getenv("DATABASE")
    usernamed = os.getenv("USERNAMED")
    password = os.getenv("PASSWORD")

    conn_str = (
        f"DRIVER={{ODBC Driver 18 for SQL Server}};"
        f"SERVER={server},{port};"
        f"DATABASE={database};"
        f"UID={usernamed};"
        f"PWD={password};"
        f"TrustServerCertificate=yes;"
    )
    conn = pyodbc.connect(conn_str)
    return conn


def test_connection():
    try:
        conn = create_connection()
        print("Connection successful!")
        conn.close()
    except pyodbc.Error as e:
        print("Error in connection:", e)


if __name__ == "__main__":
    test_connection()
