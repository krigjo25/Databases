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
        cur = (table, column, id, name, photo, file)
        result = cursor.execute(query, bFile)
        self.conn.close()
    
    def generatePDF(self, column, value, vid):
        conn = mariadb.connect(
                                host=getenv('HOST'),
                                user= getenv('USERNAME'),
                                port= int(getenv('PORT')),
                                password = getenv('PASSWORD'),
                                database = getenv('DATABASE')
            )

        cur = conn.cursor()

        #   Update a column
        value = self.BinaryConverter(value)
        query = f' UPDATE patient SET {column} = {value} WHERE id = {vid}'
        print(query)
        execute = cur.execute(query)
        conn.close()
