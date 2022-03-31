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
                        patientName VARCHAR(255)
                        -- General information
                        birthDate DATE NOT NULL DEFAULT '1973-01-01',
                        ssn VARCHAR(12) NOT NULL DEFAULT 0101740009,
                        gender VARCHAR(5) NOT NULL DEFAULT 'M',
                        phoneNumber VARCHAR(255),
                        street VARCHAR(255) NOT NULL DEFAULT 'CharminAvenue',
                        zipcode MEDIUMINT SIGNED NOT NULL DEFAULT 12345,

                    --  Health information
                        organDonor VARCHAR(3) NOT NULL DEFAULT 'no',
                        bloodDonor VARCHAR(3) NOT NULL DEFAULT 'no',
                        bWeight DECIMAL (5.2) DEFAULT 80.0,
                        bHeight DECIMAL (4.1) NOT NULL DEFAULT 180.0,
                        bloodType VARCHAR(3), 
                        alergyID VARCHAR(255) NOT NULL DEFAULT 'NNNNA,',
                        diagnoseID VARCHAR(255) NOT NULL DEFAULT 'NNNND,',
                        medecineID  VARCHAR(255) NOT NULL DEFAULT 'NNNNM,',

                    -- Employeement status 
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

/********************************************   patientTable,    *******************************************/

CREATE OR REPLACE TABLE socialSecurityNumber (
                        id INT SIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT
                        patientID BIGINT SIGNED NOT NULL UNIQUE,
                        
                    --  General Information
                        dateIn CURDATE NOT NULL,
                        booking VARCHAR(255),
                        oProcedure VARCHAR(255),
                        price DECIMAL (8.2)
                        employeeName VARCHAR(255)
                        primaryDoctor VARCHAR(255)
                        roomID SMALLINT NOT NULL,

                        dateIn DATE, 
                        dateOut Date,
                    -- Health information




                    --  Finance information
                        billing MEDIUMBLOB,
                        billingStatus VARCHAR(8) NOT NULL DEFAULT 'Not Paid'
                        patientJournal MEDIUMBLOB,
                    --  Extra columns
                        demo VARCHAR(255),
                        demo1 VARCHAR(255),
                        
                    --  Table Constraints

                        INDEX (patientID),
                        CONSTRAINT patientID_fk FOREIGN KEY(patientID) REFERENCES patients.patient(id) ON DELETE CASCADE ON UPDATE CASCADE);
/*********************************************************************************************************/
