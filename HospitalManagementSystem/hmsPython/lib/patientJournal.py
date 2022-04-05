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
        x = 0
        #   initializing the mariadb connection
        
        database = getenv('database3')
        query = f'SHOW TABLES;'

        sqlData = dc.selectFromTable(database, query)

        query = f'SELECT * FROM {sqlData[0][0]};'
        sqlData = dc.selectFromTable(database, query)

        #   PDF Document
        self.setFont('Helvetica-Bold', 18)
        self.drawString(150, 775, f'Patient Journal of {sqlData[x][1]}, {sqlData[x][0]}')

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
        self.drawString(90, 660, f'{sqlData[x][2]}')
        self.drawString(350, 660, f'{sqlData[x][3]}')
        self.drawString(235, 660, f'{sqlData[x][4]}')
        self.drawString(535, 660, f'{kalc.CalculateAge(sqlData[x][2])}')

        #   Health Information about the patient
        self.drawString(90, 610, f'Organ : {sqlData[x][8]}, Blood : {sqlData[x][9]}')
        

        self.drawString(360, 610, f'{round(sqlData[x][10],2)}')
        self.drawString(435, 610, f'{round(sqlData[x][11], 2)} cm')
        self.drawString(525, 610, f'{kalc.Calculatebmi(sqlData[x][10], sqlData[x][11], kalc.CalculateAge(sqlData[0][2]), sqlData[0][4])}')
        self.drawString(250, 610, f'{sqlData[x][12]}')
        
        #Donor status


        #   Contact Information
        self.setFont('Helvetica', 14)
        self.drawString(75, 545, f'{sqlData[x][5]},')
        self.drawString(75, 525, f'{sqlData[x][6]},')
        self.drawString(75, 505, f'{sqlData[x][7]}, {Dictionaries.AmericanPostalCodes(sqlData[0][8])}')

        #   Emergency contacts

        self.drawString(350, 550, f'{sqlData[x][21]}, {sqlData[x][22]}')
        self.drawString(350, 525, f'{sqlData[x][23]}, {sqlData[x][24]}')
        self.drawString(350, 500, f'{sqlData[x][25]}, {sqlData[x][26]}')
        self.drawString(90, 425, f'{sqlData[x][13]}')

        
        #   Alergies and diagnosis
        #   x Listing the values automatically


        self.setFont('Helvetica-Bold', 16)
        self.drawString(75, 300, 'Alergies')
        self.drawString(75, 375, 'Diagnosis')
        self.drawString(350, 375, 'Suggested Treatments')
        self.drawString(350, 300, 'Suggested Treatments')

        self.setFont('Helvetica', 14)
        self.drawString(90, 350, f'{sqlData[x][14]}')
        self.drawString(90, 275, f'{sqlData[x][15]}')

        #   Initializing the connection the database


        database = getenv('database4')
        query = 'SHOW TABLES;'
        queryData = dc.selectFromTable(database, query)


        #   Alergies
        query = f'SELECT * from {queryData[0][0]} WHERE alergyID = \'{sqlData[x][14][0:5]}\';'
        data = dc.selectFromTable(database, query)

        self.drawString(350, 350, f'{data[x][4]}')

        
        #   Diagnosis

        query = f'SELECT * from {queryData[3][0]} WHERE diagnoseID = \'{sqlData[x][15][0:5]}\';'
        sqlData = dc.selectFromTable(database, query)
        self.drawString(350, 275, f'{sqlData[0][4]}')

        #   Page End Lines
        self.setFont ('Helvetica', 30)
        #self.line(0,400,890,400)

        dc.closeConnection()
        return


    def BodyMain(self):
        
        #   Class initializion
        dc = mariaDB()
        
        #  retrieveing the sql Data
        database = getenv('database2')
        
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
            
            query = f'SELECT * FROM {sqlData[x][3]};'

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