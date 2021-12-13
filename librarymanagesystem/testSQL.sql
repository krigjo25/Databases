/*****************************************************************************************
    *   Project Created :
            dd.mm-21

    *   Project Finished :
                03.12-21
    *   Files Contains in the project:
            views.sql,
            events.sql,
            tables.sql,
            testSQL.sql,
            triggers.sql,
            procedures.sql
        
            read-me.md

            sendMail.py
    

    *   DATABASE
            libManageSystem

    *   About
            Documentations

    *   Author
            Krigjo25
*****************************************************************************************/

/* ***************************The Idea ***********************************
    *   The idea is to create a library system 

    *   Tables
            Member, books, lib

    *   Views
            An overview of whom is borrowing which book.
    
    *   Events.sql
        Delete members or books if they're terminated from the library system
    *   procedures
                List of given procedures for the project

******************************************************************************************/

/* *************************** Database Creation / Drop ***********************************

    CREATE DATABASE IF NOT EXISTS libManageSystem;
    
    DROP DATABASE  libManageSystem;

*****************************************************************************************/

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
                
                CALL delM(1);                                                                   --      Delete a member from the members table
                CALL updateNum(13, 87654321)                                                    --      Update the number of the given member
                CALL updateMail(1, 'jhodoe00@collage.com')                                      --      Update the E-mail of the given member
                CALL updatelCash(vID, lcash)                                                    --      Update the given member's credit
                CALL insertM('Jhon Doe', 'jhoDoe@gmail.com', 12345678);                         --      Add a new member to the list

*****************************************************************************************/

/* *************************** Procedures books table ***********************************
                
                
                CALL delB(14);                                                                  --      Deleting a book
                CALL bookSearch(1);                                                             --      Searching for a book
                CALL updateQty(14, 49)                                                          --      Updating quanity for a given book
                CALL updateG (14, 'demo')                                                       --      Changing the genre
                CALL updateBN (14,'NewName')                                                    --      Chaning the book name
                CALL updateSG (14, 'demo sub')                                                  --      Chaning the subGenre
                CALL insertB('bookName', 'author', 1000.00, 50, 48, 'Demo Genre', 'test');      --      Inserting a book into books
*****************************************************************************************/

/***************************** Procedures lib table **************************************

                CALL returnBook(vID)                                                            --      Return a book for the given member
                CALL userSearch(vID)                                                            --      Search after a user to see the given rented books
                CALL insertB(14, 'DemoTitle', 'Jhon Doe', 1, 'Jhon Doe', 12)                    --      Rent out a book for the given member
                
*****************************************************************************************/