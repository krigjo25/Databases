#   Python Responsories
import mariadb
from os import getenv
from dotenv import load_dotenv
from lib.customFunctions import DatabaseConnection

#   Library responsories
from lib.patientJournal import PDFCanvas
from lib.customFunctions import UploadFile

load_dotenv()

def PDFSetup():
 
    #   Classes initialization
    c = PDFCanvas()
    u = UploadFile()
    db = DatabaseConnection()

    #   PDF Canvas
    #   Health information
    c.BodyHeader()

        #   Hospital visits
    #c.BodyMain()

    #   Logo and firm
    c.BodyFooter()
    c.showPage()
    c.save()

    #   Uploading the pdf file
    #u.generatePDF('patientJournal', '/home/kriss/Documents/Coding/Database/patientJournal.pdf')#, f'{pid[0]}')
    

if __name__ == '__main__':
    PDFSetup()