/***************************************************************
This file contains tables which is placed in patients

DATABASE

patients
    Tables
        patient,
        billing
************************************************************************/
/********************************************   Patient table   *******************************************/

CREATE OR REPLACE TABLE patient (
                        id BIGINT, -- NOT NULL AUTO_INCREMENT PRIMARY KEY AUTO_INCREMENT=100
                        
                        -- General information
                        patientName VARCHAR(255) NOT NULL UNIQUE DEFAULT 'Jhon Doe',
                        birthDate DATE NOT NULL DEFAULT '1973-01-01',
                        ssn VARCHAR(12) NOT NULL DEFAULT 0101740009,
                        gender VARCHAR(5) NOT NULL DEFAULT 'M',
                        phoneNumber VARCHAR(255),
                        street VARCHAR(255) NOT NULL DEFAULT 'CharminAvenue',
                        zipcode MEDIUMINT SIGNED NOT NULL DEFAULT 12345,

                    --  Health information
                        bWeight DECIMAL (5.2) DEFAULT 80.0,
                        bHeight SMALLINT SIGNED NOT NULL DEFAULT 180,
                        bmi DECIMAL (5,2) NOT NULL,
                        bloodType VARCHAR(2), 
                        alergies VARCHAR(255) NOT NULL UNIQUE DEFAULT 'NNNNA',
                        diagnosis VARCHAR(255) NOT NULL DEFAULT 'NNNND',
                        medecine  VARCHAR(255) NOT NULL DEFAULT 'NNNNM',
                        dateIn DATETIME NOT NULL DEFAULT CURRENT_TIME,
                        dateOut DATETIME,
                        billing MEDIUMBLOB,
                        patientJournal MEDIUMBLOB,

                    --  Employeement
                        company VARCHAR(255) NOT NULL DEFAULT 'Unemployeed',
                        industry VARCHAR(255) NOT NULL DEFAULT 'Unemployeed',
                        registered TIMESTAMP NOT NULL DEFAULT NOW(),

                    --  Extra columns
                        demo VARCHAR(255),
                        demo1 VARCHAR(255),
                    --  Table Constraints

                        INDEX (diagnosis, medecine, alergies),
                        CONSTRAINT ListOfAlergies_FK FOREIGN KEY(alergies) REFERENCES HospitalManagementSystem.alergies (alergyID) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT ListofMedecine FOREIGN KEY(medecine) REFERENCES HospitalManagementSystem.availableMedecines (mID) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT ListOfDiagnosis_FK FOREIGN KEY(diagnosis) REFERENCES HospitalManagementSystem.diagnosis (diagnosisID) ON DELETE CASCADE ON UPDATE CASCADE);
/*********************************************************************************************************/

/************************************* Billings **********************************************************/
DELIMITER
CREATE TABLE billing (
                    --  Table Columns
                        id BIGINT NOT NULL UNIQUE AUTO_INCREMENT,
                        pID BIGINT NOT NULL,
                        invoiceID INT NOT NULL, -- AUTO_INCREMENT PRIMARY KEY, AUTO_INCREMENT=300000 
                        Ammount DECIMAL(11,2),
                        discount TINYINT NOT NULL,
                        paymentStatus VARCHAR(8) NOT NULL DEFAULT 'Not Paid',
                    
                    -- Table Constraints
                    INDEX (pID),
                    CONSTRAINT uniqueName UNIQUE(invoiceID),
                    CONSTRAINT patient_FK FOREIGN KEY(pID) REFERENCES patient (pID) ON DELETE CASCADE ON UPDATE CASCADE);
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
                        rate DECIMAL(4,2) NOT NULL DEFAULT 0,
                        eID BIGINT NOT NULL,
                        employeeName VARCHAR(255),
                        bookingInn DATETIME NOT NULL,
                        bookingOut DATETIME NOT NULL,
                        demo VARCHAR(255),
                        demo1 VARCHAR(255),

                    --  Table Constraints
                        INDEX (rID, eID),
                        CONSTRAINT uniqueName UNIQUE (pID, bookingInn),
                        CONSTRAINT employee_FK FOREIGN KEY (eID) REFERENCES employees.employees (eID) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT patient_FK FOREIGN KEY (pID) REFERENCES patients.patient (pID) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT rommID_FK FOREIGN KEY (rID) REFERENCES rooms (roomID) ON DELETE CASCADE ON UPDATE CASCADE);

/*************************************************************************************************************/

