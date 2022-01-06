# Library Manage System

## Table Of Content

    Introduction...........
        developer..........

    project............
        The design.............

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

## Introduction

***About the Developer***

krigjo25, born in 94, Norway, using most of my time on Python language
otherwise, Gym and living life as a human

***libraryManageSystem***

The idea of libraryManageSystem is to create a system
which lets the user borrow / purchase a book

***Contact Information***

Discord : krigjo25#5588

Only One advice,
« The importance of creating is just have fun. »

## The Design

The idea is to create a library system, which sends
out a notification, recipte and billing

### Tables

Member, books, lib

### Views

An overview of whom is borrowing which book
An overview of current stock of books

### Events

Delete, rows when they're set in the
terminated table to maintain the information
Sending mail for notifications, billing and recipe

### procedures

Should include the procedures which is necsessary
for the system to work

### Project info

Started : 10.10-21
Last Update: 06.01-22

### Files Contains in the project

read-me.md

sendMail.py

views.sql,
events.sql,
tables.sql,
testSQL.sql,
triggers.sql,
procedures.sql

The SQL is designed for mariadb

## tables.sql

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

## Procedures.sql

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

## Triggers,sql

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

## Events.sql

    delRecords
        deletes records which has 0 value and older than given value
    
    discount 
        gives discounts in a given period

    SendMail
        Trigger an event to send a reciepte when a user has returned
        or borrowed a book. 
        Trigger an event to send a reminder when the returndate is
        close, on or 7days behind

## Views.sql

    lib
        Viewing important colums

    books 
        Viewing important colums

## test.sql

Created to test the Database

## Credentials

Reposories and plugins used for this database,
    yagmail,
    mariadb

written and edited by,
krigjo25.

************************************************************************************************************************
