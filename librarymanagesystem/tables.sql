/*
DATABASE Name 
Collage Library System

Author
Krigjo25

Project start
Monday, 04.10-21 : 18:00:00

Project tested


Project Finished
*/
DROP DATABASE lib;
-- *****************  Database Creation ***********************************
CREATE DATABASE lib;                         
DELIMITER ;
/* **************************************************************************************************/

/********************************************* Table for members ***********************************/
    CREATE TABLE member (   id INT NOT NULL AUTO_INCREMENT,
                            memberName VARCHAR(255) NOT NULL,
                            lCash DECIMAL(6,2) DEFAULT 0.00,
                            eMail VARCHAR(255) NOT NULL,
                            phoneNum INT NOT NULL,
                            demo1 VARCHAR(255), 
                            demo VARCHAR(255),
                                PRIMARY KEY(id,memberName));
DELIMITER
    CREATE TABLE terminMember(  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                                memberName VARCHAR(255) NOT NULL,
                                contactInfo VARCHAR(255) NOT NULL,
                                lCash DECIMAL(6,2),
                                terminate TIMESTAMP NOT NULL);
DELIMITER ;
/* **************************************************************************************************/


DELIMITER ;
-- *****************  Table for Books ***********************************
    CREATE TABLE books (    id INT NOT NULL AUTO_INCREMENT,
                            bookName VARCHAR(255) NOT NULL,
                            author VARCHAR(255) NOT NULL,
                            price DECIMAL(6,2) NOT NULL,
                            qty INT N  OT NULL,
                            maxQty INT NOT NULL DEFAULT 10,
                            genre VARCHAR(255),
                            subgenre VARCHAR(255),
                            discount DECIMAL(6,2), 
                            deals DECIMAL(6,2),
                            dealDate DATE,
                            dealEndDate DATE),
                            PRIMARY KEY (id, bookName, author));
DELIMITER ;
    CREATE TABLE terminBooks (      id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                                    bookName VARCHAR(255) NOT NULL,
                                    author VARCHAR(255) NOT NULL,
                                    price DECIMAL(6,2) NOT NULL,
                                    qty INT NOT NULL,
                                    genre VARCHAR(255),
                                    subgenre VARCHAR(255), 
                                    demo VARCHAR(255),
                                    subdemo VARCHAR(255),
                                    terminate TIMESTAMP NOT NULL);
DELIMITER;
DROP TABLE lib
DELIMITER

    CREATE TABLE  lib(  id INT NOT NULL AUTO_INCREMENT,
                        bookID INT NOT NULL,
                        bookName VARCHAR(255) NOT NULL,
                        author VARCHAR(255) NOT NULL,
                        qty INT NOT NULL,
                        dateBorrowed DATE NOT NULL DEFAULT CURDATE(),
                        remindDate DATE NOT NULL,
                        returnDate DATE NOT NULL,
                        overDueDate DATE NOT NULL,
                        borrowedBy VARCHAR(255) NOT NULL,
                        memberID INT NOT NULL,
                        demoColumn VARCHAR(255),
                        PRIMARY KEY(id, bookID, memberID),
                            CONSTRAINT memberFK FOREIGN KEY (memberID) REFERENCES member(id) ON DELETE CASCADE ON UPDATE CASCADE,
                            CONSTRAINT bookFK FOREIGN KEY (bookID) REFERENCES books(id) ON DELETE CASCADE ON UPDATE CASCADE);


DELIMITER
    CREATE TABLE  returnedBooks(    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                                    bookID INT NOT NULL,
                                    bookName VARCHAR(255) NOT NULL,
                                    author VARCHAR(255) NOT NULL,
                                    returnDate DATE NOT NULL DEFAULT CURDATE(),
                                    borrowedBy VARCHAR(255) NOT NULL,
                                    memberID INT NOT NULL,
                                    terminate TIMESTAMP NOT NULL,
                                    demoColumn VARCHAR(255));

/* **************************************************************************************************/