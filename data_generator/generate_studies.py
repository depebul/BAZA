from common_imports import *


@dataclass
class Row:
    StudiesDescription: str
    StudiesName: str
    StudiesEntryFee: float
    StudiesStartDate: date
    StudiesEndDate: date
    StudiesCapacity: int


data = []
for i in range(20):
    start_date = faker.date_between(start_date="-5y", end_date="+5y")
    data.append(
        asdict(
            Row(
                StudiesName=faker.sentence(nb_words=3, variable_nb_words=True),
                StudiesDescription=faker.text(max_nb_chars=200),
                StudiesEntryFee=round(random.uniform(300.0, 7000.0), 2),
                StudiesStartDate=start_date,
                StudiesEndDate=start_date + timedelta(days=1500),
                StudiesCapacity=random.randint(25, 300),
            )
        )
    )
insert_data(data, "Studies")
