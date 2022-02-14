/*

/***************************************************************
Comments such as the one below indicates, it has to be made after the the given table

# Comment

This file contains the main tables which is used in the project

***************************************************************/
/********************************************   Patient table   ********************************************/

CREATE TABLE patient (
                        id BIGINT NOT NULL, --  AUTO_INCREMENT PRIMARY KEY AUTO_INCREMENT=100
                        -- General information
                        patientName VARCHAR(255) NOT NULL DEFAULT 'Jhon Doe',
                        birthDate DATE NOT NULL DEFAULT '1973-01-01',
                        ssn INT NOT NULL DEFAULT 010174000,
                        sex VARCHAR(5) NOT NULL, 
                        phoneNumber VARCHAR(255),
                        street VARCHAR(255) NOT NULL DEFAULT 'CharminAvenue',
                        provice VARCHAR(255) NOT NULL DEFAULT 'Warshinton DC',
                        zipcode SMALLINT NOT NULL DEFAULT 12345,

                    --  Health information
                        bodyWeight MEDIUMINT NOT NULL,
                        bodyIndex INT,
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

                        CONSTRAINT UniqeuName UNIQUE(diagnosis, medecine, patientName),
                        CONSTRAINT ListOfAlergies_FK FOREIGN KEY(alergies) REFERENCES alergies(alergyID) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT ListofMedecine FOREIGN KEY(medecine) REFERENCES availableMedecines(mID) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT ListOfDiagnosis_FK FOREIGN KEY(diagnosis) REFERENCES diagnosis(diagnosisID) ON DELETE CASCADE ON UPDATE CASCADE);
/*************************************************************************************************************/

/******************************** Employee **************************************************************************/
CREATE TABLE employees (
                        eID BIGINT NOT NULL, -- AUTO_INCREMENT PRIMARY KEY AUTO_INCREMENT = 100

                    --  General information
                        eName VARCHAR(255) NOT NULL,
                        birthDate DATE NOT NULL,
                        street VARCHAR(255) NOT NULL,
                        provice VARCHAR(255) NOT NULL,
                        zipCode  SMALLINT NOT NULL DEFAULT 1234,
                        email VARCHAR(255) NOT NULL,
                        phone VARCHAR(255) NOT NULL,
                        mobile VARCHAR(255) NOT NULL,

                    -- Work related information
                        eStatus TINYINT NOT NULL,
                        occupation VARCHAR(255) NOT NULL,
                        hourlyRate DECIMAL(9,2),
                        department VARCHAR(255) NOT NULL,
                        eContract TINYBLOB,
                        hired TIMESTAMP NOT NULL DEFAULT NOW());
/*************************************************************************************************************/

/******************************** RoomBookings **************************************************************/
CREATE TABLE booking (

                    --  Table Columns
                        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        patientID INT NOT NULL,
                        patientName VARCHAR(255) NOT NULL,
                        roomID INT NOT NULL,
                        roomName VARCHAR(255),
                        rate DECIMAL(4,2) NOT NULL DEFAULT 0,
                        employeeID INT NOT NULL,
                        employeeName VARCHAR(255),
                        bookingInn DATETIME NOT NULL DEFAULT NOW(),
                        bookingOut DATETIME NOT NULL,
                        comments VARCHAR(255),
                        demo VARCHAR(255),
                        demo1 VARCHAR(255),

                    --  Table Constraints
                        CONSTRAINT uniqueName UNIQUE(patientName, roomName, rate, employeeName),
                        CONSTRAINT patient_FK FOREIGN KEY (patientName) REFERENCES patient (patientName) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT room_FK FOREIGN KEY (roomName) REFERENCES rooms (roomName) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT employee_FK FOREIGN KEY (employeeName) REFERENCES employees (eName) ON DELETE CASCADE ON UPDATE CASCADE);

/*************************************************************************************************************/

/************************************* Billings *************************************************************/

CREATE TABLE billing (
                    --  Table Columns
                        id BIGINT NOT NULL UNIQUE AUTO_INCREMENT
                        invoiceID INT NOT NULL, -- AUTO_INCREMENT PRIMARY KEY, AUTO_INCREMENT=300000 
                        patientID INT NOT NULL,
                        Ammount, DECIMAL(11,2),
                        discount TINYINT NOT NULL,
                        paymentStatus VARCHAR(8) NOT NULL DEFAULT 'Not Paid',
                    
                    -- Table Constraints
                    CONSTRAINT uniqueName UNIQUE(invoiceID),
                    CONSTRAINT patient_FK FOREIGN KEY(patientID) REFERENCE patient (patientID) ON DELETE CASCADE ON UPDATE CASCADE);
/*************************************************************************************************************/