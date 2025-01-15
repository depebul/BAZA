from common_imports import *

users = f.users()
employee_types = f.employee_types()


@dataclass
class Row:
    UserID: int
    EmployeeTypeID: int
    HireDate: date
    Salary: int


data = []
for i in range(100):
    data.append(
        asdict(
            Row(
                UserID=users[i].UserID,
                EmployeeTypeID=2 if i < 70 else 3,
                HireDate=faker.date_of_birth(maximum_age=20, minimum_age=0),
                Salary=random.randint(3000, 20000),
            )
        )
    )
insert_data(data, "Employees")
