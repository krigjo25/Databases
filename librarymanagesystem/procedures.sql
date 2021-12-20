/*************************************** Universal - procedures ************************************/
DELIMITER **
    CREATE OR REPLACE PROCEDURE del (IN tbl VARCHAR(20), IN vID INT)
            BEGIN
                    /* Deletes a given id from a given table*/

                SET @Query = CONCAT('DELETE FROM ', tbl, ' WHERE id = ', vID);

                /*Prepareing and executing the statement*/
                PREPARE stmt FROM @Query;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
            END **
DELIMITER **
    CREATE OR REPLACE PROCEDURE charValue (IN tbl VARCHAR(20),IN col VARCHAR(255), IN vValue VARCHAR(255), IN vID INT)
        BEGIN
            /*Updates a table with the given characters*/
            SET @Query = CONCAT('UPDATE ', tbl, 'SET ', col, ' = ', vValue, ' WHERE id = ', vID);
            
            /*Prepareing and executing the statement*/
            
            PREPARE stmt FROM @Query;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
        END **

DELIMITER **
    CREATE OR REPLACE PROCEDURE intUpdate (IN tbl VARCHAR(255), IN col VARCHAR(20), IN intValue INT, IN vID INT)
        BEGIN
            /* Updating values with INT*/
            SET @Query = CONCAT (' UPDATE ', tbl, ' SET ', col, ' = ', intValue, ' WHERE id = ', vID)
            
            /* Prepare and execute the statement*/
            
            PREPARE stmt;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
        
        END **
/*************************************** Member - procedures ************************************/
DELIMITER **

    CREATE OR REPLACE PROCEDURE insertM(IN mName VARCHAR(255), IN vMail VARCHAR(255), IN vNum INT) 
        BEGIN
            -- Inserting values to the teacher table
            INSERT INTO member(memberName, eMail, phoneNum) 
            VALUES (mName, vMail, vNum);
        END **


DELIMITER **

DELIMITER 
    CREATE OR REPLACE PROCEDURE updatelCash (IN vID INT, IN vlCash DECIMAL(6.2))
        BEGIN
            -- Updates a user's credits -- testing
            UPDATE member SET lCasg = vlCash WHERE id= vID;
        END **
/**************************************************************************************************/

/***************************************** Books - procedures ***********************************/
DELIMITER **
    CREATE OR REPLACE PROCEDURE insertB(IN vbookName VARCHAR(255), IN vAuthor VARCHAR(255), IN vPrice DECIMAL(6.2), IN vQty INT, vMax INT, IN vGenre VARCHAR(255), IN vSub VARCHAR(255)) 
        BEGIN
            -- Inserting values to the books table
            INSERT INTO books(bookName, author, price, qty, maxQty, genre, subgenre) VALUES
            (vbookName , vAuthor, vPrice, vQty, vMax, vGenre, vSub);
        END **

DELIMITER **

 DELIMITER **

    CREATE OR REPLACE PROCEDURE bookSearch(IN vBook VARCHAR(255))
        BEGIN
            /*  This procedure search after books based on the book id*/
            SELECT bookName, author, price, qty, genre, subgenre FROM books WHERE id=vBook;
        END **
DELIMITER **

    CREATE OR REPLACE PROCEDURE addDiscount(IN vID INT, IN vDiscount INT)
        BEGIN
            /*  This procedure creates discounts on books*/

            -- Declare variables
            
            DECLARE vPrice TYPE OF books.price;
            DECLARE vDate TYPE OF books.dealDate;
            DECLARE vDiscount TYPE OF books.price;
            DECLARE vPriceUpdate TYPE OF books.price;
            DECLARE vEndDate TYPE OF books.dealEndDate;
            
            -- Give the variables a value 
            SET vDiscount = vDiscount;
            SET vDate = CURDATE() + INTERVAL 1 WEEK;
            SET vEndDate = CURDATE() + INTERVAL 2 WEEK;
            

            -- Selecting values into variables
            SELECT price INTO vPrice FROM books WHERE id = vID;

            SET vPriceUpdate = vDiscount % vPrice;
            SET vDiscount = vPrice/vPriceUpdate;

            
            UPDATE books SET dealDate = vDate WHERE id = vID;
            UPDATE books SET deals = vprice - vPriceUpdate WHERE id = vID;
            UPDATE books SET dealEndDate = vEndDate WHERE id = vID;
            UPDATE books SET discount = vPriceUpdate WHERE id = vID;
        END **


    
/*********************************** library - procedures ******************************************/
DELIMITER **
    CREATE OR REPLACE PROCEDURE insertL (In bID INT, vbookName VARCHAR(255), vauthor VARCHAR(255), vQty INT, vBy VARCHAR(255), mID INT)
        BEGIN
            -- Inserting values into the table
            INSERT INTO lib (bookID, bookName, author, qty, dateBorrowed, returnDate, remindDate, overDueDate, borrowedBy, memberID) VALUES
                (bID, vbookName, vauthor, vQty, CURDATE(), CURDATE() + INTERVAL 4 WEEK, CURDATE() + INTERVAL 3 WEEK, CURDATE() + INTERVAL 5 WEEK, vBy, mID);
        END **

  
DELIMITER **
    CREATE OR REPLACE PROCEDURE userSearch (in vID INT)
        BEGIN
                /*  This procedure search after the given user in the lib table */
        SELECT bookName, author, qty, dateBorrowed, overDueDate AS ReturnDate, borrowedBy, memberID FROM lib WHERE borrowedBy = (SELECT memberName FROM member WHERE id =vID);
        
        END **

DELIMITER **
    CREATE OR REPLACE PROCEDURE returnBook (IN vID INT)
        BEGIN
            /*  This procedure returns a book from the library */
            -- Declareing variables 

            DECLARE vOverDueDate TYPE OF lib.overDueDate;
            DECLARE vCurDate TYPE OF lib.overDueDate;
            DECLARE vLCash TYPE OF members.lCash;
            DECLARE vBookedBy TYPE OF lib.borrowedBy;
            
            -- Selecting values into the variable
            SELECT borrowedBy INTO vBookedBy FROM lib WHERE id=vID;
            SELECT lCash INTO vLCash FROM member WHERE memberName=vBookedBy;
            SELECT overdueDate INTO vOverDueDate FROM lib WHERE id = vID;
            SELECT CURDATE() INTO vCurDate;
         
            CASE
                --  Creating a case to do stuff if the condition is true
                WHEN CURDATE() > DATE(overDueDate) THEN
                    UPDATE member SET lCash = LCash+10 WHERE memberName = vBookedBy;
                    DELETE FROM lib WHERE id = vID;

                WHEN CURDATE() <= OverDueDate THEN
                    DELETE FROM lib WHERE id=vID;
            END CASE;

        END **
/**************************************************************************************************/