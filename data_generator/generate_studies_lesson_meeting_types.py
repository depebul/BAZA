from common_imports import *


@dataclass
class Row:
    StudiesLessonMeetingTypeName: str


types = ["stationary", "on-line sync", "on-line async"]


data = []
for t in types:
    data.append(
        asdict(
            Row(
                StudiesLessonMeetingTypeName=t,
            )
        )
    )
insert_data(data, "StudiesLessonMeetingTypes")
