/*
DATABASE Name 
SporstsDB testdb

DOCUMENTATION
SportsDB

Author
Krigjo25
*/
--************** SELECTING FROM The Tables ************
    -- In order to check if the table is created, select them.
    SELECT * FROM Members;
    SELECT * FROM Room;
    SELECT * FROM Booking;
    SELECT * FROM PendingTerminations;
DELIMITER ;
-- Works, the tables are created *****

/************** Calling procedures ************/
-- Inserting a new member to the database collection
/************** INSERT MEMBER ************/
    CALL insertMember('dioda', '123', 'pro@demo.com');
    SELECT * FROM Members ORDER BY Registered;

DELIMITER ;

/************** DELETE MEMBERS ************/
    CALL delMember('dioda');
    CALL delMember('Demo');
    SELECT * FROM Members;
    SELECT * FROM PendingTerminations;


/************** UPDATE MEMBER ************/
    -- Updating the given member
    CALL uPass('dingoda', '18Oct1976');
    CALL uEmail ('dingoda', 'noah51@hotmail.com');
    SELECT * FROM Members;

/************** INSERT MEMBER ************/
    -- Checking if the given member
    SELECT * FROM Members WHERE MemberID = 'oustLEri';
    SELECT * FROM Booking WHERE BookedBy = 'oustLEri';

/************** update Status ************/
    CALL updateStatus (5);
    SELECT * FROM Members WHERE MemberID = 'oustLEri';
    SELECT * FROM Booking WHERE BookedBy = 'oustLEri';

/************** SEARCHING if room is unavailable ************/
    CALL searchRoom('AR', '2017-12-26', '13:00:00');
    CALL searchRoom('BC', '2018-04-15', '14:00:00');
    CALL searchRoom('BC', '2018-06-12', '15:00:00');

/************** Book a room ************/
    CALL Book ('AR','crhdXFbRZV', '2017-12-26', '13:00:00');
    CALL Book('M1', 'crhdXFbRZV', CURDATE() + INTERVAL 2 WEEK, '11:00:00');
    CALL Book('AR', 'EMperSerse', CURDATE() + INTERVAL 2 WEEK, '11:00:00');
    SELECT * FROM Booking;
DELIMITER;
CALL Cancel(5, @errormsg);
delimiter;
SELECT @errormsg;

DELIMITER;
CALL Cancel(1, @errormsg);
DELIMITER
SELECT @errormsg;