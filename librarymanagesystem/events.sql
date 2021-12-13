/*****************  Deletes records from termination *****************************/
/*
Del records*/
DELIMITER ??
    CREATE OR REPLACE EVENT delRecords
    ON SCHEDULE EVERY 1 DAY -- Schedule the time for the event
    DO 
            -- Deletes records from given tables with-in 12 hours
        DELETE FROM terminBooks WHERE terminate = terminate < DATE_SUB(NOW(), INTERVAL 12 HOUR);
        DELETE FROM terminMember WHERE terminate < DATE_SUB(NOW(), INTERVAL 12 HOUR);
/************************************************************************************/

/*****************  Deletes discounts and add discounts *****************************/
DELIMITER ??
    CREATE OR REPLACE EVENT delDiscounts
    ON SCHEDULE EVERY 1 DAY -- Schedule the time for the event
    DO 
            -- Deletes records from given tables with-in 12 hours
        UPDATE books SET discount = 0 WHERE dealEndDate < DATE_SUB(CURDATE(), INTERVAL 1 DAY);
        UPDATE books SET deals = 0 WHERE dealENDDate < DATE_SUB(CURDATE(), INTERVAL + 1 DAY)

/************************************************************************************/

/*****************  Deletes discounts and add discounts *****************************/

DELIMITER ??
    CREATE OR REPLACE EVENT addDisount
    ON SCHEDULE EVERY 1 WEEK -- Schedule the time for the event
    DO 
            -- Adds Discounts for books given tables with-in 12 hours
            CALL addDiscount(1,10);
            CALL addDiscount(3,20);
/************************************************************************************/