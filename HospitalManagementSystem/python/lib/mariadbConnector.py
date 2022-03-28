from os import getenv


#   Database    Responsories
import mariadb

#   dotenv Responsories
from dotenv import load_dotenv

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

    #   Initializing the database connection
    connection = mariadb.connect( host=getenv('HOST'), user= getenv('USERNAME'), port= int(getenv('PORT')),password = getenv('PASSWORD'), database = database)

    #   Creating a cursor to execute the statements
    cur = connection.cursor()

    #   Executes the query
    cur.execute(query)

    return