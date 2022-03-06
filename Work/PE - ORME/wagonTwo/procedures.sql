/***************************** WagonTwo Procedures *************/
DELIMITER x

        CREATE OR REPLACE PROCEDURE newTwo(IN vName VARCHAR(255), IN vSeries VARCHAR(255), IN vPlate DECIMAL(4,2), IN vArm DECIMAL(4,2), IN vNotes VARCHAR(255))
            BEGIN
            -- This procedure inserts a row into the wagonOne Table
                INSERT INTO wagonTwo (formName, plate, arm, notes, series)
                    VALUES(vName, vPlate, vArm, vNotes, vSeries);
            END x