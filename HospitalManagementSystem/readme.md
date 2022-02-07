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
 
    project start :
        1.01-22

   Last Update :


    SQL Database: 
        mariaDB
    
**The Design**

Infomration about the design can be found in the given links below
includes the text files below,

* [Patient](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/Design/Patients.md),
* [Bookings](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/Design/Bookings.md),
* [Employee](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/Design/Employee.md),
* [Billing](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/Design/Billing.md),
* [Table list](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/Design/TableList.md),
* [Rooms](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/Design/Rooms.md),
* [The Case](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/Design/TheCase.md)
* [Turnus](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/Design/Turnus.md)

## SQL Data

**Tables**

    patients
        includes the "personal" information about a given patient

    Employee..................
        includes the information about the Hospital Staff

    roomBookings..............
        A booking system so the staff has to book a given room

    Hospital lists

        medecines 
            List of medecines

        alergies
            list of given registered Alergies

        diagnosis
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

        CALL newPatient (pName, vAge, vSex, vPhone, vEmail, bType, vAlergies, vIllness)         #   Inserts a patient to the table

        CALL patientInfo (vID, vColumn, vValue)                                                 #   Updates a value for the patient table

***Employee***

    CALL newEmployee (eName, vAge, vSex, vPhone, vEmail)
    

***List Of Alergies***

    CALL insertLOA (vID, vName, vSymptoms, medicine ID)                                         #   Inserts a new Alergy

***List Of Diagnosis***

    CALL insertLOD (vID, vName, vSymptoms, medicine ID)                                         #   Inserts a new Diagnosis

***List of Medicine***

    CALL insertLOM (vID, vName, vSymptoms, illness)                                             #  Inerts a new type of Medicine

***Rooms***

    CALL firstFloor('roomName', 10000.00)
    CALL secondFloor('roomName', 10000.00)
    CALL thirdFloor('roomName', 10000.00)

**Views**

    Rooms.sql                                                                                   #   An overview of all rooms which is available in the Hospital

**Triggers**

**Events**

##  Testing

**Test Performed in this SQL Project**

    - Manually entered values

***SQL Testing***

The database has been manually tested 

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

the patient journal, includes information about the given patient,
what has done during the patient's stay at the Hospital. 

**Invoice.pdf**

A simple invoice for the patient, after the patient's stay

#  Summuary

* In the world of programming, there is always room for cleaning, 
the common choose were to devide the different methods in classes, 
and devide them into each python file, so there would be less mess 
in the code. Deviding lists, static and Dynamical tables, in different
files, to make the code more readable for others.


*  While designing the Database, the need for a better text reading 
software, than using plaint text were a need PDF were choosen as the
file format for the text files, the information from the database had
to be extracted to the PDF from the database, by using reportLab's Library,
 it could be achived. The way to store the information in the database,
could be a more challange as database only read bytes, not words, so by
using 'BLOB' the file could be saved in the database.

*  The experience by using  the foreign key, which where experienced,
to avoid the foreign key issue 150, there has to be only one Primary key,
but there can be multiply usage of the other keys suggested soulution is
to  Choose a different key for the foreignKey. The choice were to  use 
unique insted of Primary Key. For the row ID is the Primary targeting to 
retieve information.

*   Kriss had a slightly challange to merge all the floors into one table,
The thought were to create a new table, with foreign key, but it wouldnt work, 
as the assumption about foreign keys can not refer to more than one table the b
etter soloution were to create a view for this matter.

* 

## Responsories

**Database Plugins**



**Python Libraries** 

* mariadb, - [MariaDB Community](https://github.com/MariaDB)
* Python-dotenv, - [Saurabh Kumar](https://github.com/skwebdeveloper)
* reportlab, - [Andy Robinson, Robin Becker, the ReportLab team and the community](https://reportlab.com)
* []()
* []()

## Credits

**Contact Information**

Discord : krigjo25#5588
messenger : krigjo25

Only One advice,
« The importance of creating is fun. »

**Licence**

Not licenced.

**Disclamers**

This datebase is as is

**References**