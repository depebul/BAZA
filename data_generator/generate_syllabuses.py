from common_imports import *

studies = f.studies()


@dataclass
class Row:
    StudiesID: int
    SemesterNumber: int


data = []
for s in studies:
    for sem in range(1, 8):
        data.append(asdict(Row(StudiesID=s.StudiesID, SemesterNumber=sem)))

insert_data(data, "Syllabuses")
