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
from lib.customFunctions import Dictionaries, DatabaseConnection, Calculators

#   ReportLab Resposories
from reportlab.lib.colors import blue
from reportlab.lib.pagesizes import A4, letter
from reportlab.pdfgen.canvas import Canvas, rl_config

load_dotenv()

class PDFCanvas (Canvas):

    def __init__(self, filename='SampleJournal.pdf', pagesize=A4, bottomup=1, pageCompression=0, encoding=rl_config.defaultEncoding, verbosity=0, encrypt=None):
        super().__init__(filename,pagesize, bottomup, pageCompression, encoding, verbosity, encrypt)

        self.height, self.width = letter

    def BodyHeader(self):

        #   Initializing classes
        kalc = Calculators()
        dc = DatabaseConnection()
        kalc = Calculators()
        #   initializing the mariadb connection
        
        vID = str(getenv('vID'))
        database = getenv('database2')
        query = f'SELECT * FROM patient WHERE patientID = {vID}'

        sqlData = dc.sFR(database, query)

        area = Dictionaries.AmericanPostalCodes(sqlData[0][8])

        
        #   Health Information about the patient
        bType = sqlData[0][9]

        #   Alergy, diseases, medecines 
        dID = sqlData[0][13]
        aID = sqlData[0][12]#[0]

        query = 'SELECT mID FROM alergies WHERE alergyID = {aID}'
        mID = 'NNNNM'#dc.sFR(getenv('database4'), query)
        
        query = 'SELECT mID FROM diagnoses WHERE diagnoseID = {dID}'
        mID2 = 'NNNNM'#dc.sFR(getenv('database4'), query)

        #   PDF Document
        self.setFont('Helvetica-Bold', 18)
        self.drawString(150, 775, f'Patient Journal of {sqlData[0][1]}, {sqlData[0][0]}')

        #   Main information
        #   Front end information we get from the user

        #   Titles        
        self.setFont('Helvetica-Bold', 18)
        self.drawString(75, 725, 'Health Information')
        self.drawString(75, 575, 'Contact Information')
        self.drawString(350, 575, 'Emergency Contacts')
        self.drawString(75, 450, 'Primary Doctor')
        self.drawString( 225, 400, 'Alergies & diagnosis')
        
        self.setFont('Helvetica-Bold', 16)
        self.drawString(525, 680, 'Age')
        self.drawString(225, 680, 'Sex')
        self.drawString(75, 680, 'birth of Date')
        self.drawString(300, 680, 'Social Security Number')

        #   Blood type, weight, height, bmi and Donor status
        self.drawString(525, 630, 'Bmi')
        self.drawString(350, 630, 'Weight')
        self.drawString(425, 630, 'Height')
        self.drawString(225, 630, 'BloodType')
        self.drawString(75, 630, 'Donor Status')
        
        self.setFont('Helvetica', 12)

        #   General information about the patient
        self.drawString(90, 660, f'{sqlData[0][2]}')
        self.drawString(350, 660, f'{sqlData[0][3]}')
        self.drawString(235, 660, f'{sqlData[0][4]}')
        #self.drawString(505, 660, f'{age}')

        #   Health Information about the patient
        self.drawString(360, 610, f'{sqlData[0][8]}')
        self.drawString(435, 610, f'{sqlData[0][9]}')
        self.drawString(525, 610, f'{sqlData[0][10]}')
        self.drawString(250, 610, f'{sqlData[0][11]}')
        #self.drawString(235, 660, f'{sqlData[0][12]}') DStatus
        #dStatus = sqlData[0][12]
        
        

        #   General Information about the patient
        pid = sqlData[0][0]
        #age = kalc.calculateAge(dateofBirth)


        #   Contact Information
        self.setFont('Helvetica', 14)
        self.drawString(75, 545, f'{sqlData[0][5]},')
        self.drawString(75, 525, f'{sqlData[0][6]},')
        self.drawString(75, 505, f'{sqlData[0][7]},{area}')

        #   Emergency contacts

        #self.setFont('Helvetica', 14)
        #self.drawString(75, 550, f'{icuContact},')
        #self.drawString(75, 525, f'{icuNr},')

        
        '''
                #   illnesses
        self.setFont('Helvetica', 16)
        self.drawString( 300, 575, 'Diagnosis & medical Treatment')
        self.drawString( 300, 525, 'Alergies & Treatments')

        self.setFont('Helvetica', 14)
        '#''Create a list and roll through it''#'
        #self.drawString( 300, 550, f'{doC}, {mid}')
        self.drawString( 325, 500, f'{aID}, {mID}')
        '''
        #   Page End Lines
        self.setFont ('Helvetica', 30)
        self.line(0,400,890,400)
        #self.drawString( 0, 400, f'{arterise}')

        return


    def BodyMain(self):
        
        #   Class inztalation
        dc = DatabaseConnection()
        
        #  retrieveing the sql Data
        #query = f'SELECT * FROM bookings WHERE patientID = {getenv("vID")}' # query = ' SELECT * FROM {getenv('') WHERE patientID = {vID}}
        #sqlData = dc.sFR(getenv('database4'), query)
        
        inn = '1994-23-02'#sqlData[0][1]
        out = '1994-27-02'#sqlData[0][2]
        name = 'patientName' #sqlData[0][0]  
        
        roomName = 'Ward'#sqlData
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
        self.drawString(250,300, f'During {name}last stay at HospitalName')
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