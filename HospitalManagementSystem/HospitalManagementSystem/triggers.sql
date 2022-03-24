/***************************************************************

This file contains the triggers which is used in the project

***************************************************************/

/*************************** TriggerPDF **********************

This trigger, will trigger a new creation of a pdf file, when
a new patient is added to the database.
x
***********************************************************/
DELIMITER x
CREATE OR REPLACE TRIGGER triggerPDF AFTER INSERT ON patient
    FOR EACH ROW
    BEGIN

        DECLARE cmd VARCHAR(255);
        DECLARE result int(10);

        SET cmd = CONCAT('python /home/createPDF.py');

        SET result = sys_exec(cmd);

    END x
/*********************************************************/

/*************************** Billings **********************

The Trigger will send deleted rows without paid, into debt collector table
Else if its paid, it will be sent into an Archive to keep the records
seperated from fresh records
x
*************************************************************/

CREATE OR REPLACE TRIGGER terminateBilling BEFORE DELETE ON billing
    FOR EACH ROW BEGIN

        --  Creating a database and a table if it does not exists
        CREATE DATABASE IF NOT EXISTS archive;
        CREATE TABLE IF NOT EXISTS billingArchive ( patientName, invoiceID, discount, incTax, pStatus);

        --  Declaring variables
        DECLARE vStatus TYPE OF patients.billing;

        --  SELECTING values into the variable
        SELECT pStatus INTO vStatus FROM patients.billing;

        --  Starting a case to check wheter eStatus equals zero or one
        CASE

            WHEN eStatus > 0 THEN 
            INSERT INTO archive.billingArchive(patientName, invoiceID, discount, incTax, pStatus)

            VALUES
            (OLD.patientName, OLD.invoiceID, OLD.discount, OLD.incTax, OLD.pStatus);

            WHEN pStatus = 0 THEN
            INSERT INTO credit.billing(patientName, invoiceID, discount, incTax, pStatus)

            VALUES
            (OLD.patientName, OLD.invoiceID, OLD.discount, OLD.incTax, OLD.pStatus);
        
        CASE END;
    END x
/*******************************Patient**************************/

/*************************** Employees **********************

The Trigger add the employee to another table,
to keep the records clean, and still save the employee
Archives and termination are keept in new Databases
x
*************************************************************/
CREATE OR REPLACE TRIGGER terminateEmployee BEFORE DELETE ON employees
    FOR EACH ROW BEGIN

        --  Creating a database and a table if it does not exists
        CREATE DATABASE IF NOT EXISTS archive;
        CREATE TABLE IF NOT EXISTS terminatedEmployees (eID, eName, birthDate, street, provice, zipCode, email, phone, mobile, eStatus, occupation, department);

        --  Assigning old values into the new table
        INSERT INTO terminatedEmployees ( eID, eName, birthDate, street, provice, zipCode, email, phone, mobile, eStatus, occupation, department)
        VALUES
        (OLD.eID, OLD.eName, OLD.birthDate, OLD.street, OLD.provice, OLD.zipCode, OLD.email, OLD.phone, OLD.mobile, OLD.eStatus, OLD.occupation, OLD.department);
    END x
/*********************************************************/