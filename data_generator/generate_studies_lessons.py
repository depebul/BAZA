from common_imports import *

sessions = f.sessions()
subjects = f.subjects()
translators = f.translating_languages()
teachers = f.teaching_languages()


@dataclass
class Row:
    SessionID: int
    SubjectID: int
    LessonName: str
    LessonDescription: str
    LessonLanguageID: int
    LessonMeetingLink: str
    LessonMeetingPlace: str
    LessonMeetingDateStart: datetime
    LessonMeetingDateEnd: datetime
    LessonCapacity: int
    LessonGuestCapacity: int
    LessonPrice: float
    LessonGuestPrice: float
    IsTranslatedToPolish: bool
    TranslatorID: int
    TeacherID: int
    StudiesLessonMeetingTypeID: int


data = []
for s in sessions:
    for i in range(3):
        start_date = faker.date_time_between(
            start_date=s.SessionStartDate, end_date=s.SessionEndDate
        )
        translator = (
            random.choice(translators) if random.choice([True, False]) else None
        )
        price = round(random.uniform(0, 50), 2)
        teacher = random.choice(teachers)
        meetingtype = random.randint(1, 3)
        data.append(
            asdict(
                Row(
                    SessionID=s.SessionID,
                    SubjectID=random.choice(subjects).SubjectID,
                    LessonName=faker.sentence(nb_words=3, variable_nb_words=True),
                    LessonDescription=faker.text(max_nb_chars=200),
                    LessonLanguageID=teacher.LanguageID,
                    LessonMeetingLink=faker.password(length=12),
                    LessonMeetingPlace=faker.word() if meetingtype == 1 else "online",
                    LessonMeetingDateStart=start_date,
                    LessonMeetingDateEnd=start_date + timedelta(minutes=90),
                    LessonCapacity=random.randint(20, 100),
                    LessonGuestCapacity=random.randint(0, 10),
                    LessonPrice=price,
                    LessonGuestPrice=price + round(random.randrange(0, 10), 2),
                    IsTranslatedToPolish=translator is not None,
                    TranslatorID=(
                        translator.EmployeeID if translator is not None else None
                    ),
                    TeacherID=teacher.EmployeeID,
                    StudiesLessonMeetingTypeID=meetingtype,
                )
            )
        )


insert_data(data, "StudiesLessons")
