/*
    DATABASE
        consume

    About
        Test SQL for consume

    Author
        Krigjo25
*/
-- *****************  CREATE DATABASE ***********************************
    CREATE DATABASE consume;
-- *****************  Tables ***********************************
    SELECT * FROM alcohol;
    SELECT * FROM freezer;
    SELECT * FROM fridge;
    SELECT * FROM work;


-- *****************  stored procedures - Alcohol ***********************************
    -- // artName, pType, vol, qty
    CALL addItemA();

      -- // id, qty
    CALL updateA();    

-- *****************  stored procedures - Freezer ***********************************
    -- // artName, aType, aQty, aDate, aExpire
    CALL addItemF();
    -- // id, Type, qty
    CALL updateF();

-- *****************  Stored procedures Polyform ***********************************                        )
   -- // artName qty
   CALL addItemW();
   
   -- // id, qty
   CALL updateW(); 