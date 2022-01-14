#####################################################

#   This document only contains the back-end coding,

# By krigjo25
#####################################################

#   Database    Responsories
import mariadb

#   Python Responsories
import sys
from os import getenv

#   dotenv Responsories
from dotenv import load_dotenv

#   ReportLab Resposories
from reportlab.lib.colors import blue
from reportlab.pdfgen.canvas import Canvas,rl_config
from reportlab.lib.pagesizes import A4, letter

load_dotenv()

class PDFCanvas (Canvas):

    def __init__(self, filename='patientJournal.pdf', pagesize=A4, bottomup=1, pageCompression=0, encoding=rl_config.defaultEncoding, verbosity=0, encrypt=None):
        super().__init__(filename,pagesize, bottomup, pageCompression, encoding, verbosity, encrypt)
        self.height, self.width = letter

        self.conn = mariadb.connect(
                                host=getenv('HOST'),
                                user= getenv('USERNAME'),
                                port= int(getenv('PORT')),
                                password = getenv('PASSWORD'),
                                database = getenv('DATABASE')
            )
        self.cur = self.conn.cursor()

    def BodyHeader(self):

        #   Initializing the SQL Statement, procsessing it, and fetch the statement and close the
        #   Personal info about the given patient

        query = 'SELECT * FROM patient;'
        cur = self.cur.execute(query)
        data = self.cur.fetchall()

        self.conn.close()
        #   Initializing a list for the SQL values

        patientData = []

        for i in data:
            patientData.append(i)

        # Declaring variables fetched from Database
        pid = patientData[0][0]
        age = patientData[0][2]
        sex = patientData[0][3]
        pName = patientData[0][1]
        phone = patientData[0][4]
        email = patientData[0][5]
        address = 'streetName (nr), Apartment 2D'
        zipcode = '00000 NEWYORK'
        
        bType = patientData[0][6]
        aCode = patientData[0][7]
        dCode = patientData[0][8]
        arterise = '***********************************************************************************************'

        
        #   Title of the document
        docTitle = f'Patient Journal of {pName} {pid}'

        self.setFont('Helvetica-BoldOblique', 20)
        self.drawString(200, 800, docTitle)

        #   Main information
        #   Front end information we get from the user

        
        self.setFont('Helvetica', 18)
        self.drawString( 50, 700, 'Age')
        self.drawString( 100, 700, 'Sex')

        self.setFont('Helvetica', 16)
        self.drawString( 58, 675, f'{age}')
        self.drawString( 108, 675, f'{sex}')

        #   ContactInformation
        self.setFont('Helvetica', 18)
        self.drawString( 50, 600, 'Contact Information')

        self.setFont('Helvetica', 16)
        self.drawString( 50, 575, f'{address}')
        self.drawString( 50, 550, f'{zipcode}')
        self.drawString( 290, 575, f'{phone}')
        self.drawString( 290, 550, f'{email}')

        #   Footer information
            #   Next Appointmennt
            #   Stars

        self.setFont('Helvetica', 16)
        self.drawString( 60, 475, f'Next appointment')
        self.drawString( 60, 450, 'dd.mm-yy')
        self.drawString( 0, 400, f'{arterise}')

    def BodyMain(self):
        #   Initializing the class
        c = PDFCanvas()
        self.setFont('Halvetica', 16)

#   What the person has visited

    def BodyFooter(self):
        #   Initializing the class
        c = PDFCanvas()    

#   Hospital name
#   Contactinfo
#   organization information
