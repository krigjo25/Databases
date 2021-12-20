-- *****************  members ***********************************
CREATE TABLE members( 
    memberID VARCHAR(255) NOT NULL,  
    passw VARCHAR(255) NOT NULL, 
    email VARCHAR(255) NOT NULL, 
    credit DECIMAL(3,2) NOT NULL DEFAULT 0.0, 
    registered TIMESTAMP NOT NULL DEFAULT NOW());

DELIMITER;
INSERT INTO members(memberID, passw, email) VALUES
    ('oustLEri', ' pJ`T>JX5wCy&"QZ,', 'kalabr0@zipsr.site'),
    ('JvrDeXgJ','r6BbfvHB=4WehWhqQE%kajUqt26$ZQV','pfati.figuig.51@havyrtdashop.com'),
    ('cKwornUCtOpET','5^%!LZM7gtt@W_EwRx5Uu&yVT%*Uk2kySGnmnSNHsmNzkbB*m-','9lo_st19@vivech.site'),
    ('EMperSerse','48%QmegWK@Et7%DnzZg@5ZXdeLVtBDQ62DNu9X!FwVyR+d%e+4?8*@2D^#a','wsecreta.ta.1b@notvn.com'),
    ('WWBBWytnha','Zh38v4*q55gJR3TEaHb*QNRPX=G=t%S95%','behab.almu@manye.site'),
    ('bGn7WP%zbf','P?jTJ8bn6cL=A=wbuZFp37R6TE!CZN4YZ-X_224bhFu7E_NHS9d_CpruBTR*G3BCn9%EF-nw%qpj','kmazzkonian@rtfsz.site'),
    ('RIdergEnto','4@#m?DH-RLPKkv6zC%j=u5jqkwzp','9simsm.asoh@epublk.site'),
    ('crhdXFbRZV','7^f95p=nDSN2^Xz##adz','delijahtg@docsl.site'),
    ('X%DKI@4xK^','f?Xn?ykbneqend*zwQkZ*X2r=jY2p','ynoahx@bookea.site'),
    ('t!qRAks*nC!cV&u4XZ&L','z&qX?=zmDy7L!Ae','3majdiem@bookea.site');

DELIMITER ;
-- *****************  PENDING TERMINATIONS ***********************************
CREATE TABLE pendingTerminations (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    memberID VARCHAR(255) NOT NULL, 
    email VARCHAR(255) NOT NULL, 
    credit DECIMAL(3,2) NOT NULL,  
    requsted TIMESTAMP NOT NULL DEFAULT NOW());

DELIMITER ;
-- *****************   RoomType    ***********************************
CREATE TABLE roomType (
    id CHAR(2) NOT NULL, 
    roomType VARCHAR(255) NOT NULL, 
    priceList DECIMAL(5,2) NOT NULL );

    INSERT INTO roomType VALUES 
    ('AR', 'Archery Range', 120),
    ('SR', 'Shooting Range', 210),
    ('B1', 'Badmington Court', 3),
    ('B2', 'Badmington Court', 3),
    ('GC', 'Gym Court', 10),
    ('M1', 'Multi Activity Room', 21),
    ('M2', 'Multi Activity Room', 12);
DELIMITER ;
-- *****************  onlinebookings ***********************************
CREATE TABLE  onlineBookings (
    id INT NOT NULL AUTO_INCREMENT,
    roomID CHAR(2) NOT NULL,
    bookedBy VARCHAR(255) NOT NULL,
    bookingStatus VARCHAR(255) NOT NULL DEFAULT 'NOTPAID',
    dateBooked DATE NOT NULL,
    timeBooked TIME NOT NULL,
    booked TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY(id, roomID, bookedBy),

    -- Constraints For Booking Database
    -- UNIQUE avoid double booking for the same room in the same time
    CONSTRAINT Uniq UNIQUE(roomID, dateBooked, timeBooked),
    
    -- FOREIGN KEY : OBS : ONLY PRIMARY KEYS
    CONSTRAINT roomFK FOREIGN KEY(roomID) REFERENCES roomType(id) ON DELETE CASCADE ON UPDATE CASCADE);
    INSERT INTO Bookings (roomID, BookedBy, DateBooked, TimeBooked) VALUES 
    ('AR', 'oustLeri',  '22.09-21', '12:30:00'),
    ('SR', 'oustLeri',  '07.09-21', '12:30:00'),
    ('B1', 'JvrDeXgJ', '21.09-09', '12:00:00'),
    ('GC', 'WWBBWytnha', '21.22.10', '12:30:00'),
    ('M1', 'EMperSerse', '22.09-10', '12:30');