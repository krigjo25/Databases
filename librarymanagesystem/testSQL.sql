/*****************************************************************************************

    *   DATABASE
            libManageSystem

    *   About
            Documentations

    *   Author
            Krigjo25
            
*****************************************************************************************/

/* *************************** Database Creation / Drop ***********************************

    CREATE DATABASE IF NOT EXISTS libManageSystem;
    
    DROP DATABASE  libManageSystem;

*****************************************************************************************/

/* *************************** Database Creation / Drop ***********************************

        del(tableName, vID)                                                                     --      Delete a value from a custom table
        intValue(tableName, columnName ,vVlaue, vID)                                            --      update a given column in a table with an Integer
        charValue(tableName, columnName, vVlaue, vID)                                           --      update a given column in a table with characters
        
******************************************************************************************/

/* *************************** Selecting Tables ***********************************

                SELECT * FROM lib;
                SELECT * FROM books;
                SELECT * FROM member;
                SELECT * FROM terminmember;
                SELECT * FROM terminatedBooks;
                
*****************************************************************************************/

/* *************************** Dropping Tables ***********************************

                DROP TABLE IF EXISTS lib;
                DROP TABLE IF EXISTS books;
                DROP TABLE IF EXISTS member;
                
*****************************************************************************************/

/**************************** Procedures member's table ***********************************
                
                CALL updatelCash(vID, lcash)                                                    --      Update the given member's credit
                CALL insertM('Jhon Doe', 'jhoDoe@gmail.com', 12345678);                         --      Add a new member to the list

*****************************************************************************************/

/* *************************** Procedures books table ***********************************
                
                CALL bookSearch(1);                                                             --      Searching for a book
                CALL insertB('bookName', 'author', 1000.00, 50, 48, 'Demo Genre', 'test');      --      Inserting a book into books
*****************************************************************************************/

/***************************** Procedures lib table **************************************

                CALL returnBook(vID)                                                            --      Return a book for the given member
                CALL userSearch(vID)                                                            --      Search after a user to see the given rented books
                CALL insertB(14,1,12) 
                                   --      Rent out a book for the given member
                
*****************************************************************************************/

CALL insertB(14, 'DemoTitle', 'Jhon Doe', 1, 'Jhon Doe', 12) 