/*
DATABASE Name 
SportsDB

 DOCUMENTATION FOR
SportsDB

Author
Krigjo25
*/
CREATE DATABASE sportsDB-- *****************  CREATE DATABASE ***********************************

 -- *****************  CREATE TABLE Members ***********************************

-- *****************  PROCEDURES ***********************************
DELIMITER $$
    CREATE OR REPLACE PROCEDURE insertMember(IN mID VARCHAR(255), 
    IN mPass VARCHAR(255), IN mEmail VARCHAR(255))
        BEGIN
        -- This Procedure Inserting a member to the members table

        INSERT INTO Members (MemberID, Pass, email)
        VALUES(mid, SHA1(mPass), mEmail);
        
        END $$
DELIMITER ;

DELIMITER $$
    CREATE OR REPLACE PROCEDURE uCredit(IN mID VARCHAR(255), 
    IN mPass VARCHAR(255), IN mEmail VARCHAR(255))
        BEGIN
        -- This Procedure Inserting a member to the members table

        INSERT INTO Members (MemberID, Pass, email)
        VALUES(mid, SHA1(mPass), mEmail);
        
        END $$
DELIMITER ;
DELIMITER $$
    CREATE OR REPLACE PROCEDURE DelMember(IN mID VARCHAR (255))
        -- This procedure deletes a member from the table
        BEGIN
        DELETE FROM Members WHERE MemberID = mID;    
        END $$
DELIMITER ;
DELIMITER $$
    CREATE OR REPLACE PROCEDURE uPass(IN mID VARCHAR(255), IN mPass VARCHAR(255))
        BEGIN
        --  This procedure updates the password for the users

        UPDATE Members SET Pass = SHA1(mPass) WHERE MemberID = mID;

        END$$
DELIMITER ;

DELIMITER $$
    CREATE OR REPLACE PROCEDURE uEmail(IN mID VARCHAR(255), IN mEmail VARCHAR(255))
        BEGIN
        -- This Procedure Inserting a member to the members table
        
        UPDATE Members SET Email = mEmail WHERE MemberID = mID;
       
        END $$
DELIMITER ;

DELIMITER ;


-- *****************  CREATE TABLE BOOKINGS ***********************************

DELIMITER ;
    -- INSERT STATEMENT USED FOR THIS PROJECT


-- *****************  STORED PROCEDURES ***********************************
DELIMITER $$
    CREATE OR REPLACE PROCEDURE Book( IN rID CHAR(2), IN mID VARCHAR(255), IN bDate DATE, IN bTime TIME)
        -- This procedure creates an instance to book an activity at a date
        BEGIN
             -- DECLARES VARIABLES
            DECLARE Price Type OF Room.Pricelist;
            DECLARE SCash TYPE OF Members.Credit;

                -- Insert values into the variables
            SELECT PriceList INTO Price FROM Room WHERE ID = rID;
            SELECT Credit INTO SCash FROM Members WHERE MemberID = mID;

                -- Updating the Credit column to members first, to ensure the user gets credited
            UPDATE Members SET Credit = Scash - Price WHERE MemberID = mID;
    
                -- INSERTING VALUES INTO the table
            INSERT INTO Booking (RoomID,  DateBooked, TimeBooked, BookedBy) 
            VALUES(rID, bDate, bTime, mID);

        END $$
DELIMITER ;

DELIMITER $$
    CREATE OR REPLACE PROCEDURE searchRoom(IN rType CHAR(2), IN bookDate DATE, IN bookTime TIME)
         -- This stored procedure let us view which time a given room is unavailable
        BEGIN
                -- SELECT given colums   
            SELECT RoomID, DateBooked, TimeBooked, Status FROM Booking WHERE RoomID = rType AND DateBooked = bookDate AND TimeBooked = bookTime AND Status != 'CANCELLED';
        END $$
DELIMITER ;

DELIMITER $$
    CREATE OR REPLACE PROCEDURE viewBooking (IN mID VARCHAR(255))
           -- This particular procedure lets us view the bookings of memberID.
        BEGIN
            SELECT * FROM Booking WHERE BookedBy = mID;
        END$$
DELIMITER ;
DELIMITER $$
   -- ERROR
    CREATE OR REPLACE PROCEDURE updateStatus (IN vBookID INT)
        -- This Procedure updates the paymentstCatus when the user HAS transfeered cash.
        BEGIN
                -- Declaring variables
            DECLARE mID TYPE OF Members.MemberID;
            DECLARE sCash TYPE OF Members.Credit;
            DECLARE vPrice TYPE OF OverView.Price;
            DECLARE result DECIMAL(5,2);

            SET result = 0;
                                -- Selecting and inserting values
            SELECT BookedBy INTO mID FROM OverView WHERE BookID = vBookID;
            SELECT Price INTO vPrice FROM OverView WHERE BookID = vBookID;
            SELECT Credit INTO sCash FROM Members WHERE MemberID = mID;

            -- Updating the booking table to paid
            UPDATE OverView SET Status = 'PAYMENT OK, Room Reserved' WHERE BookID = vBookID;
            
            SET result = sCash-vPrice;
                -- UPDATING Credit when user has paid
            UPDATE Members SET Credit = result WHERE MemberID = mID;
        END$$
DELIMITER ;
DELIMITER $$

    CREATE OR REPLACE PROCEDURE Cancel(IN bID INT, OUT errorMsg VARCHAR(255))
        BEGIN
            -- This procedure cancel a booking which is made by the user
            -- DECLARING Variables
            
            DECLARE cancel INT;
            DECLARE bID TYPE OF Booking.ID;
            DECLARE price TYPE OF Room.PriceList;
            DECLARE mID TYPE OF Members.MemberID;
            DECLARE sCash TYPE OF Members.Credit;
            DECLARE pStatus TYPE OF Booking.Status;
            DECLARE bTime TYPE OF Booking.TimeBooked;
            DECLARE bDate TYPE OF Booking.DateBooked;

                -- Sets the value of Variable to 0
            SET cancel = 0;

                -- Select and insert values into variables
            SELECT BookedBy, DateBooked, TimeBooked, Status INTO mID, bDate, bTime, pStatus FROM Booking WHERE ID = bID;
            SELECT Credit INTO sCash FROM Members WHERE MemberID = mID;
            SELECT Price INTO price FROM OverView WHERE BookID = bID;
        
                -- IF Statement to check wheter the date is less than or equal to the currentdate
            IF curdate() >= bDate THEN 
                SELECT 'You can not request a cancellation on or after the booked date, contact support' INTO errorMsg; 
            
            ELSEIF pStatus = 'Cancelled' OR pStatus = 'PAYMENT OK, Room Reserved' THEN 
                SELECT 'The booking you attemted to cancel has already been paid or cancelled, please contact the staff' INTO errorMsg;
            
            ELSE
                SET sCash = sCash + price;
                UPDATE Booking SET Status = 'Cancelled' WHERE ID = bID;

                SELECT CheckCancellation (bID);
                SET cancel = checkCancellation (bID);

                IF cancel >= 2 
                    THEN SET sCash = sCash-10;
                    SELECT 'BOOKING SUCSESSFULLY CANCELED' INTO errorMsg;
                END IF;
                UPDATE Members SET Credit = sCash WHERE MemberID = mID;
            END IF;
        END $$
DELIMITER ;

        -- *****************  STORED FUNCTIONS ***********************************
DELIMITER $$

    CREATE OR REPLACE FUNCTION checkCancellation (bID INT) RETURNS INT DETERMINISTIC
        BEGIN
                -- This function checks the number of bookings, and cancellations made by the member
            DECLARE Done INT;
            DECLARE Cancel INT;
            DECLARE cStatus VARCHAR(255);
            DECLARE Cur CURSOR FOR
                    SELECT Status FROM Booking WHERE BookedBy = (SELECT BookedBy FROM Booking WHERE id = bID) ORDER BY DateBooked DESC;
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET Done = 1;
                SET Done = 0;
                SET Cancel = 0;
                OPEN Cur;
                -- Vil ikke kjøre loopen
                    CancellationLoop: LOOP
                        -- Fetching each row of the cursor ( name and status)
                        FETCH Cur INTO  cStatus;
                        IF cStatus != 'Cancelled' OR Done = 1 THEN LEAVE CancellationLoop;
                        ELSE  SET Cancel = Cancel+1;
                        END IF;
                    END LOOP;
                    CLOSE Cur;
                    return Cancel;
        END$$
DELIMITER ;
-- *****************  CREATE VIEW ***********************************
    DELIMITER $$
    CREATE OR REPLACE VIEW bookingView AS SELECT booking.id AS BookID, 
        room.id AS RoomID,
        room.roomName AS RoomName, 
        room.priceList AS Price, 
        onlineBooking.bookedBy AS BookedBy, 
        onlineBooking.bookingStatus as Status, 
        onlineBooking.dateBooked AS DATE, 
        onlineBooking.imeBooked AS TIME 
        FROM Booking JOIN Room ON onlineBooking.roomID = roomType.id;
    DELIMITER ;