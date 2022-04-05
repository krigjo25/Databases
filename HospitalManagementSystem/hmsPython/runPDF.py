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

    #   information about the patient
    c.BodyHeader()

    #   information about the visits
    c.BodyMain()

    #   Save the canvas document
    c.save()

    #   Uploading the pdf file
    u.generatePDF('patientJournal', '/home/kriss/Documents/Coding/Database/patientJournals/patientJournal.pdf')#, f'{pid[0]}')
    

if __name__ == '__main__':
    PDFSetup()