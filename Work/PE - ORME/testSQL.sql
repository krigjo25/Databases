/*
    DATABASE Name 
        polyformPE

    Description
        This sheet is for testing 

    Author
        Krigjo25
*/
/********************************** Database & Table*************************
    DROP DATABASE polyFormPE;
    CREATE DATABASE polyformPE;

    SELECT * FROM wagonOne; 
    SELECT * FROM wagonTwo;
    SELECT * FROM wagonThree;
    SELECT * FROM productionInfo;
    **SELECT * FROM terminatedForms;
****************************************************************************/

/********************************** Views *********************************
    SELECT * FROM apbView;
    SELECT * FROM aquaView;
    SELECT * FROM mbView;
    SELECT * FROM liftupView;
    SELECT * FROM pontoonView;
    SELECT * FROM prebouyView;
    SELECT * FROM kopasView;
/*************************************************************************/

/***************************** Procedures ********************************
        Inserting values into the wagons 
    CALL wagonOne('Demo', 'Demo-Series', 40.22, 40.20, 35, 20, 'None', 'Notes')
    CALL wagonOne('Demo', 'Demo-Series', 40.22, 40.20, 35, 20, 'None', 'Notes')
    CALL wagonOne('Demo', 'Demo-Series', 40.22, 40.20, 35, 20, 'None', 'Bracer', 'Notes')
        -   -- The trigger should trigger a new name, and a given ID to the form
                In productionInfo
            
            ProductionInfo procedures
            CALL productionInfo(formID, kilos)
                -- Should add how much colour the given product should have

            Inserting values for a given colour FROM ID which identifies the form
            CALL updateColor(formID, colorName, gram)
    
/*************************************************************************/

