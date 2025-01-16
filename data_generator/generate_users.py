from common_imports import *

faker = Faker("pl_PL")
n = 1000


@dataclass
class User:
    UserName: str
    UserSurname: str
    UserDateOfBirth: date
    UserSex: str
    UserEmail: str
    UserPhoneNumber: str
    UserAddress: str
    UserCity: str
    UserCountry: str
    UserPostalCode: str


def generate_data(n):
    users = []
    for _ in range(n):
        address = faker.address()
        s = address.split("\n")
        first_name = faker.first_name()
        user = User(
            UserName=first_name,
            UserSurname=faker.last_name(),
            UserDateOfBirth=faker.date_of_birth(maximum_age=80, minimum_age=18),
            UserSex="f" if first_name[-1] == "a" else "m",
            UserEmail=faker.email(),
            UserPhoneNumber=faker.phone_number(),
            UserAddress=address.replace("\n", " "),
            UserCity=s[1].split(" ")[1],
            UserCountry="Poland",
            UserPostalCode=s[1].split(" ")[0],
        )
        users.append(user)
    return users


def insert_data(conn):
    data = generate_data(n)

    conn = create_connection()
    cursor = conn.cursor()
    sql = """INSERT INTO Users (UserName, UserSurname, UserDateOfBirth, UserSex, UserEmail, UserPhoneNumber, UserAddress, UserCity, UserCountry, UserPostalCode) 
             VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"""
    data = [tuple(asdict(el).values()) for el in data]
    cursor.executemany(sql, data)
    conn.commit()
    cursor.close()
    conn.close()
    print(f"Inserted {n} rows")


if __name__ == "__main__":
    insert_data(create_connection())
