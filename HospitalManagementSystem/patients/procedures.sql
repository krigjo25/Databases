/***************************************************************

This file contains the Procedures which is used in the project


Patient Procedures,
Billing Proceduures,

/***************************************************************/

/*********************** Patients Procedures ******************************/
DELIMITER x
CREATE OR REPLACE PROCEDURE newPatient (IN pName VARCHAR(255), IN bDate DATE, IN vssn VARCHAR(255), IN vGender VARCHAR(5), IN vPhone VARCHAR(255), IN vStreet VARCHAR(255), IN vZip INT, IN vWeight INT, IN vHeight INT, IN bType VARCHAR(2))
    BEGIN
        --  Declare variables
        DECLARE vBMI DECIMAL(4.1);
        
        --  Gathering Social Security variables
        DECLARE partOne TYPE OF patient.ssn;
        DECLARE partTwo TYPE OF patient.ssn;
        DECLARE partThree TYPE OF patient.ssn;

        --  Gathering phonenumber
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
        
        --  Converting the given values for the variables using functions
        --  SET vssn = convertssn(vssn);
        --  SET vPhone = convertPhone(vPhone)
        --  SET vBMI = calculateBMI(vWeight, vheight);
        
        --  Insert values into the table
        INSERT INTO patient (patientName, birthDate, ssn, gender, phoneNumber, street, zipCode, bWeight, bHeight, bmi, bloodType) 
            VALUES (pName, bDate, vssn, vGender, vPhone, vStreet, vZip, vWeight, vHeight, vBMI, bType);
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
/*********************** Donor Procedures ************************/
-- x

CREATE OR REPLACE PROCEDURE newDonor (IN vpID BIGINT, IN vOrgan VARCHAR(3), IN vBlood VARCHAR(3))
    BEGIN

        --  Declare variables
        DECLARE ssn TYPE OF patient.ssn;
        DECLARE bType TYPE OF patient.bloodType;
        DECLARE vName TYPE OF patient.patientName;
        DECLARE vPhone TYPE OF patient.phoneNumber;
        DECLARE vMedecineID TYPE OF patient.medecine;
        DECLARE vDiagnoseID TYPE OF patient.diagnosis;
    
        --  Selecting values from the patient table
        SELECT ssn INTO vssn FROM patient WHERE patientID = vpID;
        SELECT bloodType INTO bType FROM patient WHERE patientID = vpID;
        SELECT patientName INTO vName FROM patient WHERE patientID = vpID;
        SELECT diagnoseID INTO vDiagnoseID FROM patient WHERE patientID = vpID;
        SELECT medecineID INTO vMedecineID FROM patient WHERE patientID = vpID;

        --  Inserting values to the table
        INSERT INTO donator (patientID, patientName, bloodType, phoneNumber, organDonor, bloodDonor, diagnoseID, medecineID)
            VALUES (pID, vName, bType, vPhone, vOrgan, vBlood, vDiagnoseID, vMedecineID);
    END x

CREATE OR REPLACE PROCEDURE modifyDonor (IN pID BIGINT, IN vColumn VARCHAR(25), IN vValue VARCHAR(25) )
    BEGIN

        --  Updating values for the table
        CASE
            WHEN vColumn = 'organ' THEN
                UPDATE donorList SET organDonor = vValue WHERE patientID = pID;

            WHEN vColumn = 'blood' THEN
                UPDATE donorList SET blodDonor = vValue WHERE patientID = pID;
        CASE END;
    END x
/*******************************************************************/