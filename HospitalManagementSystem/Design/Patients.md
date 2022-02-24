# Patients

The patient table, should include necsessary information, for the assigned Doctor<br>
to do the necsessary treatment for the patient. Would like to have the patient details<br>
in a own Database, for easier maintance.

**Patient Information**

##  General information about the patient                  #  Information about work #  Health Information
| pID | patientName | ssn | sex | mobile| street | zipCode | companyName | industry | BodyWeight | bodyHeight | bodyMassIndex | bloodType | DiseaseCode | alergies | medecine | dateIn | dateOut |
|--- |--- |--- |---	|--- |--- |--- |---	|--- |--- |---	|--- |--- |--- |---	|--- |--- |--- |

 Constraints |
|---	|
| Unique |
| patientID |
| patientName |
| medecine |
| diagnosisCode |
| FOREIGN KEY |
| medecine |
| diagnosisCode |
| alergies |
| medecine |

**Procedures**

#  Register a new patient to the database
- CALL newPatient()

#  Modify patient information
- CALL modifyPatient()

**Events**

-  When the patient checks out from the hospital, Create a Invoice

-      When the patient Journal gets updated, update the PDF

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