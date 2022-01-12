#   Database    Responsories
from mariadb import connect, cur

#   Python Responsories
from os import getenv, startfile

#   dotenv Responsories
from dotevn import load_env

#   ReportLab Resposories
from reportlab.pdfgen.canvas import Canvas


load_env()

class CreatePDF(Canvas):
    def __init__(self, filename='patientJournal.pdf'):
        self.conn = connect(
                            user= getenv('USERNAME'),
                            port= int(getenv('PORT')),
                            password = getenv('PASSWORD'),
                            database = getenv('DATABASE')
        )
        pass