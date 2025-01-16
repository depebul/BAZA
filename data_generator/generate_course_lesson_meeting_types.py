from common_imports import *


@dataclass
class Row:
    CourseLessonMeetingTypeName: str


types = ["stationary", "on-line sync", "on-line async", "hybrid"]


data = []
for t in types:
    data.append(
        asdict(
            Row(
                CourseLessonMeetingTypeName=t,
            )
        )
    )
insert_data(data, "CourseLessonMeetingTypes")
