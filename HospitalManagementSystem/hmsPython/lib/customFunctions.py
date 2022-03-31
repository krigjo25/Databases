#   Python responsories
from os import getenv
from datetime import datetime, date

#   Database responsories
import mariadb

#   dotenv Responsories
from dotenv import load_dotenv
load_dotenv()

#   yagMail Responsories
#import yagmail

class Calculators():
    '''         Calculators     '''

    def __init__(self):
        pass

    def CalculateAge(*birthDate):

        '''         calculateAge     
        
            Calculates age based on years

        '''
        birthDate = str(birthDate)
        birhtDate = datetime.strptime(birthDate, '%Y-%d-%m')
        #   Get the today's date
        curDate = date.today()
        
        #   Convert the birthdate Date into a readable
        print(birthDate)
        birthDate = birthDate - curDate
        # Declare a variable, substract current year with birthdate year
        age = curDate.year - birthDate.year - ((curDate.month, curDate.day) < (birthDate.month, birthDay.day))

        return age

    def Calculatebmi(height, weight):

        '''         calculatebmi
        
            Calculates bmi based on
            (height x height) / weight 

        '''

        height = height * height / 100;
        bmi = height / weight

        return bmi


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

    def updateTable (self, database, table, column, column2, value):

        #   Database selection
        self.conn.database = database

        query = 'UPDATE %s, SET %s = %s WHERE %s = %s;'%(table, column, column2, value)

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

class Dictionaries():
    def __init__(self):
        pass



    def AmericanPostalCodes(postalCode):

        '''         AmericanPostalCodes

            In life there would be an api for this
            so we leave it as an demostration.
            
            AmericanPostalCodes, lists of given 
            postalcodes in america.
        '''

        #   Creating a list to walk through
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

class sendMail():

    def __init__(self):

    # Loading environment values Needed to mask password and user 
        self.smtpUser = getenv('SMTPUser')
        self.smtpPass = getenv('SMTPPass')
        self.subject = getenv('Subject')

        return
    
    def SendMailLibray(self):

        #   Connecting to the database
        dc = DatabaseConnection()
        
        dates = []
        today = date.today()
        
        value = getenv('value')
        table = getenv('table')
        column = getenv('column')
        column2 = getenv('column2')
        database = str(getenv('database5'))

        #   Fetch the enire row in order to use some of the information in the database to get contact information, name etc.
        sqlData = dc.selectFromTable(database, query)(database, column, table, column2, value)
        
        if bool(sqlData) == True:
            for row in sqlData:
                dates.append(row)

            #   Selecting the overdue date and return date, and create a countdown until
            #   The email should be sent

            returnDate= row[7] - today
            overDueDate = row[8] -today
            returnDate = returnDate.days
            overDueDate = overDueDate.days
            print(row)

            if returnDate == 7:

                #   If date is 7days from returnDate send a reminder to the user
                msg = f'''   greetings, {row[9]}.
                This is reminder to return {row[2]}, by {row[3]} with-in {returnDate} days.
                If the store is closed, please deliver the given book in a propper box outside the store. 
                If the book is not delivered by {row[7]} a fine may apply\n This is an automatic generated email, please do not respond.'''   

                #  Sending an e-mail 
                yag = yagmail.SMTP(self.smtpUser, self.smtpPass).send(to=self.smtpUser,subject=self.subject,contents=msg)

            elif overDueDate == 0:

                #   If the person has not returned the book with-in 7days after the returnDate
                #   Send a new reminder incase the user has forgotten to deliver the book
                
                msg = f'''   greetings {row[3]}.
                We can see in our database you've forgotten to deliver {row[2]}. 
                We would appreciate if you could deliver the book with-in the next few days.
                If the store is closed, please deliver the given book in a propper box outside the store. 
                '''
                #  Send the email    
                yag = yagmail.SMTP(self.smtpUser, self.smtpPass).send(to=self.smtpUser, subject=self.subject, contents=msg)
                    #attatchments
            



            
        
        elif bool(sqlData) == False:
            print('Nothing in the selected table')

        return

if __name__=='__main__':
        mail = sendMail()
        mail.SendMailLibray()