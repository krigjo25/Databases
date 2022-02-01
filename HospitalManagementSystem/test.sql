/***************************************************************

This file contains the CALL Procedures which is used in the project

********************************************************************/

/*********************** Patient Procedures*************************
CALL newPatient('Name', age, 'sex', 'PhoneNumber', 'Email address', 'bloodType, 'Alergies', 'Diagnosis');
CALL patientInfo('Column', 'Value', id);
********************************************************************/

/*********************** Employee Procedures************************
CALL newEmployee ('Employee Name', 'Employee Address', age, 'sex', ' Employee number', 'Employee zipCode', 'Employee Email', 'Department', 'Position');
CALL updateEmployee('Column', 'Value', id);
********************************************************************/

/*********************** Table list*********************************
CALL insertD ('ID', Diagnosis Name', 'Symptoms', 'MedecineID');    -- Insert a query to our list of Deseases table
CALL insertA ('ID', Alergy Name', 'Symptoms', 'MedecineID');
CALL insertM ('ID', 'Medecine Name', 'Illness');    -- Insert a query to our list of Medicine table

CALL firstFloor ('RoomName', Rate);    -- Insert a query to our list of Deseases table
CALL secondFloor ('RoomName', Rate);    -- Insert a query to our list of Deseases table
CALL thirdFloor ('RoomName', Rate);    -- Insert a query to our list of Deseases table
********************************************************************/

/*********************** Booking Procedures ************************
********************************************************************/

/*********************** Billing Procedures ************************
********************************************************************/

/*********************** Turnus Procedures ************************
********************************************************************/
