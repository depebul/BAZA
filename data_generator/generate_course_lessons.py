from common_imports import *

modules = f.modules()
translators = f.translating_languages()
teachers = f.teaching_languages()


@dataclass
class Row:
    ModuleID: int
    CourseID: int
    LessonName: str
    LessonDescription: str
    LessonLanguageID: int
    LessonMeetingLink: str
    LessonMeetingPlace: str
    LessonMeetingDateStart: datetime
    LessonMeetingDateEnd: datetime
    LessonCapacity: int
    CourseLessonMeetingTypeID: int
    IsTranslatedToPolish: bool
    TranslatorID: int
    TeacherID: int


data = []
for m in modules:
    for i in range(m.CourseModuleLessonQuantity):
        start_date = faker.date_between(start_date="-1m", end_date="+1m")
        meetingtype = (
            random.choice([1, 2, 3])
            if m.CourseModuleMeetingTypeID == 4
            else m.CourseModuleMeetingTypeID
        )
        isTranslated = random.randint(5, 6) == 5
        data.append(
            asdict(
                Row(
                    ModuleID=m.ModuleID,
                    CourseID=m.CourseID,
                    LessonName=faker.sentence(nb_words=3, variable_nb_words=True),
                    LessonDescription=faker.text(max_nb_chars=200),
                    LessonLanguageID=m.ModuleLanguageID,
                    LessonMeetingLink=faker.password(length=12),
                    LessonMeetingPlace=faker.word() if meetingtype == 1 else "online",
                    LessonMeetingDateStart=start_date,
                    LessonMeetingDateEnd=start_date + timedelta(minutes=90),
                    LessonCapacity=random.randint(15, 100),
                    CourseLessonMeetingTypeID=meetingtype,
                    IsTranslatedToPolish=isTranslated,
                    TranslatorID=(
                        random.choice(translators).EmployeeID if isTranslated else None
                    ),
                    TeacherID=random.choice(teachers).EmployeeID,
                )
            )
        )
insert_data(data, "CourseLessons")
