from common_imports import *

students = f.students()


@dataclass
class Row:
    StudentID: int
    InternshipID: int


data = []
for s in students:
    internship = random.choice(range(1, 31))
    data.append(asdict(Row(StudentID=s.StudentID, InternshipID=internship)))
insert_data(data, "InternshipMeetingsPassed")
