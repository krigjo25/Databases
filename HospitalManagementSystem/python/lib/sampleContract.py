#####################################################

#   This document only contains the back-end coding,

# By krigjo25
#####################################################

#   Python Responsories
import sys
from os import getenv


#   Database    Responsories
import mariadb

#   dotenv Responsories
from dotenv import load_dotenv

#   Library Responsories

from lib.dictionaries import Dictionaries

#   ReportLab Resposories
from reportlab.lib.colors import blue
from reportlab.lib.pagesizes import A4, letter
from reportlab.pdfgen.canvas import Canvas,rl_config

load_dotenv()

class contractSample (Canvas):
    def __init__(self, filename='sampleContract.pdf', pagesize=A4, bottomup=1, pageCompression=0, encoding=rl_config.defaultEncoding, verbosity=0, encrypt=None):
        super().__init__(filename, pagesize, bottomup, pageComperssion, encodig, verbosity, encrypt)
        self.conn = mariadb.connect(
                                    host=getenv('HOST'),
                                    user=getenv('USERNAME'),
                                    port=INT(getenv('PORT')),
                                    password=getenv('PASSWORD'),
                                    database=getenv('DATABASE')
        )
        self.cur = self.conn.cursor()

    def PDFHeader(self):
        #   Document title
        title = f'Employeer Contratct at HospitalName'
        self.setFont('Hevetica-BoldOblique', 20)
        self.drawString(200, 800, title)

        #   About the firm

        #   About the employeer

        return

    def PDFBOdy(self):
        #   Contract Information


        return

    def PDFFooter(self):

        self.line(0,20,890,20)
        self.setFont('Helvetica', 10)
        self.drawString(50,7,'Logo')
        self.drawString(150, 7, 'HospitalName')
        self.drawString(250, 7, 'HospitalNumber')
        self.drawString(350, 7, 'HospitalAddress')
        self.drawString(450, 7, 'ZipCode, City')
        self.line(0,3,890,3)

        return