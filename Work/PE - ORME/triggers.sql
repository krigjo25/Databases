/************************** Triggering an insert into productionInfo*********************/
    CREATE OR REPLACE TRIGGER wagonOne AFTER INSERT ON wagonOne FOR EACH ROW
        BEGIN

            --Declare variables
            DECLARE fName VARCHAR(255);

            --  Selecting value into the variable
            SELECT formName INTO fName FROM productionInfo WHERE formName = NEW.formName;

            --  Checking wheter there is value in Fname
            IF fName IS NULL THEN

            -- Inserting for Wagon Three
                INSERT INTO productionInfo (formID, formName) 
                VALUES (NEW.formID, NEW.formName);
            
            END IF;
        END x

DELIMITER x
    CREATE OR REPLACE  TRIGGER wagonTwo AFTER INSERT ON wagonTwo FOR EACH ROW
        BEGIN

            --Declare variables
            DECLARE fName VARCHAR(255);

            --  Selecting value into the variable
            SELECT formName INTO fName FROM productionInfo WHERE formName = NEW.formName;

            --  Checking wheter there is value in Fname
            IF fName IS NULL THEN

            -- Inserting for Wagon Three
                INSERT INTO productionInfo (formID, formName) 
                VALUES (NEW.formID, NEW.formName);
            
            END IF;
        END x

DELIMITER x
    CREATE OR REPLACE TRIGGER wagonThree AFTER INSERT ON wagonThree FOR EACH ROW
        BEGIN

            --Declare variables
            DECLARE fName VARCHAR(255);

            --  Selecting value into the variable
            SELECT formName INTO fName FROM productionInfo WHERE formName = NEW.formName;

            --  Checking wheter there is value in Fname
            IF fName IS NULL THEN

            -- Inserting for Wagon Three
                INSERT INTO productionInfo (formID, formName) 
                VALUES (NEW.formID, NEW.formName);
            
            END IF;
        END x
DELIMITER         
DROP TRIGGER wagonOne;
DROP TRIGGER wagonTwo;
DROP TRIGGER wagonThree;


/*******************************************************************************************/