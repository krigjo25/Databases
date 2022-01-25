# Library Manage System

## Table Of Content

[Introduction](#Introduction)......................
    
    developer.....................
    project...........................
        The design....................
        Case..........................

[SQLData](#SQLData)..........................
    
    Tables........................
    patients..................
    Employee..................
    roomBookings..............
    lom.......................
    loa.......................
    lom.......................

    Procedures....................

    Triggers......................
        terminatemember...........
        terminatebook.............
            
    Events........................
        delRecords................
        discount..................
    
    Views.........................


    
[Python](#Python).....................

        dictonaries.py................
        patientJournal.py.............
        uploadbiodata.py..............
        sendSMS.py....................    
        runPDF.py.....................


[PDF](#PDF).......................

    patientjournal.pdf............
    invoice.pdf...................

[Testing](#Testing)...................

        SQL Data......................
        test.sql......................
    
[Summuary](#Summuary).................

[Responsary](#Responsary).............

[Credentials](#Credentials)...........

    licence...........................
    Contact Information...............

## Introduction

**About the Developer**

kristoffer Gjøsund, born in 94, Norway, part the time goes to python, SQL
otherwise, Gym and living life as a human

**Project info**

    Creating a back-end system, to send reminders, invoice, reciepte, of a rentail books book, 

    Started : 10.10-21
    Last Update: 06.01-22

## The Design

    The idea is to create a Library ystem, which sends
    out a notification, recipte and invoices

## SQL DATA

**Tables**

    Member
    
    books
    
    lib

**Procedures**

***Universial Procedures***

**Triggers**

**Events**

Delete events
    deletes row, which is in the terminated row,
    sends rows to terminated after x days
    sends an notification through email



**Tables**

    Members
        Stores information about the given member,
        Name, title, contactInfo, classes, cash, 
        negative values equals how much credit the
        member has, positive values 
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

**Procedures**

    Universal procedures
        Universal procedures is created, its not necsessary
        to re-create multiple procedures

        delRow( tableName, id)
            Deletes a row from a choosen table

        updateChar( tableName, columnName, value, vID)
            Updates a column in choosen table, value must be
             characters
            
        intUpdate (tableName, columnName, value, vID)
            Updates a column in a choosen table, the value must
            be integers.
        
    Members
        
        insertM(mName, vMail, vNum)
            Inserts a user to the member table.

        updatelCash(vID, vlCash);
            By using an id we can update the given value in the
            credit

    Books

        insertB(vName, vAuthor, vPrice, vQty,vMax, vGenre, vSub) 
            Inserts a row into the Books table

        bookSearch('vBook')
            search for a given book   

    lib 
        insertL(bID, vbookName, vAuthor, vQty, bBy, mID)
            inserts a book as a borrowed book

        returnBook(vID)
            inserts a book into the returnedBooks, and Triggers
            the books back into the book table

        userSearch (vID)
            Search for the user and check if the
            user has any given books in his acoount

**Triggers**

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

**Events**

    delRecords
        deletes records which has 0 value and older than given value
    
    discount 
        gives discounts in a given period

    SendMail
        Trigger an event to send a reciepte when a user has returned
        or borrowed a book. 
        Trigger an event to send a reminder when the returndate is
        close, on or 7days behind

**Views**

    lib
        Viewing important colums

    books 
        Viewing important colums

## Responsories

Plugins for mariadb

Libraries 

Python-dotenv, - [Saurabh Kumar](https://github.com/skwebdeveloper)
mariadb, - [MariaDB](https://github.com/MariaDB)
yagmail, - [Pascal Van Kooten]()
- []()
- []()

## Credentials

Reposories and plugins used for this projects,
    yagmail,
    mariadb

**Contact Information**

Discord : krigjo25#5588

Only One advice,
« The importance of creating is just have fun. »

**Licence**
Not Licenced