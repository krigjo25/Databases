/*********************'*****************************************

This file contains the views which is used in the project

**************************************************************/

/********************* Rooms view *****************************/
CREATE OR REPLACE VIEW rooms AS
        SELECT
            firstFloor.roomID AS 'Room ID',
            firstFloor.roomName AS 'Room Name',
            firstFloor.rate AS 'Hourly Room Rate',
        FROM firstFloor

        UNION ALL

        SELECT
            secondFloor.roomID,
            secondFloor.roomName,
            secondFloor.rate
        FROM secondFloor

        UNION ALL

        SELECT
            thirdFloor.roomID,
            thirdFloor.roomName,
            thirdFloor.rate
        FROM thirdFloor;
/*********************************************************/