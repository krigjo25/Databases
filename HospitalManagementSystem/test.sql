/***************************************************************

This file contains the CALL Procedures which is used in the project

********************************************************************/

/*********************** Patient Database Procedures*************************

CALL newPatient('Name', 'BirthDate', ssn, 'sex', 'PhoneNumber', 'Street', zipCo, Weght, 'bT', 'Alerg', 'Doco', 'Medec', 'Company', 'Industry' );
CALL patientInfo('Column', 'Value', id);

---
CALL newBilling ();
CALL delBilling ();
CALL modifyBilling ();
********************************************************************/

/*********************** Employee Database Procedures************************

CALL newEmployee ('Employee Name', 'BirthDate', 'Street address', ZipCo, ''Employee Email Address', 'Phone Number', Sta, 'Occupation/ Title', 'Department');
--CALL delEmployee (eID);                     --  Terminate an employee
CALL modifyEmployee('Column', 'Value', id);     --  Modify values for employees

CALL newRelation (eID, pID);                --  Assign a doctor to a patient
CALL delRelation (eID, pID);                --  Deletes a row
CALL modifyRelation ('vColumn', eID, pID);

********************************************************************/

/*********************** HospitalManagementSystem Procedures*********************************

CALL insertD ('ID', Diagnosis Name', 'Symptoms', 'MedecineID');    -- Insert a query to our list of Deseases table
CALL insertA ('ID', Alergy Name', 'Symptoms', 'MedecineID');
CALL insertM ('ID', 'Medecine Name', 'Illness');    -- Insert a query to our list of Medicine table

CALL firstFloor ('RoomName', Rate);    -- Insert a query to our list of Deseases table
CALL secondFloor ('RoomName', Rate);    -- Insert a query to our list of Deseases table
CALL thirdFloor ('RoomName', Rate);    -- Insert a query to our list of Deseases table

********************************************************************/