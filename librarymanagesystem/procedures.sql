/*************************************** Member - procedures ************************************/
DELIMITER ??

    CREATE OR REPLACE PROCEDURE insertM(IN mName VARCHAR(255), IN vMail VARCHAR(255), IN vNum INT) 
        BEGIN
            -- Inserting values to the teacher table
            INSERT INTO member(memberName, eMail, phoneNum) 
            VALUES (mName, vMail, vNum);
        END ??


DELIMITER ??
        CREATE OR REPLACE PROCEDURE updateMail(IN vID INT, IN vMail VARCHAR(255))
            BEGIN
                -- This procedure updates the contactInfo of the given student
                UPDATE member SET eMail = vMail WHERE id = vID;
            END ??

DELIMITER ??
    CREATE OR REPLACE PROCEDURE updateNum (vID INT, IN vPhone INT)
        BEGIN
            -- This procedure updates the phone number for the member
            UPDATE member SET phoneNum = vPhone WHERE id = vID;
            END ??
DELIMITER 
    CREATE OR REPLACE PROCEDURE updatelCash (IN vID INT, IN vlCash DECIMAL(6.2))
        BEGIN
            -- Updates a user's credits -- testing
            UPDATE member SET lCasg = vlCash WHERE id= vID;
        END ??
DELIMITER ??
    CREATE OR REPLACE PROCEDURE delM (IN vID INT) 
        BEGIN
            -- Deleting a member from the table
            DELETE FROM member WHERE id = vID;
        END ??
/**************************************************************************************************/

/***************************************** Books - procedures ***********************************/
DELIMITER ??
    CREATE OR REPLACE PROCEDURE insertB(IN vbookName VARCHAR(255), IN vAuthor VARCHAR(255), IN vPrice DECIMAL(6.2), IN vQty INT, vMax INT, IN vGenre VARCHAR(255), IN vSub VARCHAR(255)) 
        BEGIN
            -- Inserting values to the books table
            INSERT INTO books(bookName, author, price, qty, maxQty, genre, subgenre) VALUES
            (vbookName , vAuthor, vPrice, vQty, vMax, vGenre, vSub);
        END ??


DELIMITER ??
    CREATE OR REPLACE PROCEDURE updateBN(IN vID INT, IN vNew VARCHAR(255))
        BEGIN
            -- This procedure updates the name of the given row in Books
            UPDATE books SET bookName = vNew WHERE id = vID;
        END ??

DELIMITER ??
    CREATE OR REPLACE PROCEDURE delB (IN vID INT) 
        BEGIN
        -- Deleting a book from the table
        DELETE FROM books WHERE id = vID;

        END ??
DELIMITER ??
    CREATE OR REPLACE PROCEDURE updateG (in vID INT, IN vGenre VARCHAR(255))
        BEGIN
        -- This procedure updates the value of class
        UPDATE books SET genre = vGenre WHERE id=vID;
        END ??
DELIMITER ??

    CREATE OR REPLACE PROCEDURE updateSG (in vID INT, IN vSub VARCHAR(255))
        BEGIN
        -- This procedure updates the value of the subGenre
        UPDATE books SET subgenre = vSub WHERE id=vID;
        END ??


DELIMITER ??
    CREATE OR REPLACE PROCEDURE updateQty(IN vID INT , IN vQty INT)
        BEGIN
        -- This procedure updates Quanities of books
        UPDATE books SET qty = vQty WHERE id = vID;

        END??   
DELIMITER ??
    CREATE OR REPLACE PROCEDURE updateMax(IN vID INT , IN vQty INT)
        BEGIN
        -- This procedure updates Quanities of books
        UPDATE books SET maxQty = vQty WHERE id = vID;

        END??   
DELIMITER ??

 DELIMITER ??

    CREATE OR REPLACE PROCEDURE bookSearch(IN vBook VARCHAR(255))
        BEGIN
            SELECT bookName, author, price, qty, genre, subgenre FROM books WHERE id=vBook;
        END ??
DELIMITER ??

    CREATE OR REPLACE PROCEDURE addDiscount(IN vID INT, IN vDiscount INT)
        BEGIN

            -- Declareing variables
            
            DECLARE vPrice TYPE OF books.price;
            DECLARE vDate TYPE OF books.dealDate;
            DECLARE vDiscount TYPE OF books.price;
            DECLARE vPriceUpdate TYPE OF books.price;
            DECLARE vEndDate TYPE OF books.dealEndDate;
            
            -- Set the value of the variables 
            SET vDiscount = vDiscount;
            SET vDate = CURDATE() + INTERVAL 1 WEEK;
            SET vEndDate = CURDATE() + INTERVAL 2 WEEK;
            

            -- Selecting the price into the vPrice variable.
            SELECT price INTO vPrice FROM books WHERE id = vID;

            SET vPriceUpdate = vDiscount % vPrice;
            SET vDiscount = vPrice/vPriceUpdate;

            
            UPDATE books SET dealDate = vDate WHERE id = vID;
            UPDATE books SET deals = vprice - vPriceUpdate WHERE id = vID;
            UPDATE books SET dealEndDate = vEndDate WHERE id = vID;
            UPDATE books SET discount = vPriceUpdate WHERE id = vID;
        END ??


    
/*********************************** library - procedures ******************************************/
DELIMITER ??
    CREATE OR REPLACE PROCEDURE insertL (In bID INT, vbookName VARCHAR(255), vauthor VARCHAR(255), vQty INT, vBy VARCHAR(255), mID INT)
        BEGIN
            -- Inserting values into the table
            INSERT INTO lib (bookID, bookName, author, qty, dateBorrowed, returnDate, remindDate, overDueDate, borrowedBy, memberID) VALUES
                (bID, vbookName, vauthor, vQty, CURDATE(), CURDATE() + INTERVAL 4 WEEK, CURDATE() + INTERVAL 3 WEEK, CURDATE() + INTERVAL 5 WEEK, vBy, mID);
        END ??

  
DELIMITER ??
    CREATE OR REPLACE PROCEDURE userSearch (in vID INT)
        BEGIN

        SELECT bookName, author, qty, dateBorrowed, overDueDate AS ReturnDate, borrowedBy, memberID FROM lib WHERE borrowedBy = (SELECT memberName FROM member WHERE id =vID);
        
        END ??
DELIMITER ??
    CREATE OR REPLACE PROCEDURE returnBook (IN vID INT)
        BEGIN
            -- Declareing variables 

            DECLARE vOverDueDate TYPE OF lib.overDueDate;
            DECLARE vCurDate TYPE OF lib.overDueDate;
            DECLARE vLCash TYPE OF members.lCash;
            DECLARE vBookedBy TYPE OF lib.borrowedBy;
            
            -- SELECTing values into the variable
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


        END ??

/**************************************************************************************************/