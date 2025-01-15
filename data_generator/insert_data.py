from common_imports import *


def insert_data(data, table_name):
    conn = create_connection()
    cursor = conn.cursor()

    sql = f"""INSERT INTO {table_name} ({", ".join(data[0].keys())}) 
             VALUES ({", ".join(["?"] * len(data[0].keys()))})"""

    data = [tuple(el.values()) for el in data]
    cursor.executemany(sql, data)
    conn.commit()
    cursor.close()
    print(f"Inserted {len(data)} rows")
