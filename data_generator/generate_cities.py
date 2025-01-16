from common_imports import *


@dataclass
class Row:
    CityName: str


cities = ["Kraków", "Warszawa", "Poznań", "Wrocław", "Łódź"]

data = []
for c in cities:
    data.append(asdict(Row(CityName=c)))
insert_data(data, "Cities")
