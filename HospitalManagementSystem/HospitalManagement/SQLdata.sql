DELIMITER ;

/********************************** Rooms ************************************/

--  CALL firstFloor ('RoomName', Rate); 

CALL firstFloor ('RoomName', Rate);
CALL firstFloor ('RoomName', Rate);
CALL firstFloor ('RoomName', Rate);
CALL firstFloor ('RoomName', Rate);
CALL firstFloor ('RoomName', Rate);
CALL firstFloor ('RoomName', Rate);
CALL firstFloor ('RoomName', Rate);
CALL firstFloor ('RoomName', Rate);
CALL firstFloor ('RoomName', Rate);
CALL firstFloor ('RoomName', Rate);

--  CALL secondFloor ('RoomName', Rate);
CALL secondFloor ('RoomName', Rate);
CALL secondFloor ('RoomName', Rate);
CALL secondFloor ('RoomName', Rate);
CALL secondFloor ('RoomName', Rate);
CALL secondFloor ('RoomName', Rate);
CALL secondFloor ('RoomName', Rate);
CALL secondFloor ('RoomName', Rate);
CALL secondFloor ('RoomName', Rate);
CALL secondFloor ('RoomName', Rate);
CALL secondFloor ('RoomName', Rate);
CALL secondFloor ('RoomName', Rate);

--  CALL thirdFloor ('RoomName', Rate);
CALL thirdFloor ('RoomName', Rate);
CALL thirdFloor ('RoomName', Rate);
CALL thirdFloor ('RoomName', Rate);
CALL thirdFloor ('RoomName', Rate);
CALL thirdFloor ('RoomName', Rate);
CALL thirdFloor ('RoomName', Rate);
CALL thirdFloor ('RoomName', Rate);
CALL thirdFloor ('RoomName', Rate);
CALL thirdFloor ('RoomName', Rate);
CALL thirdFloor ('RoomName', Rate);

/************************************************************************/

/********************************** operationProcedures ************************************/
--  CALL delProcedure (vID);
--  CALL modifyProcedure (vID, vRate);
--  CALL operationProcedure ( 'ProcedureName', rate, time);


CALL operationProcedure('MRI', 1000.00, '01:30');
CALL operationProcedure('X-Ray', 3579.90, '00:45');
CALL operationProcedure('CT-Scan', 3275.00, '01:00');
CALL operationProcedure('Consulation', 55.78, '00:45');
CALL operationProcedure('C-Section', 25300.00, '01:20');
CALL operationProcedure('Upper Endoscopy', 1750, '01:00');
CALL operationProcedure('Appendectomy',33000.00, '01:30');
CALL operationProcedure('Echocardiogram', 2000.00, '01:30');
CALL operationProcedure('Cataract Surgery', 2500.00, '00:50');
CALL operationProcedure('Heart Bypass Surgery', 100000.00, '5:30');
CALL operationProcedure('Hip Replacement Surgery', 35000.00, '02:30');

/*******************************************************************/