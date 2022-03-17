/************************************* employees ************************/

-- CALL newEmployee (Name, date, street, zip, email, phone, mobile, eStatus, occupation, department)
CALL newEmployee ('Jon George', '1994-01-01', '118 Cerullo Road', 20001, 'billie.deck@hotmail.com', '406925436', 50,'General Healt practitioner', 'ICU');
CALL newEmployee ('Eric E. West', '1975-07-23', '1164 Prospect Street', 08014, 'carli.barte@hotmail.com', '8567362941', 75,'General Health practitioner', 'ICU');
CALL newEmployee ('Michele R. Dejesus', '1969-06-12', '1698 Wescam Street', 89501, 'rasheed_wiega@gmail.com', '7758981143', 100,'General Health practitioner', 'ICU');
CALL newEmployee ('Brian A Benites', '1984-01-25', '2501 Woodland Terrace', 95630, 'allan2000@gmail.com','9169349710', 100,'Plastic surgeon', '');
CALL newEmployee ('Brian M Howell', '1976-06-04', '2645 Foley Street', 33442, 'jake.lind1973@yahoo.com', '9546991607', 100,'thoracic surgeon', 'ICU');
CALL newEmployee ('Loida G Newton', '1972-08-18', '552 Horizon Circle', 98119, 'barton2000@hotmail.com', '2536855251', 100,'Surgeon', 'ICU');
CALL newEmployee ('Julia A. Hanson', '1994-01-01', '118 Cerullo Road', 20001, 'frida2015@gmail.com', '9122491720', 100,'Surgeon', 'ICU');
CALL newEmployee ('Ryan R. Orr', '1982-02-22', '662 Smith Street', 01545, 'alfredo2011@hotmail.com', '5088410971', 100,'General practitioner', 'ICU');
CALL newEmployee ('Yollanda K. Lambardi', '1995-07-28', '2390 Russel Street', 01468, 'hoyt1978@gmail.com', '9789390913', 100,'General practitioner', 'ICU');
CALL newEmployee ('Christopher S. Howard', '1974-03-30', '118 Cerullo Road', 84119, 'lilana_bart@yahoo.com', '4355146733', 100,'General practitioner', 'ICU');
CALL newEmployee ('Roberto E. Marshall', '1953-05-05', '1068 Center Street', 93721, 'mariana_gay@gmail.com', '5592073271', 100,'General practitioner', 'ICU');
CALL newEmployee ('Dennis M. Perez', '2000-12-25', '1550 Patterson Street', 77002, 'javonte2012@hotmail.com', '7132762437', 100,'General practitioner', 'ICU');
CALL newEmployee ('Cathrine T.Beyer', '1999-02-25', '657 Tibbs Avenue', 20001, '657 Tibbs Avenue', '406-689-5023', 75,'General practitioner', 'ICU');
CALL newEmployee ('Cathrine J. Levis', '1994-01-01', '2890 Chandler Hollow Road', 15106, 'kelsie.greenho@hotmail.com', '412-429-1997', 50,'General practitioner', 'ICU');
CALL newEmployee ('Carolyn R Elliott', '1988-02-03', '1673 Lang Avenue', 84734, 'Kaley.bartolet@yahoo.com', '435-788-1852', 75,'General practitioner', 'ICU');
CALL newEmployee ('Donald M. Woodfin', '1994-01-01', '118 Cerullo Road', 20001, 'neoma_kemme10@yahoo.com', '646-744-8588', 25,'General practitioner', 'ICU');
CALL newEmployee ('Melissa S Burtoon', '1991-02-14', '48843 Southside Lane', 90017, 'lissa91@gmail.com', '323-657-6683', 80,'General practitioner', 'ICU');
CALL newEmployee ('Sabrina R. McMahon', '1997-05-12', '4210 Norma Avenue', 75925, 'sabrmc@gmail.com', '830-890-3860', 5,'General practitioner', 'ICU');
CALL newEmployee ('Lisa P. Fuller', '1981-06-25', '3411 Glory Road', 37110, 'lispfu@yahoo.com', '931-934-0140', 25,'General practitioner', 'ICU');
CALL newEmployee ('Gregory M. Flood', '1980-12-24', '1921 Reel Avenue', 88061, 'alfredo2011@hotmail.com', '505-388-7136', 100,'General practitioner', 'ICU');

/************************************************************************/

/************************************* relations ************************/

--  CALL newRelation (veID, vpID, @vError);
CALL newRelation (1000, 1000, @vError);

--  CALL modifyRelation (modifyRelation( 'vColumn', veID, vpID, 'vValue', @conmsg)
/************************************************************************/
/************************************* Turnus ************************/

--  CALL newTurnus (veID, vDate, vTimeInn, vhrs, vMin, vai) 0 - 2
CALL newTurnus (1000, '2022.05.04', '08:00:00', 8, 0, 0);
/************************************************************************/
