/************************************* patients **********************************************************
-- update
*********************************************************************************************************/
CREATE OR REPLACE EVENT delRecords
    -- Schedule the time for the event
    ON SCHEDULE EVERY 1 DAY DO BEGIN
        
        --  Deletes records from given tables with-in 12 hours
        DELETE FROM patients.billings WHERE overDue = overDue < DATE_SUB(NOW(), INTERVAL 12 HOUR);
        
    END x
/*************************************************************************************************************/

