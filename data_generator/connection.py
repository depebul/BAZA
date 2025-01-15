import pyodbc


def create_connection():
    server = "dbmanage.lab.ii.agh.edu.pl"  # Update with your server name
    port = "1433"  # Update with your port number if different
    database = "u_dzak"  # Update with your database name
    username = "u_dzak"  # Update with your username
    password = "kochamtft"  # Update with your password
    conn_str = (
        f"DRIVER={{ODBC Driver 18 for SQL Server}};"
        f"SERVER={server},{port};"
        f"DATABASE={database};"
        f"UID={username};"
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
