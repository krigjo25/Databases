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
                        patientID BIGINT SIGNED NOT NULL , -- NOT NULL AUTO_INCREMENT PRIMARY KEY AUTO_INCREMENT=100
                        
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
                        alergyID VARCHAR(255) NOT NULL DEFAULT 'NNNNA,',
                        diagnoseID VARCHAR(255) NOT NULL DEFAULT 'NNNND,',
                        medecineID  VARCHAR(255) NOT NULL DEFAULT 'NNNNM,',
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

                        INDEX (diagnoseID, medecineID, alergyID));
/*********************************************************************************************************/
DELIMITER
/********************************************   Patient table   *******************************************/

CREATE OR REPLACE TABLE donors (
                        id INT SIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, -- NOT NULL AUTO_INCREMENT PRIMARY KEY AUTO_INCREMENT=100
                        
                        -- General information
                        patientID BIGINT SIGNED NOT NULL,
                        patientName VARCHAR(255) NOT NULL UNIQUE DEFAULT 'Jhon Doe',
                        birthDate DATE NOT NULL DEFAULT '1973-01-01',
                        bloodType VARCHAR(3) NOT NULL,
                        ssn VARCHAR(12) NOT NULL,
                        phoneNumber VARCHAR(255) NOT NULL,
                        
                    --  Health information
                        organDonor VARCHAR(255) DEFAULT 'no',
                        bloodDonot Char(1) NOT NULL DEFAULT 'x',
                        diagnosis VARCHAR(255) NOT NULL DEFAULT 'NNNND',
                        medecine  VARCHAR(255) NOT NULL DEFAULT 'NNNNM',
                        registered TIMESTAMP NOT NULL DEFAULT NOW(),

                    --  Extra columns
                        demo VARCHAR(255),
                        demo1 VARCHAR(255),
                    --  Table Constraints

                        INDEX (patientID, medecine, alergies),
                        CONSTRAINT patientID_fk FOREIGN KEY(patientID) REFERENCES patients.patient(id) ON DELETE CASCADE ON UPDATE CASCADE);
/*********************************************************************************************************/

/************************************* Billings **********************************************************/
DELIMITER
CREATE TABLE billing (
                    --  Table Columns
                        id BIGINT NOT NULL UNIQUE AUTO_INCREMENT,
                        invoiceID INT NOT NULL UNIQUE, -- AUTO_INCREMENT PRIMARY KEY, AUTO_INCREMENT=300000 
                        pID BIGINT SIGNED NOT NULL,
                        discount TINYINT NOT NULL,
                        incTax DECIMAL(11,2),
                        overDue DATE NOT NULL,
                        paymentStatus TINYINT NOT NULL DEFAULT 0,
                    
                    -- Table Constraints
                        INDEX (pID),
                        CONSTRAINT patientID_FK FOREIGN KEY (pID) REFERENCES patient (id) ON DELETE CASCADE ON UPDATE CASCADE);
/*************************************************************************************************************/