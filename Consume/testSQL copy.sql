/*
    DATABASE
        libManageSystem

    About
        Test SQL for libraryManageSystem

    Author
        Krigjo25
*/

/* ***************************The Idea ***********************************
*The idea is to create a library system for  collage students.

*   Tables
        teamleader, teacher, stufdents, books

*   Views
        An overview of whom is leader for whom,
        An overview of whom is teacher for which classes, and students 
        An overview of whom is borrowing which book.
*/
-- Database Creation / dropping
    CREATE DATABASE libManageSystem;
    DROP DATABASE libManageSystem;

-- Selecting Tables
    SELECT * FROM teamLeader;
    SELECT * FROM teachers;
    SELECT * FROM students;
    SELECT * FROM books;
    SELECT * FROM studentLib;