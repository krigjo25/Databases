#   Python Responsories
import mariadb
from os import getenv
from dotenv import load_dotenv

#   Library responsories
from lib.patientJournal import PDFCanvas
from lib.uploadbiodata import UploadFile

load_dotenv()

def PDFSetup():

    #   Initializing the Database Connection
    conn = mariadb.connect(
                                host=getenv('HOST'),
                                user= getenv('USERNAME'),
                                port= int(getenv('PORT')),
                                password = getenv('PASSWORD'),
                                database = getenv('DATABASE')
            )

    cur = conn.cursor()

        #   Selecting and procsessing from the database
    query = f' SELECT id FROM patient;'
    execute = cur.execute(query)
    cur = cur.fetchone()
    
    pid = []
    for i in cur:
        i = str(i)
        pid.append(i)

    #   Closing the connection
    conn.close()    

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
    u.generatePDF('patientJournal', '/home/kriss/Documents/Coding/Database/patientJournal.pdf', f'{pid[0]}')
    

if __name__ == '__main__':
    PDFSetup()