# Hospital Manage System

## Table Of Content

[Introduction](#Introduction)......................
    
    developer.....................
    project...........................
        The design....................
        Case..........................

[SQLData](#SQLData)..........................
    
    Tables........................
    patients..................
    Employee..................
    roomBookings..............
    lom.......................
    loa.......................
    lom.......................

    Procedures....................

    Triggers......................
        terminatemember...........
        terminatebook.............
            
    Events........................
        delRecords................
        discount..................
    
    Views.........................


    
[Python](#Python).....................
        dictonaries.py................
        patientJournal.py.............
        uploadbiodata.py..............
        sendSMS.py....................    
        runPDF.py.....................


[PDF](#PDF).......................

    patientjournal.pdf............
    invoice.pdf...................

[Testing](#Testing)...................

        SQL Data......................
        test.sql......................
    
[Summuary](#Summuary).................

[Responsary](#Responsary).............

[Credentials](#Credentials)...........

    licence...........................
    Contact Information...............

## Introduction

**About the Developer**

krigjo25, born in 94, Norway, part the time goes to python, SQL
otherwise, Gym and living life as a human

**Project**

The idea of HospitalManageSystem is to create a system
which lets the personell to add, modify the patient journal

## The Design

Can be found in its given folder at github,com

    The project started
    

    The project were finished

## SQL Data

 **Tables**

        patients
            includes the "personal" information about a given patient

        Employee..................
            includes the information about the Hospital Staff

        roomBookings..............
            A booking system so the staff has to book a given room

        Hospital lists
            
            lom 
                List of medecines
            
            loa
                list of given registered Alergies

            lod
                List of given Deseases
                
        Interior list

            First floor
            100 - 199

            Second floor

                200
                299
            
            Third floor
                300
                399


**Procedures**

***Patient***

        InsertPatient (pName, vAge, vSex, vPhone, vEmail, bType, vAlergies, vIllness)                                       --Inserts a patient to the table

        patientInfo (vID, vColumn, vValue)       --  Updates a value for the patient table
    
***List Of Alergies***

    insertLOA (vID, vName, vSymptoms, medicine ID)  --  Inserts a new Alergy

***List Of Diagnosis***

    insertLOD (vID, vName, vSymptoms, medicine ID)

***List of Medicine***
    insertLOM (vID, vName, vSymptoms, illness)

**Triggers**

**Events**

##  Testing

***SQL Testing***


##  Python

**sendSMS,py**

**dictionaries.py**

**patientjournal.py**

**uploadbiodata.py**

**sampleContract.py**

**runPDF.py**

##  PDF

**patientjoirnal.pdf**

**sampleContract.pdf**

##  Summary

* 

*

* 

* 
## Responsories

## Credits

**Contact Information**

Discord : krigjo25#5588

Only One advice,
« The importance of creating is just have fun. »
