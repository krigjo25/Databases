-- *****************  stored procedures - Alcohol ***********************************
DELIMITER **
    CREATE OR REPLACE PROCEDURE addItemA (IN vName VARCHAR(255), vType VARCHAR(255), vVol DECIMAL, vQty INT)
    -- This procedure inserts a new article to the table of Alcohol
        BEGIN
            INSERT INTO alcohol (article, aType, vol, qty)
                VALUES  (vName, vType, vVol, vQty);
        END **

    CREATE OR REPLACE PROCEDURE updateA( IN aID INT, IN aQty INT) 
        -- This procedure updates the quanity of the articles

        BEGIN

            UPDATE alcohol SET qty = aQty WHERE id = aID;

        END**

-- *****************  stored procedures - Freezer ***********************************
DELIMITER **
    CREATE OR REPLACE PROCEDURE addItemF(IN art VARCHAR(255), IN aType VARCHAR(255), IN aQty INT, IN aDate DATE, aExpire DATE)
        -- This procedure inserts values to the table
        BEGIN

        INSERT INTO Freezer (article, type, qty, dateAdded, dateExpires) 
        VALUES(aArticle, aType, aQty, aDate, curdate(), aExpire );

        END**
DELIMITER ;
-- x
    CREATE OR REPLACE PROCEDURE updateF (IN aID INT, IN aType VARCHAR(255), IN aQty INT)
        -- This procedure updates the quanity of Qty and add a expireDate
        BEGIN
            UPDATE freezer SET dateAdded = curdate();
            UPDATE freezer SET qty = aQty WHERE id = aID;
            UPDATE freezer SET Type = aType WHERE id = aID;
            -- Using CASE to set the expiredate
            CASE
             -- Meat
                WHEN aType = 'MINCEDMEAT' OR aType = 'SOUSAGE' THEN
                    UPDATE freezer SET expireDate = curdate() + INTERVAL 2 MONTH;
             
                WHEN aType = 'CHICKEN' OR aType = 'PORK' THEN
                    UPDATE freezer SET expireDate = curdate() + INTERVAL 4 MONTH;
            
                WHEN aType = 'BEEF' OR aType = 'LAMB' OR aType = 'TURKEY' OR aType = 'WILDMEAT' THEN
                    UPDATE freezer SET expireDate = curdate() + INTERVAL 10 MONTH;

                    -- Fish
                WHEN aType = 'FISH' OR aType = 'MILK' THEN
                    UPDATE freezer SET expireDate = curdate() + INTERVAL 3 MONTH;

                    -- Bread
                WHEN aType = 'BREAD' OR aType = 'PORK' THEN
                    UPDATE freezer SET expireDate = curdate() + INTERVAL 6 MONTH;

                    -- Berry and Vegetables
                WHEN aType = 'BERRY' OR aType = 'VEGETABLES' THEN
                    UPDATE freezer SET expireDate = curdate() + INTERVAL 12 MONTH;
            END CASE;
        END**

-- *****************  Stored procedures work ***********************************                        )
delimiter ;
   CREATE OR REPLACE PROCEDURE addItemW (IN warticle VARCHAR(255), IN qtyW INT)
    -- This procedure inserts a new article to the table of Alcohol
    
        BEGIN
            INSERT INTO work (article, qty)
            VALUES (articleW, qtyW);
        END **
    
    CREATE OR REPLACE PROCEDURE updateW( IN aID INT, IN aQty INT) 
        -- This procedure updates the quanity of the articles

        BEGIN

            UPDATE polyForm SET qty = aQty WHERE id = aID;

        END**