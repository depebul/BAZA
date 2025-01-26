from common_imports import *

ow = f.orderWebinars()
oc = f.orderCourses()
ost = f.orderStudies()
ose = f.orderSessions()
details = f.orderDetails()
orders = f.orders()
students = f.students()


def findStudentID(id):
    return [x.StudentID for x in students if x.UserID == id][0]


@dataclass
class RowOw:
    StudentID: int
    WebinarID: int
    WebinarBoughtDate: datetime
    WebinarAccessDateEnd: datetime


@dataclass
class RowOc:
    StudentID: int
    CourseID: int


@dataclass
class RowOst:
    StudentID: int
    StudiesID: int


@dataclass
class RowOse:
    StudentID: int
    SessionID: int


data_ow = []
data_oc = []
data_ost = []
data_ose = []
# s = set()
# for e in ow:
#     oid = [x.OrderID for x in details if x.OrderDetailID == e.OrderDetailID][0]
#     order = [x for x in orders if x.OrderID == oid][0]
#     d = (findStudentID(order.UserID), e.WebinarID)
#     if d not in s:
#         data_ow.append(
#             asdict(
#                 RowOw(
#                     StudentID=findStudentID(order.UserID),
#                     WebinarID=e.WebinarID,
#                     WebinarBoughtDate=order.OrderDate,
#                     WebinarAccessDateEnd=order.OrderDate + timedelta(days=30),
#                 )
#             )
#         )
#         s.add((findStudentID(order.UserID), e.WebinarID))
s = set()
for e in oc:
    oid = [x.OrderID for x in details if x.OrderDetailID == e.OrderDetailID][0]
    id = [x.UserID for x in orders if x.OrderID == oid][0]
    d = (findStudentID(id), e.CourseID)
    if d not in s:
        data_oc.append(asdict(RowOc(StudentID=findStudentID(id), CourseID=e.CourseID)))
        s.add((findStudentID(id), e.CourseID))
s = set()
for e in ost:
    oid = [x.OrderID for x in details if x.OrderDetailID == e.OrderDetailID][0]
    id = [x.UserID for x in orders if x.OrderID == oid][0]
    d = (findStudentID(id), e.StudiesID)
    if d not in s:
        data_ost.append(
            asdict(RowOst(StudentID=findStudentID(id), StudiesID=e.StudiesID))
        )
        s.add((findStudentID(id), e.StudiesID))
s = set()
for e in ose:
    oid = [x.OrderID for x in details if x.OrderDetailID == e.OrderDetailID][0]
    id = [x.UserID for x in orders if x.OrderID == oid][0]
    d = (findStudentID(id), e.SessionID)
    if d not in s:
        data_ose.append(
            asdict(RowOse(StudentID=findStudentID(id), SessionID=e.SessionID))
        )
        s.add((findStudentID(id), e.SessionID))

# insert_data(data_ow, "StudentBoughtWebinars")
insert_data(data_oc, "StudentBoughtCourses")
insert_data(data_ost, "StudentBoughtStudies")
insert_data(data_ose, "StudentBoughtSessions")
