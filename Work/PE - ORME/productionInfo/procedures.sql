
/*********************** ProductionInfo Procedures ****************/

DELIMITER x
CREATE OR REPLACE PROCEDURE proInfo(IN fID BIGINT, IN kg DECIMAL(4,1) )
    BEGIN
        -- This procedure returns how much gram there is for colouring

        -- Updating values in productionInfo

        UPDATE productionInfo 
            SET kilo = kg 
        WHERE formID = fID;

        -- Updating column yellow, grey
        UPDATE productionInfo
            SET yellow = kg
        WHERE formID = fID;

        UPDATE productionInfo
            SET grey = kg*2
        WHERE formID = fID;
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