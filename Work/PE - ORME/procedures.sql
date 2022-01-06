/******************************* Procedures for wagons ******************************/
DELIMITER **
        CREATE OR REPLACE PROCEDURE wagonOne(IN fName VARCHAR(255), IN fSeries VARCHAR(255), IN fPlate DECIMAL(4,2), IN fArm DECIMAL(4,2), IN fMinCool  INT, fMinOven DECIMAL(4,1), IN fMiddlePiece VARCHAR(6), IN fNotes VARCHAR(255))
            BEGIN
            -- This procedure inserts a row into the wagonOne Table
                INSERT INTO wagonOne (formName, plate, arm, mincool, minOven, middlePiece, notes, pSeries)
                    VALUES(fName, fPlate, fArm, fMinCool, fMinOven, fMiddlePiece, fNotes, fSeries);
            END **

        CREATE OR REPLACE PROCEDURE wagonTwo(IN fName VARCHAR(255), IN fSeries VARCHAR(255), IN fPlate DECIMAL(4,2), IN fArm DECIMAL(4,2), IN fMinCool  INT, fMinOven DECIMAL(4,1), IN fMiddlePiece VARCHAR(6), IN fNotes VARCHAR(255))
            BEGIN
            -- This procedure inserts a row into the wagonOne Table
                INSERT INTO wagonOne (formName, plate, arm, mincool, minOven, middlePiece, notes, pSeries)
                    VALUES(fName, fPlate, fArm, fMinCool, fMinOven, fMiddlePiece, fNotes, fSeries);
            END **
        
        CREATE OR REPLACE PROCEDURE wagonThree(IN fName VARCHAR(255), IN fSeries VARCHAR(255), IN fPlate DECIMAL(4,2), IN fArm DECIMAL(4,2), IN fMinCool  INT, fMinOven DECIMAL(4,1), IN fMiddlePiece VARCHAR(6), IN fBracer VARCHAR(255), IN fNotes VARCHAR(255))
            BEGIN
            -- This procedure inserts a row into the wagonOne Table
                INSERT INTO wagonThree (formName, plate, arm, mincool, minOven, middlePiece, bracer, notes, pSeries)
                    VALUES(fName, fPlate, fArm, fMinCool, fMinOven, fMiddlePiece, fBracers, fNotes, fSeries);
            END **

DELIMITER;


/******************************* ProductionInfo Procedures ******************************/
--ProInfo
DELIMITER **
    CREATE OR REPLACE PROCEDURE proInfo(IN fID INT, IN kg DECIMAL(4,1) )
        BEGIN
            -- This procedure returns how much gram there is for colouring

            -- Updating values in productionInfo

            UPDATE productionInfo 
            SET kilo = kg 
            WHERE id = fID;

            -- Updating column yellow, grey
            UPDATE productionInfo
                SET yellow = kg
                WHERE id = fID;

            UPDATE productionInfo
                SET grey = kg*2
                WHERE id= fID;
        END **

-- updateColor
DELIMITER **
        CREATE OR REPLACE PROCEDURE updateColor(IN fID INT, IN col VARCHAR(20), IN g DECIMAL(4.1))
            BEGIN
            -- This procedure Updates the values of a given colour

                SET @Query = CONCAT('UPDATE productionInfo SET ', col, ' = ', g, ' WHERE formID = ', fID);
                
                /*  Prepare and execute the statement */
                PREPARE stmt FROM @Query;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
        END **
DELIMITER;