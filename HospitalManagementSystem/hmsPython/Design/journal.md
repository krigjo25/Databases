# Patient journal


## The Design of the patient journal

        ***************************************************
        Patient Journal of **Jhon Doe 1000** (fontsize 20, Fontfamily ARIAL titles bold)

        General information

        Social Security Number      Sex     BloodType   List of Current Diseases**
           ddmm00000             M         O+                 A000A

        Contact Information

            mobile          Street          State   ZipCode
        123-123-123        

        Work Information

            Company             Industry
            Unemployed         Unemployed
        
        Health information

        bodyWeight      BodyHeight      BodyMass

        
        bloodType       Diseases        Alergies
        
        Current Medecine        Date IN    dateOut
        
        -----------------------------------------------------------------------------

        ******************* Hospital Visits**************************
        Last Visit : dd.mm.yy

        During your last stay at Ålesund Hospital
        The patient were visiting 

        (roomID)(roomName), 
        due to {reason}. between inDate + hh.mm and outdate + hh.mm

        Doctor DoctorName's notes 
        (

        )

        max 200 letters

        --------------------------------------------------------------------------------------------------

        (IF he were visiting more than one room)

        patient were also visiting (roomName)(roomID), between inDate + hh.mm and outdate + hh.mm

        ------------------------------------------------------------------------------
        Hospital logo, name, number, address, postalcode

## How to i plan to achive the the design

By using reportlab you can generate a pdf file, which is mostlikely readable for every computers, by using <b>google's pdf reader</b>, <b> Adobe's pdf reader</b>

I would like to create a function where you can accsess mariadb connector in a easier way
### Responsories

-   reportlab
-   mariadb
