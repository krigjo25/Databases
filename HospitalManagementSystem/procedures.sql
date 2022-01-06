/********************** Procedures***************************
author
krigjo25

/*****************************************************/
/********************** Patients ********************/
DELIMITER ??
CREATE OR REPLACE PROCEDURE insertPatient (pName VARCHAR(255),vage INT, vSex VARCHAR(5), vPhone VARCHAR(255), veMail VARCHAR(255), bType VARCHAR(20), vAlergies VARCHAR(255), villness VARCHAR(255))
    BEGIN
    /*
    Inserting a new patient for the table
    */
    INSERT INTO patient (patientName, age, gender, phoneNumber, eMail, bloodType, alergies, diseases) VALUES
    (pName, vage, vSex, vPhone, veMail, bType, vAlergies,villness);
    END ??

CREATE OR REPLACE PROCEDURE updatePatient (vID INT,  vColumn VARCHAR(20), vValue VARCHAR(255))
    BEGIN

    /*
    Updates patient information Which has VARCHAR as DATATYPE
    */
    SET @Query = CONCAT('UPDATE patient SET ', vColumn , vValue ' WHERE id = ', vID);

                /*Prepareing and executing the statement*/
                PREPARE stmt FROM @Query;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
/*****************************************************/