/*
Comments such as the one below indicates, it has to be made after the the given table

# Comment

*/
/********************************************   Patient table   ********************************************/

CREATE TABLE patient (
                        id BIGINT NOT NULL AUTO_INCREMENT,
                        patientName VARCHAR(255) NOT NULL,
                        age TINYINT NOT NULL DEFAULT 20,
                        gender VARCHAR(5) NOT NULL, 
                        phoneNumber VARCHAR(255) NOT NULL,
                        eMail VARCHAR(255) NOT NULL,
                        adress VARCHAR(255) NOT NULL DEFAULT 'CharminAvenue',
                        zipcode SMALLINT NOT NULL DEFAULT 0000,
                        bloodType VARCHAR(255), 
                        alergies VARCHAR(255) NOT NULL DEFAULT 'NNNNA',
                        diagnosis VARCHAR(255) NOT NULL DEFAULT 'NNNND',
                        dateIn DATETIME NOT NULL DEFAULT CURRENT_TIME,
                        dateOut DATETIME,
                        nextAppointment DATE,
                        billing MEDIUMBLOB,
                        patientJournal MEDIUMBLOB,
                        demo VARCHAR(255),
                        demo1 VARCHAR(255),
                        registered TIMESTAMP NOT NULL DEFAULT NOW(),

                    --  Table Constraints
                        PRIMARY KEY(id),
                        CONSTRAINT UniqeuName UNIQUE(diagnosis, alergies),
                        CONSTRAINT ListOfAlergies_FK FOREIGN KEY(alergies) REFERENCES alergies(alergyID) ON DELETE CASCADE ON UPDATE CASCADE,
                        CONSTRAINT ListOfDiagnosis_FK FOREIGN KEY(diagnosis) REFERENCES diagnosis(diagnosisID) ON DELETE CASCADE ON UPDATE CASCADE);
/*************************************************************************************************************/

/******************************** Employee **************************************************************************/
CREATE TABLE employees (
                        EmployeeID INT NOT NULL,
                        employeeName VARCHAR(255) NOT NULL,
                        employeeAddress VARCHAR(255) NOT NULL,
                        email VARCHAR(255) NOT NULL,
                        phone VARCHAR(255) NOT NULL,
                        zipCode SMALLINT NOT NULL DEFAULT 0000,
                        eContact VARCHAr(255),
                        department VARCHAR(255) NOT NULL,
                        Position VARCHAR(255) NOT NULL,
                        employeeContract TINYBLOB,
                        Hired TIMESTAMP NOT NULL DEFAULT NOW());
/*************************************************************************************************************/

/******************************** RoomBookings **************************************************************/
CREATE TABLE booking (
                    --  Table Columns
                        id INT NOT NULL AUTO_INCREMENT,
                        patientID INT NOT NULL,
                        patient VARCHAR(255) NOT NULL,
                        roomID INT NOT NULL,
                        roomName VARCHAR(255),
                        rate DECIMAL(4,2) NOT NULL DEFAULT 0,
                        employeeID INT NOT NULL,
                        employeeName VARCHAR(255),
                        bookingInn DATETIME NOT NULL DEFAULT NOW(),
                        bookingOut DATETIME NOT NULL,
                        comments VARCHAR(255),
                        demo VARCHAR(255),
                        demo1 VARCHAR(255),

                    --  Table Constraints
                    CONSTRAINT uniqueName UNIQUE(patientName, roomName, rate, EmployeeName),
                    CONSTRAINT patient_FK FOREIGN KEY (patientName) ON DELETE CASCADE, ON UPDATE CASCADE,
                    CONSTRAINT room_FK FOREIGN KEY (roomName) REFERENCES firstfloor ON DELETE CASCADE ON UPDATE CASCADE,
                    CONSTRAINT employee_FK FOREIGN KEY (employeeName) REFERENCES employees(employeeName) ON DELETE RESTRICT ON UPDATE CASCADE);

/*************************************************************************************************************/


/************************************* Billings *************************************************************/

CREATE TABLE billing (
                    --  Table Columns
                        id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT
                        invoiceID INT NOT NULL, -- AUTO_INCREMENT PRIMARY KEY, AUTO_INCREMENT=300000 
                        patientID INT NOT NULL,
                        Ammount, DECIMAL(11,2),
                        discount TINYINT NOT NULL,
                        status VARCHAR(8) NOT NULL DEFAULT 'Not Paid' 
                    
                    -- Table Constraints
                    CONSTRAINT uniqueName UNIQUE(invoiceID)
                    CONSTRAINT patient_FK FOREIGN KEY(patientID) ON DELETE CASCADE ON UPDATE CASCADE);
/*************************************************************************************************************/