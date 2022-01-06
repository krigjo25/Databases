CREATE DATABASE Discord;

CREATE TABLE disneyCharactersEasy ( id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                                    characterName VARCHAR(255) NOT NULL,
                                    role VARCHAR(255) NOT NULL,
                                    animation VARCHAR(255) NOT NULL,
                                    img MEDIUMBLOB );

CREATE TABLE disneyClassicsEasy ( id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                                    title VARCHAR(255) NOT NULL, img MEDIUMBLOB);

CREATE TABLE mainGenres (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                            genre VARCHAR(255) NOT NULL );

CREATE TABLE movies (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        movieName VARCHAR(255) NOT NULL,
                        genre VARCHAR(255) NOT NULL );

CREATE TABLE series (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        tvShowName VARCHAR(255) NOT NULL,
                        genre VARCHAR(255) NOT NULL);

CREATE TABLE welcomeMessages (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                                message VARCHAR(255) NOT NULL);

CREATE TABLE leaveMessages (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                            message VARCHAR(255) NOT NULL);