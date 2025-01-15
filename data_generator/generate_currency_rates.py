from common_imports import *

Faker.seed(2137)
faker = Faker("pl_PL")

n = 4
names = ["PLN", "EUR", "USD", "GBP"]
rates = [1, 4.26, 4.13, 5.06]


@dataclass
class Row:
    CurrencyName: str
    RateToPLN: float


def generate_data(n):
    data = []
    for i in range(n):
        data.append(Row(CurrencyName=names[i], RateToPLN=rates[i]))
    return data


def insert_data(conn):
    data = generate_data(n)

    conn = create_connection()
    cursor = conn.cursor()

    sql = """INSERT INTO CurrencyRates (CurrencyName,RateToPLN ) 
             VALUES (?,?)"""

    data = [tuple(asdict(el).values()) for el in data]
    cursor.executemany(sql, data)
    conn.commit()
    cursor.close()
    conn.close()
    print(f"Inserted {n} rows")


if __name__ == "__main__":
    insert_data(create_connection())
