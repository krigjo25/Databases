/***************************************************************

This file contains the triggers which is used in the project

***************************************************************/

DELIMITER x
/****************************** Procedure Bookings ****************************/
CREATE OR REPLACE TRIGGER newRecord AFTER INSERT ON hospitalManagementSystem.booking
    FOR EACH ROW BEGIN

        /************ NewRecord ********************'
            
            Inserts a new record into patientRecords.socialsecurity
            When there is a new record in record into bookings 
            
        ************************************************/
        
        CALL NewPatientRecord (NEW.patientID, NEW.oProcedure, NEW.dateIn, NEW.dateOut);

    END x
/***************************************************************/