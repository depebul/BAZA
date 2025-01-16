from common_imports import *

students = f.students()
modules = f.course_modules()


@dataclass
class Row:
    StudentID: int
    ModuleID: int


data = []
for s in students:
    for m in modules:
        if random.randint(1, 100) == 1:
            data.append(asdict(Row(StudentID=s.StudentID, ModuleID=m.ModuleID)))
print("ready for insert")
insert_data(data, "CourseModulesPassed")
