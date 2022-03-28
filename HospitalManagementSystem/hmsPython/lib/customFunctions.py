#   Python responsories
from typing_extensions import Self
import mariadb
from os import getenv
from datetime import date

#   dotenv Responsories
from dotenv import load_dotenv


class Calculators ():
    def __init__(self):
        pass

    def calculateAge(birthDate):
        today = date.today()
        age = today.year - birthDate.year ()
        return

    from os import getenv


class DatabaseConnection():

    def __init__(self):

        #   Initializing the database connection
        self.conn = mariadb.connect(
                                    host = getenv('H0ST'), 
                                    user = getenv('USERNAME'), 
                                    port = int(getenv('PORT')), 
                                    password = getenv('PASSWORD'),
                                    database = getenv('database'))
        
        #   Creating a cursor to execute the statements
        self.cur = self.conn.cursor()

    # Problems with self, database wont show
        return

    def databaseTest (self):
        self.conn.database = getenv(f'database1')
        self.cur.execute('SELECT \'CONNECTION\'')


        self.conn.close()


    def sFR (self, database, column, table, column2, value):

        #   Database selection
        self.conn.database = database

        #   Creating the query and execute the query statement
        query = 'SELECT %s FROM %s WHERE %s = %s;'% (column, table, column2, value)
        #  Create and execute the query.
        self.cur.execute(query)

        #   Fetching the sql selection
        sql = self.cur.fetchall()

            #   Initializing a list to return
        sqlData = []

        #   append to the list
        for i in sql:
            sqlData.append(i)

        #   Closing the connection to the database
        self.conn.close()

        return sqlData

    def iAR (self, database, query):

        #   Database selection
        self.conn.database = database

        #   Executes the query
        self.cur.execute(query)
        self.conn.close()

        return

    def updateTable (self, database, table, column, column2, value):

        #   Database selection
        self.conn.database = database

        query = 'UPDATE %s, SET %s = %s WHERE %s = %s;'%(table, column, column2, value)

        self.database = database

        #   Executes the query and close the connection

        self.cur.execute(query)
        self.conn.close()

        return

class Dictionaries():
    def __init__(self):
        pass

    def postalCode(postalCode):
        zipCode = {
                    0000:'Warshington',
        }
        postalCode = zipCode.get(postalCode)
        return postalCode

class UploadFile():
    def __init__(self):
        pass

    def BinaryConverter(self, fName):
        #   Converting data to binary format
        with open(fName, 'rb') as file:
            binaryData = file.read()
            print(binaryData)
            
        return binaryData

    def generateBlob(self, table, column, id, name, photo, bioData):
        database = 'patients'
        
        conn = mariadb.connect(
                                host=getenv('HOST'),
                                user= getenv('USERNAME'),
                                port= int(getenv('PORT')),
                                password = getenv('PASSWORD'),
                                database = getenv('DATABASE')
            )

        cur = conn.cursor()

        query = ' UPDATE %s SET %s = %s WHERE id = %s'
        bFile = self.BinaryConverter(fName,file)
        file = self.BinaryConverter(dataFile)

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
        query = f' UPDATE patient SET {column} = "{pdf}" WHERE id = {vid}'
        execute = cur.execute(query)
        conn.close()
