from common_imports import *

users = f.users()


@dataclass
class Row:
    IsSigned: bool
    SignDate: date
    userID: int


data = []
for user in users:
    data.append(
        asdict(
            Row(
                IsSigned=1,
                SignDate=faker.date_between(start_date="-20y", end_date="today"),
                userID=user.UserID,
            )
        )
    )

insert_data(data, "RODOSigns")
