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
DELIMITER ??
CREATE OR REPLACE PROCEDURE insertPatient (pName VARCHAR(255),vAge INT, vSex VARCHAR(5), vPhone VARCHAR(255), vEmail VARCHAR(255), bType VARCHAR(20), vAlergies VARCHAR(255), vIllness VARCHAR(255))
    BEGIN
    /*
    Inserting a new patient for the table
    */
    INSERT INTO patient (patientName, age, gender, phoneNumber, eMail, bloodType, alergies, diseases) VALUES
    (pName, vage, vSex, vPhone, veMail, bType, vAlergies, villness);
    END ??

CREATE OR REPLACE PROCEDURE patientInfo(vID INT,  vColumn VARCHAR(20), 
vValue VARCHAR(255))
    BEGIN

    /*
    Updates patient information Which has VARCHAR as DATATYPE
    */
    SET @Query = CONCAT('UPDATE patient SET ', vColumn , vValue ' WHERE id = ', vID);

                /*Prepareing and executing the statement*/
                PREPARE stmt FROM @Query;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
/*****************************************************/
DELIMITER ??
/************************ List of Alergies **************************/
CREATE OR REPLACE PROCEDURE insertLOA (vID CHAR(5), vName VARCHAR(255), vSymptoms VARCHAR(255), mID CHAR(5))
    BEGIN
        -- Inserting values into list of Alergies
        INSERT INTO loa (alergyID, alergyName, symptoms, medicineID) VALUES 
        (vID, vName, vSymptoms, mID);
    END ??

/***************************************************/
DELIMITER ??
/************************ List of Diagnosis **************************/
CREATE OR REPLACE PROCEDURE insertLOD (vID CHAR(5), vName VARCHAR(255), vSymptoms VARCHAR(255), mID CHAR(5))
    BEGIN
        -- Inserting values into list of Diagnosis
        INSERT INTO lod (diagnosisID, diagnosisName, symptoms, medicineID) VALUES 
        (vID, vName, vSymptoms, mID);
    END ??

/***************************************************/
DELIMITER ??
/************************ List of Diagnosis **************************/
CREATE OR REPLACE PROCEDURE insertLOM (mID CHAR(5), vName VARCHAR(255), vIllness VARCHAR(255))
    BEGIN
        -- Inserting values into list of Medicine
        INSERT INTO lom (medicineID, medicineName, illness) VALUES 
        (mID, vName, vIllness);
    END ??

/***************************************************/

/*********************** Rooms ************************************/

DELIMITER x
CREATE OR REPLACE PROCEDURE firstFloor ( vName VARCHAR(255), vRate DECIMAL(4.2))
    BEGIN
        -- Inserting values into list of Medicine
        INSERT INTO firstFloor (roomName, hourlyRate) VALUES 
        (vName, vRate);
    END x