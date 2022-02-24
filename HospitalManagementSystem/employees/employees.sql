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

CREATE TABLE employees (
                        eID BIGINT NOT NULL, -- AUTO_INCREMENT PRIMARY KEY AUTO_INCREMENT = 100

                    --  General information
                        eName VARCHAR(255) NOT NULL,
                        birthDate DATE NOT NULL,
                        street VARCHAR(255) NOT NULL,
                        zipCode  SMALLINT NOT NULL DEFAULT 1234,
                        email VARCHAR(255) NOT NULL,
                        phone VARCHAR(255) NOT NULL,

                    -- Work related information
                        eStatus TINYINT NOT NULL,
                        occupation VARCHAR(255) NOT NULL,
                        hourlyRate DECIMAL(9,2),
                        department VARCHAR(255) NOT NULL,
                        eContract TINYBLOB,
                        sickDays TINYINT NOT NULL DEFAULT 25,
                        hired TIMESTAMP NOT NULL DEFAULT NOW()),
                        
                    --  Table Constraints
                        INDEX(eName);
/*************************************************************************************************************/
DELIMITER ;
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
