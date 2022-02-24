/***************************************************************

This file contains the Procedures which is used in the project


Patient Procedures,
Billing Proceduures,

/***************************************************************/

/*********************** Patients Procedures ******************************/

CREATE OR REPLACE PROCEDURE newPatient (IN pName VARCHAR(255), IN bDate DATE, IN vssn INT, IN vSex VARCHAR(5), IN vPhone VARCHAR(255), IN vStreet VARCHAR(255), IN vZip TINYINT, IN vWeight INT, IN vHeight INT, IN bType VARCHAR(2), IN vAlergies VARCHAR(5), IN vDoc VARCHAR(5), IN vMed VARCHAR(5))
    BEGIN
        --  Declare variables
        DECLARE vBMI TINYINT UNSIGNED;

        --  Add a value to the variables
        SET vBMI = vHeight / vBodyWeight;

        --  Insert values into the table
        INSERT INTO patient (patientName, birthDate, ssn, sex, phoneNumber, street, zipCode, bodyWeight, bodyHeight, bodyIndex, bloodType, alergies, diagnosis, medecine)
            VALUES
                (pName, bDate, vssn, vSex, vPhone, vStreet, vZip, vWeight, vHeight, vBMI, bType, vAlergies, vDoc, vMed);
    END x

/*****************************************************************/

CREATE OR REPLACE PROCEDURE modifyPatient (IN vColumn VARCHAR(20), vValue VARCHAR(255), IN vID INT)
    BEGIN

    --  Updates patient information Which has VARCHAR as DATATYPE

        SET @Query = CONCAT('UPDATE patient SET ', vColumn , vValue, ' WHERE id = ', vID);

            --  Prepareing and executing the statement
            PREPARE stmt FROM @Query;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
    END x
/***********************************************************************/

/*********************** Billing Procedures ************************/
-- x
CREATE OR REPLACE PROCEDURE newBilling (IN vpID BIGINT)
    BEGIN

        --  Declare variables
        DECLARE vAmmount DECIMAL(11,2)
        DECLARE num  DECIMAL(11,2)
        
        --  Creating a loop to loop thorugh the list

        --  Inserting values to the table
        INSERT INTO billing (pID, Ammount, discount)
        VALUES
        (cpID, vAmmount, 0.00)

/*******************************************************************/
