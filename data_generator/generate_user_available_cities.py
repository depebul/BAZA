from common_imports import *

users = f.users()
cities = f.cities()


@dataclass
class Row:
    UserID: int
    CityID: int


data = []
for u in users:
    flag = False
    for c in cities:
        if random.random() > 0.2:
            data.append(asdict(Row(UserID=u.UserID, CityID=c.CityID)))
            flag = True
    if not flag:
        data.append(asdict(Row(UserID=u.UserID, CityID=random.choice(cities).CityID)))


insert_data(data, "UserAvailableCities")
