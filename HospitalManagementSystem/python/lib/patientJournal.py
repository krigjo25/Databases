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

#   Library Responsories

from lib.dictionaries import Dictionaries

#   ReportLab Resposories
from reportlab.lib.colors import blue
from reportlab.lib.pagesizes import A4, letter
from reportlab.pdfgen.canvas import Canvas,rl_config

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
        adrs = patientData [0][6]
        zipNum = patientData[0][7]
        zipCode = Dictionaries.postalCode(patientData[0][7])
        
        bType = patientData[0][8]
        alC = patientData[0][9]#[0]
        doC = patientData[0][10]#[0]
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
        self.drawString(150, 700, 'BloodType')

        self.setFont('Helvetica', 16)
        self.drawString( 58, 675, f'{age}')
        self.drawString( 108, 675, f'{sex}')
        self.drawString(158, 675, f'{bType}')

        #   ContactInformation
        self.setFont('Helvetica', 18)
        self.drawString( 50, 600, 'Contact Information')

        self.setFont('Helvetica', 16)
        self.drawString( 50, 550, f'{phone},')
        self.drawString( 50, 525, f'{email}')
        self.drawString( 50, 475, f'{adrs}')
        self.drawString( 60, 450, f'{zipNum}, {zipCode}')
        self.drawString( 0, 400, f'{arterise}')

                #   illnesses

        self.setFont('Helvetica', 18)
        self.drawString( 300, 700, 'Diagnosis')

        self.setFont('Helvetica', 16)
        self.drawString( 300, 650, f'{doC},')
        self.drawString( 300, 625, f'{doC}')
        self.drawString( 300, 600, f'{doC}')
        self.drawString( 300, 575, f'{doC}')

        self.drawString( 400, 700, 'Recommended Treatment')

        self.setFont('Helvetica', 16)
        self.drawString( 425, 650, f'{doC},')
        
        self.drawString( 425, 625, f'{doC}')
        self.drawString( 425, 600, f'{doC}')
        self.drawString( 425, 575, f'{doC}')

        self.setFont('Helvetica', 18)
        self.drawString( 300, 525, 'Alergies')

        self.setFont('Helvetica', 16)
        self.drawString( 300, 500, f'{alC},')
        self.drawString( 300, 475, f'{alC}')
        self.drawString( 300, 450, f'{alC}')
        self.drawString( 300, 425, f'{alC}')

        self.drawString( 400, 525, 'Recommended Treatment')

        self.setFont('Helvetica', 16)
        self.drawString( 425, 500, f'{alC},')
        self.drawString( 425, 475, f'{alC}')
        self.drawString( 425, 450, f'{alC}')
        self.drawString( 425, 425, f'{alC}')

    def BodyMain(self):
        #   Initializing the class
        #self.setFont('Halvetica', 16)
        pass
#   What the person has visited
#   Notes from the doctor


    def BodyFooter(self):
        #   Line Through
        self.setFont('Helvetica', 10)
        self.drawString( 0, 5, f'Logo')
        self.drawString( 50, 5, f'HospitalName')
        self.drawString( 125, 5, f'HospitalNumber')
        self.drawString( 200, 5, f'HospitalAddress')
        self.drawString( 275, 5, f'ZipCode, City')
