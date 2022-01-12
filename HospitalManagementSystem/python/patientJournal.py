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
    def __init__(self, filename='patientJournal.pdf', pagesize=(595.27,841.89), bottomup=1, pageCompression=0, encoding=rl_config.defaultEncoding, verbosity=0, encrypt):
        super().__init__(filename,pagesize, bottomup, pageCompression, encoding, verbosity, encrypt)
        self.conn = connect(
                            user= getenv('USERNAME'),
                            port= int(getenv('PORT')),
                            password = getenv('PASSWORD'),
                            database = getenv('DATABASE')
        )
https://www.reportlab.com/docs/reportlab-userguide.pdf