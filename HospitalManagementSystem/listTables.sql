/******************************************** Diagnosis *****************************************************/
CREATE TABLE lod (
    -- Table of List of Diseases
                    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
                    diseaseID CHAR(5) NOT NULL DEFAULT 'A000A', 
                    diseaseName VARCHAR(255) NOT NULL, 
                    symptoms VARCHAR(255) NOT NULL,
                    medicineID VARCHAR(255) NOT NULL,
                    demo VARCHAR(255), 
                    demo1 VARCHAR(255));
/*************************************************************************************************************/

CREATE TABLE loa (
    -- Table of List of Alergies
                    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
                    alergyID CHAR(5) NOT NULL DEFAULT 'AA000', 
                    alergyName VARCHAR(255) NOT NULL, 
                    symptoms VARCHAR(255) NOT NULL, 
                    medicineID VARCHAR(255) NOT NULL, 
                    demo VARCHAR(255),
                    demo1 VARCHAR(255));

CREATE TABLE lom (
    -- Table of List of Medicines
                    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                    MedicineID VARCHAR(255) NOT NULL DEFAULT 'AA00A',
                    MedicineName CHAR(5) NOT NULL, 
                    illness VARCHAR(255) NOT NULL,
                    demo VARCHAR(255), 
                    demo1 VARCHAR(255));

/*************************************************************************************************************/

/******************************************** Rooms *****************************************************/
CREATE TABLE firstFloor (
    -- Table of List of firstFloor
                    roomID SMALLINT SIGNED NOT NULL,
                    roomName VARCHAR(255) NOT NULL,
                    hourlyRate DECIMAL(7,2) NOT NULL DEFAULT 0.00, 
                    demo VARCHAR(255),
                    demo1 VARCHAR(255));

CREATE TABLE secondFloor (
    -- Table of List of secondFloor
                    roomID SMALLINT SIGNED NOT NULL,
                    roomName VARCHAR(255) NOT NULL,
                    hourlyRate DECIMAL(7,2) NOT NULL DEFAULT 0.00, 
                    demo VARCHAR(255),
                    demo1 VARCHAR(255));

CREATE TABLE thirdFloor (
    -- Table of List of thirdFloor
                    roomID SMALLINT SIGNED NOT NULL,
                    roomName VARCHAR(255) NOT NULL,
                    hourlyRate DECIMAL(7,2) NOT NULL DEFAULT 0.00, 
                    demo VARCHAR(255),
                    demo1 VARCHAR(255));

/*************************************************************************************************************/