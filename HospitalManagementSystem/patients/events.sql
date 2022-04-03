/************************************* patients **********************************************************
-- update
*********************************************************************************************************/
CREATE OR REPLACE EVENT delRecords
    -- Schedule the time for the event
    ON SCHEDULE EVERY 1 DAY DO BEGIN
        
        --  Deletes records from given tables with-in 12 hours
        DELETE FROM patients.billings WHERE overDue = overDue < DATE_SUB(NOW(), INTERVAL 12 HOUR);
        
    END x

CREATE OR REPLACE EVENT createTable
    --  The event shuld be scheduled every minute,
    ON SCHEDULE EVERY 1 MIN DO BEGIN

    DEclare run VARCHAR(255);
    DECLARE query VARCHAR(255);

    SET query = CONCAT('/home/hospitalManagementSystem/hmsPython/createTable')
    SET run = sys_exec(query);
    END x
/*************************************************************************************************************/

