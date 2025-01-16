from common_imports import *


@dataclass
class Row:
    CourseModuleMeetingTypeName: str


types = ["stationary", "on-line sync", "on-line async", "hybrid"]


data = []
for t in types:
    data.append(
        asdict(
            Row(
                CourseModuleMeetingTypeName=t,
            )
        )
    )
insert_data(data, "CourseModuleMeetingTypes")
