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

kristoffer Gjøsund, born in 94, Norway, part the time goes to python, SQL
otherwise, Gym and living life as a human

**Project info**

The idea of HospitalManageSystem is to create a back-end system
which lets the personell to add and modify the patient journal
 
>   project start :
>>  1.01-22
>
>   Last Update :
>>

>   SQL Database: 
 
>>  mariaDB
 
## The Design

The design has its own folder in github.com

**The design includes**

>patient.txt,
>bookings.txt,
>employee.txt,
>billing.txt,
>list of diseases.txt
>rooms.txt
>thecase.txt
>turnus.txt
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
            200 - 299
            
        Third floor
            300 - 399

**Procedures**

***Universial Procedures***

***Patient***

        CALL newPatient (pName, vAge, vSex, vPhone, vEmail, bType, vAlergies, vIllness)         --Inserts a patient to the table

        CALL patientInfo (vID, vColumn, vValue)                                                 --  Updates a value for the patient table

***Employee***

    CALL newEmployee (eName, vAge, vSex, vPhone, vEmail)
    

***List Of Alergies***

    CALL insertLOA (vID, vName, vSymptoms, medicine ID)                                         --  Inserts a new Alergy

***List Of Diagnosis***

    CALL insertLOD (vID, vName, vSymptoms, medicine ID)                                         -- Inserts a new Diagnosis

***List of Medicine***

    CALL insertLOM (vID, vName, vSymptoms, illness)                                             --  Inerts a new type of Medicine

***Rooms***

    CALL firstFloor('roomName', 10000.00)
    CALL secondFloor('roomName', 10000.00)
    CALL thirdFloor('roomName', 10000.00)

**Triggers**

**Events**

##  Testing
    Test Performed in this SQL Project

    - Manually entered values

***SQL Testing***


##  Python

**dictionaries.py**

Created to easly maintain postal codes in the area

**patientjournal.py**

This programming, create a PDF file from values which is in the database

**uploadbiodata.py**

This uploads blob files to the database

**runPDF.py**

This programming, runs the different methods which is coded

##  PDF

**sampleJournal.pdf**

This is the patient journal, includes information about the given patient,
what has done during the patient's stay at the Hospital. 

**Invoice.pdf**

A simple invoice for the patient, after the patient's stay

#  Summuary

* In the world of programming, there is always room for cleaning, i choose to devide the different methods in classes, and devide them into each python file, so there would be less mess in the code. Deviding lists, static and Dynamical tables, in different files, to make the code more readable for others.


* Some experience i learned while design this database, 
Kriss had to find a way to create a text sheet which is stored in the database by using "BLOB", Kriss choose to use PDF format as the text file.
kriss had a wish to extract information from the database into the PDF file, in order for it to be dynamical. So reportlab were a good option for this case.

*  Kriss experienced some issues with Keys, learned that there is more than just one Key to be used, even though some of them are the same, so kriss choose Candidate key for the given database, unless its the row id.

* 

* 
## Responsories

Plugins for mariadb

Libraries 

* Python-dotenv, - [Saurabh Kumar](https://github.com/skwebdeveloper)
* mariadb, - [MariaDB](https://github.com/MariaDB)
* reportlab, - [nAdy Robinson, Robin Becker, the ReportLab team and the community](https://reportlab.com)
* []()
* []()

## Credits

**Contact Information**

Discord : krigjo25#5588
messenger : krigjo25

Only One advice,
« The importance of creating is just have fun. »

in gloria excelcius deo

**Licence**

Not licenced.

**Disclamers**

**References**