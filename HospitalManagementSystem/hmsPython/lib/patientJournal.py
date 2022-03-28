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
from lib.customFunctions import Dictionaries, DatabaseConnection

#   ReportLab Resposories
from reportlab.lib.colors import blue
from reportlab.lib.pagesizes import A4, letter
from reportlab.pdfgen.canvas import Canvas,rl_config

load_dotenv()

class PDFCanvas (Canvas):

    def __init__(self, filename='SampleJournal.pdf', pagesize=A4, bottomup=1, pageCompression=0, encoding=rl_config.defaultEncoding, verbosity=0, encrypt=None):
        super().__init__(filename,pagesize, bottomup, pageCompression, encoding, verbosity, encrypt)

        self.height, self.width = letter

    def BodyHeader(self):
        dc = DatabaseConnection()
        # initializing the mariadb statements
        value = getenv('value')
        table = getenv('table')
        column2 = getenv('column2')
        database = str(getenv('database1'))
        column = getenv('column')
                        # D
        sqlData = dc.sFR(database, column, table, column2, value)

        #   General Information about the patient
        pid = sqlData[0][0]
        dateofBirth = sqlData[0][2]
        age = sqlData[0][2]
        ssn = sqlData[0][3]
        sex = sqlData[0][4]
        name = sqlData[0][1]
        phone = sqlData[0][5]
        email = sqlData[0][6]
        adrs = sqlData[0][7]
        zipNum = sqlData[0][8]
        zipCode = Dictionaries.postalCode(zipNum)

        
        #   Health Information about the patient
        bType = sqlData[0][9]

        #   Alergy, diseases, medecines 
        dID = sqlData[0][10]
        aID = sqlData[0][9]#[0]
        mID = 'NNNNM' #DatabaseConnection.sFR(database, select, table, where, vID)
        
        #mID2 = DatabaseConnection.sFR(database, mID, table, aID, aID)

        #   PDF Document
        self.setFont('Helvetica-BoldOblique', 20)
        self.drawString(200, 800, f'Patient Journal of {name} {pid}')

        #   Main information
        #   Front end information we get from the user

        #   Titles        
        self.setFont('Helvetica', 18)
        self.drawString( 50, 700, 'Age')
        self.drawString( 200, 700, 'Sex')
        self.drawString(300, 700, 'Social Security Number')

        self.setFont('Helvetica', 16)
        self.drawString( 20, 675, f'{age}')
        self.drawString( 210, 675, f'{sex}')
        self.drawString(350, 675, f'{ssn}')

        #   ContactInformation
        self.setFont('Helvetica', 18)
        self.drawString( 50, 625, 'Contact Information')

        self.setFont('Helvetica', 16)
        self.drawString( 50, 575, f'{phone},')
        self.drawString( 50, 550, f'{email}')
        self.drawString( 50, 525, f'{adrs}')
        self.drawString( 60, 500, f'{zipNum}, {zipCode}')

                #   illnesses

        self.setFont('Helvetica', 18)
        self.drawString( 350, 625, 'Alergies and diagnosis')
        self.drawString( 300, 575, 'Diagnosis & medical Treatment')

        self.setFont('Helvetica', 16)
        #self.drawString( 300, 550, f'{doC}, {mid}')
        #self.drawString( 300, 525, f'{doC}, {mid}')
        #self.drawString( 300, 500, f'{doC}, {mid}')
        #self.drawString( 300, 575, f'{doC}, ')

        self.setFont('Helvetica', 18)
        self.drawString( 300, 525, 'Alergies & Treatments')

        self.setFont('Helvetica', 16)
        self.drawString( 300, 500, f'{aID}, {mID}')

       #   Lines
        self.setFont ('Helvetica', 30)
        self.line(0,400,890,400)
        #self.drawString( 0, 400, f'{arterise}')

        return


    def BodyMain(self):

        #  retrieveing the sql Data
        dc = DatabaseConnection()
        sqlData = dc.sFR(getenv('database1'), getenv('dateName'), getenv('table'), getenv('column2'), getenv('value'))
        
        inn = sqlData[0][1]
        out = sqlData[0][2]
        name = sqlData[0][0]  
        
        roomID = 225
        roomName = 'Ward - Recovery'
        
        reason = 'Demo reason' 
        doctor = 'Jhon Doe'#f'SELECT employeeName FROM relations WHERE patientID = {int(pID)}' 

        #   255 CHARACTERS
        doc =       'amet aliquam id diam maecenas ultricies mi eget mauris pharetra'
        doc1 =      'et ultrices neque ornare aenean euismod elementum nisi quis el-'
        doc2 =      'e ifend quam adipiscing vitae pro in sagittis nisl rhoncus mat-'
        doc3 =      'tis rhoncus urna neque viverra justo nec ultrices du sa'

        #   Document Font
        self.setFont('Helvetica', 20)
        self.drawString(150, 350, f'During {name}\'s at Saint Mary\'s')

        #   Document Text
        self.setFont('Helvetica', 16)
        self.drawString(50, 300, f'{name}\'s last visit')
        self.drawString(50,275, f'{inn}')
        self.drawString(250,300, 'During your last stay at HospitalName')
        self.drawString(250, 275, f'You were visiting {roomName}, {roomID}')
        self.drawString(250, 250, f'Due to {reason}')
        self.drawString(250, 225, f'Between {inn} - {out}')
        self.drawString(50, 175, f'Doctor {doctor}\'s notes')
        self.drawString(50, 150, f'{doc}')
        self.drawString(50, 125, f'{doc1}')
        self.drawString(50, 100, f'{doc2}')
        self.drawString(50, 75, f'{doc3}')

        return

    def BodyFooter(self):
        
        self.line(0,20,890,20)
        self.setFont('Helvetica', 10)
        self.drawString(50, 7, f'Logo')
        self.drawString(150, 7, f'Saint Mary')
        self.drawString(250, 7, f'(474)- 234 - 123 -1234')
        self.drawString(350, 7, f'HospitalAddress')
        self.drawString(450, 7, f'ZipCode, City')
        self.line(0,3,890,3)

        return