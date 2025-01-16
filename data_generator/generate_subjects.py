from common_imports import *

studies = f.studies()
teachers = f.teaching_languages()
syllabuses = f.sysllabuses()


@dataclass
class Row:
    SubjectName: str
    SubjectDescription: str
    SubjectsCount: int
    CoordinatorID: int
    SyllabusID: int


data = []
for s in studies:
    for sem in range(1, 8):
        data.append(
            asdict(
                Row(
                    SubjectName=faker.sentence(nb_words=3, variable_nb_words=True),
                    SubjectDescription=faker.text(max_nb_chars=200),
                    SubjectsCount=random.randint(4, 20),
                    CoordinatorID=random.choice(teachers).EmployeeID,
                    SyllabusID=random.choice(syllabuses).SyllabusID,
                )
            )
        )

insert_data(data, "Subjects")
