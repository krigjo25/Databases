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
                    roomID SMALLINT SIGNED NOT NULL, --AUTO_INCREMENT PRIMARY KEY, AUTO_INCREMENT = 100,
                    roomName VARCHAR(255) NOT NULL);

CREATE OR REPLACE TABLE secondFloor (
                --  Table columns
                    roomID SMALLINT SIGNED NOT NULL, --AUTO_INCREMENT PRIMARY KEY, AUTO_INCREMENT = 100,
                    roomName VARCHAR(255) NOT NULL);

CREATE OR REPLACE TABLE thirdFloor (
                --  Table Columns
                    roomID SMALLINT SIGNED NOT NULL, --AUTO_INCREMENT PRIMARY KEY, AUTO_INCREMENT = 100,
                    roomName VARCHAR(255) NOT NULL);
/*************************************************************************************************************/

/******************************** RoomBookings **************************************************************/
CREATE OR REPLACE TABLE booking (

                    --  Table Columns
                        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        pID BIGINT NOT NULL,
                        patientName VARCHAR(255) NOT NULL,
                        rID SMALLINT SIGNED NOT NULL,
                        roomName VARCHAR(255),
                        oProcedure VARCHAR(255) NOT NULL,
                        price DECIMAL(8,2) NOT NULL,
                        eID BIGINT NOT NULL,
                        employeeName VARCHAR(255),
                        bookingInn DATETIME NOT NULL,
                        bookingOut DATETIME NOT NULL ,
                        cmt VARCHAR(3),
                        demo VARCHAR(255)
                        demo1 VARCHAR(255),

                    --  Table Constraints
                        INDEX (eID, oProcedure, price),
                        CONSTRAINT uniqueName UNIQUE (pID),
                        CONSTRAINT patientFK FOREIGN KEY (pID) REFERENCES patients.patient (id) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT employeeFK FOREIGN KEY (eID) REFERENCES employees.employees (eID) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT procedureNameFK FOREIGN KEY (oProcedure) REFERENCES operationProcedures (procedureName) ON DELETE CASCADE ON UPDATE CASCADE);
                        
/*************************************************************************************************************/

/******************************** RoomBookings **************************************************************/
CREATE OR REPLACE TABLE operationProcedures (

                    --  Table Columns
                        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        procedureName VARCHAR(255) NOT NULL,
                        procedurePrice DECIMAL(8,2) NOT NULL,
                        procedureTime TIME NOT NULL,
                        demo VARCHAR(255),
                        demo1 VARCHAR(255),

                    --  Table Constraints
                        INDEX (procedureName, procedurePrice, procedureTime));
                        
/*************************************************************************************************************/
