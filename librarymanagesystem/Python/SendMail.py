# Importing yagmail to handle the smtp configs, Os, to retriev env variables
import yagmail, os, mariadb

from datetime import date

# Importing dotenv to handle the enviormental variables
from dotenv import load_dotenv

load_dotenv()

#msg = f''' {selection}'''

class SendMail():
    def __init__(self):

    # Loading environment values Needed to mask password and user 
        self.smtpUser = os.getenv('SMTPUser')
        self.smtpPass = os.getenv('SMTPPass')
        self.subject = 'libManageSystem: a reminder of your borrowed book'
        
        #   Connecting to the database
        self.conn = mariadb.connect(
            user =os.getenv('USER'),
            password=os.getenv('PASSWORD'),
            host=os.getenv('HOST'),
            db=os.getenv('DATABASE'))

        self.cur = self.conn.cursor()
        return
    
    def sendMail(self):

        dates = []
        today = date.today()
        
        #   Fetch the enire row in order to use some of the information in the database to get contact information, name etc.
        query = 'SELECT * FROM lib'

        
        self.cur.execute(query)
        data = self.cur.fetchall()
        
        for row in data:
            dates.append(row)
            print(row, today)

        #   Selecting the overdue date and return date, and create a countdown until
        #   The email should be sent

        returnDate= row[7] - today
        overDueDate = row[8] - today
        returnDate = returnDate.days
        overDueDate = overDueDate.days
        
        if returnDate == 7:

            #   If date is 7days from returnDate send a reminder to the user
            msg = f'''   greetings {row[3]}.
             This is reminder to return {row[2]} with-in {returnDate} days.
             If the store is closed, please deliver the given book in a propper box outside the store. 
             If the book is not delivered by {row[7]} a fine may apply'''   

            #  Sending an e-mail 
            yag = yagmail.SMTP(self.smtpUser, self.smtpPass).send(tpipo=self.smtpUser,subject=self.subject,contents=msg)

        elif overDueDate == 0:

            #   If the person has not returned the book with-in 7days after the returnDate
            #   Send a new reminder incase the user has forgotten to deliver the book
            
            msg = f'''   greetings {row[3]}.
            We can see in our database you've forgotten to deliver {row[2]}. 
            We would appreciate if you could deliver the book with-in the next few days.
            If the store is closed, please deliver the given book in a propper box outside the store. 
             '''
             #  Send the email    
            yag = yagmail.SMTP(self.smtpUser, self.smtpPass).send(to=self.smtpUser,subject=self.subject,contents=msg)
                #attatchments
        #print(f'Connection to {conn.database} is enstablized')



        self.conn.close()
    
        return

if __name__=='__main__':
    mail = SendMail()
    mail.sendMail()
