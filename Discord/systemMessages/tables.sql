CREATE DATABASE Discord;

CREATE OR REPLACE TABLE joinOrleaveMessages (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                                welcome VARCHAR(255) NOT NULL,
                                absence VARCHAR(255) NOT NULL);

CREATE OR REPLACE TABLE  afkMessages (
                                        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                                        memberName VARCHAR(255) NOT NULL,
                                        afkReason VARCHAR(255));