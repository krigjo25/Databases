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
CREATE OR REPLACE PROCEDURE bookRoom (IN vpID BIGINT, IN veID BIGINT, IN vID SMALLINT, IN vOid INT, IN vTime TINYINT, OUT Emessage VARCHAR(255))
    BEGIN

        --  Declareing variables'
        DECLARE rName TYPE OF rooms.roomName;
        Declare vInn TYPE OF booking.bookInn;

        DECLARE procedureName VARCHAR(255);
        DECLARE procedurePrice DECIMAL(4,2);
        DECLARE procedureTime DECIMAL(3,1);

        DECLARE veName VARCHAR(255);
        DECLARE vpName VARCHAR(255);

        --  Selecting the values and insert it into the variable
        SELECT roomName INTO rName FROM rooms WHERE roomID = vID;
        SELECT patientName INTO vpName FROM patients.patient WHERE pID = vpID;
        SELECT employeeName INTO veName FROM employees.employees WHERE eID = veID;

        --  Selecting the informaation about the operation procedure
        SELECT procedureName INTo procedureName FROM operationProcedures WHERE id = vOid;
        SELECT procedureTime INTO procedureTime FROM operationProcedures WHERE id = vOid;
        SELECT procedurePrice INTO procedurePrice FROM operationProcedures Where id = vOid;

        --  Case when a ward is booked
        CASE
            WHEN procedureName = 'Ward' THEN
                SET procedureTime = vTime;
                SET procedurePrice = 70 * CONVERT(procedureTime, DECIMAL);
        END CASE;
        --  Set values for the variables
        SET vInn = CURDATE();
        SET procedureTime = ADDTIME(vInn, procedureTime);

        --  Inserting values into the table
        INSERT INTO booking (pID, patientName, rID, roomName, oProcedures, price, eID, employeeName, bookingInn, bookingOut)
            VALUES (vpID, vpName, vID, rName, procedureName, procedurePrice, veID, veName, vInn, procedureTime);
    END x

CREATE OR REPLACE PROCEDURE delbook (in vpID BIGINT)
    BEGIN

    --  Delete a row from the database
    UPDATE booking SET cmt = 'CLD' WHERE pID = vpID;
    UPDATE 
    END x

CREATE OR REPLACE PROCEDURE searchRoom (IN vID SMALLINT, OUT ErrorMsg VARCHAR(255))
    BEGIN

        --  Declare variables
        DECLARE vBed INT;
        DECLARE vCounter INT;

        WHILE vID <= 105 DO

            SELECT COUNT(pID) INTO vCounter FROM booking WHERE rID = vID AND cmt != 'CLD';

            CASE

                -- Checking wheter the counter has reached max patients
                WHEN vCounter = 0 THEN 
                    SELECT roomID, roomName FROM rooms WHERE roomID = vID;
                    --  SELECT employeeName FROM employees.turnus WHERE roomID = vID;
                WHEN vCounter > 0 AND vID = 105 THEN 
                    SET ErrorMsg = 'No Consultation office is available';
                    SELECT ErrorMsg AS 'Available Rooms';
            END CASE;

            --  Adding a new number to the room
            SET vID = vID +1;

        END WHILE;

        IF vID = 108 OR vID = 110 THEN

            --  Counting how many patient there is in the observation Room
            SELECT COUNT(pID) INTO vCounter FROM booking WHERE rID = vID AND cmt != 'CLD';

            CASE

                --  Checking wheter the counter has reached max patients
                WHEN vCounter <= 12 THEN

                --  Counting how many beds available
                SET ErrorMsg = 12 - vCounter;


                SELECT roomID, roomName, ErrorMsg AS 'Available beds'  FROM rooms WHERE roomID = vID;
                
                

                WHEN vCounter = 12 THEN
                    SET ErrorMsg = ' No available beds';

            END CASE;
        END IF;

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