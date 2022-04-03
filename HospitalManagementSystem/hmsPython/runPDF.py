#   Python Responsories
from os import getenv
from dotenv import load_dotenv


#   Library responsories
from lib.patientJournal import PDFCanvas
from lib.customFunctions import UploadFile
from lib.databasePython import mariaDB, tableCreation

load_dotenv()

def PDFSetup():
 
    #   Classes initialization
    db = mariaDB()
    c = PDFCanvas()
    u = UploadFile()
    tb = tableCreation()

    '''
    database = getenv('database3')
    query = 'SELECT ssn FROM patient'
    sqlData = db.selectFromTable(database, query)
    columns = 'id NOT NULL PRIMARY KEY AUTO_INCREMENT, patientID BIGINT NOT NULL, procedure VARCHAR(255),  '

    x = 0
    counter = db.RowCount(query)

    while x <= counter:
        #   Creating Table
        tb.CreatePatientInfoTable(database, sqlData[x][0], columns)

        #   Creating Procedures
        tb.CreateProcedure(database, sqlData[x][0])

        #   Creating Triggers
        tb.CreateTriggers(database, sqlData[x][0])

        #   Creating Events
        tb.CreateEvents(database, sqlData[x][0])

        #   Creating 
        #tb.CreateViews()
    '''
    #   Creating the PDF

    #   Health information
    c.BodyHeader()

        #   Hospital visits
    c.BodyMain()

    #   Logo and firm
    c.BodyFooter()

    c.showPage()
    c.save()

    #   Uploading the pdf file
    #u.generatePDF('patientJournal', '/home/kriss/Documents/Coding/Database/patientJournal.pdf')#, f'{pid[0]}')
    

if __name__ == '__main__':
    PDFSetup()