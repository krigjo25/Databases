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
        #   Initializing the classes
        self.mc = MetricConverter()
        pass

    def CalculateAge(self, birthDate):

        '''         calculateAge     
        
            Calculates the age difference between the current
            date and the given date

            The leap year is added 

        '''

        #   Converting the date into a string, then back to a date
        birthDate = str(birthDate)
        birthDate = datetime.strptime(birthDate, '%Y-%d-%m').date()

        #   Get the today's date
        curDate = date.today()

        #   Calculate the difference in years
        difference = curDate.year - birthDate.year  

        #   
        oneOrZero = ((curDate.month, curDate.day) < (birthDate.month, birthDate.day))

        #   Age equals the difference - one or zero
        age = difference - oneOrZero

        return age

    def Calculatebmi(self, kg, cm, age, gender):

        '''         calculatebmi
        
            Calculates bmi for adults and children

            Childrens 2-20
            kg / (m * m) * 10000

            Adults 20+
            kg / (m * m)


        '''

        #   Convert the height in meters
        m = self.mc.CentimeterMeter(cm)

        # Converts the weight into a integer
        kg = int(kg)
        
        #   Finds the bmi by dividing  with age and gender
        if age < 21 and gender == 'M':

            bmi = kg / (m * m) * 10000

        elif age < 21 and gender == 'F':

            bmi = kg / (m * m) * 10000

        else:
            bmi = kg / (m * m)

        return round(bmi, 2)

class MetricConverter():

    def __init__(self):
        pass

    def MiliMeter(self, mm):

        # Deviding decimeeter on 10
        # 1000 mm = 1 meeter
        m = mm / 1000

        return round(m, 2)

    def CentimeterMeter(self, cm):

        # Dividing centimeter on 100
        # 100 cm = 1 meeter
        m = cm / 100
         
        return m
    
    def DecimeterMeter(self, dm):

        # Deviding decimeeter on 10
        # 10 dm = 1 meeter
        m = dm / 10

        return round(m, 2)
    
    def MeterKiloMeter(self, m):

        # Deviding decimeeter on 10
        # 10 dm = 1 meeter
        km = m / 1000

        return km

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
        self.cur = self.conn.cursor(buffered=True)

        return

    def databaseTest (self):

        # Testing the connection to the database
        self.conn.database = getenv('database1')
        self.cur.execute('SELECT \'CONNECTION\'')


        self.conn.close()

    def selectFromTable (self, database, query):

        database = str(database)

        #   Database selection
        self.conn.database = database

        #  Execute the query.
        self.cur.execute(query)
        curCount = self.cur.rowcount

        #   Fetching the sql selection
        sql = self.cur.fetchall()

        #   Initializing a list to return
        sqlData = []

        #   append to the list
        for i in sql:
            sqlData.append(i)
        
        sql
        #   Closing the connection to the database
        self.conn.close()
        #   Returning the values in sqlData
        return sqlData, curCount

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

        self.dc = DatabaseConnection
        self.database = database = getenv('database2')
        pass

    def BinaryConverter(self, fName):
        #   Converting data to binary format
        with open(fName, 'rb') as file:
            binaryData = file.read()
            
        return binaryData

    def generateBlob(self, query, photo, bioData):

        
        conn = mariadb.connect(
                                host=getenv('HOST'),
                                user= getenv('USERNAME'),
                                port= int(getenv('PORT')),
                                password = getenv('PASSWORD'),
                                database = getenv('DATABASE')
            )

        cur = conn.cursor()

        
        bFile = self.BinaryConverter(photo,file)
        file = self.BinaryConverter(bioData)
        
        #   Converting information into tuple
        query = query, photo
        self.dc.updateTable(self.database, query)

    def generatePDF(self, pdf, vid):

        #   Update a column
        query = f' UPDATE patient SET pdf = "{pdf}" WHERE id = {vid}'
        self.dc.updateTable(self.database, query)

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
        query = 'SELECT * FROM libraryManageSystem'
        sqlData = dc.selectFromTable(database, query)
        
        if bool(sqlData) == True:
            for row in sqlData:
                dates.append(row)

            #   Selecting the overdue date and return date, and create a countdown until
            #   The email should be sent

            returnDate= row[7] - today
            overDueDate = row[8] - today
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