/***************************************************************

This file contains the Procedures which is used in the project

Employees Procedures,
Patient Procedures,
Booking Procedures,
Billing Proceduures,

Relation Procedures,
Alergy Procedures,
diagnosis Procedures,
Medecine Procedures.
Room Procedures.
/***************************************************************/

/********************** Employees Procedures *******************
This procedures below allows the management
add a new employee into the database
***************************************************************/
CREATE OR REPLACE PROCEDURE newEmployee (IN eName VARCHAR(255), IN Eaddr VARCHAR(255), IN vAge INT, IN vSex VARCHAR(5), IN vPhone VARCHAR(255), IN vEmail VARCHAR(255), IN vZip SMALLINT, IN vDep VARCHAR(255), IN vPos VARCHAR(255))
    BEGIN
        -- This procedure creates a new row with the details of an employee 
        INSERT INTO employees (employeeName, employeeAddress, zipCode, email, phone, eContact, position) VALUES
        (eName, Eaddr, vZip, vEmail, vPhone, vEmergency, vPos)
    END x


/**************************************************************
This procedure below allow the management
to edit information about the employee,
But it doesnt allow date but we assume the date is correct in this case
***************************************************************/
DELIMITER x

CREATE OR REPLACE PROCEDURE employeeInfo (IN vColumn VARCHAR(20), IN eValue VARCHAR(255), IN eID BIGINT)
    BEGIN
        --  The procedure updates, the values for employees, execpt date
        SET @Query = CONCAT('UPDATE employees SET ', vColumn, ' = ', eValue, ' WHERE eID = ', eID);
            PREPARE stmt FROM @Query;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;

    END x
/***************************************************************/

/********************** Patients Procedures ********************
Inserting a new record to the table.
****************************************************************/
DELIMITER x
CREATE OR REPLACE PROCEDURE insertPatient (IN pName VARCHAR(255), IN vAge TINYINT, IN vSex VARCHAR(5), IN vPhone VARCHAR(255), IN vEmail VARCHAR(255), IN bType VARCHAR(2), IN vAlergies VARCHAR(255), IN vIllness VARCHAR(255))
    BEGIN
    /*
    Inserting a new patient for the table
    */
    INSERT INTO patient (patientName, age, gender, phoneNumber, eMail, bloodType, alergies, diseases) VALUES
    (pName, vage, vSex, vPhone, veMail, bType, vAlergies, villness);
    END x
    
/*****************************************************************
Update the patient Information.
******************************************************************/
CREATE OR REPLACE PROCEDURE patientInfo(IN vColumn VARCHAR(20), vValue VARCHAR(255), IN vID INT)
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

/*********************** Booking Procedures ************************/
/*******************************************************************/

/*********************** Billing Procedures ************************/
/*******************************************************************/

/*********************** Turnus Procedures *************************/
/*******************************************************************/



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

