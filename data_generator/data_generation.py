from faker import Faker
from faker.providers import BaseProvider
import random
from connection import create_connection


class CustomProvider(BaseProvider):
    def typ_pracy(self):
        array = ["Teacher", "Translator"]
        job = random.choice(array)
        return job


def fetch_users(conn):
    cursor = conn.cursor()
    cursor.execute("SELECT TOP 10 UserID, UserName, UserSurname FROM Users")
    rows = cursor.fetchall()
    for row in rows:
        print(
            f"UserID: {row.UserID}, UserName: {row.UserName}, UserSurname: {row.UserSurname}"
        )


if __name__ == "__main__":
    fake = Faker("pl_PL")
    fake.add_provider(CustomProvider)

    # Create a single connection to the database
    conn = create_connection()

    try:
        fetch_users(conn)
    finally:
        # Ensure the connection is closed when done
        conn.close()
