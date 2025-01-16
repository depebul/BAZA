from common_imports import *

students = f.students()
lessons = f.studies_lessons()
sessions = f.sessions()


@dataclass
class Row:
    StudentID: int
    LessonID: int


@dataclass
class Row2:
    StudentID: int
    StudiesID: int
    StudentGrade: int


studies = []
for i in range(len(lessons)):
    for ses in sessions:
        if ses.SessionID == lessons[i].SessionID:
            studies.append(ses.StudiesID)


data = []
data2 = []
for s in students:
    r = random.choice(range(1, 21))
    for i in range(len(lessons)):
        if studies[i] == r and random.randint(1, 10) > 3:
            data.append(
                asdict(Row(StudentID=s.StudentID, LessonID=lessons[i].LessonID))
            )
    if random.randint(1, 10) > 8:
        data2.append(
            asdict(
                Row2(
                    StudentID=s.StudentID,
                    StudiesID=r,
                    StudentGrade=random.randint(3, 5),
                )
            )
        )

insert_data(data, "StudiesLessonsPassed")
insert_data(data2, "StudentStudiesGrades")
