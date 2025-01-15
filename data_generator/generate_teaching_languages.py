from common_imports import *

employees = f.employees()
languages = f.languages()


@dataclass
class Row:
    EmployeeID: int
    LanguageID: int


data = []
for i in range(70):
    data.append(
        asdict(
            Row(
                EmployeeID=employees[i].EmployeeID,
                LanguageID=random.choice(languages).LanguageID,
            )
        )
    )
insert_data(data, "TeachingLanguages")
