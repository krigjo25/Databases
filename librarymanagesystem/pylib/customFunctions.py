#   Python responsories
from os import getenv
from datetime import datetime, date

#   Database responsories
from databasePython import mariaDB

#   dotenv Responsories
from dotenv import load_dotenv


load_dotenv()

#   yagMail Responsories


class Calculators():
    '''         Calculators     

        DateCountDown :
            Calculates how many years, months days left
    '''

    def __init__(self):
        #   Initializing the classes

        pass

    def DateCountDown(self, arg):
        '''
            Calculates how many days left
            from today to arg
        '''
        today = date.today()
        arg = arg - today
        return arg