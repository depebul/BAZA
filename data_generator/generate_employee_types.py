from common_imports import *

Faker.seed(2137)
faker = Faker("pl_PL")
n = 0
types = ["Student", "Teacher", "Translator"]


@dataclass
class Row:
    EmployeeTypeName: str


def generate_data(n):
    data = []
    for t in types:
        data.append(Row(EmployeeTypeName=t))
    return data


def insert_data(conn):
    data = generate_data(n)

    conn = create_connection()
    cursor = conn.cursor()

    sql = """INSERT INTO EmployeeTypes (EmployeeTypeName) 
             VALUES (?)"""

    data = [tuple(asdict(el).values()) for el in data]
    cursor.executemany(sql, data)
    conn.commit()
    cursor.close()
    conn.close()
    print(f"Inserted {n} rows")


if __name__ == "__main__":
    insert_data(create_connection())
