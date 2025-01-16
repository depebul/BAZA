from common_imports import *

users = f.users()


@dataclass
class Row:
    UserID: int
    OrderDate: datetime
    OrderPaymentLink: str


data = []
for u in users[100:]:
    date = faker.date_time_between(start_date="-5y")
    for i in range(2):
        data.append(
            asdict(
                Row(
                    UserID=u.UserID,
                    OrderDate=date,
                    OrderPaymentLink=faker.password(length=12),
                )
            )
        )
insert_data(data, "Orders")
