/************************* Wagons Procedures ****************/

CREATE OR REPLACE PROCEDURE newThree(IN vName VARCHAR(255), IN vSeries VARCHAR(255), IN vPlate DECIMAL(4,2), IN vArm DECIMAL(4,2), IN vMinOven DECIMAL(4,1), IN vNotes VARCHAR(255), IN vBracer VARCHAR(255))
    BEGIN

        --  Inserting values into the table
        INSERT INTO wagonThree (formName, plate, arm, minOven, bracer, notes, series)
        VALUES(vName, vPlate, vArm, vMinOven, vBracer, vNotes, vSeries);
    END x
