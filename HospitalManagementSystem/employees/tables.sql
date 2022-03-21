/***************************************************************
Comments such as the one below indicates, it has to be made after the the given table

--  Comment

This file contains tables which is placed in patients

DATABASE

employee,
    Tables
        employees,
        relations
        turnus

***************************************************************/

/******************************** Employee *******************************************************************/

CREATE OR REPLACE TABLE employees (
                        eID BIGINT NOT NULL, -- AUTO_INCREMENT PRIMARY KEY AUTO_INCREMENT = 100

                    --  General information
                        eName VARCHAR(255) NOT NULL,
                        birthDate DATE NOT NULL,
                        street VARCHAR(255) NOT NULL,
                        zipCode MEDIUMINT NOT NULL DEFAULT 12345,
                        email VARCHAR(255) NOT NULL,
                        phone VARCHAR(255) NOT NULL,

                    -- Work related information
                        eStatus TINYINT NOT NULL DEFAULT 5,
                        occupation VARCHAR(255) NOT NULL,
                        hRate DECIMAL(9,2),
                        department VARCHAR(255) NOT NULL,
                        sickDays TINYINT NOT NULL DEFAULT 25,
                        hired TIMESTAMP NOT NULL DEFAULT NOW(),
                        
                    --  Constraints
                        INDEX(eName, sickDays, occupation, hRate, department),
                        -- The rooms
                        
                        CONSTRAINT occupation_fk FOREIGN KEY(occupation) REFERENCES employees.salaryInfo ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT hourlyRate FOREIGN KEY(hRate) REFERENCES employees.salaryInfo ON DELETE CASCADE ON UPDATE CASCADE);
/*************************************************************************************************************/
DELIMITER ;
/******************************** Relations **************************************************************/
CREATE OR REPLACE TABLE relations (

                        --  Table Columns
                        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        pID BIGINT NOT NULL,
                        patientName VARCHAR(255),
                        eID BIGINT NOT NULL,
                        employeeName VARCHAR(255) NOT NULL,
                        recovered TINYINT NOT NULL DEFAULT 0,

                        --  Table Constraints
                        UNIQUE(pID),
                        INDEX (eID, employeeName, patientName),
                        CONSTRAINT employeeID_fk FOREIGN KEY (eID) REFERENCES employees (eID) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT employeeName_fk FOREIGN KEY (employeeName) REFERENCES employees (eName) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT patientID_fk FOREIGN KEY (pID) REFERENCES patients.patient (id) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT patientName_fk FOREIGN KEY (patientName) REFERENCES patients.patient (patientName) ON DELETE CASCADE ON UPDATE CASCADE);
/*************************************************************************************************************/
DELIMITER ;
/******************************** Turnus **************************************************************/
CREATE OR REPLACE TABLE turnus (
                        --  Table Columns
                        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        eID BIGINT NOT NULL,
                        eName VARCHAR(255) NOT NULL,
                        dato DATE NOT NULL,
                        inn TIME NOT NULL,
                        ut TIME NOT NULL,
                        hrs TINYINT NOT NULL,
                        minute TINYINT NOT NULL,
                        --  sickDays TINYINT UNSIGNED NOT NULL,
                        absence VARCHAR(255),

                        --  Table Constraints
                        INDEX (eID, eName),
                        CONSTRAINT employeeID_fk2 FOREIGN KEY (eID) REFERENCES employees (eID) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT employeeName_fk2 FOREIGN KEY (eName) REFERENCES employees (eName) ON DELETE CASCADE ON UPDATE CASCADE);
                        --  CONSTRAINT sickDays_fk FOREIGN KEY (sickDays) REFERENCES employees (sickDays) ON DELETE CASCADE ON UPDATE CASCADE);
/*************************************************************************************************************/
DELIMITER ;
/******************************** SalaryInfo **************************************************************/
CREATE OR REPLACE TABLE salaryInfo (
                        --  Table Columns
                        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        occupation VARCHAR(255) NOT NULL, 
                        yearlyRate DECIMAL(10,2) NOT NULL,
                        monthlyRate DECIMAL(7,2) NOT NULL,
                        hRate DECIMAL (5,2) NOT NULL);
/*************************************************************************************************************/
