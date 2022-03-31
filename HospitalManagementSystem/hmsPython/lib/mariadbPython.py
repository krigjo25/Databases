#   Python responsories
from os import getenv
from datetime import datetime, date

#   Database responsories
import mariadb

#   dotenv Responsories
from dotenv import load_dotenv
load_dotenv()

#   Creating a database, table / dropp
class DatbaseCreation():
    def __init__(self):
        '''         DatabaseCreation

        Creating a database / Dropping a database,
        creating a table, dropping tables,
        creating a view, dropping a view,

    '''
        #   Initializing the database connection
        self.conn = mariadb.connect(
                                    host = getenv('H0ST'), 
                                    user = getenv('MASTER'), 
                                    port = int(getenv('PORT')), 
                                    password = getenv('PASSWORD'),
                                    database = getenv('test'))
        
        #   Creating a cursor to execute the statements
        self.cur = self.conn.cursor()

        return

    def CreateDatabase(self, name):

        query = f'CREATE DATABASE IF NOT EXISTS {name}'
        self.cur.execute(query)
        self.conn.database = name

        if self.conn == True:
            msg = f'{name}, were successfully created'
        else:
            msg = ' An error occurred'

        #   Closing the connection to the database
        self.conn.close()

        return print(msg)

    def DropDatabase(self, name):

        query = f'DROP DATABASE IF NOT EXISTS {name}'
        self.cur.execute(query)

        if self.conn == False:
            msg = f'{name}, were successfully deleted'
        else:
            msg = ' An error occurred'

        #   Closing the connection to the database
        self.conn.close()

        return print(msg)

    def CreateTable(self, name, columns):

        query = f'CREATE TABLE {name} IF NOT EXISTS {columns};'
        self.cur.execute(query)
        self.conn.database = name

        if self.conn == True:
            msg = f'{name}, were successfully created'
        else:
            msg = ' An error occurred'

        #   Closing the connection to the database
        self.conn.close()

        return print(msg)

    def DropTable(self, name):

        query = f'DROP TABLE IF EXISTS {name};'
        self.cur.execute(query)

        if self.conn == False:
            msg = f'{name}, were successfully deleted'
        else:
            msg = ' An error occurred'

        #   Closing the connection to the database
        self.conn.close()

        return print(msg)

#   Selecting, Inserting or updates a table
class DatabaseConnection():

    '''         DatabaseConnection

        Connects to the preferably used database
        With Commands, such as SELECT, INSERT, UPDATE
                
        x callProcedure / callfunction
    '''

    def __init__(self):

        #   Initializing the database connection
        self.conn = mariadb.connect(
                                    host = getenv('H0ST'), 
                                    user = getenv('MASTER'), 
                                    port = int(getenv('PORT')), 
                                    password = getenv('PASSWORD'),
                                    database = getenv('database'))
        
        #   Creating a cursor to execute the statements
        self.cur = self.conn.cursor()

        return

    def databaseTest (self):

        # Testing the connection to the database
        self.conn.database = getenv(f'database1')
        self.cur.execute('SELECT \'CONNECTION\'')


        self.conn.close()

    def selectFromTable (self, database, query):

        database = str(database)
        print(database)
        #   Database selection
        self.conn.database = database

        #  Execute the query.
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

        #   Returning the values in sqlData
        return sqlData

    def insertIntoTable (self, database, query):

        #   Database selection
        self.conn.database = database

        #   Executes the query
        self.cur.execute(query)
        self.conn.close()

        return

    def updateTable (self, database, query):

        #   Database selection
        self.conn.database = database

        self.database = database

        #   Executes the query and close the connection

        self.cur.execute(query)
        self.conn.close()

        return

    def callProcedure (self, database, procedure):

        #   Database Connection 
        self.conn.database = database

        #   calling a procedure
        sqlData = self.cur.callproc(f'{procedure}')

        return sqlData