/***************************************************************

This file contains the Procedures which is used in the project


Patient Procedures,
Billing Proceduures,

Employees Procedures,
Relation Procedures,
Booking Procedures,

Alergy Procedures,
diagnosis Procedures,
Medecine Procedures.
Room Procedures.

/***************************************************************/

/*********************** Patients Procedures ******************************
Procedures for patients database

 newPatient     --  Inserting new patient

***********************************************************************/

/********************** Patients Procedures ********************

Inserting a new and / or modifying records in the patient table

****************************************************************/

CREATE OR REPLACE PROCEDURE newPatient (IN pName VARCHAR(255), IN bDate DATE, IN vssn INT, IN vSex VARCHAR(5), IN vPhone VARCHAR(255), IN vStreet VARCHAR(255), IN vZip TINYINT, IN vWeight INT, IN vHeight INT, IN bType VARCHAR(2), IN vAlergies VARCHAR(5), IN vDoc VARCHAR(5), IN vMed VARCHAR(5))
    BEGIN
        --  Declare variables
        DECLARE vBMI TINYINT UNSIGNED;

        --  Add a value to the variables
        SET vBMI = vHeight / vBodyWeight;

        --  Insert values into the table
        INSERT INTO patient (patientName, birthDate, ssn, sex, phoneNumber, street, zipCode, bodyWeight, bodyHeight, bodyIndex, bloodType, alergies, diagnosis, medecine)
            VALUES
                (pName, bDate, vssn, vSex, vPhone, vStreet, vZip, vWeight, vHeight, vBMI, bType, vAlergies, vDoc, vMed);
    END x

/*****************************************************************/

CREATE OR REPLACE PROCEDURE modifyPatient (IN vColumn VARCHAR(20), vValue VARCHAR(255), IN vID INT)
    BEGIN

    /*
    Updates patient information Which has VARCHAR as DATATYPE
    */

        SET @Query = CONCAT('UPDATE patient SET ', vColumn , vValue, ' WHERE id = ', vID);

        /*Prepareing and executing the statement*/
            PREPARE stmt FROM @Query;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
    END x
/***********************************************************************/
x
/*********************** Billing Procedures ************************/
CREATE OR REPLACE PROCEDURE newBilling (IN vpID BIGINT)
    BEGIN

        --  Declare variables
        DECLARE vAmmount DECIMAL(11,2)
        DECLARE num  DECIMAL(11,2)
        
        --  Creating a loop to loop thorugh the list

        --  Inserting values to the table
        INSERT INTO billing (pID, Ammount, discount)
        VALUES
        (cpID, vAmmount, 0.00)
/*******************************************************************/


/*********************** HospitalManagementSystem Procedures ******************************
Procedures for HospitalManagementSystem database

***********************************************************************/

/****************************************************************
Procedures of Diagnosis, alergies, and Medecine
****************************************************************/

DELIMITER x
/************************ Alergies Procedures **************************/
CREATE OR REPLACE PROCEDURE insertA (vID CHAR(5), vName VARCHAR(255), vSymptoms VARCHAR(255), mID CHAR(5))
    BEGIN
        -- Inserting values into list of Alergies
        INSERT INTO alergies (alergyID, alergyName, symptoms, medicineID)
        VALUES (vID, vName, vSymptoms, mID);
    END x

/************************************************************************/
DELIMITER x
/************************ Diagnosis Procedures **************************/
CREATE OR REPLACE PROCEDURE insertD (vID CHAR(5), vName VARCHAR(255), vSymptoms VARCHAR(255), mID CHAR(5))
    BEGIN
        -- Inserting values into list of Diagnosis
        INSERT INTO diagnosis (diagnosisID, diagnosisName, symptoms, medicineID)
        VALUES (vID, vName, vSymptoms, mID);
    END x
/************************************************************************/
DELIMITER x
/************************ Medecines Procedures **************************/
CREATE OR REPLACE PROCEDURE insertM (mID CHAR(5), vName VARCHAR(255), vIllness VARCHAR(255))
    BEGIN
        -- Inserting values into list of Medicine
        INSERT INTO availableMedecines (medicineID, medicineName, illness) 
        VALUES (mID, vName, vIllness);
    END x

/***********************************************************************/

/*********************** Room Procedures ******************************/
CREATE OR REPLACE PROCEDURE firstFloor ( vName VARCHAR(255), vRate DECIMAL(4.2))
    BEGIN
        -- Inserting values into list of Medicine
        INSERT INTO firstFloor (roomName, hourlyRate)
        VALUES (vName, vRate);
    END x


CREATE OR REPLACE PROCEDURE secondFloor ( vName VARCHAR(255), vRate DECIMAL(4.2))
    BEGIN
        -- Inserting values into list of Medicine
        INSERT INTO secondFloor (roomName, hourlyRate)
        VALUES (vName, vRate);
    END x

CREATE OR REPLACE PROCEDURE thirdFloor ( vName VARCHAR(255), vRate DECIMAL(4.2))
    BEGIN
        -- Inserting values into list of Medicine
        INSERT INTO thirdFloor (roomName, hourlyRate)
        VALUES (vName, vRate);
    END x

/*******************************************************************/


/*********************** Employees Procedures ******************************
Procedures for employees database

***********************************************************************/

/********************** Employees Procedures *******************

This procedures below allows the management
add a new employee into the database

***************************************************************/
CREATE OR REPLACE PROCEDURE newEmployee (IN eName VARCHAR(255), IN vDate DATE, IN vStreet VARCHAR(255), IN vEmail VARCHAR(255), IN vPhone VARCHAR(255), IN veStatus TINYINT, IN vTitle VARCHAR(255),  IN vDep VARCHAR(255))
    BEGIN
        -- This procedure creates a new row with the details of an employee 

        --  Declare variables
        DECLARE vSalary DECIMAL(9,2);

        --  Add a value to the Variable
        SET vSalary = (SELECT salary FROM salaries WHERE occupation = vTitle);
        
        INSERT INTO employees (eName, birthDate, street, zipCode, email, phone, eStatus, hourlyPay, department, occupation) VALUES
        (eName, vDate, vStreet, vZip, vEmail, vPhone, veStatus, vSalary, vDep, vTitle);
    END x

/**************************************************************/

/***************************************************************

The procedure below allow the management
to modify information about the employee,
But it doesnt allow date but we assume 
the date is correct in this case

****************************************************************/
CREATE OR REPLACE PROCEDURE modifyEmployee (IN vColumn VARCHAR(20), IN vValue VARCHAR(255), IN veID BIGINT)
    BEGIN
        --  The procedure updates, the values for employees, execpt date
        SET @Query = CONCAT('UPDATE employees SET ', vColumn, ' = ', vValue, ' WHERE eID = ', veID);
            PREPARE stmt FROM @Query;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;

    END x
/***************************************************************/

/*********************** relation Procedures ******************************

This procedure assign a doctor to a patient

***********************************************************************/
CREATE OR REPLACE PROCEDURE newRelation ( IN veID BIGINT, IN vpID BIGINT)
    BEGIN

        -- Declareing new variables
        DECLARE pName VARCHAR(255);
        DECLARE veName VARCHAR(255);
        DECLARE vCount TINYINT;

        --  Assigning the new variable values
        SET pName = (SELECT patientName from patients.patient WHERE pID = vpID);
        SET veName = (SELECT eName from employees WHERE eID = veID);

        --  Counting how many times the doctor has been added to the table
        SET vCount = COUNT(veID);

        IF vCount <= 9 THEN

        -- Assigning doctor to patient
        INSERT INTO relations (eID, employeeName, pID, patientName)
            VALUES 
            (veID, veName, vpID, pName);

        END IF;

    END x

CREATE OR REPLACE PROCEDURE delRelation (IN veID BIGINT, IN vpID BIGINT)
    BEGIN
        -- Deletes a row from the relation table
        DELETE FROM relations WHERE eID = veID AND pID = vpID;
    END x

CREATE OR REPLACE PROCEDURE modifyRelation( IN vColumn VARCHAR(20), IN veID BIGINT, IN vpID BIGINT, IN vValue BIGINT)
    BEGIN

        --  Creating a case to update selected Column
        CASE
        WHEN vColumn = 'eID' THEN SET @Query = CONCAT('UPDATE relations SET ', vColumn, ' = ', vValue, ' WHERE eID = ', veID);
        WHEN vColumn = 'pID' THEN SET @Query = CONCAT('UPDATE relations SER ', vColumn, ' = ', vValue, ' WHERE pID = ', vpID);
        END CASE;

            /*Prepareing and executing the statement*/
            PREPARE stmt FROM @Query;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;

    END x
/*******************************************************************/

/*********************** Booking Procedures ************************/
CREATE OR REPLACE PROCEDURE bookRoom (IN vpID BIGINT, IN veID BIGINT, IN vrID SMALLINT, IN vInn DATE)
    BEGIN

        --  Declareing variables'
        DECLARE rName TYPE OF rooms.roomName;
        DECLARE vOut TYPE OF booking.bookOut;
        DECLARE vRate TYPE OF rooms.hourlyRoomRate;
        DECLARE veName TYPE OF employees.employees.eName;
        DECLARE vpName TYPE OF patients.patient.patientName;

        --  Selecting the values and insert it into the variable
        SELECT roomName INTO rName FROM rooms WHERE roomID = vRid;
        SELECT patientName INTO vpName FROM patients.patient WHERE pID = vpID;
        SELECT employeeName INTO veName FROM employees.employees WHERE eID = veID;        
        
        --  Loop through the booking reason and room Name
        --IF rName = 'SurgeryTheaters' THEN SET vRate = (SELECT hourlyRoomRate FROM rooms WHERE roomName = rName);
        --ELSE IF rName = 'ICU'  THEN SET vRate = (SELECT hourlyRoomRate FROM rooms WHERE roomName = rName);
        --END IF;

        --  Creating a loop to check wheter the date is taken or not
        
        --  Inserting values into the table
        INSERT INTO booking (pID, patientName, rID, roomName, eID, employeeName, bookingInn, bookingOut)
            VALUES (vpID, vpName, vrID, rName, veID, veName, vInn, vOut);
    END x

CREATE OR REPLACE PROCEDURE delbook (in vpID BIGINT)
    BEGIN

    --  Delete a row from the database
    DELETE FROM booking WHERE pID = vpID;

    END x

CREATE OR REPLACE PROCEDURE searchRoom (IN vDate DATETIME, IN vrID SMALLINT)
    BEGIN
        --  Declare variables
        DECLARE vrName VARCHAR(255);

        --  Set a value to the variable
        SET vrName = (SELECT roomName FROM rooms WHERE rID = vrID);

        --  Select the values from the table
        SELECT pID, rID, roomName, bookInn, bookOut FROM bookings WHERE bookInn = vDate AND comments != 'Cancelled' AND roomName = vrName;
    
    END x
/*******************************************************************/
DELIMITER x
/*********************** Turnus Procedures *************************/
CREATE OR REPLACE PROCEDURE newTurnus (IN veID BIGINT, IN vDate DATE, IN vTimeInn TIME, IN vhrs TINYINT, vMin TINYINT)
    BEGIN

        --  Declare variables
        DECLARE vTimeOut TYPE OF turnus.ut;
        DECLARE veName TYPE OF employees.eName;
        DECLARE vSickDays TYPE OF employees.sickDays;

        --  Insert values to variables
        SELECT eName INTO veName FROM employees WHERE eID = veID;

        --  Count the hours for the staff to be at work
        SET vTimeOut = CONCAT(vhrs,':', vmin, ':00'); 

        --  Insert into the table
        INSERT INTO turnus (eID, eName, dato, inn, ut, sickDays) 
            VALUES (veID, veName, vDate, vTimeInn, vTimeout, vSickDays);
    END x

CREATE OR REPLACE PROCEDURE sickDay (IN veID BIGINT, IN vInt TINYINT, IN vComment VARCHAR(255))
    BEGIN

        --  Declaring variables
        DECLARE vTime TYPE OF turnus.inn;
        DECLARE vResult TINYINT;
        DECLARE vComment TYPE OF turnus.comments;
        DECLARE vSickDays TYPE OF employees.sickDays;
        

        -- Inserting values into the variables
        SELECT inn INTO vTime FROM turnus;
        SET vComment = 'Self-Declareation';
        SELECT sickDays INTO vSickDays FROM employees;

        -- Updating sickDays
        IF vInt < vSickDays THEN 
        SET vResult = vSickDays - vInt
        UPDATE employees SET sickDays = vSickDays - vInt WHERE eID = veID;
        UPDATE turnus SET comments = vComment WHERE dato = vDate AND inn = vTime;
        END IF;

    END x
/*******************************************************************/