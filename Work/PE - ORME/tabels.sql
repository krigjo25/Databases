
/*
DATABASE Name 
PolyForm 

file for tables and insert statements


Author
Krigjo25
*/
/******************************* Wagon One ******************************/
DROP TABLE wagonOne;
    -- Creating the first table named formInfo ( Information about the forms which is used in PE)
    CREATE TABLE wagonOne( 
                            id INT NOT NULL AUTO_INCREMENT,
                            formName VARCHAR(255) NOT NULL,
                            plate DECIMAL(4,2) NOT NULL DEFAULT 0, 
                            arm DECIMAL(4,2) NOT NULL DEFAULT 0,
                            mincool INT NOT NULL DEFAULT 35,
                            minOven DECIMAL(3,1) NOT NULL DEFAULT 30,
                            sutableWith VARCHAR(255),
                            middlePice VARCHAR(6),
                            notes VARCHAR(255),
                            img MEDIUMBLOB,
                            notes VARCHAR(255),
                            pSeries VARCHAR(255) NOT NULL);
        

/******************************* Wagon 2 ******************************/

    CREATE TABLE wagonTwo (
                            formName VARCHAR(255) NOT NULL,
                            plate DECIMAL(4,2) NOT NULL DEFAULT 0, 
                            arm DECIMAL(4,2) NOT NULL DEFAULT 0,
                            mincool INT NOT NULL DEFAULT 35,
                            minOven DECIMAL(3,1) NOT NULL DEFAULT 20,
                            sutableWith VARCHAR(255) DEFAULT '4pack',
                            middlePice VARCHAR(6),
                            notes VARCHAR(255),
                            img MEDIUMBLOB,
                            registered TIMESTAMP DEFAULT NOW(),
                            wagonid INT DEFAULT 2,
                            pSeries VARCHAR(255) NOT NULL);

/******************************* WagonThree ******************************/
    -- Creating the first table named formInfo ( Information about the forms which is used in PE)
DROP TABLE wagonThree;
    CREATE TABLE wagonThree (
                                formName VARCHAR(255) NOT NULL,
                                plate DECIMAL(4,2) NOT NULL DEFAULT 0, 
                                arm DECIMAL(4,2) NOT NULL DEFAULT 0,
                                mincool INT NOT NULL DEFAULT 35,
                                minOven DECIMAL(3,1) NOT NULL DEFAULT 30,
                                middlePice VARCHAR(6), 
                                bracer varchar(255),                               
                                notes VARCHAR(255),
                                img MEDIUMBLOB,
                                armNR INT DEFAULT 3,
                                pSeries VARCHAR(255) NOT NULL, 
                                registered TIMESTAMP DEFAULT NOW());

/******************************* production Information Tables ******************************/
    DELIMITER ;
    
    DROP TABLE productionInfo;

    CREATE TABLE productionInfo(
                                id INT NOT NULL AUTO_INCREMENT, 
                                formID INT NOT NULL, 
                                formName VARCHAR(255) NOT NULL, 
                                kg DECIMAL(4,1),
                                black DECIMAL(4,1) NOT NULL DEFAULT 0,
                                blue DECIMAL(4,1) NOT NULL DEFAULT 0,
                                grey DECIMAL(4.1) NOT NULL DEFAULT 0,
                                orange DECIMAL(4,1) NOT NULL DEFAULT 0,
                                yellow DECIMAL(4.1) NOT NULL DEFAULT 0,
                                notes VARCHAR(255),
                                pSeries VARCHAR(255),
                                powderName VARCHAR(255) NOT NULL DEFAULT 'polyethylene',
                                PRIMARY KEY (id,formID));
                                -- Constraints
                                    --CONSTRAINT wagonOneFK FOREIGN KEY(formID) REFERENCES wagonOne(id) ON DELETE CASCADE ON UPDATE CASCADE,
                                    --CONSTRAINT wagonTwoFK FOREIGN KEY(formID) REFERENCES wagonTwo(id) ON DELETE CASCADE ON UPDATE CASCADE,
                                    --CONSTRAINT wagonThreeFK FOREIGN KEY(formID) REFERENCES wagonThree(id) ON DELETE CASCADE ON UPDATE CASCADE);

        