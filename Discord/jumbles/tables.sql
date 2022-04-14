
CREATE OR REPLACE TABLE waltdisney ( 
                            id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                            characters VARCHAR(255) NOT NULL,
                            roles VARCHAR(255) NOT NULL,
                            animation VARCHAR(255) NOT NULL,
                            img MEDIUMBLOB );