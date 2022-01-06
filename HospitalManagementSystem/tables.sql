/********************************************   Patient table   ********************************************/

CREATE TABLE patient (
                        id INT NOT NULL AUTO_INCREMENT,
                        patientName VARCHAR(255) NOT NULL,
                        age VARCHAR(3) NOT NULL,
                        gender VARCHAR(5) NOT NULL, 
                        phoneNumber VARCHAR(255) NOT NULL,
                        eMail VARCHAR(255),
                        bloodType VARCHAR(255), 
                        alergies VARCHAR(255) NOT NULL DEFAULT 00000,
                        diseases VARCHAR(255) NOT NULL DEFAULT 00000,
                        dateIn DATETIME NOT NULL DEFAULT CURRENT_TIME,
                        dateOut DATETIME NOT NULL,
                        nextAppointment DATE,
                        billing MEDIUMBLOB,
                        patientJournal MEDIUMBLOB,
                        demo VARCHAR(255),
                        demo1 VARCHAR(255),
                        registered TIMESTAMP NOT NULL DEFAULT NOW(),
                        PRIMARY KEY(id, diseases, alergies));
/*************************************************************************************************************/

/********************************************   rooms   ********************************************/
CREATE TABLE firstFloor (
                    id INT NOT NULL,
                    roomName VARCHAR(255) NOT NULL);
CREATE TABLE secondFloor (
                    id INT NOT NULL,
                    roomName VARCHAR(255) NOT NULL,
                    hourly_Rate DECIMAL(8,2) NOT NULL);
CREATE TABLE thirdFloor (
                    id INT NOT NULL,
                    roomName VARCHAR(255) NOT NULL,
                    hourly_Rate DECIMAL(8,2) NOT NULL);
/*************************************************************************************************************/