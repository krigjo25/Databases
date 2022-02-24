/************************************* patients **********************************************************
X
*********************************************************************************************************/
CREATE OR REPLACE EVENT delRecords
    -- Schedule the time for the event
    ON SCHEDULE EVERY 1 DAY DO BEGIN
        
        --  Deletes records from given tables with-in 12 hours
        DELETE FROM patients.billings WHERE overDue = overDue < DATE_SUB(NOW(), INTERVAL 12 HOUR);
        
        -- Counting the age of the patient, then deleting if the patient is above 150

        --DELETE FROM patients.patient 

        --  Delete records from employee
        DELETE FROM employees.employees WHERE eStatus = 0;

        DELETE FROM employees.relations WHERE recovered = 1;
    END x
/*************************************************************************************************************/

