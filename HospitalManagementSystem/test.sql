/***************************************************************

This file contains the CALL Procedures which is used in the project

********************************************************************/

/*********************** Patient Procedures*************************
CALL newPatient('Name', 'BirthDate', ssn, 'sex', 'PhoneNumber', 'Street', zipCo, Weght, 'bT', 'Alerg', 'Doco', 'Medec', 'Company', 'Industry' );
CALL patientInfo('Column', 'Value', id);
********************************************************************/

/*********************** Employee Procedures************************
CALL newEmployee ('Employee Name', 'BirthDate', 'Street address', ZipCo, ''Employee Email Address', 'Phone Number', Sta, 'Occupation/ Title', 'Department');
CALL updateEmployee('Column', 'Value', id);
********************************************************************/

/*********************** Table list*********************************
CALL insertD ('ID', Diagnosis Name', 'Symptoms', 'MedecineID');    -- Insert a query to our list of Deseases table
CALL insertA ('ID', Alergy Name', 'Symptoms', 'MedecineID');
CALL insertM ('ID', 'Medecine Name', 'Illness');    -- Insert a query to our list of Medicine table

CALL firstFloor ('RoomName', Rate);    -- Insert a query to our list of Deseases table
CALL secondFloor ('RoomName', Rate);    -- Insert a query to our list of Deseases table
CALL thirdFloor ('RoomName', Rate);    -- Insert a query to our list of Deseases table

CALL relation ('eID', pID)              --  Assign a doctor to a patient
********************************************************************/

/*********************** Booking Procedures ************************
********************************************************************/

/*********************** Billing Procedures ************************
********************************************************************/

/*********************** Turnus Procedures ************************
********************************************************************/
