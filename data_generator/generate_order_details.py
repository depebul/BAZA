from common_imports import *

orders = f.orders()
currencies = f.currencies()
webinars = f.webinars()
sessions = f.sessions()
studies = f.studies()
courses = f.courses()


@dataclass
class Row:
    OrderID: int
    AmountPaid: float
    AmountToPay: float
    CurrencyID: int
    CurrencyRate: float
    PaidDate: datetime
    PostponementDate: datetime


@dataclass
class RowWebinar:
    WebinarID: int
    OrderDetailID: int


@dataclass
class RowCourse:
    CourseID: int
    OrderDetailID: int


@dataclass
class RowSession:
    SessionID: int
    OrderDetailID: int


@dataclass
class RowStudies:
    StudiesID: int
    OrderDetailID: int


data = []
datawebinar = []
datacourses = []
datastudies = []
datasessions = []
id = 1
for o in orders:
    webinar = random.choice(webinars)
    while webinar.WebinarPrice is None:
        webinar = random.choice(webinars)
    session = random.choice(sessions)
    course = random.choice(courses)
    study = random.choice(studies)
    amountToPay = (
        webinar.WebinarPrice
        + session.SessionPrice
        + course.CoursePrice
        + study.StudiesEntryFee
    )
    amountPaid = (
        amountToPay
        if random.choice([True, False])
        else round(random.uniform(0, float(amountToPay)), 2)
    )
    currency = random.choice(currencies)
    data.append(
        asdict(
            Row(
                OrderID=o.OrderID,
                AmountPaid=amountPaid,
                AmountToPay=amountToPay,
                CurrencyID=currency.CurrencyID,
                CurrencyRate=currency.RateToPLN,
                PaidDate=o.OrderDate,
                PostponementDate=(
                    o.OrderDate + timedelta(hours=24)
                    if random.uniform(0, 1) > 0.97
                    else None
                ),
            )
        )
    )
    datawebinar.append(
        asdict(RowWebinar(WebinarID=webinar.WebinarID, OrderDetailID=id))
    )
    datacourses.append(asdict(RowCourse(CourseID=course.CourseID, OrderDetailID=id)))
    datasessions.append(
        asdict(RowSession(SessionID=session.SessionID, OrderDetailID=id))
    )
    datastudies.append(asdict(RowStudies(StudiesID=study.StudiesID, OrderDetailID=id)))
    id += 1


insert_data(data, "OrderDetails")
insert_data(datawebinar, "OrderWebinars")
insert_data(datasessions, "OrderSessions")
insert_data(datacourses, "OrderCourses")
insert_data(datastudies, "OrderStudies")
