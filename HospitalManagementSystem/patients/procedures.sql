/***************************************************************

This file contains the Procedures which is used in the project


Patient Procedures,
Billing Proceduures,

/***************************************************************/

/*********************** Patients Procedures ******************************/
DELIMITER x
CREATE OR REPLACE PROCEDURE newPatient (IN pName VARCHAR(255), IN bDate DATE, IN vssn VARCHAR(255), IN vGender VARCHAR(5), IN vPhone VARCHAR(255), IN vStreet VARCHAR(255), IN vZip INT, IN vWeight INT, IN vHeight INT, IN bType VARCHAR(2), IN vAlergies VARCHAR(5), IN vDoc VARCHAR(5), IN vMed VARCHAR(5))
    BEGIN
        --  Declare variables
        DECLARE vBMI TINYINT;
        
        DECLARE partOne TYPE OF patient.ssn;
        DECLARE partTwo TYPE OF patient.ssn;
        DECLARE partThree TYPE OF patient.ssn;

        DECLARE areaCode TYPE OF patient.phoneNumber;
        DECLARE lastDigit TYPE OF patient.phoneNumber;
        DECLARE threeDigit TYPE OF patient.phoneNumber;

        -- Converting cm into m
        SET @height = vHeight / 100;
        SET @height = @height * 2;

        --  divide the Weight with Height
        SET vBMI = vWeight/@height;

        --  Trimming the Phone Number
        SET areaCode = SUBSTRING(vPhone, 1,3);
        SET lastDigit = SUBSTRING(vPhone, 7,4);
        SET threeDigit = SUBSTRING(vPhone, 4,3);

        -- Trimming the Social Security Number
        SET partOne = SUBSTRING(vssn, 1,3);
        SET partTwo = SUBSTRING(vssn, 3,2);
        SET partThree = SUBSTRING(vssn,5,4);

        -- Assigning the new values to the variables, using concat to merge the string
        SET vssn = CONCAT(partOne, '-', partTwo, '-', partThree);
        SET vPhone = CONCAT ('(', areaCode, ') -', threeDigit, '-', lastDigit);

        --  Insert values into the table
        INSERT INTO patient (patientName, birthDate, ssn, gender, phoneNumber, street, zipCode, bWeight, bHeight, bmi, bloodType, alergyID, diagnoseID, medecineID) VALUES
                (pName, bDate, vssn, vGender, vPhone, vStreet, vZip, vWeight, vHeight, vBMI, bType, vAlergies, vDoc, vMed);
    END x

/*****************************************************************/

CREATE OR REPLACE PROCEDURE modifyPatient (IN vColumn VARCHAR(20), vValue VARCHAR(255), IN vID INT)
    BEGIN

        --  Declare variables
        DECLARE vAlergy TYPE OF patient.alergyID;
        DECLARE vMedecine TYPE OF patient.medecineID;
        DECLARE vMedecineTwo TYPE OF patient.medecineID;

        -- Selecting medecine value into the variables

        IF vColumn = 'alergyID' THEN

            -- Select the old IDS into the vAlergy variable IF they're not default
            SELECT alergyID INTO vAlergy FROM patient WHERE patientID = vID;
            SELECT medecineID INTO vMedecineTwo FROM HospitalManagementSystem.alergies WHERE alergyID = vValue;
            SELECT medecineID INTO vMedecine FROM HospitalManagementSystem.alergies WHERE alergyID = vAlergy;

            --  Checking wheter the vAlergy Contains 
            IF vAlergy != 'NNNNA' THEN

                SET vValue = CONCAT(vAlergy, ',', vValue);

                CASE

                    WHEN vMedecine != 'NNNNM' THEN
                        SET vMedecine = CONCAT(vMedecine, ',', vMedecineTwo);
                        UPDATE patient SET medecineID = vMedecine WHERE patientID = vID;

                    WHEN vMedecine = 'NNNNM' THEN
                        UPDATE patient SET medecineID = vMedecine WHERE patientID = vID;            
                END CASE;

            END IF;

        ELSEIF vColumn = 'diagnoseID' THEN

            -- Select the old IDS into the vAlergy variable IF they're not default
            SELECT diagnoseID INTO vAlergy FROM patient WHERE patientID = vID;
            SELECT medecineID INTO vMedecine FROM HospitalManagementSystem.diagnosis WHERE alergyID = vAlergy;
            SELECT medecineID INTO vMedecine FROM HospitalManagementSystem.diagnosis WHERE alergyID = vAlergy;

            --  Checking wheter the vAlergy Contains 
            IF vAlergy != 'NNNND' THEN

                SET vValue = CONCAT(vAlergy, ',', vValue);
            
                CASE

                    WHEN vMedecine != 'NNNNM' AND vMedecine != vMedecineTwo THEN
                        SET vMedecine = CONCAT(vMedecine, ',', vMedecineTwo);
                        UPDATE patient SET medecineID = vMedecine WHERE patientID = vID;

                    WHEN vMedecine = 'NNNNM' THEN
                        UPDATE patient SET medecineID = vMedecine WHERE patientID = vID;
                END CASE;
            
            END IF;

        END IF;

                --  Updates patient information Which has VARCHAR as DATATYPE
                SET @Query = CONCAT('UPDATE patient SET ', vColumn , ' = ', vValue, ' WHERE patientID = ', vID);

                --  Prepareing and executing the statement
                PREPARE stmt FROM @Query;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
        END x
/***********************************************************************/
DELIMITER
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
