/xxxxxxxxxxxxxxx* Wagons Procedures xxxxxxxxxxxxxxx/

CREATE OR REPLACE PROCEDURE newThree(IN vName VARCHAR(255), IN vSeries VARCHAR(255), IN fPlate DECIMAL(4,2), IN fArm DECIMAL(4,2), IN fMinCool  INT, fMinOven DECIMAL(4,1), IN fMiddlePiece VARCHAR(6), IN fBracer VARCHAR(255), IN fNotes VARCHAR(255))
    BEGIN

        --  Inserting values into the table
        INSERT INTO wagonThree (formName, plate, arm, mincool, minOven, middlePiece, bracer, notes, pSeries)
        VALUES(fName, fPlate, fArm, fMinCool, fMinOven, fMiddlePiece, fBracers, fNotes, fSeries);
    END x
