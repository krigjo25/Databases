/************************** Triggering an insert into productionInfo*********************/
    CREATE OR REPLACE TRIGGER wagonOne AFTER INSERT ON wagonOne FOR EACH ROW
        BEGIN

            INSERT INTO productionInfo( formID, formName )
            VALUES
                ( NEW.id, NEW.formName );
    END ??

DELIMITER \\
    CREATE OR REPLACE  TRIGGER wagonTwo AFTER INSERT ON wagonTwo FOR EACH ROW
        BEGIN
            -- Inserting for Wagon Two
            INSERT INTO productionInfo (formID, formName) 
            VALUES ( NEW.id, new.formName );
        END ??

DELIMITER ??
    CREATE OR REPLACE TRIGGER wagonThree AFTER INSERT ON wagonThree FOR EACH ROW
        BEGIN      
            -- Inserting for Wagon Three        
            INSERT INTO productionInfo (formID, formName) 
            VALUES (NEW.id, NEW.formName);
        END ??


/*******************************************************************************************/