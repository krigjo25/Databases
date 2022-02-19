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

CREATE OR REPLACE PROCEDURE newPatient (IN pName VARCHAR(255), IN bDate DATE, IN vssn INT, IN vSex VARCHAR(5), IN vPhone VARCHAR(255), IN vWeight MEDIUMINT, IN vHeight INT, IN bType VARCHAR(2), IN vAlergies VARCHAR(5), IN vDoc VARCHAR(5), IN vMed VARCHAR(5))
    BEGIN

    /*
        Inserting a new patient for the table
    */

        DECLARE vBMI TINYINT UNSIGNED;

        SET vBMI = vHeight / vBodyWeight;


        INSERT INTO patient (patientName, birthDate, ssn, sex, phoneNumber, street, zipCode, bodyWeight, bodyHeight, bodyIndex, bloodType, alergies, diagnosis, medecine, company, industry) 
            VALUES
            (pName, bDate, vssn, vSex, vPhone, vStreet, cZip, vWeight, vHeight, vBMI, bType, vAlergies, vDoc, vMed, vCompany, vIndustry);
    END x

/*****************************************************************/

CREATE OR REPLACE PROCEDURE modifyPatient(IN vColumn VARCHAR(20), vValue VARCHAR(255), IN vID INT)
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

/*********************** Billing Procedures ************************/
CREATE OR REPLACE PROCEDURE newBilling(IN vpID)
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

DELIMITER x
CREATE OR REPLACE PROCEDURE firstFloor ( vName VARCHAR(255), vRate DECIMAL(4.2))
    BEGIN
        -- Inserting values into list of Medicine
        INSERT INTO firstFloor (roomName, hourlyRate)
        VALUES (vName, vRate);
    END x

DELIMITER x
CREATE OR REPLACE PROCEDURE secondFloor ( vName VARCHAR(255), vRate DECIMAL(4.2))
    BEGIN
        -- Inserting values into list of Medicine
        INSERT INTO secondFloor (roomName, hourlyRate)
        VALUES (vName, vRate);
    END x

DELIMITER x
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
        
        INSERT INTO employees (eName, birthDate, street, zipCode, email, phone, mobile, eStatus, hourlyPay, department, occupation) VALUES
        (eName, vDate, vStreet, vZip, vEmail, vPhone, vMobile, veStatus, vSalary, vDep, vTitle);
    END x

/**************************************************************/

/***************************************************************

The procedure below allow the management
to modify information about the employee,
But it doesnt allow date but we assume 
the date is correct in this case

****************************************************************/
DELIMITER x

CREATE OR REPLACE PROCEDURE modifyEmployee (IN vColumn VARCHAR(20), IN eValue VARCHAR(255), IN eID BIGINT)
    BEGIN
        --  The procedure updates, the values for employees, execpt date
        SET @Query = CONCAT('UPDATE employees SET ', vColumn, ' = ', eValue, ' WHERE eID = ', eID);
            PREPARE stmt FROM @Query;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;

    END x
/***************************************************************/

/*********************** relation Procedures ******************************

This procedure assign a doctor to a patient

***********************************************************************/

DELIMITER x
CREATE OR REPLACE PROCEDURE newRelation ( IN veID BIGINT, IN vpID BIGINT)
    BEGIN

        -- Declareing new variables
        DECLARE pName VARCHAR(255);
        DECLARE emName VARCHAR(255);

        --  Assigning the new variable values
        SET pName = (SELECT patientName from patients.patient WHERE pID = vpID);
        SET emName = (SELECT eName from employees WHERE eID = veID);

        -- Assigning doctor to patient
        INSERT INTO relations (eID, employeeName, pID, patientName)
            VALUES 
            (veID, emName, vpID, pName);

    END x

CREATE OR REPLACE PROCEDURE delRelation (IN veID BIGINT, IN vpID BIGINT)
    BEGIN
        -- Deletes a row from the relation table
        DELETE FROM relations WHERE eID = veID AND pID = vpID;
    END x
DELIMITER x
CREATE OR REPLACE PROCEDURE modifyRelation( IN vColumn VARCHAR(20), veID BIGINT, vpID BIGINT)
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
/*******************************************************************/

/*********************** Turnus Procedures *************************/
/*******************************************************************/
