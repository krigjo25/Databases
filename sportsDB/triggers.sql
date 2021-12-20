-- *****************  PENDING TERMINATIONS ***********************************


    -- *****************  CREATE TRIGGER ***********************************
DELIMITER $$    
    CREATE OR REPLACE TRIGGER CreditCheck BEFORE DELETE ON members FOR EACH ROW
    BEGIN
        /*Using an IF ELSE statement in order to check wheter the Member has 
        Outstanding payments. IF it returns true, the memeber will be added
        to Pending terminations table.*/

        -- Declaring variables
        DECLARE sCash TYPE OF members.credit;

        -- Selecting values into the variable
        SELECT Credit INTO sCash FROM members WHERE memberID = OLD.memberID;

    -- IF ELSE STATEMENT
        IF sCash != 0 THEN 
    
            INSERT INTO PendingTerminations (memberID, email, credit) 
            VALUES (OLD.memberID, OLD.email, OLD.credit);
    
        END IF;
    
    END$$