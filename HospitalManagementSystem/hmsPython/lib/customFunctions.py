#   Python responsories
from os import getenv
from datetime import datetime, date


#   dotenv Responsories
from dotenv import load_dotenv


load_dotenv()


class Calculators():
    '''         Calculators     
        Calculate age
            Calculate a age type : yyyy-dd-mm
        
        Calculate bmi :
            Calculates the bmi
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