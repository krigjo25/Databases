/********************************************************** Wagon One   **********************************************/SELECT * FROM wagonOne LIMIT 100;
DELIMITER x
CREATE OR REPLACE PROCEDURE newOne(IN vName VARCHAR(255), IN vPlate DECIMAL(4,2), IN vArm DECIMAL(4,2), IN vSeries VARCHAR(255))
    BEGIN
        -- Inserting values to the arm
        INSERT INTO wagonOne (formName, plate, arm, series)
        VALUES(vName, vPlate, vArm, vSeries);
    END x
