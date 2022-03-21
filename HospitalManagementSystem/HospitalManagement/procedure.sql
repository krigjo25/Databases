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
CREATE OR REPLACE PROCEDURE bookRoom (IN vpID BIGINT, IN rID SMALLINT, IN vID INT, IN vTime TINYINT, OUT msg VARCHAR(255))
    BEGIN

        --  Declare variables'
        DECLARE rName TYPE OF rooms.roomName;
        Declare vInn TYPE OF booking.bookInn;

        DECLARE procedureName VARCHAR(255);
        DECLARE procedurePrice DECIMAL(4,2);
        DECLARE procedureTime DECIMAL(3,1);

        DECLARE veID BIGINT;
        DECLARE veName VARCHAR(255);
        DECLARE vpName VARCHAR(255);

        --  Selecting the values and insert it into the variable
        SELECT roomName INTO rName FROM rooms WHERE roomID = rID;
        SELECT eID INTO veID FROM employees.relations WHERE pID = vpID;
        SELECT patientName INTO vpName FROM patients.patient WHERE pID = vpID;
        SELECT employeeName INTO veName FROM employees.relations WHERE veID = vpID;

        --  Selecting the informaation about the operation procedure
        SELECT procedureName INTo procedureName FROM operationProcedures WHERE id = vID;
        SELECT procedureTime INTO procedureTime FROM operationProcedures WHERE id = vID;
        SELECT procedurePrice INTO procedurePrice FROM operationProcedures Where id = vID;

        --  Case when a ward is booked
        CASE
            WHEN procedureName = 'Ward' THEN

                --  Give the variables a value
                SET procedureTime = vTime;
                SET procedurePrice = 70 * CONVERT(procedureTime, DECIMAL);
        END CASE;

        --  Set values for the variables
        SET vInn = CURDATE();
        SET procedureTime = ADDTIME(vInn, procedureTime);
        
        --  Checking if a room is available or not to complete the booking.
        SET @available = checkAvailableRoom(rID);

         --  Selecting values into variables
        SELECT roomName INTO vRname FROM rooms WHERE roomID = rID;
         CASE
            WHEN @available = 0 THEN
                --  Inserting values into the table
               INSERT INTO booking (pID, patientName, rID, roomName, oProcedures, price, eID, employeeName, bookingInn, bookingOut)
                    VALUES (vpID, vpName, vID, rName, procedureName, procedurePrice, veID, veName, vInn, procedureTime);

                SET msg = CONCAT('Patient Booked for', roomName, vInn);
                SELECT pID, patientName, roomName, oProcedures, msg AS 'SUCCSESS' FROM booking WHERE pID = vpID AND roomID = vRid AND bookingInn = CURDATE();

            WHEN @available = 1 THEN

                SET msg = CONCAT( roomName, ' Is not available at the moment');
                SELECT msg AS 'Booking failed';
        END CASE;
    END x

CREATE OR REPLACE PROCEDURE delbook (in vpID BIGINT)
    BEGIN

    --  Delete a row from the database
    UPDATE booking SET cmt = 'CLD' WHERE pID = vpID;
    UPDATE 
    END x

CREATE OR REPLACE PROCEDURE searchRoom (IN vID SMALLINT, OUT ErrorMsg VARCHAR(255))
    BEGIN

        --  Declare varibales
        DECLARE vRname VARCHAR(255);

        --  Creating a Temporary table
        CREATE OR REPLACE TEMPORARY TABLE availableRooms (
                                roomID SMALLINT UNSIGNED NOT NULL,
                                roomName VARCHAR(255) NOT NULL,
                                sStatus VARCHAR(255) NOT NULL);

        WHILE vID <= 105 DO

        --  Checking wheter the room is avialable or not
         SET @available = checkAvailableRoom(vID);

         --  Selecting values into variables
        SELECT roomName INTO vRname FROM rooms WHERE roomID = vID;
         CASE
            WHEN @available = 0 THEN
                INSERT INTO availableRooms (roomID, roomName, sStatus)
                    VALUES (vID, vRname, 'Available');

            WHEN @available = 1 THEN

                INSERT INTO availableRooms (roomID, roomName, sStatus)
                    VALUES (vID, vRname, 'Un Available');

            END CASE;

            --  Adding a new number to the room
            SET vID = vID +1;
        END WHILE;

        SELECT roomID, roomName, sStatus AS 'Search Status' FROM availableRooms;
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
CREATE OR REPLACE PROCEDURE firstFloor ( IN vName VARCHAR(255))
    BEGIN
        -- Inserting values into list of Medicine
        INSERT INTO firstFloor (roomName)
        VALUES (vName);
    END x


CREATE OR REPLACE PROCEDURE secondFloor ( IN vName VARCHAR(255))
    BEGIN
        -- Inserting values into list of Medicine
        INSERT INTO secondFloor (roomName)
        VALUES (vName);
    END x

CREATE OR REPLACE PROCEDURE thirdFloor ( IN vName VARCHAR(255))
    BEGIN
        -- Inserting values into list of Medicine
        INSERT INTO thirdFloor (roomName)
        VALUES (vName);
    END x

/*******************************************************************/

/*********************** Room Procedures ******************************/
CREATE OR REPLACE PROCEDURE operationProcedure ( IN vName VARCHAR(255), IN vRate DECIMAL(8.2), IN vTime TIME)
    BEGIN

        --  Inserting values into list of Medicine
        INSERT INTO operationProcedures (procedureName, procedurePrice, procedureTime)
        VALUES (vName, vRate, vTime);
    END x


CREATE OR REPLACE PROCEDURE modifyProcedures (IN vID INT, vRate DECIMAL(4.2))
    BEGIN

        --  Updating a procedure
        UPDATE operationProcedures SET procedurePrice = vRate WHERE id = vID;
    END x

CREATE OR REPLACE PROCEDURE delProcedure ( IN vID INT)
    BEGIN
        -- Deleting a row in the operationProcedures table
        DELETE FROM operationProcedures WHERE id = vID;

    END x

/*******************************************************************/