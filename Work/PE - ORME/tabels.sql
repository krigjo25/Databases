/*
DATABASE Name 
PolyForm 

file for tables and insert statements


Author
Krigjo25
*/
/******************************* Wagon One ******************************/
CREATE DATABASE polyformPE;
DROP TABLE wagonOne;
    -- Creating the first table named formInfo ( Information about the forms which is used in PE)
    CREATE OR REPLACE TABLE wagonOne( 
                            --  Table columns
                            formID BIGINT, --AUTO_INCREMENT PRIMARY KEY, AUTO_INCREMENT=1000,
                            formName VARCHAR(255) NOT NULL,
                            plate DECIMAL(4,2) NOT NULL DEFAULT 0, 
                            arm DECIMAL(4,2) NOT NULL DEFAULT 0,
                            mincool TINYINT NOT NULL DEFAULT 35,
                            minOven DECIMAL(3,1) NOT NULL DEFAULT 32.5,
                            sutableWith VARCHAR(255),
                            middlePice VARCHAR(6) DEFAULT ' ',
                            armNR TINYINT NOT NULL DEFAULT 1,
                            series VARCHAR(255) NOT NULL,
                            notes VARCHAR(255),
                            img MEDIUMBLOB,

                            --  Table Constraints
                            INDEX (series),
                            CONSTRAINT uniqueName UNIQUE(formName));

/******************************* Wagon 2 ******************************/
DELIMITER ;
    CREATE OR REPLACE TABLE wagonTwo (
                            --  Table columns
                            formID BIGINT NOT NULL, -- AUTO_INCREMENT PRIMARY KEY, AUTO_INCREMENT=2000,
                            formName VARCHAR(255) NOT NULL,
                            plate DECIMAL(4,2) NOT NULL, 
                            arm DECIMAL(4,2) NOT NULL,
                            mincool TINYINT NOT NULL DEFAULT 35,
                            minOven DECIMAL(3,1) NOT NULL DEFAULT 20,
                            sutableWith VARCHAR(255),
                            middlePice VARCHAR(6),
                            armNR TINYINT NOT NULL DEFAULT 2,                               
                            series VARCHAR(255) NOT NULL,
                            notes VARCHAR(255),
                            img MEDIUMBLOB,

                            --  Table Constraints
                            INDEX (series),
                            CONSTRAINT uniqueName UNIQUE(formName));
/******************************* WagonThree ******************************/
    -- Creating the first table named formInfo ( Information about the forms which is used in PE)
    DELIMITER ;
DROP TABLE wagonThree;
    CREATE OR REPLACE TABLE wagonThree (
                            --  Table columns
                            formID BIGINT NOT NULL, -- AUTO_INCREMENT PRIMARY KEY, AUTO_INCREMENT=3000,
                            formName VARCHAR(255) NOT NULL,
                            plate DECIMAL(4,2) NOT NULL DEFAULT 0, 
                            arm DECIMAL(4,2) NOT NULL DEFAULT 0,
                            mincool TINYINT NOT NULL DEFAULT 35,
                            minOven DECIMAL(3,1) NOT NULL DEFAULT 30,
                            sutableWith VARCHAR(255),
                            middlePice VARCHAR(6),
                            bracer varchar(255),
                            armNR TINYINT NOT NULL DEFAULT 3,
                            series VARCHAR(255) NOT NULL,
                            notes VARCHAR(255),
                            img MEDIUMBLOB,

                            --  Table Constraints
                            INDEX (series),
                            CONSTRAINT uniqueName UNIQUE(formName));

/******************************* production Information Tables ******************************/
    DELIMITER ;x
    
    DROP TABLE productionInfo;

    CREATE OR REPLACE TABLE productionInfo(
                                id INT NOT NULL AUTO_INCREMENT, 
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
                                PRIMARY KEY (id, formID, formName));
        