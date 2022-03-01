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
                        INDEX(eName, occupation, hRate, department),
                        CONSTRAINT uniqueName UNIQUE(eID));--,
                        -- The rooms
                        --CONSTRAINT room_fk FOREIGN KEY (department) REFERENCES HospitalManagementSystem.rooms ON DELETE CASCADE ON UPDATE CASCADE);
                        --CONSTRAINT occupation_fk FOREIGN KEY(occupation) REFERENCES employees.salaryInfo ON DELETE CASCADE ON UPDATE CASCADE,
                        --CONSTRAINT hourlyRate FOREIGN KEY(hRate) REFERENCES employees.salaryInfo ON DELETE CASCADE ON UPDATE CASCADE;
/*************************************************************************************************************/
DELIMITER ;
/******************************** Relations **************************************************************/
CREATE TABLE relations (

                        --  Table Columns
                        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        pID BIGINT NOT NULL,
                        patientName VARCHAR(255),
                        eID BIGINT NOT NULL,
                        eName VARCHAR(255) NOT NULL,
                        recovered TINYINT NOT NULL DEFAULT 0,

                        --  Table Constraints
                        UNIQUE(pID),
                        INDEX (eID, eName, patientName),
                        CONSTRAINT employeeID_fk FOREIGN KEY (eID) REFERENCES employees (eID) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT employeeName_fk FOREIGN KEY (eName) REFERENCES employees (eName) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT patientID_fk FOREIGN KEY (pID) REFERENCES patients.patient (id) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT patientName_fk FOREIGN KEY (patientName) REFERENCES patients.patient (patientName) ON DELETE CASCADE ON UPDATE CASCADE);
/*************************************************************************************************************/

/******************************** Turnus **************************************************************/
CREATE TABLE turnus (
                        --  Table Columns
                        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        eID BIGINT NOT NULL,
                        eName VARCHAR(255) NOT NULL,
                        dato DATE NOT NULL,
                        inn TIME NOT NULL,
                        ut TIME NOT NULL,
                        sickDays TINYINT UNSIGNED NOT NULL DEFAULT 25,
                        comments VARCHAR(255),
                        
                        --  Table Constraints
                        INDEX (eID, eName, dato, inn, ut),
                        CONSTRAINT employeeID_fk FOREIGN KEY (eID) REFERENCES employees (eID) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT employeeName_fk FOREIGN KEY (eName) REFERENCES employees (eName) ON DELETE CASCADE ON UPDATE CASCADE);
/*************************************************************************************************************/
