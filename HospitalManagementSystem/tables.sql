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
DELIMITER ;
/******************************** Employee **************************************************************************/
CREATE TABLE employees (
                        EmployeeID INT NOT NULL,
                        employeeName VARCHAR(255) NOT NULL,
                        employeeAddress VARCHAR(255) NOT NULL,
                        email VARCHAR(255) NOT NULL,
                        phone VARCHAR(255) NOT NULL,
                        zipCode SMALLINT NOT NULL DEFAULT 0000,
                        department VARCHAR(255) NOT NULL,
                        Position VARCHAR(255) NOT NULL,
                        employeeContract TINYBLOB,
                        Hired TIMESTAMP NOT NULL DEFAULT CURRENT_TIME));
/*************************************************************************************************************/

/******************************** RoomBookings *******************************************************************/

/*************************************************************************************************************/