/***************************************************************

This file contains the Procedures which is used in the project

Turnus Prodcedures,
Relation Procedures,
Employees Procedures,

/***************************************************************/

/********************** Employees Procedures *******************

This procedures below allows the management
add a new employee into the database

***************************************************************/
CREATE OR REPLACE PROCEDURE newEmployee (IN eName VARCHAR(255), IN vDate DATE, IN vStreet VARCHAR(255), IN vZip MEDIUMINT, IN vEmail VARCHAR(255), IN vPhone VARCHAR(255), IN veStatus TINYINT, IN vTitle VARCHAR(255),  IN vDep VARCHAR(255))
    BEGIN
        -- This procedure creates a new row with the details of an employee 

        --  Declare variables
        DECLARE vSalary DECIMAL(9,2);
    
        --  Add a value to the Variable
        --SET vSalary = (SELECT salary FROM salaryInfo WHERE occupation = vTitle);
        
        -- Modifying the employee number

        SET @areaCode = SUBSTRING(vPhone, 1,3);
        SET @lastDigit = SUBSTRING(vPhone, 7,4);
        SET @threeDigit = SUBSTRING(vPhone, 4,3);

        SET vPhone = CONCAT ('(', @areaCode, ') -', @threeDigit, '-', @lastDigit);


        INSERT INTO employees (eName, birthDate, street, zipCode, email, phone, eStatus, department, occupation) VALUES
        (eName, vDate, vStreet, vZip, vEmail, vPhone, veStatus, vDep, vTitle);
    END x

/**************************************************************/

/***************************************************************

The procedure below allow the management
to modify information about the employee,
But it doesnt allow date but we assume 
the date is correct in this case

****************************************************************/
CREATE OR REPLACE PROCEDURE modifyEmployee (IN vColumn VARCHAR(20), IN vValue VARCHAR(255), IN veID BIGINT)
    BEGIN
        --  The procedure updates, the values for employees, execpt date
        SET @Query = CONCAT('UPDATE employees SET ', vColumn, ' = ', vValue, ' WHERE eID = ', veID);
            PREPARE stmt FROM @Query;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;

    END x
/***************************************************************/

/*********************** relation Procedures ******************************

This procedure assign a doctor to a patient

***********************************************************************/
CREATE OR REPLACE PROCEDURE newRelation ( IN veID BIGINT, IN vpID BIGINT, OUT vError VARCHAR(255))
    BEGIN

        -- Declareing new variables
        DECLARE vCount TINYINT;
        DECLARE pName VARCHAR(255);
        DECLARE veName VARCHAR(255);

        --  Assigning the new variable values
        SET veName = (SELECT eName from employees WHERE eID = veID);
        SET pName = (SELECT patientName from patients.patient WHERE id = vpID);

        --  Counting how many times the doctor has been added to the table
        SET vCount = (SELECT COUNT(eID) FROM relations WHERE eID = veID);

        IF vCount <= 10 THEN

            -- Assigning doctor to patient
            INSERT INTO relations (pID, patientName, eID, employeeName )
                VALUES 
                (vpID, pName, veID, veName);

            SET vError = CONCAT(veName, ' Were assigned as ', pName, ' Primary doctor');

            SELECT vError AS 'SQL operation Succsess'; 

        ELSEIF vCount >= 10 THEN

            SET vError = CONCAT (veName, ' Has reached the maximum of assignments. Take care of your employees.');

            SELECT vError AS 'SQL operation Failed !';
        END IF;
    END x

CREATE OR REPLACE PROCEDURE modifyRelation(IN veID BIGINT, IN vpID BIGINT, OUT vCon VARCHAR(100))
    BEGIN

            -- Update relations patient and employee name
            UPDATE relations SET patientName = (SELECT patientName FROM patients.patient WHERE pID = vpID) WHERE pID= vpID;
            UPDATE relations SET employeeName = (SELECT employeeName FROm employees.employees WHERE eID = veID) WHERE eID = veID;

            SET vConf = CONCAT('You have re-assigned ', (SELECT employeeName FROM relation WHERE eID = veID), ' To ', (SELECT patientName FROM relations WHERE pID = vpID));

            SELECT vConf AS 'SQL Confirmation';

    END x
/*******************************************************************/

/*********************** Turnus Procedures *************************/
CREATE OR REPLACE PROCEDURE newTurnus (IN veID BIGINT, IN vDate DATE, IN vTimeInn TIME, IN hh VARCHAR(2), IN mm TINYINT, IN vai TINYINT)
    BEGIN

        --  Declare variables
        DECLARE vAbsence VARCHAR(255);
        DECLARE vTimeOut TYPE OF turnus.ut;
        DECLARE veName TYPE OF employees.eName;
        DECLARE vSick TYPE OF employees.sickDays;

        --  Insert values to variables
        SELECT eName INTO veName FROM employees WHERE eID = veID;

        --  Converting hours into time 
        IF mm = 0 AND hh < 10 THEN
            SET vTimeOut =  ADDTIME(vTimeInn, CONCAT(0,hh, 0, 0, 0, 0));

        -- Checking if hh is greater  or equal to 10
        ELSEIF mm = 0 AND hh >= 10 THEN 
            SET vTimeOut = ADDTIME (vTimeInn, CONCAT(hh, 0, 0, 0, 0));

        -- // Challanges vmin converts into random hours
        ELSEIF mm > 0 THEN
            SET vTimeOut =  ADDTIME(vTimeInn, CONCAT(0, hh, mm, 0, 0));
        END IF;
        --  Creating a case to check wheter vai is equal to one or two
        CASE

            WHEN vai = 0 THEN

                SET vAbsence = '';

            WHEN vai = 1 THEN            

                SET vAbsence = 'Doctor / Dentis';
            WHEN vai = 2 THEN

                SET vAbsence = 'Sick';


                --  Selecting sickDays values into the variable
                SET vSick = (SELECT sickDays FROM employees.employees WHERE eID = vEID);

                --  Updating the information in employees 
                UPDATE employees SET sickDays = vSick - 1 WHERE eID = veID;

        END CASE;

        --  Insert into the table
        INSERT INTO turnus (eID, eName, dato, inn, ut, absence, hrs, minute) 
            VALUES (veID, veName, vDate, vTimeInn, vTimeout, vAbsence, hh, mm);

    END x
DELIMITER
CREATE OR REPLACE PROCEDURE modifySickDay (IN veID BIGINT, IN vInt TINYINT, IN vComment VARCHAR(255))
    BEGIN

        --  Declaring variables
        DECLARE vTime TYPE OF turnus.inn;
        DECLARE vResult TINYINT;
        DECLARE vComment TYPE OF turnus.comments;
        DECLARE vSickDays TYPE OF employees.sickDays;
        

        -- Inserting values into the variables
        SELECT inn INTO vTime FROM turnus;
        SET vComment = 'Self-Declareation';
        SELECT sickDays INTO vSickDays FROM employees;

        -- Updating sickDays
        IF vInt < vSickDays THEN 
        SET vResult = vSickDays - vInt;
        UPDATE employees SET sickDays = vSickDays - vInt WHERE eID = veID;
        UPDATE turnus SET comments = vComment WHERE dato = vDate AND inn = vTime;
        END IF;

    END x
/*******************************************************************/