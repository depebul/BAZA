from common_imports import *

languages = f.languages()


@dataclass
class Row:
    CourseName: str
    CourseModuleQuantity: int
    CourseDescription: str
    CourseLanguageID: int
    CoursePrice: float
    CourseStartDate: date
    CourseEndDate: date
    CourseCapacity: int
    CourseRecordingLink: str


data = []
for i in range(430):
    start_date = faker.date_between(start_date="-1y", end_date="+1y")
    data.append(
        asdict(
            Row(
                CourseName=faker.sentence(nb_words=3, variable_nb_words=True),
                CourseModuleQuantity=random.randint(2, 7),
                CourseDescription=faker.text(max_nb_chars=200),
                CourseLanguageID=random.choice(languages).LanguageID,
                CoursePrice=round(random.uniform(50.0, 1000.0), 2),
                CourseStartDate=start_date,
                CourseEndDate=start_date + timedelta(days=90),
                CourseCapacity=random.randint(25, 200),
                CourseRecordingLink=(
                    None if start_date > date.today() else faker.password(length=8)
                ),
            )
        )
    )
insert_data(data, "Courses")
