DELIMITER ;

/********************************** Rooms ************************************/

--  CALL firstFloor ('RoomName'); 

CALL firstFloor ('Reception');
CALL firstFloor ('Cosultation Office');
CALL firstFloor ('Cosultation Office');
CALL firstFloor ('Cosultation Office');
CALL firstFloor ('Cosultation Office');
CALL firstFloor ('Cosultation Office');
CALL firstFloor ('Labratory');
CALL firstFloor ('Nursery clinic');
CALL firstFloor ('EmergencyRoom');
CALL firstFloor ('Storage');
CALL firstFloor('Observation Room');

--  CALL secondFloor ('RoomName');
CALL secondFloor ('Surgery Room');
CALL secondFloor ('Surgery Room 2');
CALL secondFloor ('Ward');
CALL secondFloor ('Ward');
CALL secondFloor ('Ward');
CALL secondFloor ('Ward');
CALL secondFloor ('Ward');
CALL secondFloor ('Ward');
CALL secondFloor ('Ward');

CALL secondFloor ('Ward');

CALL secondFloor ('Special equipment Room');
CALL secondFloor ('RoomName');

--  CALL thirdFloor ('RoomName');
CALL thirdFloor ('RoomName');
CALL thirdFloor ('RoomName');
CALL thirdFloor ('RoomName');
CALL thirdFloor ('RoomName');
CALL thirdFloor ('RoomName');
CALL thirdFloor ('RoomName');
CALL thirdFloor ('RoomName');
CALL thirdFloor ('RoomName');
CALL thirdFloor ('RoomName');
CALL thirdFloor ('RoomName');

/************************************************************************/

/********************************** operationProcedures ************************************/
--  CALL delProcedure (vID);
--  CALL modifyProcedure (vID, vRate);
--  CALL operationProcedure ( 'ProcedureName', time);


CALL operationProcedure('Ward', 70.00, '01:00');
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


/********************************** Bookings ************************************/

--  CALL delBook (vpID);
--  CALL searchRoom (vrID, @ErrorMsg);
--  CALL bookRoom (vpID, veID, vID, vOid, '00:00');

CALL bookRoom (pID, veID, vOid, '00:00');
/*******************************************************************/
