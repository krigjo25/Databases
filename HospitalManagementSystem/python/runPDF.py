#   Library responsories
from lib.patientJournal import PDFCanvas
from lib.uploadbiodata import UploadFile

def PDFSetup():

    #   Clasees initialization
    c = PDFCanvas()
    u = UploadFile()

    #   PDF Canvas module
    c.BodyHeader()
    #c.BodyMain()
    #c.BodyFooter()
    c.showPage()
    c.save()

    #   UploadFile module
    u.generatePDF('patientJournal', '/home/kriss/Documents/Coding/Database/patientJournal.pdf', 100)

    

if __name__ == '__main__':
    PDFSetup()