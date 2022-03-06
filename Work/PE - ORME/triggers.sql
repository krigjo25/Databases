/************************** Triggering an insert into productionInfo*********************/
    CREATE OR REPLACE TRIGGER wagonOne AFTER INSERT ON wagonOne FOR EACH ROW
        BEGIN

            --  Insert values into the table
            INSERT INTO productionInfo( formID, formName )
            VALUES
                ( NEW.formID, NEW.formName );
    END x

DELIMITER x
    CREATE OR REPLACE  TRIGGER wagonTwo AFTER INSERT ON wagonTwo FOR EACH ROW
        BEGIN

            -- Inserting for Wagon Two
            INSERT INTO productionInfo (formID, formName) 
            VALUES ( NEW.formID, new.formName );

        END x

DELIMITER x
    CREATE OR REPLACE TRIGGER wagonThree AFTER INSERT ON wagonThree FOR EACH ROW
        BEGIN

            -- Inserting for Wagon Three        
            INSERT INTO productionInfo (formID, formName) 
            VALUES (NEW.formID, NEW.formName);

        END x
DELIMITER         
DROP TRIGGER wagonOne;
DROP TRIGGER wagonTwo;
DROP TRIGGER wagonThree;


/*******************************************************************************************/