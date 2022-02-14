/***************************************************************

This file contains the triggers which is used in the project

***************************************************************/

/*************************** Patient **********************/
CREATE TRIGGER Patient AFTER INSERT ON patient
    FOR EACH ROW
    BEGINCREATE OR REPLACE PROCEDURE employeeInfo (IN vColumn VARCHAR(20), IN eValue VARCHAR(255), IN eID BIGINT)
    BEGIN
        SET Query = sys_exec('/usr/bin/codes/python/createPDF.pyy');
            PREPARE stmt FROM @Query;
            EXECUTE stmt;
    END x
/*********************************************************/


/*************************** Employees **********************
The Trigger add the employee to another table,
to keep the records clean, and still save the employee
Archives and termination are keept in new Databases
*************************************************************/
CREATE TRIGGER terminateEmployee BEFORE DELETE ON employees
    FOR EACH ROW
    
    BEGIN
        INSERT INTO terminatedEmployees ( eID, eName, birthDate, street, provice, zipCode, email, phone, mobile, eStatus, occupation, department)
        VALUES
        
        (OLD.eID, OLD.eName, OLD.birthDate, OLD.street, OLD.provice, OLD.zipCode, OLD.email, OLD.phone, OLD.mobile, OLD.eStatus, OLD.occupation, OLD.department)
    END x
/*********************************************************/