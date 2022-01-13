#   Database    Responsories
import mariadb

#   Python Responsories
from os import getenv

#   dotenv Responsories
from dotenv import load_dotenv

#   ReportLab Resposories
from reportlab.lib.colors import blue
from reportlab.pdfgen.canvas import Canvas,rl_config
from reportlab.lib.pagesizes import A4, letter
#   PDF Responsories
#from lib.classes.createCanvas import CreatePDF
load_dotenv()

class PDFCanvas (Canvas):

    def __init__(self, filename='patientJournal.pdf', pagesize=A4, bottomup=1, pageCompression=0, encoding=rl_config.defaultEncoding, verbosity=0, encrypt=None):
        super().__init__(filename,pagesize, bottomup, pageCompression, encoding, verbosity, encrypt)
        self.height, self.width = letter
    '''    self.conn = mariadb.connect(
                            host=getenv('HOST'),
                            user= getenv('USERNAME'),
                            port= int(getenv('PORT')),
                            password = getenv('PASSWORD'),
                            database = getenv('DATABASE')
        )
        self.cur = self.conn.cur
        self.conn.close
    '''
    def BodyHeader(self):
        #   Personal info about the patient
        patientName, patientID = 'JhonDoe', 0
        #   Title of the document
        docTitle = f'Patient Journal of {patientName} {patientID}'

        self.setFont('Helvetica-BoldOblique', 20)
        self.drawString(200, 800, docTitle)

        #   Main information

        age, sex = 27, 'M'
        address,phone, email = 'streetName (nr), Apartment 2D', '(000)123-312-345', 'jdoe@demo.com'
        zipcode = '00000 NEWYORK'
        
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

        stars = '***********************************************************************************************'
        self.setFont('Helvetica', 16)
        self.drawString( 60, 475, f'Next appointment')
        self.drawString( 60, 450, 'dd.mm-yy')
        self.drawString( 0, 400, f'{stars}')
        footer = ''

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

def PDFSetup():
    #   Initializing the class
    
    c = PDFCanvas()
    c.BodyHeader()
    #c.BodyMain()
    #c.BodyFooter()
    c.save()
    c.showPage()

if __name__ == '__main__':
    PDFSetup()