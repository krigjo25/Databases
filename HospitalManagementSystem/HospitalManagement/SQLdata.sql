
DELIMITER ;

/********************************** Rooms ************************************/

--  CALL firstFloor ('RoomName', Rate); 
--  CALL secondFloor ('RoomName', Rate);
--  CALL thirdFloor ('RoomName', Rate);
/************************************************************************/

/********************************** operationProcedures ************************************/
--  CALL delProcedure (vID);
--  CALL modifyProcedure (vID, vRate);
--  CALL operationProcedure ( 'ProcedureName', rate, time);


CALL operationProcedure('MRI', 1000, 90);
CALL operationProcedure('X-Ray', 3579.90, 004500);
CALL operationProcedure('CT-Scan', 3275.00, 003000);
CALL operationProcedure('Consulation', 55.78, 004500);
CALL operationProcedure('C-Section', 25300.00, 012000);
CALL operationProcedure('Upper Endoscopy', 1750, 010000);
CALL operationProcedure('Appendectomy',33000.00, 013000);
CALL operationProcedure('Echocardiogram', 2000.00, 013000);
CALL operationProcedure('Cataract Surgery', 2500.00, 00:50:00);
CALL operationProcedure('Heart Bypass Surgery', 100000.00, 053000);
CALL operationProcedure('Hip Replacement Surgery', 35000.00, 023000);

/*******************************************************************/