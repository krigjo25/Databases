/*********************'*****************************************

This file contains the views which is used in the project

**************************************************************/

/********************* Rooms view *****************************
DATABASE 
    HospitalManagementSystem
    
**************************************************************/
CREATE OR REPLACE VIEW rooms AS
        SELECT
            firstFloor.roomID AS 'Room ID',
            firstFloor.roomName AS 'Room Name',
            firstFloor.price AS 'Hourly Room Rate'
        FROM firstFloor

        UNION ALL

        SELECT
            secondFloor.roomID,
            secondFloor.roomName,
            secondFloor.price
        FROM secondFloor

        UNION ALL

        SELECT
            thirdFloor.roomID,
            thirdFloor.roomName,
            thirdFloor.price
        FROM thirdFloor;
/*********************************************************/