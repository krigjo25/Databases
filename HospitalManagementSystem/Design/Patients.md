# Patient Table

The patient table, should include necsessary information, for the assigned Doctor<br>
to do the necsessary treatment for the patient. Would like to have the patient details<br>
in a own Database, for easier maintance.

## Patient Information**

Information which is needed from the patient incldes some general information<br>
the patient's health, and proffesion.

| pID | patientName | ssn | gender | mobile| street | zipCode | companyName | industry | BodyWeight | bodyHeight | bodyMassIndex | bloodType | DiseaseID | alergyID | medecineID | dateIn | dateOut |
|--- |--- |--- |---	|--- |--- |--- |---	|--- |--- |---	|--- |--- |--- |---	|--- |--- |--- |

 Constraints |
|---	|
| Unique |
| patientID |
| patientName |
| |
| FOREIGN KEY |
| medecine |
| diagnosisCode |
| alergies |
| medecine |

##  Procedures

###  Register a new patient to the database
- CALL newPatient()

###  Modify patient information
- CALL modifyPatient()

##  Functions

*   Convert ssn digits
*   Convert phone digits
*   Calculate the BMI of a patient

##  Events

*   When the patient is registered in the database, generate a PDF document
*   When the patient information gets updaed, the PDF regenerates

##  Trigger

When the patient gets registered for the first time in the<br>
database. Create a PDF containing the personal info, alergies, diagnosis<br>
( where the recommended treatments get fetched from the database)

##  Patient Journal


        
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

-----------------------------------------------------------------------------------------------------------------------------------

# Billing system

This system can fetch fetch necsessary columns from the different tables, in order to calculate the bill,<br> 
then create an invoice for the patient.

The invoice fetches

*   Visited rooms, procedures done any extra treatments


##  BillingSystem Table

| patientID | invoiceID | incTax | reminder | overdue |
|--- |--- |--- |--- |--- |--- |

## Procedures

###  Insert necsessary values to create the pdf file
-    CALL newBilling (vpID)                 

###  Updates the values, if wrongly added
    CALL updateBilling (vColumn, vpID)

## Triggers

After the overdue, trigger a record into credited table<br>
else trigger a record  into paidBillings table

## Events

*   When the first overdue has passed on the invoice, trigger a new overdue, add a fine.
*   When the patient has been recovered trigger a pdf creation 

## Invoice

    FirmName
    Address                                 logo
    city, postalcode

    To                                     invoice info
    Jhon Doe                               invoice (id)
    address                                invoice sent (through)
    city, postalcode                       Due date

    -----------------------------------------------------
    Sourgy | Room Name | Date visited |(hours + min)| $      |
    -----------------------------------------------------
    x     Room Name    dd.mm-yy        1.5        000000,00

    -----------------------------------------------------
                            tax rate       =        25%  -> Amount
                    insurance discount      =        100%
                                total       =      $ 30.25
    -----------------------------------------------------

    (invoice text)

------------------------------------------------------------------------------------------

# Donators

A list of patients which is organ / blood donator.

## Donators Table

| patientID | patientName | bloodType | ssn | phoneNumber | organDonor | bloodDonor | diagnosID | medecineID | 
|--- |--- |--- |--- |--- |--- |--- |--- |--- |---

##  Procedures

Creating a procedure to add a new record in the table <br>
modifying a records value, and one to remove a donor from the list<br>

*   CALL newDonor(vID, vorgan);  -- Creating a new donor record
*   CALL modifyDonor(vID, vColum, vValue);   --  modifying given values
*   CALL delDonor(vID) --    Removes a donor from the list.
