#   Python Responsories
from os import getenv
from dotenv import load_dotenv


#   Library responsories
from lib.databasePython import mariaDB
from lib.patientJournal import PDFCanvas
from lib.customFunctions import UploadFile

load_dotenv()

def PDFSetup():
 
    #   Classes initialization
    db = mariaDB()
    c = PDFCanvas()
    u = UploadFile()

    #   Creating the PDF

    #   Health information
    c.BodyHeader()

        #   Hospital visits
    #c.BodyMain()

    #   Logo and firm
    #c.BodyFooter()

    c.showPage()
    c.save()

    #   Uploading the pdf file
    #u.generatePDF('patientJournal', '/home/kriss/Documents/Coding/Database/patientJournal.pdf')#, f'{pid[0]}')
    

if __name__ == '__main__':
    PDFSetup()