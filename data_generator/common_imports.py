import f
from faker import Faker
import random
from dataclasses import dataclass, asdict
from datetime import date, timedelta, datetime
from connection import create_connection
from faker.providers import BaseProvider
from insert_data import insert_data

Faker.seed(2137)
faker = Faker("pl_PL")
