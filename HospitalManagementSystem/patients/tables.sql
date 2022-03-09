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
                        id BIGINT SIGNED NOT NULL , -- NOT NULL AUTO_INCREMENT PRIMARY KEY AUTO_INCREMENT=100
                        
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