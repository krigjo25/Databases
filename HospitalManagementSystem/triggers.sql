/***************************************************************

This file contains the triggers which is used in the project

***************************************************************/

/*************************** Patient **********************

This trigger, will trigger a new creation of a pdf file, when
a new patient is added to the database.

***********************************************************/
DELIMITER x
CREATE TRIGGER patientInfo AFTER INSERT ON patient
    FOR EACH ROW
    BEGIN

        DECLARE cmd VARCHAR(255);
        DECLARE result int(10);

        SET cmd = CONCAT('python /home/createPDF.py');

        SET result = sys_exec(cmd);

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
        
        (OLD.eID, OLD.eName, OLD.birthDate, OLD.street, OLD.provice, OLD.zipCode, OLD.email, OLD.phone, OLD.mobile, OLD.eStatus, OLD.occupation, OLD.department);
    END x
/*********************************************************/