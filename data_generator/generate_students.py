from common_imports import *

users = f.users()


@dataclass
class Row:
    UserID: int


data = []
for i in range(100, 1000):
    data.append(
        asdict(
            Row(
                UserID=users[i].UserID,
            )
        )
    )
insert_data(data, "Students")
