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
        DECLARE vCounter INT;

        COUNT(eName) FROM
        --  Add a value to the Variable
        SET vSalary = (SELECT hourlySalary FROM salaryInfo WHERE occupation = vTitle);
        SET vSalary = veStatus * vSalary/100;
        
        -- Modifying the employee number

        SET @areaCode = SUBSTRING(vPhone, 1,3);
        SET @lastDigit = SUBSTRING(vPhone, 7,4);
        SET @threeDigit = SUBSTRING(vPhone, 4,3);

        SET vPhone = CONCAT ('(', @areaCode, ')- ', @threeDigit, '-', @lastDigit);


        INSERT INTO employees (eName, birthDate, street, zipCode, email, phone, eStatus, occupation, hSalary, department) VALUES
        (eName, vDate, vStreet, vZip, vEmail, vPhone, veStatus, vTitle, vSalary, vDep);
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
CREATE OR REPLACE PROCEDURE newSalary (IN vName VARCHAR(255), IN ySalary DECIMAL(8.2))
    BEGIN

        --  Declare variables
        DECLARE mSalary DECIMAL(7.2);
        DECLARE hSalary DECIMAL (6.2);

        --  Set values to the variables using a function
        SET mSalary = ySalary / 162.5;
        SET hSalary = ySalary / 1950;

        --  Inserting values into the table
        INSERT INTO salaryInfo(occupation, yearlySalary, monthlySalary, hourlySalary)
            VALUES (vName, ySalary, mSalary, hSalary);

    END x


/*******************************************************************/