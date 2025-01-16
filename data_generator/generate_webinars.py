from common_imports import *

employees = f.employees()
translating_languages = f.translating_languages()


@dataclass
class Row:
    WebinarName: str
    WebinarStartDate: datetime
    WebinarEndDate: datetime
    WebinarDescription: str
    WebinarLanguageID: int
    WebinarPrice: float
    WebinarTranslatorID: int
    WebinarTeacherID: int
    WebinarMeetingLink: str
    WebinarAccessDateEnd: datetime
    WebinarRecordingLink: str


data = []
for i in range(430):
    start_date = faker.date_time_between(start_date="-1y", end_date="+1y")
    translator = random.choice(translating_languages)
    data.append(
        asdict(
            Row(
                WebinarName=faker.sentence(nb_words=3, variable_nb_words=True),
                WebinarStartDate=start_date,
                WebinarEndDate=start_date + timedelta(hours=2),
                WebinarDescription=faker.text(max_nb_chars=200),
                WebinarLanguageID=translator.LanguageID,
                WebinarPrice=(
                    None
                    if random.randint(1, 2) == 1
                    else round(random.uniform(5.0, 200.0), 2)
                ),
                WebinarTranslatorID=translator.EmployeeID,
                WebinarTeacherID=random.randint(1, 70),
                WebinarMeetingLink=faker.url(),
                WebinarAccessDateEnd=start_date + timedelta(days=30),
                WebinarRecordingLink=faker.url(),
            )
        )
    )
insert_data(data, "Webinars")
