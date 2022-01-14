from lib.patientJournal import PDFCanvas
from lib.insertToJournal import PDFsql

def PDFSetup():
    #   Initializing the class

    c = PDFCanvas()
    c.BodyHeader()
    #c.BodyMain()
    #c.BodyFooter()
    c.showPage()
    c.save()
    

if __name__ == '__main__':
    PDFSetup()