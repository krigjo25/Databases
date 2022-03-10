/***************************************************************
Comments such as the one below indicates, it has to be made after the the given table

--  Comment

This file contains tables which is placed in patients

DATABASE

hospitalManagementSystem
    Tables
        Alergies,
        Diagnosis,
        availableMedecines
        firstFloor,
        secondFloor,
        thirdFloor,
        bookings

***************************************************************/

/******************************************** Diagnosis *****************************************************/
DELIMITER ;
CREATE OR REPLACE TABLE diagnosis (
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

CREATE OR REPLACE TABLE alergies (
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

CREATE OR REPLACE TABLE availableMedecines (
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
CREATE OR REPLACE TABLE firstFloor (
                --  Table Columns
                    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                    roomID SMALLINT SIGNED NOT NULL UNIQUE,
                    roomName VARCHAR(255) NOT NULL,
                    price DECIMAL(7,2) NOT NULL DEFAULT 0.00, 
                    demo VARCHAR(255),
                    demo1 VARCHAR(255));

CREATE OR REPLACE TABLE secondFloor (
                --  Table columns
                    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                    roomID SMALLINT SIGNED NOT NULL UNIQUE,
                    roomName VARCHAR(255) NOT NULL,
                    price DECIMAL(7,2) NOT NULL DEFAULT 0.00, 
                    demo VARCHAR(255),
                    demo1 VARCHAR(255));

CREATE OR REPLACE TABLE thirdFloor (
                --  Table Columns
                    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                    roomID SMALLINT SIGNED NOT NULL UNIQUE,
                    roomName VARCHAR(255) NOT NULL,
                    demo VARCHAR(255),
                    demo1 VARCHAR(255));

/*************************************************************************************************************/

/******************************** RoomBookings **************************************************************/
CREATE OR REPLACE TABLE booking (

                    --  Table Columns
                        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        pID BIGINT NOT NULL,
                        patientName VARCHAR(255) NOT NULL,
                        rID SMALLINT SIGNED NOT NULL,
                        roomName VARCHAR(255),
                        procedures VARCHAR(255),
                        rate DECIMAL(4,2) NOT NULL,
                        eID BIGINT NOT NULL,
                        employeeName VARCHAR(255),
                        bookingInn DATETIME NOT NULL,
                        bookingOut DATETIME NOT NULL,
                        demo VARCHAR(255),
                        demo1 VARCHAR(255),

                    --  Table Constraints
                        INDEX (eID),
                        CONSTRAINT uniqueName UNIQUE (pID, bookingInn),
                        CONSTRAINT patient_FK FOREIGN KEY (pID) REFERENCES patients.patient (pID) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT employee_FK FOREIGN KEY (eID) REFERENCES employees.employees (eID) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT rate_FK FOREIGN KEY (rate) REFERENCES operationProcedures (procedureRate) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT procedureName FOREIGN KEY (procedures) REFERENCES operationProcedures (procedureName) ON DELETE CASCADE ON UPDATE CASCADE);
                        
/*************************************************************************************************************/

/******************************** RoomBookings **************************************************************/
CREATE OR REPLACE TABLE operationProcedures (

                    --  Table Columns
                        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        procedureName VARCHAR(255) NOT NULL,
                        procedureRate DECIMAL(4,2) NOT NULL,
                        procedureTime TIME NOT NULL,
                        demo VARCHAR(255),
                        demo1 VARCHAR(255),

                    --  Table Constraints
                        INDEX (procedureName, procedureRate));
                        
/*************************************************************************************************************/
