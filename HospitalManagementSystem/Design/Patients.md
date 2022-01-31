## Patient Table
        Column                              Comment

**Patient Information**

        -   unique ID \t                        To identify the patient custom start from 100
        -   Gender                              The gender max 5 characters
        -   age                                 The age of the patient
        -   ContactInfo                         Phone number, e-mail
        -   Disease Code                        A Unique KEY TO doc Table
        -   Alergies                            A Unique KEY TO alergies Table
        -   blood type                          A Unique KEY TO Blood type table 
        -   PDF                                 Patient Journal
        -   Datetime inn                        A counter from
        -   DateTime out                        A counter untill
        -   Next Appointment                    If the user is visiting a specialist

**Procedures**

        - Insert a new patient
        - Update patient Journal
        - Update patient Information

**Events**

**Triggers**

        When the patient gets registered for the first time in the database,
        Create a PDF containing the personal info, alergies, diagnosis
        ( where the recommended treatments get fetched from the database)

**PDF file**

        ***************************************************
        Patient Journal of **Jhon Doe 100** (fontsize 20, Fontfamily ARIAL titles bold)

        **age         Sex     BloodType           List of Current Diseases**
        dd.mm-yy       M         O+                     A000A

        **contact information**            **List of Recommended treatment**

        +4712345678,                                        A000A
        jhondoe@domaine.domaine

        streetName(nr), Apartment (nr)              **List of Current Alergies**
        zipCode, State                                      
                                                        A000A

        **List of current Diagnosis**            **List of Recommended treatment**

        Recommended treatment for your illness              A000A

        **patient registered**

        dd.mm.yyyy

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