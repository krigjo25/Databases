/***************************************************************

This file contains the all tables which is considered as a list

/***************************************************************/

/******************************************** Diagnosis *****************************************************/
DELIMITER ;
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
                    CONSTRAINT medecineID_fk FOREIGN KEY(medecineID) REFERENCES availableMedecines(mID) ON DELETE CASCADE ON UPDATE CASCADE);
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
                    CONSTRAINT medecineID_fk2 FOREIGN KEY(medecineID) REFERENCES availableMedecines(mID) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE availableMedecines (
                --  Table of List of Medicines

                    id BIGINT NOT NULL AUTO_INCREMENT,
                    mID CHAR(5) NOT NULL DEFAULT 'NNNNM',
                    medecineName VARCHAR(255) NOT NULL DEFAULT 'Demo Medicine', 
                    illness VARCHAR(255) NOT NULL,
                    demo VARCHAR(255), 
                    demo1 VARCHAR(255),

                --  Table Constraints

                    PRIMARY KEY (id),
                    CONSTRAINT uniqueName UNIQUE(mID, medecineName));

/*************************************************************************************************************/

/******************************************** Rooms *****************************************************/
DELIMITER
CREATE TABLE firstFloor (
                --  Table Columns
                    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                    roomID SMALLINT SIGNED NOT NULL UNIQUE,
                    roomName VARCHAR(255) NOT NULL,
                    price DECIMAL(7,2) NOT NULL DEFAULT 0.00, 
                    demo VARCHAR(255),
                    demo1 VARCHAR(255));

CREATE TABLE secondFloor (
                --  Table columns
                    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                    roomID SMALLINT SIGNED NOT NULL UNIQUE,
                    roomName VARCHAR(255) NOT NULL,
                    price DECIMAL(7,2) NOT NULL DEFAULT 0.00, 
                    demo VARCHAR(255),
                    demo1 VARCHAR(255));

CREATE TABLE thirdFloor (
                --  Table Columns
                    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                    roomID SMALLINT SIGNED NOT NULL UNIQUE,
                    roomName VARCHAR(255) NOT NULL,
                    demo VARCHAR(255),
                    demo1 VARCHAR(255));

/*************************************************************************************************************/


/******************************************** Rooms *****************************************************/
DELIMITER ;
CREATE TABLE relations (
                        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        pID BIGINT NOT NULL,
                        patientName VARCHAR(255),
                        eID BIGINT NOT NULL,
                        employeeName VARCHAR(255),
                        demo VARCHAR(255),
                        demo1 VARCHAR(255),

                    --  Constraints 
                        CONSTRAINT uniqueKey UNIQUE(pID, eID));
                        --CONSTRAINT patientID_FK FOREIGN KEY (pID) REFERENCES patients.patient(pID) ON DELETE CASCADE ON UPDATE CASCADE,
                        --CONSTRAINT employee_FK FOREIGN KEY (eID) REFERENCES employees.employees (eID) ON DELETE CASCADE ON UPDATE CASCADE);

/*************************************************************************************************************/