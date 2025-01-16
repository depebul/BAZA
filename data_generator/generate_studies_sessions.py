from common_imports import *

studies = f.studies()
subjects = f.subjects()


@dataclass
class Row:
    StudiesID: int
    SubjectID: int
    SessionStartDate: date
    SessionEndDate: date
    SessionCapacity: int
    SessionGuestCapacity: int
    SessionPrice: float


data = []
for s in studies:
    for i in range(30):
        start_date = faker.date_time_between(
            start_date=s.StudiesStartDate, end_date=s.StudiesEndDate
        )
        data.append(
            asdict(
                Row(
                    StudiesID=s.StudiesID,
                    SubjectID=random.choice(subjects).SubjectID,
                    SessionStartDate=start_date,
                    SessionEndDate=start_date + timedelta(days=3),
                    SessionCapacity=random.randint(25, 100),
                    SessionGuestCapacity=random.randint(0, 10),
                    SessionPrice=round(random.randrange(30, 300), 2),
                )
            )
        )
insert_data(data, "StudiesSessions")
