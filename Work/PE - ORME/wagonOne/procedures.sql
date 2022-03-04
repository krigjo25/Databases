/********************************************************** Wagon One   **********************************************/
DELIMITER x
CREATE OR REPLACE PROCEDURE NewOne(IN vName VARCHAR(255), IN vPlate DECIMAL(4,2), IN vArm DECIMAL(4,2), IN vSeries VARCHAR(255))
    BEGIN
        -- Inserting values to the arm
        INSERT INTO wagonOne (formName, plate, arm, pSeries)
        VALUES(vName, vPlate, vArm, vSeries,);
    END x
