/********************** Procedures***************************
author
krigjo25

/******************************************************/

/********************** Employees ********************/

CREATE OR REPLACE PROCEDURE newEmployee (IN eName VARCHAR(255), IN Eaddr VARCHAR(255), IN vAge INT, IN vSex VARCHAR(5), IN vPhone VARCHAR(255), IN vEmail VARCHAR(255), IN vZip SMALLINT, IN vDep VARCHAR(255), IN vPos VARCHAR(255))
    BEGIN
        -- This procedure creates a new row with the details of an employee 
        INSERT INTO employees (employeeName, employeeAddress, zipCode, email, phone, eContact, position) VALUES
        (eName, Eaddr, vZip, vEmail, vPhone, vEmergency, vPos)
    -   Insert a new employee
    -   Update employee info
/****************************************************/
/********************** Patients ********************/
DELIMITER x
CREATE OR REPLACE PROCEDURE insertPatient (IN pName VARCHAR(255), IN vAge TINYINT, IN vSex VARCHAR(5), IN vPhone VARCHAR(255), IN vEmail VARCHAR(255), IN bType VARCHAR(20), IN vAlergies VARCHAR(255), IN vIllness VARCHAR(255))
    BEGIN
    /*
    Inserting a new patient for the table
    */
    INSERT INTO patient (patientName, age, gender, phoneNumber, eMail, bloodType, alergies, diseases) VALUES
    (pName, vage, vSex, vPhone, veMail, bType, vAlergies, villness);
    END x

CREATE OR REPLACE PROCEDURE patientInfo(IN vID INT, IN vColumn VARCHAR(20),vValue VARCHAR(255))
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
/*****************************************************/
DELIMITER x
/************************ List of Alergies **************************/
CREATE OR REPLACE PROCEDURE insertA (vID CHAR(5), vName VARCHAR(255), vSymptoms VARCHAR(255), mID CHAR(5))
    BEGIN
        -- Inserting values into list of Alergies
        INSERT INTO alergies (alergyID, alergyName, symptoms, medicineID)
        VALUES (vID, vName, vSymptoms, mID);
    END x

/***************************************************/
DELIMITER x
/************************ List of Diagnosis **************************/
CREATE OR REPLACE PROCEDURE insertD (vID CHAR(5), vName VARCHAR(255), vSymptoms VARCHAR(255), mID CHAR(5))
    BEGIN
        -- Inserting values into list of Diagnosis
        INSERT INTO diagnosis (diagnosisID, diagnosisName, symptoms, medicineID)
        VALUES (vID, vName, vSymptoms, mID);
    END x
/***************************************************/
DELIMITER x
/************************ List of available Medecines **************************/
CREATE OR REPLACE PROCEDURE insertM (mID CHAR(5), vName VARCHAR(255), vIllness VARCHAR(255))
    BEGIN
        -- Inserting values into list of Medicine
        INSERT INTO availableMedecines (medicineID, medicineName, illness) 
        VALUES (mID, vName, vIllness);
    END x

/***************************************************/

/*********************** Rooms ************************************/

DELIMITER x
CREATE OR REPLACE PROCEDURE firstFloor ( vName VARCHAR(255), vRate DECIMAL(4.2))
    BEGIN
        -- Inserting values into list of Medicine
        INSERT INTO firstFloor (roomName, hourlyRate)
        VALUES (vName, vRate);
    END x