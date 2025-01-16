from common_imports import *

meeting_types = f.course_module_meeting_types()
courses = f.courses()


@dataclass
class Row:
    CourseID: int
    ModuleName: str
    ModuleDescription: str
    ModuleLanguageID: int
    CourseModuleMeetingTypeID: int
    CourseModuleLessonQuantity: int


data = []
for c in courses:
    for i in range(c.CourseModuleQuantity):
        start_date = faker.date_between(
            start_date=c.CourseStartDate, end_date=c.CourseEndDate - timedelta(days=3)
        )
        data.append(
            asdict(
                Row(
                    CourseID=c.CourseID,
                    ModuleName=faker.sentence(nb_words=3, variable_nb_words=True),
                    ModuleDescription=faker.text(max_nb_chars=200),
                    ModuleLanguageID=c.CourseLanguageID,
                    CourseModuleMeetingTypeID=random.choice(
                        meeting_types
                    ).CourseModuleMeetingTypeID,
                    CourseModuleLessonQuantity=random.randint(2, 8),
                )
            )
        )
insert_data(data, "CourseModules")
