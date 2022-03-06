
/*********************** ProductionInfo Procedures ****************/
DELIMITER x
CREATE OR REPLACE PROCEDURE proInfo(IN vID BIGINT, IN kg DECIMAL(4,1) )
    BEGIN

        UPDATE productionInfo
            SET kg = kg
        WHERE formID = vID;

        UPDATE productionInfo
            SET yellow = kg
        WHERE formID = vID;

        UPDATE productionInfo
            SET grey = kg*2
        WHERE formID = vID;
    END x

DELIMITER x
CREATE OR REPLACE PROCEDURE updateColor(IN fID BIGINT, IN col VARCHAR(20), IN g DECIMAL(4.1))
    BEGIN
        -- This procedure Updates the values of a given colour

        SET @Query = CONCAT('UPDATE productionInfo SET ', col, ' = ', g, ' WHERE formID = ', fID);
        
            --  Prepear the SQL Statement
            PREPARE stmt FROM @Query;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
END x