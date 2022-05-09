#   Python Responsories
from os import getenv
from dotenv import load_dotenv


#   Library responsories
from pylib.databasePython import MariaDB
from pylib.patientJournal import PDFCanvas
from pylib.customFunctions import UploadFile

load_dotenv()

def PDFSetup():
 
    #   Classes initialization
    db = MariaDB()
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
    #u.generatePDF('patientJournal', '/home/kriss/Documents/Coding/Database/patientJournals/patientJournal.pdf')#, f'{pid[0]}')
    

if __name__ == '__main__':
    PDFSetup()