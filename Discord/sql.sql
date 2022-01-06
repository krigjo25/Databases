CREATE DATABASE Discord;
INSERT INTO disneyCharactersEasy( characterName, role, animation) VALUES
('Aladdin', 'Hero', 'Aladdin'),
('Simba', 'Hero', ' The Lion King'),
('Robin Hood', ' Hero', 'Robin Hood'),
('Pinhoccio', 'Hero', 'Pinocchio'),
('Tarzan', ' Hero', 'Tarzan'),
('Quasimodo', 'Hero', 'The Hunchback Of Notredame'),
('Hercules', ' Hero', 'Hercules'),
('The Beast', 'Hero', ' The Beauti And the Beast'),
('Jasmine', 'Princess','Aladdin'),
('Mulan', 'Princess', 'Mulan'),
('Ariel', 'Princess', ' The Little Marmaid'),
('Aurora', 'Princess', 'Sleeping Beauti'),
('Belle', 'Princess', 'Beauti And The Beast'),
('Cinderella', 'Princess', ' Cinderella'),
('Merida', 'Princess', 'Brave'),
('Moana', 'Princess', ' Moana'),
('Snow White', 'Princess', 'Snow White And the Seven Dwarfs'),
('Tiana', 'Princess', 'The Princess And The Frog'),
('Rapunzel', 'Princess', 'Rapunzel'),
('Govenor John Ratcliff', 'Villain', 'Pocahontas'),
('Maleficent', 'Villian', 'Sleeping Beauti'),
('The Wicked Queen', 'Villian', 'Snow White and the Seven Dwarfs'),
('Lady Tremaine', 'Villian', 'Cinderella'),
('Jafar', 'Villian', 'Aladdin'),
('Scar', 'Villian', 'The Lion King'),
('Ursurella', 'Villian', 'The little Marmaid'),
('Dr.Farciller', 'Villian', 'The Princess And The Frog'),
('Judge Claude Frollo', 'Villian', 'The Hunchback Of Notredame'),
('Mother Gothel', ' Villian', 'Rapunzel'),
('Shan Yu', 'Villian', 'Mulan'),
("Mor'du", 'Villian', ' Brave'),
('Hades', 'Villian', 'Hercules'),
('Gideon', 'Villian', 'Pinocchio'),
('Clayton', 'Villian', 'Tarzan'),
('Gaston', ' Villian', 'The Beauti And The Beast');

DELIMITER ;
INSERT INTO disneyClassicsEasy (title) VALUES
('Aladdin'),
('Brave'),
('Cinderella'),
('Hercules'),
('Moana'),
('Mulan'),
('Pinocchio'),
('Pocahontas'),
('Rapunzel'),
('Robin Hood'),
('Sleeping Beauti'),
('Snow White And The Seven Dwarfs'),
('Tarzan'),
('The Beauti And The Beast'),
('The Hunchback Of Notredame'),
('The Lion King'),
('The Little Marmaid'),
('The Princsess And The Frog');

INSERT INTO mainGenres (genre) VALUES
('Action'),
('Animation'),
('Adventure'),
('Comedy'),
('Drama'),
('Fantasy'),
('Historical'),
('Mystery'),
('Romance'),
('Science Fiction'),
('Thriller'),
('Western'),
('Other');

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