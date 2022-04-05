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

        bmi = round(bmi, 2)

        # Checking the body's condition
        #   Checking if the bmi is below 18.5
        if bmi < 18.5:
            bmi = f'{bmi}, UW'

        #   Checking if the bmi is equal to 18.5 or above
        elif bmi == 18.5 and bmi < 25.1:
            bmi = f'{bmi}, N' # Normal

        #   Checking if the bmi is equal 25.0 or above 18.5
        elif bmi > 25.0 and bmi < 30.0:
            bmi = f'{bmi}, OW'
            
        #   Checking if the bmi is equal 25.0 or above 18.5
        elif bmi > 30.0:
            bmi = f'{bmi}, Obese'

        return bmi

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

    def generateBlob(self, query, photo):

        file = self.BinaryConverter(bioData)
        bioData = self.BinaryConverter(photo, file)
        
        
        #   Converting information into tuple
        query = query, photo
        self.dc.updateTable(self.database, query)

        return bioData

    def generatePDF(self, pdf, vid):

        #   Update a column
        query = f' UPDATE patient SET pdf = "{pdf}" WHERE id = 100'
        bioData =self.generateBlob(query, pdf)

        return print(bioData)
        
 


# Fix this one

class SendMail():
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
