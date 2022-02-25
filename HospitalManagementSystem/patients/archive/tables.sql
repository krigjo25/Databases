CREATE TABLE  terminatedEmployees( 
                                                eID BIGINT NOT NULL, 
                                                eName VARCHAR(255), 
                                                birthDate DATE, 
                                                street VARCHAR(255), 
                                                zipCode SMALLINT, 
                                                email VARCHAR(255), 
                                                phone VARCHAR(255), 
                                                occupation VARCHAR(255), 
                                                department VARCHAR(255));
DELIMITER ;
CREATE TABLE billingArchive (   patientName VARCHAR(255) NOT NULL,
                                invoiceID BIGINT NOT NULL,
                                discount TINYINT NOT NULL, 
                                incTax DECIMAL (7.2) NOT NULL, 
                                pStatus INT NOT NULL DEFAULT 0);
