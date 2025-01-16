from common_imports import *

students = f.students()
webinars = f.webinars()


@dataclass
class Row:
    StudentID: int
    WebinarID: int


data = []
for s in students:
    for w in webinars:
        if random.randint(1, 100) < 6:
            data.append(asdict(Row(StudentID=s.StudentID, WebinarID=w.WebinarID)))
insert_data(data, "WebinarsPassed")
