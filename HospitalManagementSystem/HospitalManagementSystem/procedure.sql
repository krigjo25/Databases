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
CREATE OR REPLACE PROCEDURE roomBooking (IN vpID BIGINT, IN rID SMALLINT, IN vID INT, IN vTime DECIMAL(3,1), OUT msg VARCHAR(255))
    BEGIN

        /************ bookRoom ********************'
            Booking a room or a operation procedure,
            record into the databse.

        *****************************************************************/

        --  Declare variables'
        DECLARE rName TYPE OF rooms.roomName;
        Declare vInn TYPE OF booking.bookingInn;

        DECLARE procedureName VARCHAR(255);
        DECLARE procedurePrice DECIMAL(4,2);
        DECLARE procedureTime DECIMAL(3,1);

        DECLARE veID BIGINT;
        DECLARE veName VARCHAR(255);
        DECLARE vpName VARCHAR(255);

        --  Selecting the values and insert it into the variable
        SELECT roomName INTO rName FROM rooms WHERE roomID = rID;
        SELECT eID INTO veID FROM employeement.relations WHERE pID = vpID;
        SELECT employeeName INTO veName FROM employeement.relations WHERE veID = vpID;
        SELECT patientName INTO vpName FROM patientRegistration.patientRegistrations WHERE patientID = vpID;

        --  Selecting the informaation about the operation procedure
        SELECT procedureName INTO procedureName FROM operationProcedures WHERE id = vID;
        SELECT procedureTime INTO procedureTime FROM operationProcedures WHERE id = vID;
        SELECT procedurePrice INTO procedurePrice FROM operationProcedures Where id = vID;

        --  Case when a ward is booked
            IF procedureName = 'Ward' THEN

                --  Give the variables a value
                SET procedureTime = vTime;
                SET procedurePrice = 70 * CONVERT(procedureTime, DECIMAL);
        END IF;

        --  Set values for the variables
        SET vInn = CURDATE();
        SET procedureTime = ADDTIME(vInn, procedureTime);
        
        --  Checking if a room is available or not to complete the booking.
        SET @available = checkAvailableRoom(rID);

        --  Selecting values into variables
        SELECT roomName INTO rName FROM rooms WHERE roomID = rID;

        --   Creating a record into the patientRecords tables
        
         CASE
            WHEN @available = 0 THEN

            -- Inserting a new record into the patient's table
                CALL newPatientRecord (vpID, procedureName, vInn, procedureTime, veName, rName, procedurePrice);

                --  Inserting a new record into booking
               INSERT INTO booking (patientID, patientName, rID, roomName, oProcedures, price, eID, employeeName, bookingInn, bookingOut)
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


        /************ delbook ********************'
            Deletes a booked room from the table

        *****************************************************************/

    --  Delete a row from the database
    UPDATE booking SET cmt = 'CLD' WHERE pID = vpID;
    END x

CREATE OR REPLACE PROCEDURE searchRoom (IN vID SMALLINT, OUT ErrorMsg VARCHAR(255))
    BEGIN


        /************ newEmployee ********************
            Checking wheter a room is available or not

        ***********************************************/

        --  Declare varibales
        DECLARE rName VARCHAR(255);

        --  Creating a Temporary table
        CREATE OR REPLACE TEMPORARY TABLE availableRooms (
                                roomID SMALLINT UNSIGNED NOT NULL,
                                roomName VARCHAR(255) NOT NULL,
                                sStatus VARCHAR(255) NOT NULL);

        WHILE vID <= 105 DO

        --  Checking wheter the room is avialable or not
         SET @available = checkAvailableRoom(vID);

         --  Selecting values into variables
        SELECT roomName INTO rName FROM rooms WHERE roomID = vID;
         CASE
            WHEN @available = 0 THEN
                INSERT INTO availableRooms (roomID, roomName, sStatus)
                    VALUES (vID, rName, 'Available');

            WHEN @available = 1 THEN

                INSERT INTO availableRooms (roomID, roomName, sStatus)
                    VALUES (vID, rName, 'Un Available');

            END CASE;

            --  Adding a new number to the room
            SET vID = vID +1;
        END WHILE;

        SELECT roomID, roomName, sStatus AS 'Search Status' FROM availableRooms;
    END x

CREATE OR REPLACE PROCEDURE newPatientRecord (IN vPatientID BIGINT, IN vprocedureName VARCHAR(255), IN vInn DATE, IN procedureTime TIME, IN veName VARCHAR(255), IN roomName VARCHAR(255), IN procedurePrice DECIMAL(8.2))
    BEGIN 
        
        --  Declare necsessary variables
        DECLARE vssn VARCHAR(255);
        DECLARE Query VARCHAR(255);
        DECLARE vName VARCHAR(255);
        DECLARE tableName VARCHAR(7);

        --  Selecting values into the variables

        SELECT patientName into vName FROM patientRegistration.patientRegistrations WHERE patientID = vpID;
        SELECT vssn into vssn FROM patientRegistration.patientRegistrations WHERE patientID = vpID;

        SET tableName = generateTableName(vName, vssn);
       
        INSERT INTO patientRecords.tableName(oprocedure, datein, procedureTime, procedurePrice, eName, room)
            VALUES (procedureName, vInn, procedureTime, vprocedurePrice, veName, roomName);

    END x
/*******************************************************************/

/************************ Alergies Procedures **************************/
CREATE OR REPLACE PROCEDURE insertA (vID CHAR(5), vName VARCHAR(255), vSymptoms VARCHAR(255), mID CHAR(5))
    BEGIN


        /************ newEmployee ********************'
            Inserting a record into alergies table

        *****************************************************************/

        -- Inserting values into list of Alergies
        INSERT INTO alergies (alergyID, aName, symptoms, medecineID)
        VALUES (vID, vName, vSymptoms, mID);
    END x

/************************************************************************/
DELIMITER x
/************************ Diagnosis Procedures **************************/
CREATE OR REPLACE PROCEDURE insertD (vID CHAR(5), vName VARCHAR(255), vSymptoms VARCHAR(255), mID CHAR(5))
    BEGIN

        /************ newEmployee ********************'
            Inserting a record into Diagnosis table

        **********************************************/

        -- Inserting values into list of Diagnosis
        INSERT INTO diagnosis (diagnosisID, diagnosisName, symptoms, medicineID)
        VALUES (vID, vName, vSymptoms, mID);
    END x
/************************************************************************/
DELIMITER x
/************************ Medecines Procedures **************************/
CREATE OR REPLACE PROCEDURE insertM (mID CHAR(5), vName VARCHAR(255), vIllness VARCHAR(255))
    BEGIN

        /************ insertM ********************
            Inserting a record into the available medecine table

        *******************************************************/

        -- Inserting values into list of Medicine
        INSERT INTO availableMedecines (mID, medecineName, illness) 
        VALUES (mID, vName, vIllness);
    END x

/***********************************************************************/

/*********************** Room Procedures ******************************/
CREATE OR REPLACE PROCEDURE firstFloor ( IN vName VARCHAR(255))
    BEGIN

        /************ firstfloor ********************'
            Inserting a record into the firstfloor table.

        ************************************************/

        -- Inserting values into list of Medicine
        INSERT INTO firstFloor (roomName)
        VALUES (vName);
    END x


CREATE OR REPLACE PROCEDURE secondFloor ( IN vName VARCHAR(255))
    BEGIN

        /************ secondfloor ********************'
            Inserting a record into the secondfloor table.

        ************************************************/

        -- Inserting values into list of Medicine
        INSERT INTO secondFloor (roomName)
        VALUES (vName);
    END x

CREATE OR REPLACE PROCEDURE thirdFloor ( IN vName VARCHAR(255))
    BEGIN

        /*********** thirdFloor ********************'
            Inserting a record into the thirdfloor table.

        ************************************************/

        -- Inserting values into list of Medicine
        INSERT INTO thirdFloor (roomName)
        VALUES (vName);
    END x

/*******************************************************************/

/*********************** Operation Procedures ******************************/
CREATE OR REPLACE PROCEDURE operationProcedure ( IN vName VARCHAR(255), IN vRate DECIMAL(8.2), IN vTime TIME)
    BEGIN

        /************  operationProcedure ********************'
            Inserting a record into the operationProcedure table.

        ************************************************/

        --  Inserting values into list of Medicine
        INSERT INTO operationProcedures (procedureName, procedurePrice, procedureTime)
        VALUES (vName, vRate, vTime);
    END x


CREATE OR REPLACE PROCEDURE modifyProcedures (IN vID INT, vRate DECIMAL(4.2))
    BEGIN

        /************ modifyProcedures ********************'
            modifying the price of a procedure.

        ************************************************/

        --  Updating a procedure
        UPDATE operationProcedures SET procedurePrice = vRate WHERE id = vID;
    END x

CREATE OR REPLACE PROCEDURE delProcedure ( IN vID INT)
    BEGIN

        /************ delProcedure ********************'
            Deletes a record from the operation procedure table

        ************************************************/

        -- Deleting a row in the operationProcedures table
        DELETE FROM operationProcedures WHERE id = vID;

    END x

/*******************************************************************/