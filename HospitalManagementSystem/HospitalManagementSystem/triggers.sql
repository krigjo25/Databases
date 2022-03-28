/***************************************************************

This file contains the triggers which is used in the project

***************************************************************/

DELIMITER x
CREATE OR REPLACE TRIGGER triggerPDF AFTER INSERT ON patient
    FOR EACH ROW
    BEGIN

        /************ salaryChanges ********************'
            Triggers a new creation of a pdf file, when
            a new patient is added to the database

        ************************************************/

        --  Declare variables
        DECLARE cmd VARCHAR(255);
        DECLARE result int(10);

        --  Set a value to cmd
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

        /************ salaryChanges ********************'
            
            In order to keep records as fresh and clean
            as possible, we want to trigger a new record
            into archive, credited (x)

        ************************************************/

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

/*********************************************************/