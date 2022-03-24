# Hospital Manage System

## Table Of Content

[Introduction](#Introduction)......................
    
    developer.....................
    project...........................
        The design....................
        Case..........................

[SQLData](#SQLData)..........................
    
    Databases........................
    patients.....................
        patient...............
        billings..............
    employees...................
        employees.............
        relations.............
        turnus................
        salaryinfo............
    HospitalManageSystem.........
        lom....................
        loa....................
        lom....................
        booking.................
        floors..................

    Procedures...................
    patients.....................
        patient..................
        billing..................

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
 
    project start :<br>
        01.01-22

   Last Update :<br>
        24.02-22

    Finished : <br>
        dd.mm-yy    
    SQL Database:<br> 
        mariaDB
    
**The Design**

Infomration about the design can be found in the given links below
includes the text files below,

##  Databases

[patients](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/patients/)

    patient
        includes the "personal" information about a given patient
    
    Billing
        Information about the Invoices for the patient
    
    donators

[employees](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/employees/)

    Employee..................
        includes the information about the Hospital Staff

    relations
        includes the iformation about assignments for doctors

    Turnus


    reports
        reports / notes from the doctor

[HospitalManagement](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/HospitalManagement)

    roomBookings..............
        A booking system so the staff has to book a given room

    Medecines 
        List of medecines

    alergies
        list of given registered Alergies

    diagnosis
        List of given Deseases

    First floor
        100 - 199

    Second floor
        200 - 299
            
    Third floor
        300 - 399

## Procedures

### Universial Procedures

###  Patients

####  Patient
    #   add a new record of a patient
    CALL newPatient (pName, bDate, vssn, vSex, vPhone, vStreet, vZip,vEmail, vWeight, vHeight, bType, vAlergies, vDoc, vMed);

    #   Updates the value for the record
    CALL modifyPatient (vColumn,vValue, vID)d;

### Employee

#### Employee

    #   Add a new record to the table
    CALL newEmployee (eName, vDate, vStreet, vEmail, vPhone,veStatus ,vTitle, vDep);

    # Updates the information of the employee  except :x: Date
    CALL modifyEmployee (vColumn, vValue, veID);

#### Relations

    #   Assign a doctor to a patient
    CALL newRelation (veID, vpID);

    #   Delete an assignement manually
    CALL delRelation (veID, vpID);

    #   Modify a relation
    CALL modifyRelation (vColumn, veID, vpID);

#### Turnus

    #   Assign time for the employee to be at work
    CALL newTurnus (veID, vDate, vTime, vhrs);

    #   If the doctor is sick, update the sicDays, and add a comment to the turnus
    CALL sickDays (veID, vInt, vComment);

### HospitalManagementSystem

#### List Of Alergies

    #   Creates a new record for alergies
    CALL insertLOA (vID, vName, vSymptoms, medicine ID);

#### Diagnosis

    #   Creates a new record for Diagnosis
    CALL insertLOD (vID, vName, vSymptoms, medicine ID);

#### Medecines

    #   Creates a new record for Medecines
    CALL insertLOM (vID, vName, vSymptoms, illness);

#### RoomBookings

    #   Booking a room for the patient
    CALL bookRoom (vpID, veID, vrID, vInn);

    #   Cancellation of a room booking
    CALL delbook (vpID);

    #   Check if a room is available
    CALL checkRoom (veID, vDate, vTimeInn);

#### Floors

    #   Creates a new record for the table
    CALL firstFloor('roomName', 10000.00);
    CALL secondFloor('roomName', 10000.00);
    CALL thirdFloor('roomName', 10000.00);

##  Functions

###    Functions for employee database

####    Calculate a monthly salary

-   convertPhone(vPhone);
    Converts the digits into Areacode, 

-   calculateSalary(veStatus, vSalary);
    Calculates the salary for the inserted employee

-   checkRecovery();
    Check if the person is recovered

### Functions for patients Database

-   calculatebmi(vheight, vWeight);
    Calculates the bmi based on weight / vHeight

-   convertssn(vssn);
    Converts the digits from the table, and adding "-"

-   convertPhone(vPhone);
    Converts the digits into areacode.

### Functions for hospitalManagementSystem Database

-   checkAvailableRoom(vID);
    Check wheter a room is available, and returns an integer

## Views

-   Rooms

## Triggers

### Patients

-   triggerPDF
    triggers a new pdf generation when a patient has been registered<br>
    in the database

-   terminateBilling
    moves the old billings into a new database based on the billing is<br>
    paid or not.


### Employee

-   terminateEmployee
    trigger a insert into a table, when the delRecords event has been executed.

### hospitalManagementSystem

### archives

##  Events

### Patients

- delRecords
    Deletes records where the patient is above 200 years

### Employee

- delRecords
    Deletes records where the employee has been resigned

-   salaryChanges
    re calculates the salary every month

### hospitalManagementSystem

-   delRecords
    Delete old records

### archives

##  Testing and SQL Data

###  Test Performed in this SQL Project

The values has been manually entered, over time.

* [SQL data for employees](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/employees/SQLdata.sql)
* [SQL data for HospitalManagementSystem](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/HospitalManagementSystem/SQLdata.sql)
* [SQL data for patients](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/patients/SQLdata.sql)
* [SQL data for archive](https://github.com/krigjo25/Databases/blob/main/HospitalManagementSystem/archive/SQLdata.sql)

##  Python

### dictionaries.py

-   Created to easly maintain postal codes in the area

###  patientjournal.py

- This programming, create a PDF file from values which is in the database

###  uploadbiodata.py

- This uploads blob files to the database

### runPDF.py

This programming, runs the different methods which is coded

##  PDF

### sampleJournal.pdf

the patient journal, includes information about the given patient,
what has done during the patient's stay at the Hospital. 

### Invoice.pdf

A simple invoice for the patient, after the patient's stay

### Salary.pdf 

A simple salary for the employee

##  Summuary

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

*   Since the database is growing, there would be a need for new databases to keep the records as easy to maintain as possible, A database for Archives, patients, and employees
one database for employees and stuff for the employees, one for the administration, misc, and one for the patients 

## Responsories

### Database Plugins

### Python Libraries 

* mariadb, - [MariaDB Community](https://github.com/MariaDB)
* Python-dotenv, - [Saurabh Kumar](https://github.com/skwebdeveloper)
* reportlab, - [Andy Robinson, Robin Becker, the ReportLab team and the community](https://reportlab.com)

## Credits

### Contact Information

-   Discord : krigjo25#5588
-   messenger : krigjo25

Author notes<br>
« Everything is perfect as is. »

###  Licence

Not licenced.

###  Disclamers

This datebase is as is

###  References