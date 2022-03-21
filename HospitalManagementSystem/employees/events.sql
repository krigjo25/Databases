/************************************* patients **********************************************************

*********************************************************************************************************/

CREATE OR REPLACE EVENT delRecords
        -- Schedule the time for the event
    ON SCHEDULE EVERY 1 DAY DO BEGIN

        --  Delete records from employee
        DELETE FROM employees.employees WHERE eStatus = 0;

        -- Calling a function to check wheter the patient is recovered or not
        CALL checkRecovery();

        -- Delete records from relations 
        DELETE FROM employees.relations WHERE recovered = 1;

        -- Delete records from turnus
        DELETE FROM employees.turnus WHERE dato < DATE_SUB(CURDATE(), INTERVAL + 1 YEAR);

        -- When the employee has gone a period with out being sick, he get back sickdays

END x
/*************************************************************************************************************/
CREATE OR REPLACE Event salaryChanges
    ON SCHEDULE EVERY 1 MINUTE DO BEGIN

        --  Declare variables
        DECLARE mSalary DECIMAL(7.2);
        DECLARE hSalary DECIMAL(6.2);
        DECLARE ySalary DECIMAL(9.2);

        --  Set values to the variables using a function

        SELECT yearlyRate into ySalary FROM salaryInfo;
    
        SET hSalary = ySalary / 1950;
        SET mSalary = ySalary = mSalary / 163.5;

        --  Inserting values into the table
        UPDATE salaryInfo SET hourlyRate = hSalary;
        UPDATE salaryInfo SET monthlyRate = mSalary;

    END x

