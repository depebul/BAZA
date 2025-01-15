from common_imports import *

Faker.seed(2137)
faker = Faker("pl_PL")

n = 30


@dataclass
class Row:
    LanguageName: str


def generate_data(n):
    languages = [
        "English",
        "Polish",
        "Spanish",
        "French",
        "German",
        "Chinese",
        "Nigerian",
    ]
    data = []
    for l in languages:
        data.append(Row(LanguageName=l))
    return data


def insert_data(conn):
    data = generate_data(n)

    conn = create_connection()
    cursor = conn.cursor()

    sql = """INSERT INTO Languages (LanguageName) 
             VALUES (?)"""

    data = [tuple(asdict(el).values()) for el in data]
    cursor.executemany(sql, data)
    conn.commit()
    cursor.close()
    conn.close()
    print(f"Inserted {n} rows")


if __name__ == "__main__":
    insert_data(create_connection())
