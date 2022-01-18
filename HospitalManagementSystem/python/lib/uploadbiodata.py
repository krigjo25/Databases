#   Python Responsories
from os import getenv
#   mariadb Responsories
import mariadb

#   dotenv Resposories
from dotenv import load_dotenv

load_dotenv()

class UploadFile():
    def __init__(self):
        pass
#        self.conn = mariadb.connect(
#                                host=getenv('HOST'),
#                                user= getenv('USERNAME'),
#                                port= int(getenv('PORT')),
#                                password = getenv('PASSWORD'),
#                                database = getenv('DATABASE')
#            )
#        self.cur = self.conn.cursor

    def BinaryConverter(self, fName):
        #   Converting data to binary format
        with open(fName, 'rb') as file:
            binaryData = file.read()
            print(binaryData)
        return binaryData

    def generateBlob(table, column, id, name, photo, bioData):
        conn = mariadb.connect(
                                host=getenv('HOST'),
                                user= getenv('USERNAME'),
                                port= int(getenv('PORT')),
                                password = getenv('PASSWORD'),
                                database = getenv('DATABASE')
            )

        cur = conn.cursor()

        query = ' UPDATE %s SET %s = %s WHERE id = %s'
        bFile = BinaryConverter(fName,file)
        file = BinaryConverter(dataFile)

        #   Converting information into tuple
        cur = (table, column, id, name, photo)
        result = cursor.execute(query, bFile)
        self.conn.close()
    
    def generatePDF(self, column, pdf, vid):
        conn = mariadb.connect(
                                host=getenv('HOST'),
                                user= getenv('USERNAME'),
                                port= int(getenv('PORT')),
                                password = getenv('PASSWORD'),
                                database = getenv('DATABASE')
            )

        cur = conn.cursor()

        #   Update a column
        #pdf = self.BinaryConverter(pdf)
        #print(value)
        query = f' UPDATE patient SET {column} = "{pdf}" WHERE id = {vid}'
        execute = cur.execute(query)
        conn.close()
