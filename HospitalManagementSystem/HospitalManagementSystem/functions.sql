
CREATE OR REPLACE FUNCTIOn checkAvailableRoom (vID SMALLINT) RETURNS TINYINT DETERMINISTIC
    BEGIN

        /************ checkAvailableRoom(vID) ********************'
            Returns an integer to check wheter the room
            is available or not

        *****************************************************************/

        --  Declare variables
        DECLARE vBookedIn DATE;
        DECLARE endLoop TINYINT;
        DECLARE vRoomID SMALLINT;
        DECLARE vCounter SMALLINT;
        DECLARE vRoomName VARCHAR(255);
        DECLARE availableRoom TINYINT;

        --  Declare cursor
        DECLARE cur CURSOR FOR 
            SELECT rID, roomName, bookingInn FROM booking WHERE rID = vID;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET endLoop = 1;

        --  Adding values to the declared variables
        SET endLoop = 0;
        SET availableRoom = 0;

        --  Opening the cur handler
        OPEN cur;
        availableRoomLoop : LOOP
            FETCH cur INTO vRoomID, vRoomName, vbookedIn;

            --  Checking if boooking in is not equal to current date
            --  And roomID is has to be equal to the room number
            IF vbookedIn != CURDATE() OR endLoop = 1 THEN LEAVE availableRoomLoop;

            ELSE SET availableRoom = 1;
            END IF;

        END LOOP;
        CLOSE cur;
        RETURN availableRoom;
    END x