/******************************************** Diagnosis *****************************************************/
CREATE TABLE diagnosis (
                -- Table Columns
                    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                    diagnosisID CHAR(5) NOT NULL DEFAULT 'NNNND', 
                    dName VARCHAR(255) NOT NULL, 
                    symptoms VARCHAR(255) NOT NULL,
                    medecineID CHAR(5) NOT NULL DEFAULT 'NNNNM',
                    demo VARCHAR(255), 
                    demo1 VARCHAR(255),

                -- Table Constraints
                    CONSTRAINT uniqueName UNIQUE(diagnosisID),
                    CONSTRAINT medecineID_fk FOREIGN KEY(medecineID) REFERENCES lom(mID) ON DELETE CASCADE ON UPDATE CASCADE);
/*************************************************************************************************************/

CREATE TABLE alergies (
    -- Table of List of Alergies
                    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                    alergyID CHAR(5) NOT NULL DEFAULT 'NNNNA', 
                    aName VARCHAR(255) NOT NULL, 
                    symptoms VARCHAR(255) NOT NULL, 
                    medecineID CHAR(5) NOT NULL, 
                    demo VARCHAR(255),
                    demo1 VARCHAR(255),
                --  Table Constraints
                    CONSTRAINT uniqueName UNIQUE(alergyID),
                    CONSTRAINT medecineID_fk2 FOREIGN KEY(medecineID) REFERENCES lom(mID) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE availableMedecines (
    -- Table of List of Medicines
                    mID CHAR(5) NOT NULL DEFAULT 'NNNNM',
                    medicineName VARCHAR(255) NOT NULL DEFAULT 'Test', 
                    illness VARCHAR(255) NOT NULL,
                    demo VARCHAR(255), 
                    demo1 VARCHAR(255),
                    PRIMARY KEY (mID));

/*************************************************************************************************************/

/******************************************** Rooms *****************************************************/

CREATE TABLE firstFloor (
                --  Table Columns
                    roomID SMALLINT SIGNED NOT NULL,
                    roomName VARCHAR(255) NOT NULL,
                    price DECIMAL(7,2) NOT NULL DEFAULT 0.00, 
                    demo VARCHAR(255),
                    demo1 VARCHAR(255),

                --  Table Constraints
                    PRIMARY KEY(roomID));
CREATE TABLE secondFloor (
                --  Table columns
                    roomID SMALLINT SIGNED NOT NULL,
                    roomName VARCHAR(255) NOT NULL,
                    price DECIMAL(7,2) NOT NULL DEFAULT 0.00, 
                    demo VARCHAR(255),
                    demo1 VARCHAR(255),

                --  Table Constraints
                    PRIMARY KEY(roomID));

CREATE TABLE thirdFloor (
                --  Table Columns
                    roomID SMALLINT SIGNED NOT NULL,
                    roomName VARCHAR(255) NOT NULL,
                    price DECIMAL(7,2) NOT NULL DEFAULT 0.00, 
                    demo VARCHAR(255),
                    demo1 VARCHAR(255),

                --  Table Constraints
                    PRIMARY KEY (roomID));
/*************************************************************************************************************/