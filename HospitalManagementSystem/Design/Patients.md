## Patient Table


**Databse**
Own database for Patients

**Patient Information**
        Column                              Comment

        -   unique ID \t                        To identify the patient custom start from 100

        #   General information about the patient

        -   birthDate                           The date of birth
        -   ssn                                 Security Social Number
        -   sex                                 The sex max 5 characters
        -   mobile                              Phone number, max 9 digits

        -   street                              street name
        
        -   zipcode                             the given postal code

        #   Information about work

        -   companyName                         patients employeement
        -   industry                            work environment

        #   Health information

        -   bodyWeight                          Patient's body Weight
        -   bodyHeight                          Patient's body Height
        -   bodyMass                            Patient's body mass
        -   bloodType                           Blood type of the patient
        -   Disease Code                        A Unique KEY TO doc Table
        -   Alergies                            A Unique KEY TO alergies 
        -   medecine                            A Unique Key to available medecine
        -   dateIn                              When the patient arrive
        -   dateOut                             When the patient leaves
        -   patientJournal                      Patient Journal

        Constraints

        UNIQUE 

        patientName,
        patientID
        medecine,
        diseaseCode 
        Medecine

        FOREIGN KEY

        medecine,
        diseaseCode 
        Medecine

**Procedures**

        - Insert a new patient
        - Update patient Information

**Events**

-       When the patient checks out from the hospital, Create a Invoice

-       When the patient Journal gets updated, update the PDF

**Triggers**

        When the patient gets registered for the first time in the database,
        Create a PDF containing the personal info, alergies, diagnosis
        ( where the recommended treatments get fetched from the database)

**PDF file**


        
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