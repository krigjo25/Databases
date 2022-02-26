/****************************************************************
About the checkRecovery

Declare necsessary variables to perform a counter, Selecting ids,
Update values into the table

*****************************************************************/
DELIMITER x

CREATE OR REPLACE FUNCTION checkRecovery() RETURNS INT DETERMINISTIC
    BEGIN

        --  Declaring variables
        DECLARE vDate DATE;
        DECLARE vID BIGINT;
        DECLARE vpID BIGINT;    
        DECLARE vCounter BIGINT; 
        DECLARE vRecovery TINYINT;
        
        --  Set Values into variables
        SET vID = 0;
        SET vpID = 1000;
        SET vRecovery = 0;

        --  Counting rows
        SELECT COUNT(*) INTO vCounter FROM patients.patient WHERE (dateOut IS NOT NULL);

        --  While loop to check each row
        WhileCounter: WHILE vID <= vCounter DO

            --  Selecting recovery date into vDate
            SELECT dateOut INTO vDate FROM patients.patient WHERE pID = vpID;
    
            --  If statements
            IF vOutDate <= CURDATE() THEN SET vRecovery = 1;

                CASE

                    WHEN vRecovery > 0 THEN UPDATE employee.relations SET recovered = vRecovery WHERE pID = vpID AND recovered = 0;

                END CASE;

            END IF;
            --  Update value of the variable
            SET vID = vID+1;
            SET vPID = vpID+1;

        END WHILE;
        --  Returning Values
        RETURN vRecovery;
    END x