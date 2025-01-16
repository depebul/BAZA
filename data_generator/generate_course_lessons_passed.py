from common_imports import *

students = f.students()
lessons = f.course_lessons()
modules = f.course_modules_passed()


@dataclass
class Row:
    StudentID: int
    LessonID: int


data = []
for m in modules:
    for l in lessons:
        if l.ModuleID == m.ModuleID:
            data.append(asdict(Row(StudentID=m.StudentID, LessonID=l.LessonID)))

insert_data(data, "CourseLessonsPassed")
