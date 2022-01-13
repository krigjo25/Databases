from lib.patientJournal import PDFCanvas

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