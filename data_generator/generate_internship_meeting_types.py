from common_imports import *


@dataclass
class Row:
    InternshipMeetingTypeName: str


types = ["stationary", "on-line sync", "on-line async"]


data = []
for t in types:
    data.append(
        asdict(
            Row(
                InternshipMeetingTypeName=t,
            )
        )
    )
insert_data(data, "InternshipMeetingTypes")
