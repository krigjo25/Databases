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


