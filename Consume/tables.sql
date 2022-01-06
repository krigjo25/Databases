

DELIMITER ;
-- *****************  Creating the table Alcohol ***********************************
    CREATE TABLE alcohol (  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
                            article VARCHAR(255) NOT NULL, 
                            aType VARCHAR(255) NOT NULL, 
                            vol DECIMAL (4,1) NOT NULL DEFAULT 4.5, 
                            qty INT NOT NULL);
    INSERT INTO alcohol (article, aType, vol, qty) VALUES
    ('Sourz Apple', 'Sprit', 16.7, 1),
    ('Captain Morgan', 'Rom', 32.7, 1),
    ('Smirnoff', 'Sprit', 32.6, 1),
    ('Corona Extra', 'Øl', 4.7, 5);
DELIMITER ;
-- *****************  CREATE TABLE FREEZER ***********************************
    CREATE TABLE freezer (  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
                            article VARCHAR(255) NOT NULL, 
                            brand VARCHAR(255), 
                            aType VARCHAR(255) NOT NULL, 
                            qty INT NOT NULL DEFAULT 0, 
                            dateAdded DATE NOT NULL DEFAULT curdate(), 
                            dateExpires DATE NOT NULL);
DELIMITER

-- *****************  CREATE TABLE Fridge ***********************************
    CREATE TABLE fridge (   id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
                            article VARCHAR(255) NOT NULL, 
                            brand VARCHAR(255), 
                            aType VARCHAR(255) NOT NULL, 
                            qty INT NOT NULL DEFAULT 0, 
                            dateAdded DATE NOT NULL DEFAULT curdate(), 
                            dateExpires DATE NOT NULL);

-- *****************  CREATE TABLE Polyform ***********************************
    CREATE TABLE work ( id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        article VARCHAR(255) NOT NULL,
                        qty INT NOT NULL);
    INSERT INTO work (article, qty) VALUES
    ('Knife', 15),
    ('Spoon', 15),
    ('Fork', 15),
    ('Yoghurt', 2),
    ('Leverpostei', 2);