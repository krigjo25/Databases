#####################################################

#   This document only contains the back-end coding,

# By krigjo25
#####################################################

#   Python Responsories
import sys
from os import getenv

#   dotenv Responsories
from dotenv import load_dotenv

#   Library Responsories
from lib.databasePython import mariaDB
from lib.customFunctions import Dictionaries, Calculators

#   ReportLab Resposories
from reportlab.lib.colors import blue
from reportlab.lib.pagesizes import A4, letter
from reportlab.pdfgen.canvas import Canvas, rl_config

load_dotenv()

class PDFCanvas (Canvas):
    # Creating a PDF title with the three first letters in the FirstName, 
    # LastName and four last digits in the ssn
    def __init__(self, filename='SampleJournal.pdf', pagesize=A4, bottomup=1, pageCompression=0, encoding=rl_config.defaultEncoding, verbosity=0, encrypt=None):
        super().__init__(filename,pagesize, bottomup, pageCompression, encoding, verbosity, encrypt)

        self.height, self.width = letter

    def BodyHeader(self):

        #   Initializing classes
        kalc = Calculators()
        dc = mariaDB()

        #   initializing the mariadb connection
        
        database = getenv('database2')
        query = f'SELECT * FROM patientRegistrations;'

        sqlData = dc.selectFromTable(database, query)
        print(sqlData)
        #   PDF Document
        self.setFont('Helvetica-Bold', 18)
        self.drawString(150, 775, f'Patient Journal of {sqlData[0][1]}, {sqlData[0][0]}')

        #   Main information
        #   Front end information we get from the user

        #   Titles        
        self.setFont('Helvetica-Bold', 18)
        self.drawString(75, 450, 'Primary Doctor')
        self.drawString(75, 725, 'Health Information')
        self.drawString(75, 575, 'Contact Information')
        self.drawString(350, 575, 'Emergency Contacts')
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
        self.drawString(535, 660, f'{kalc.CalculateAge(sqlData[0][2])}')

        #   Health Information about the patient
        if sqlData[0][12] == True:
            self.drawString(90, 610, f'{sqlData[0][12]}')
        else:
            self.drawString(120, 610, f'No')

        self.drawString(360, 610, f'{sqlData[0][8]}')
        self.drawString(435, 610, f'{sqlData[0][9]} cm')
        self.drawString(525, 610, f'{kalc.Calculatebmi(sqlData[0][8], sqlData[0][9], kalc.CalculateAge(sqlData[0][2]), sqlData[0][4])}')
        self.drawString(250, 610, f'{sqlData[0][11]}')
        
        #Donor status


        #   Contact Information
        self.setFont('Helvetica', 14)
        self.drawString(75, 545, f'{sqlData[0][5]},')
        self.drawString(75, 525, f'{sqlData[0][6]},')
        self.drawString(75, 505, f'{sqlData[0][7]}, {Dictionaries.AmericanPostalCodes(sqlData[0][8])}')

        #   Emergency contacts

        self.drawString(350, 550, f'Husband, Jhon Doe, \n 123 123 123')
        self.drawString(350, 525, f'Father, Jhon Doe, \n 123 123 123')
        self.drawString(350, 500, f'Son, Jhon Doe, \n 123 123 123')

        

        self.setFont('Helvetica', 16)
        self.drawString(50, 300, 'Alergies')
        self.drawString(50, 375, 'Diagnosis')
        self.drawString(300, 375, 'Suggested Treatments')
        self.drawString(300, 300, 'Suggested Treatments')

        self.setFont('Helvetica', 14)

        #   Page End Lines
        self.setFont ('Helvetica', 30)
        self.line(0,400,890,400)

        return


    def BodyMain(self):
        
        #   Class initializion
        dc = mariaDB()
        
        #  retrieveing the sql Data
        database = getenv('database1')
        
        #   Get the table by using patientID
        query = f'SELECT * FROM '

        #   Selecting and counting rows
        sqlData = dc.selectFromTable(database, query)
        print(sqlData)

        counter = dc.RowCount(database, getenv('pt1'), query)

        #   Declare and initialize the variables
        rID = 1
        x = 0
        while rID <= counter :

            #  Collecting intel from the given Database
            
            query = f'SELECT * FROM {sqlData[x][3]} WHERE id = {rID};'

            sqlData = dc.selectFromTable(database, query)



            #   Increment the variables by one
            x += 1
            rID += 1
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