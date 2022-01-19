/********************************************   Patient table   ********************************************/

CREATE TABLE patient (
                        id BIGINT NOT NULL AUTO_INCREMENT,
                        patientName VARCHAR(255) NOT NULL DEFAULT,
                        age TINYINT NOT NULL DEFAULT 20,
                        gender VARCHAR(5) NOT NULL, 
                        phoneNumber VARCHAR(255) NOT NULL,
                        eMail VARCHAR(255) NOT NULL,
                        adress VARCHAR(255) NOT NULL DEFAULT 'CharminAvenue',
                        zipcode SMALLINT NOT NULL DEFAULT 0000,
                        bloodType VARCHAR(255), 
                        alergies VARCHAR(255) NOT NULL DEFAULT 00000,
                        diseases VARCHAR(255) NOT NULL DEFAULT 00000,
                        dateIn DATETIME NOT NULL DEFAULT CURRENT_TIME,
                        dateOut DATETIME,
                        nextAppointment DATE,
                        billing MEDIUMBLOB,
                        patientJournal MEDIUMBLOB,
                        demo VARCHAR(255),
                        demo1 VARCHAR(255),
                        registered TIMESTAMP NOT NULL DEFAULT NOW(),
                        PRIMARY KEY(id, diseases, alergies));
/*************************************************************************************************************/

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

/******************************************** Alergies *****************************************************/
CREATE TABLE loa (
    -- Table of List of Alergies
                    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
                    alergyID CHAR(5) NOT NULL DEFAULT 'AA000', 
                    alergyName VARCHAR(255) NOT NULL, 
                    symptoms VARCHAR(255) NOT NULL, 
                    medicineID VARCHAR(255) NOT NULL, 
                    demo VARCHAR(255),
                    demo1 VARCHAR(255));
/*************************************************************************************************************/

/******************************************** medicine *****************************************************/
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
    -- Table of List of Medicines
                    roomID SMALLINT SIGNED NOT NULL,
                    roomName VARCHAR(255) NOT NULL DEFAULT 'AA00A',
                    EquipmentID MEDIUMINT NOT NULL, 
                    equipment VARCHAR(255), 
                    demo1 VARCHAR(255));
/*************************************************************************************************************/