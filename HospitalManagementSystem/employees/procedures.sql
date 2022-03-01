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
CREATE OR REPLACE PROCEDURE newRelation ( IN veID BIGINT, IN vpID BIGINT)
    BEGIN

        -- Declareing new variables
        DECLARE pName VARCHAR(255);
        DECLARE veName VARCHAR(255);
        DECLARE vCount TINYINT;

        --  Assigning the new variable values
        SET pName = (SELECT patientName from patients.patient WHERE pID = vpID);
        SET veName = (SELECT eName from employees WHERE eID = veID);

        --  Counting how many times the doctor has been added to the table
        SET vCount = COUNT(veID);

        IF vCount <= 9 THEN

        -- Assigning doctor to patient
        INSERT INTO relations (eID, employeeName, pID, patientName)
            VALUES 
            (veID, veName, vpID, pName);

        END IF;

    END x

CREATE OR REPLACE PROCEDURE modifyRelation( IN vColumn VARCHAR(20), IN veID BIGINT, IN vpID BIGINT, IN vValue BIGINT)
    BEGIN

        --  Creating a case to update selected Column
        CASE
        WHEN vColumn = 'eID' THEN SET @Query = CONCAT('UPDATE relations SET ', vColumn, ' = ', vValue, ' WHERE eID = ', veID);
        WHEN vColumn = 'pID' THEN SET @Query = CONCAT('UPDATE relations SER ', vColumn, ' = ', vValue, ' WHERE pID = ', vpID);
        END CASE;

            /*Prepareing and executing the statement*/
            PREPARE stmt FROM @Query;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;

    END x
/*******************************************************************/

/*********************** Turnus Procedures *************************/
CREATE OR REPLACE PROCEDURE newTurnus (IN veID BIGINT, IN vDate DATE, IN vTimeInn TIME, IN vhrs TINYINT, vMin TINYINT)
    BEGIN

        --  Declare variables
        DECLARE vTimeOut TYPE OF turnus.ut;
        DECLARE veName TYPE OF employees.eName;
        DECLARE vSickDays TYPE OF employees.sickDays;

        --  Insert values to variables
        SELECT eName INTO veName FROM employees WHERE eID = veID;

        --  Count the hours for the staff to be at work
        SET vTimeOut = CONCAT(vhrs,':', vmin, ':00'); 

        --  Insert into the table
        INSERT INTO turnus (eID, eName, dato, inn, ut, sickDays) 
            VALUES (veID, veName, vDate, vTimeInn, vTimeout, vSickDays);
    END x

CREATE OR REPLACE PROCEDURE sickDay (IN veID BIGINT, IN vInt TINYINT, IN vComment VARCHAR(255))
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