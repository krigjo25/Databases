#   Python responsories
import mariadb
from os import getenv
from datetime import date

#   dotenv Responsories
from dotenv import load_dotenv


class hospitalManagementSystem ():
    def __init__(self):
        pass

    def calculateAge(birthDate):
        today = date.today()
        age = today.year - birthDate.year ()
        return

    from os import getenv


class DatabaseConnection():
    def __init__(self) -> None:
        pass
    def sFR  (database, query):

        #   Initializing the database connection
        connection = mariadb.connect( host=getenv('HOST'), user= getenv('USERNAME'), port= int(getenv('PORT')),password = getenv('PASSWORD'), database = database)
        
        #   Creating a cursor to execute the statements
        cur = connection.cursor()

        #   Executes the query
        cur.execute(query)

        #   Fetching the sql selection
        sql = cur.fetchall()

            #   Initializing a list to return
        sqlData = []

        for i in sql:
            sqlData.append(i)

        #   Closing the connection to the database
        connection.close()

        return sqlData

    def iAR (database, query):

        #   Initializing the database connection for MedieServer
        connection = mariadb.connect( host=getenv('HOST'), user= getenv('USERNAME'), port= int(getenv('PORT')), password = getenv('PASSWORD'), database = database)

        #   Creating a cursor to execute the statements
        cur = connection.cursor()

        #   Executes the query
        cur.execute(query)

        return