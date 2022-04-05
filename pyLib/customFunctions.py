#   Python responsories
from os import getenv
from datetime import datetime, date

#   Database responsories
from databasePython import mariaDB

#   dotenv Responsories
from dotenv import load_dotenv


load_dotenv()

#   yagMail Responsories
import yagmail

class Calculators():
    '''         Calculators     
        Calculate age
            Calculate a age type : yyyy-dd-mm
        
        Calculate bmi :
            Calculates the bmi

        DateCountDown :
            Calculates how many years, months days left
    '''

    def __init__(self):
        #   Initializing the classes

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
        m = cm / 100

        # Converts the weight into a integer
        kg = int(kg)
        
        #   Finds the bmi by dividing  with age and gender
        if age < 21 and gender == 'M':

            bmi = kg / (m * m) * 10000

        elif age < 21 and gender == 'F':

            bmi = kg / (m * m) * 10000

        elif age > 20 and gender =='F':
            bmi = kg / (m * m)
        else:
            #   Else we assume its a Male, above 20
            bmi = kg / (m * m)

        return round(bmi, 2)

    def DateCountDown(self, arg):
        '''
            Calculates how many days left
            from today to arg
        '''
        today = date.today()
        arg = arg - today
        return arg


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

class miscFunctions():
        pass
# Fix these
"""
class UploadFile():
    def __init__(self):

        self.dc = mariaDB
        self.database = database = getenv('database2')
        pass

    def BinaryConverter(self, fName):
        #   Converting data to binary format
        with open(fName, 'rb') as file:
            binaryData = file.read()
            
        return binaryData

    def generateBlob(self, query, photo, bioData):

        bFile = self.BinaryConverter(photo,file)
        file = self.BinaryConverter(bioData)
        
        #   Converting information into tuple
        query = query, photo
        self.dc.updateTable(self.database, query)

    def generatePDF(self, pdf, vid):

        #   Update a column
        query = f' UPDATE patient SET pdf = "{pdf}" WHERE id = {vid}'
        self.dc.updateTable(self.database, query)"""

# Fix this one

class sendMail():
    '''
        Sends an email, different functions for different mail 
        service setups.
    '''

    def __init__(self):

        #   Loading environment values Needed to mask password and user 

        return

    def sendMailOutlook(self):
        pass

    def sendMailYahoo(self):
        pass
    
    def SendMailGmail(self):

        #   SMTP Initialazion
        SMPTPass = getenv('GmailPass')
        SMPTReciever = getenv('Reciever')
        SMPTMaster = getenv('GmailMaster')



        #   Initializing mariadb Connection 
        dc = mariaDB()

        #   Sending an e-mail 
        subject = ''
        msg = ''
        yag = yagmail.SMTP(SMPTMaster, SMPTPass).send(to=SMPTReciever,subject=subject,contents=msg)

        #   Closing the connection to the database
        dc.closeConnection()
        return
