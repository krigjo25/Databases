
/*
DATABASE Name 
PolyForm 

file for tables and insert statements


Author
Krigjo25
*/
/******************************* Wagon One ******************************/
DROP TABLE wagonOne;
    -- Creating the first table named formInfo ( Information about the forms which is used in PE)
    CREATE OR REPLACE TABLE wagonOne( 
                            --  Table columns
                            id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, AUTO_INCREMENT=1000,
                            formName VARCHAR(255) NOT NULL,
                            plate DECIMAL(4,2) NOT NULL DEFAULT 0, 
                            arm DECIMAL(4,2) NOT NULL DEFAULT 0,
                            mincool TINYINT NOT NULL DEFAULT 35,
                            minOven DECIMAL(3,1) NOT NULL DEFAULT 32.5,
                            sutableWith VARCHAR(255),
                            middlePice VARCHAR(6) DEFAULT ' ',
                            armNR TINYINT NOT NULL DEFAULT 1,
                            pSeries VARCHAR(255) NOT NULL,
                            notes VARCHAR(255),
                            img MEDIUMBLOB,

                            --  Table Constraints
                            INDEX (pSeries),
                            CONSTRAINT uniqueName UNIQUE(formName));

/******************************* Wagon 2 ******************************/

    CREATE OR REPLACE TABLE wagonTwo (
                            --  Table columns
                            id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, AUTO_INCREMENT=2000,
                            formName VARCHAR(255) NOT NULL,
                            plate DECIMAL(4,2) NOT NULL, 
                            arm DECIMAL(4,2) NOT NULL,
                            mincool TINYINT NOT NULL DEFAULT 35,
                            minOven DECIMAL(3,1) NOT NULL,
                            sutableWith VARCHAR(255),
                            middlePice VARCHAR(6),
                            armNR TINYINT NOT NULL DEFAULT 2,                               
                            pSeries VARCHAR(255) NOT NULL,
                            notes VARCHAR(255),
                            img MEDIUMBLOB,

                            --  Table Constraints
                            INDEX (pSeries),
                            CONSTRAINT uniqueName UNIQUE(formName));
/******************************* WagonThree ******************************/
    -- Creating the first table named formInfo ( Information about the forms which is used in PE)
DROP TABLE wagonThree;
    CREATE OR REPLACE TABLE wagonThree (
                            --  Table columns
                            id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, AUTO_INCREMENT=3000,
                            formName VARCHAR(255) NOT NULL,
                            plate DECIMAL(4,2) NOT NULL DEFAULT 0, 
                            arm DECIMAL(4,2) NOT NULL DEFAULT 0,
                            mincool TINYINT NOT NULL DEFAULT 35,
                            minOven DECIMAL(3,1) NOT NULL DEFAULT 30,
                            sutableWith VARCHAR(255),
                            middlePice VARCHAR(6),
                            bracer varchar(255),
                            armNR TINYINT NOT NULL DEFAULT 3,                               
                            notes VARCHAR(255),
                            img MEDIUMBLOB,
                            pSeries VARCHAR(255) NOT NULL,

                            --  Table Constraints
                            INDEX (pSeries),
                            CONSTRAINT uniqueName UNIQUE(formName));

/******************************* production Information Tables ******************************/
    DELIMITER ;
    
    DROP TABLE productionInfo;

    CREATE TABLE productionInfo(
                                id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
                                formID BIGINT NOT NULL, 
                                formName VARCHAR(255) NOT NULL, 
                                kg DECIMAL(4,1),
                                -- Colors 
                                black DECIMAL(4,1) NOT NULL DEFAULT 0,
                                blue DECIMAL(4,1) NOT NULL DEFAULT 0,
                                grey DECIMAL(4.1) NOT NULL DEFAULT 0,
                                orange DECIMAL(4,1) NOT NULL DEFAULT 0,
                                yellow DECIMAL(4.1) NOT NULL DEFAULT 0,
                                powderType VARCHAR(255) NOT NULL DEFAULT 'polyethylene',

                                -- Constraints
                                CONSTRAINT uniqueName UNIQUE(formID)
                                CONSTRAINT wagonOneFK FOREIGN KEY(formID) REFERENCES wagonOne(id) ON DELETE CASCADE ON UPDATE CASCADE,
                                CONSTRAINT wagonTwoFK FOREIGN KEY(formID) REFERENCES wagonTwo(id) ON DELETE CASCADE ON UPDATE CASCADE,
                                CONSTRAINT wagonThreeFK FOREIGN KEY(formID) REFERENCES wagonThree(id) ON DELETE CASCADE ON UPDATE CASCADE);

        