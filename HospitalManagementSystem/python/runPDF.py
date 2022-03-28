#   Python Responsories
import mariadb
from os import getenv
from dotenv import load_dotenv

#   Library responsories
from lib.patientJournal import PDFCanvas
from lib.uploadbiodata import UploadFile
from lib.mariadbConnector import sFR
load_dotenv()

def PDFSetup():

    #   Clasees initialization        print(data)
    c = PDFCanvas()
    u = UploadFile()

    #   PDF Canvas
        #   Conctact information
    c.BodyHeader()

        #   Hospital visits
    c.BodyMain()

        #   Logo and firm
    c.BodyFooter()
    c.showPage()
    c.save()
    #u.generatePDF('patientJournal', '/home/kriss/Documents/Coding/Database/patientJournal.pdf')#, f'{pid[0]}')
    

if __name__ == '__main__':
    PDFSetup()