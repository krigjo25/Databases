****************************************** Table Of Content ****************************************************************
                            TableOfContent......... 1-22
                            Introduction...........
                                developer..........
                                project............
                            Tables.................
                                member............
                                terminemember.....
                                books..............
                                lib................
                            Procedures.............
                            Triggers...............
                                terminatemember...
                                terminatebook......
                            Events.................
                                delRecords.........
                                discount...........

                            Views..................
                            Summuary...............

************************************************************************************************************************
***************************************** Introduction *****************************************
                    About the Developer 
                        krigjo25, born in 94, Norway, Using most of my time on Python language 
                        otherwise, Gym and living life as a human

                    libraryManageSystem
                        A system where members of a library,
                        where they can borrow a book, bookDiscount, purchase a book.

                    Contact Information :
                        Discord : krigjo25#5588

                        Only One advice,
                            « The importance of creating is
                                just have fun. »
***************************************** Tables.sql *******************************************
                    Members
                        Stores information about the given member,
                        Name, title, contactInfo, classes, cash, 
                        negative values equals how much cash the 
                        member has has, positive values 
                        equals how much the member owns the library. 

                    terminMember/ terminBooks / returnBook
                        Stores the information for a given time, 
                        before the information gets terminated 
                        from the server
    
                    Books
                        list up information about the given books,
                        in the library. 


                    lib
                        Stores the information about the borrowed,
                        book, date of return, if the user does not 
                        return the book in the given time. Automatically
                        send a reminder on email, after a given time, 
                        there will be added a fine to the user of x cash

************************************************************************************************

***************************************** Procedures.sql ***************************************
                    Members
                        insertM(mName, vMail, vNum)
                            Inserts a user to the member table.

                        updateMail(id, vMailclass)
                            by using an id, we update a member's Email.

                        updateNum(id, vNum)
                            by using an id, we update the number of a member.

                        updatelCash(vID, vlCash);
                            By using an id we can update the given value in the credit
                        delM(id)
                            by inserting an id, we can delete a row from the members
                            table and a trigger ('termineMember') will insert it to 
                            terminateMember
    
                    Books
        
                        insertB(vName, vAuthor, vPrice, vQty,vMax, vGenre, vSub) 
                            Inserts a row into the Books table
                        
                        updateBN(vID, vNew))
                            update a book name.
                        
                        delB (vID)
                            Deletes a book from the table, inserts it into the termineBooks.
                        
                        updateG (vID, vGenre)
                            Updates a genre for a book

                        updateSG (vID, vSub)
                            updates a subgenre for a book
                        
                        updateQty(vID, vQty )
                            updates the quanity for a book
                        
                        updateMax(vID, vQty)
                            updates the max quanity for a book
                        bookSearch('vBook')
                            search for a given book   
                    lib 
                        insertL(bID, vbookName, vAuthor, vQty, bBy, mID)
                            -i  nserts a book as a borrowed book

                        returnBook(vID)
                            -   inserts a book into the returnedBooks, and adds x borrowed books
                                into book table
                        userSearch (vID)
                            Search for the user and check if the user has any given books in his acoount
************************************************************************************************

****************************************** Triggers.sql ****************************************
                    termineMember
                        Moves a row from the member table into
                        termineBooks, ready for terminate the member


                    termineBook
                        Moves a row from the books table into 
                        termineBook, ready for termination


                    returnBook
                        Moves a row from the lib table into 
                        returnedBooks, updates the qty in Books, 
                        as the book is returned, and ready to be 
                        deleted from the database.
************************************************************************************************

***************************************** Events.sql *******************************************
    delRecords
        deletes records which has 0 value and older than given value
    
*    discount 
        gives discounts in a given period

************************************************************************************************

****************************************** views.sql ****************************************
                    lib
                        -   Viewing important colums
                    books 
                        -   Viewing important colums
                    
************************************************************************************************


***************************************** testSQL.sql ******************************************
                            Created to test the Database

************************************************************************************************

************************************ Summary of the Project ************************************

                    *   Created some tables to store the information,
                        procedures to manage the database, 
                        triggers to trigger a insert / update on DELETION 
                        and events to SCHEDULE a misc events in the database

************************************************************************************************

***************************************** Credential *******************************************


                The END
                    @krigjo25
************************************************************************************************************************
