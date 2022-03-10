/***************************************************************

This file contains the Procedures which is used in the project


Room Procedures,
Alergy Procedures,
Booking Procedures,
Medecine Procedures,
diagnosis Procedures,


/***************************************************************/

/****************************************************************
Procedures of Diagnosis, alergies, rooms and Medecine
****************************************************************/

/*********************** Booking Procedures ************************/
CREATE OR REPLACE PROCEDURE bookRoom (IN vpID BIGINT, IN veID BIGINT, IN vrID SMALLINT, IN vOid INT)
    BEGIN

        --  Declareing variables'
        DECLARE rName TYPE OF rooms.roomName;
        Declare vInn TYPE OF booking.bookInn;

        DECLARE procedureName VARCHAR(255);
        DECLARE procedureRate DECIMAL(4,2);
        DECLARE procedureTime DECIMAL(3,1);

        DECLARE veName VARCHAR(255);
        DECLARE vpName VARCHAR(255);

        --  Selecting the values and insert it into the variable
        SELECT roomName INTO rName FROM rooms WHERE roomID = vRid;
        SELECT patientName INTO vpName FROM patients.patient WHERE pID = vpID;
        SELECT employeeName INTO veName FROM employees.employees WHERE eID = veID;

        --  Selecting the informaation about the operation procedure
        SELECT procedureTime INTO procedureTime FROM operationProcedures.procedureTime WHERE id = vOid;
        SELECT procedureRate INTO procedureRate FROM operationProcedures.rate Where id = vOid;
        SELECT procedureName INTo procedureName FROM operationProcedures.procedureName WHERE id = vOid;

        --  Set values for the variables
        SET vInn = CURDATE();
        SET procedureTime = ADDTIME(vInn, procedureTime);

        --  Inserting values into the table
        INSERT INTO booking (pID, patientName, rID, roomName, procedures, rate, eID, employeeName, bookingInn, bookingOut)
            VALUES (vpID, vpName, vrID, rName, procedureName, procedureRate, veID, veName, vInn, procedureTime);
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


CREATE OR REPLACE PROCEDURE secondFloor ( IN vName VARCHAR(255), IN vRate DECIMAL(4.2))
    BEGIN
        -- Inserting values into list of Medicine
        INSERT INTO secondFloor (roomName, hourlyRate)
        VALUES (vName, vRate);
    END x

CREATE OR REPLACE PROCEDURE thirdFloor ( IN vName VARCHAR(255), IN vRate DECIMAL(4.2))
    BEGIN
        -- Inserting values into list of Medicine
        INSERT INTO thirdFloor (roomName, hourlyRate)
        VALUES (vName, vRate);
    END x

/*******************************************************************/

/*********************** Room Procedures ******************************/
CREATE OR REPLACE PROCEDURE operationProcedure ( IN vName VARCHAR(255), IN vRate DECIMAL(8.2), IN vTime TIME)
    BEGIN
        -- Inserting values into list of Medicine
        INSERT INTO operationProcedures (procedureName, procedureRate, procedureTime)
        VALUES (vName, vRate, vTime);
    END x


CREATE OR REPLACE PROCEDURE modifyProcedures (IN vID INT, vRate DECIMAL(4.2))
    BEGIN

        --  Updating a procedure
        UPDATE operationProcedures SET procedureRate = vRate WHERE id = vID;
    END x

CREATE OR REPLACE PROCEDURE delProcedure ( IN vID INT)
    BEGIN
        -- Deleting a row in the operationProcedures table
        DELETE FROM operationProcedures WHERE id = vID;

    END x

/*******************************************************************/