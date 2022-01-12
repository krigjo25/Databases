#   Database    Responsories
import mariadb

#   Python Responsories
from os import getenv

#   dotenv Responsories
from dotenv import load_dotenv

#   ReportLab Resposories
from reportlab.pdfgen.canvas import Canvas,rl_config

#   PDF Responsories
#from lib.classes.createCanvas import CreatePDF
load_dotenv()

class PDFCanvas (Canvas):

    def __init__(self, filename='patientJournal.pdf', pagesize=(595.27,841.89), bottomup=1, pageCompression=0, encoding=rl_config.defaultEncoding, verbosity=0, encrypt=None):
        super().__init__(filename,pagesize, bottomup, pageCompression, encoding, verbosity, encrypt)
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
    def HeaderPDF(self):
        #   Initializing the class
        c = PDFCanvas()

#   Personal info about the patient
   
    def main(self):
        #   Initializing the class
        c = PDFCanvas()

#   What the person has visited

    def footer(self):
        #   Initializing the class
        c = PDFCanvas()    

#   Hospital name
#   Contactinfo
#   organization information

def PDFSetup():

    #   Initializing the class
    c = PDFCanvas()
    #   Save and show the page
    c.save()
    c.showPage()

if __name__ == '__main__':
    PDFSetup()