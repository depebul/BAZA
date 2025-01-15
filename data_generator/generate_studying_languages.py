from common_imports import *

students = f.students()
languages = f.languages()


@dataclass
class Row:
    StudentID: int
    LanguageID: int


data = []
for i in range(len(students)):
    data.append(
        asdict(
            Row(
                StudentID=students[i].StudentID,
                LanguageID=random.choice(languages).LanguageID,
            )
        )
    )
insert_data(data, "StudyingLanguages")
