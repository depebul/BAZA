from common_imports import *


@dataclass
class Row:
    InternshipCompany: str
    InternshipStartDate: date
    StudiesID: int
    InternshipMeetingType: int


data = []
for i in range(30):
    start_date = faker.date_time_between(start_date="-1y", end_date="+1y")
    data.append(
        asdict(
            Row(
                InternshipCompany=f"Petroinform{i}",
                InternshipStartDate=start_date,
                StudiesID=random.randint(1, 20),
                InternshipMeetingType=random.randint(1, 3),
            )
        )
    )
insert_data(data, "Internships")
