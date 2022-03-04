/***************************** WagonTwo Procedures *************/
DELIMITER x

        CREATE OR REPLACE PROCEDURE newTwo(IN fName VARCHAR(255), IN fSeries VARCHAR(255), IN fPlate DECIMAL(4,2), IN fArm DECIMAL(4,2), IN fMinCool  INT, fMinOven DECIMAL(4,1), IN fMiddlePiece VARCHAR(6), IN fNotes VARCHAR(255))
            BEGIN
            -- This procedure inserts a row into the wagonOne Table
                INSERT INTO wagonOne (formName, plate, arm, mincool, minOven, middlePiece, notes, pSeries)
                    VALUES(fName, fPlate, fArm, fMinCool, fMinOven, fMiddlePiece, fNotes, fSeries);
            END x