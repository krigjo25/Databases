/************************************* patients **********************************************************

*********************************************************************************************************/
CREATE OR REPLACE EVENT delRecords
    -- Schedule the time for the event
    ON SCHEDULE EVERY 1 DAY DO BEGIN

        --  Delete records from employee
        DELETE FROM employees.employees WHERE eStatus = 0;

        DELETE FROM employees.relations WHERE recovered = 1;
    END x
/*************************************************************************************************************/

