/*

        Author
                Krigjo25

*/
/******************************* OverView ******************************/

/******************************** Aqua - Series ******************************/
CREATE OR REPLACE VIEW aquaView AS
        SELECT
                wagonOne.formID AS 'Form ID',
                wagonOne.formName AS 'Form Name',
                wagonOne.arm AS 'Arm Rotation',
                wagonOne.plate AS 'Plate Rotation',
                wagonOne.mincool AS 'Cooling Time',
                wagonOne.minOven AS 'Oven Time',
                productionInfo.kg AS 'kg Gram',
                productionInfo.yellow AS 'Yellow',
                productionInfo.grey AS 'Grey',
                wagonOne.series AS 'Series'

        FROM wagonOne
        JOIN productionInfo ON wagonOne.formID = productionInfo.formID
        WHERE series LIKE '%Aqua%'

        UNION ALL

        SELECT
                wagonTwo.formID,
                wagonTwo.formName,
                wagonTwo.arm,
                wagonTwo.plate,
                wagonTwo.mincool,
                wagonTwo.minOven,
                productionInfo.kg,
                productionInfo.yellow,
                productionInfo.grey,
                wagonTwo.series
        
        FROM wagonTwo
        JOIN productionInfo ON wagonTwo.formID = productionInfo.formID
        WHERE series like '%Aqua%'

        UNION ALL
        
        SELECT 
                wagonThree.formID,
                wagonThree.formName,
                wagonThree.arm,
                wagonThree.plate,
                wagonThree.mincool,
                wagonThree.minOven,
                productionInfo.kg,
                productionInfo.yellow,
                productionInfo.grey,
                wagonThree.series

        FROM wagonThree
        JOIN productionInfo ON wagonThree.formID = productionInfo.formID
        WHERE series LIKE '%Aqua%';
/****************************************************************************/

/******************************* Apb-Series ******************************/
CREATE OR REPLACE VIEW apbView AS
        SELECT
                wagonOne.formID AS 'Form ID',
                wagonOne.formName AS 'Form Name',
                wagonOne.arm AS 'Arm Rotation',
                wagonOne.plate AS 'Plate Rotation',
                wagonOne.mincool AS ' Cooling Time',
                wagonOne.minOven AS 'Oven Time',
                productionInfo.kg AS 'kg Gram',
                productionInfo.yellow AS 'Yellow',
                productionInfo.grey AS 'Grey',
                productionInfo.black AS 'Black',
                wagonOne.series AS 'Series'

        FROM wagonOne
        JOIN productionInfo ON wagonOne.formID = productionInfo.formID
        WHERE series LIKE '%APB%'

        UNION ALL
        
        SELECT 
                wagonTwo.formID,
                wagonTwo.formName,
                wagonTwo.arm,
                wagonTwo.plate,
                wagonTwo.mincool,
                wagonTwo.minOven,
                productionInfo.kg,
                productionInfo.yellow,
                productionInfo.grey,
                productionInfo.black,
                wagonTwo.series
        
        FROM wagonTwo
        JOIN productionInfo ON wagonTwo.formID = productionInfo.formID
        WHERE series LIKE '%APB%'

        UNION ALL
        
        SELECT
                wagonThree.formID,
                wagonThree.formName,
                wagonThree.arm,
                wagonThree.plate,
                wagonThree.mincool,
                wagonThree.minOven,
                productionInfo.kg,
                productionInfo.yellow,
                productionInfo.grey,
                productionInfo.black,
                wagonThree.series
        
        FROM wagonThree
        JOIN productionInfo ON wagonThree.formID = productionInfo.formID
        WHERE series LIKE '%APB%';
/****************************************************************************/


/******************************* Kopas-Series ******************************/
    CREATE OR REPLACE VIEW kopasView AS
        SELECT
                wagonOne.formID  AS 'Form ID',
                wagonOne.formName AS 'Form Name',
                wagonOne.arm AS 'Arm Rotation',
                wagonOne.plate AS 'Plate Rotation',
                wagonOne.mincool AS 'Cooling Time',
                wagonOne.minOven AS 'Oven Time',
                productionInfo.kg AS 'kg Gram',
                productionInfo.grey as 'Grey',
                wagonOne.series AS 'Series'

        FROM wagonOne
        JOIN productionInfo ON wagonOne.formID = productionInfo.formID
        WHERE series LIKE '%Kopas%'
        
        UNION ALL
        SELECT
                wagonTwo.formID,
                wagonTwo.formName,
                wagonTwo.arm,
                wagonTwo.plate,
                wagonTwo.mincool,
                wagonTwo.minOven,
                productionInfo.kg,
                productionInfo.grey,
                wagonTwo.series

        FROM wagonTwo
        JOIN productionInfo ON wagonTwo.formID = productionInfo.formID
        WHERE series LIKE '%Kopas%'
        
        UNION ALL

        SELECT 
                wagonThree.formID,
                wagonThree.formName,
                wagonThree.arm,
                wagonThree.plate,
                wagonThree.mincool,
                wagonThree.minOven,
                productionInfo.kg,
                productionInfo.grey,
                wagonThree.series
        
        FROM wagonThree
        JOIN productionInfo ON wagonThree.formID = productionInfo.formID
        WHERE series LIKE '%Kopas%';

        
/****************************************************************************/

/******************************** LLB - Series ******************************/

/******************************** LiftUp - Series ******************************/
CREATE OR REPLACE VIEW liftupView AS
        SELECT
                wagonOne.formID AS 'Form ID',
                wagonOne.formName As 'Form Name',
                wagonOne.arm AS 'Arm Rotation',
                wagonOne.plate As 'Plate Rotation',
                wagonOne.mincool AS 'Cooling Time',
                wagonOne.minOven AS 'Oven Time',
                productionInfo.kg AS 'kg Gram',
                productionInfo.blue AS 'Blue',
                wagonOne.series AS 'Series'

        FROM wagonOne
        JOIN productionInfo ON wagonOne.formID = productionInfo.formID
        WHERE series LIKE '%Liftup%'

        UNION ALL

        SELECT
                wagonTwo.formID,
                wagonTwo.formName,
                wagonTwo.arm,
                wagonTwo.plate,
                wagonTwo.mincool,
                wagonTwo.minOven,
                productionInfo.kg,
                productionInfo.blue,
                wagonTwo.series

        FROM wagonTwo
        JOIN productionInfo ON wagonTwo.formID = productionInfo.formID
        WHERE series LIKE '%Liftup%'

        UNION ALL

        SELECT
                wagonThree.formID,
                wagonThree.formName,
                wagonThree.arm,
                wagonThree.plate,
                wagonThree.mincool,
                wagonThree.minOven,
                productionInfo.kg,
                productionInfo.blue,
                wagonThree.series
        FROM wagonThree
        JOIN productionInfo ON wagonThree.formID = productionInfo.formID
        WHERE series LIKE '%Liftup%';

/****************************************************************************/

/******************************* Kopas-Series ******************************/
    CREATE OR REPLACE VIEW mbView AS
        SELECT
                wagonOne.formID  AS 'Form ID',
                wagonOne.formName AS 'Form Name',
                wagonOne.arm AS 'Arm Rotation',
                wagonOne.plate AS 'Plate Rotation',
                wagonOne.mincool AS 'Cooling Time',
                wagonOne.minOven AS 'Oven Time',
                productionInfo.kg AS 'kg Gram',
                productionInfo.orange as 'Orange',
                wagonOne.series AS 'Series'

        FROM wagonOne
        JOIN productionInfo ON wagonOne.formID = productionInfo.formID
        WHERE series LIKE '%mb%'
        
        UNION ALL
        SELECT
                wagonTwo.formID,
                wagonTwo.formName,
                wagonTwo.arm,
                wagonTwo.plate,
                wagonTwo.mincool,
                wagonTwo.minOven,
                productionInfo.kg,
                productionInfo.orange,
                wagonTwo.series

        FROM wagonTwo
        JOIN productionInfo ON wagonTwo.formID = productionInfo.formID
        WHERE series LIKE '%mb%'
        
        UNION ALL

        SELECT 
                wagonThree.formID,
                wagonThree.formName,
                wagonThree.arm,
                wagonThree.plate,
                wagonThree.mincool,
                wagonThree.minOven,
                productionInfo.kg,
                productionInfo.orange,
                wagonThree.series
        
        FROM wagonThree
        JOIN productionInfo ON wagonThree.formID = productionInfo.formID
        WHERE series LIKE '%mb%';

        
/****************************************************************************/

/******************************** Pontoon - Series ******************************/
CREATE OR REPLACE VIEW pontoonView AS
        SELECT
                wagonOne.formID AS 'Form ID',
                wagonOne.formName As 'Form Name',
                wagonOne.arm AS 'Arm Rotation',
                wagonOne.plate As 'Plate Rotation',
                wagonOne.mincool AS 'Cooling Time',
                wagonOne.minOven AS 'Oven Time',
                productionInfo.kg AS 'kg Gram',
                productionInfo.black AS 'Black',
                wagonOne.series AS 'Series'

        FROM wagonOne
        JOIN productionInfo ON wagonOne.formID = productionInfo.formID
        WHERE series LIKE '%Pontoon%'

        UNION ALL

        SELECT
                wagonTwo.formID,
                wagonTwo.formName,
                wagonTwo.arm,
                wagonTwo.plate,
                wagonTwo.mincool,
                wagonTwo.minOven,
                productionInfo.kg,
                productionInfo.black,
                wagonTwo.series

        FROM wagonTwo
        JOIN productionInfo ON wagonTwo.formID = productionInfo.formID
        WHERE series LIKE '%Pontoon%'

        UNION ALL

        SELECT
                wagonThree.formID,
                wagonThree.formName,
                wagonThree.arm,
                wagonThree.plate,
                wagonThree.mincool,
                wagonThree.minOven,
                productionInfo.kg,
                productionInfo.black,
                wagonThree.series
        FROM wagonThree
        JOIN productionInfo ON wagonThree.formID = productionInfo.formID
        WHERE series LIKE '%Pontoon%';

/****************************************************************************/
/******************************* Prebouy - Series ****************************/
CREATE OR REPLACE VIEW prebouyView AS 
        SELECT
                wagonOne.formID AS 'Form ID',
                wagonOne.formName AS 'Form Name',
                wagonOne.arm AS 'Arm Rotation',
                wagonOne.plate AS 'Plate Rotation',
                wagonOne.mincool AS 'Cooling Time',
                wagonOne.minOven AS ' Oven Time',
                productionInfo.kg AS 'kg Gram',
                productionInfo.yellow AS 'Yellow',
                productionInfo.grey AS 'Grey',
                wagonOne.series AS 'Series'

        FROM wagonOne
        JOIN productionInfo ON wagonOne.formID = productionInfo.formID
        WHERE series LIKE '%Prebouy%'

        UNION ALL
        
        SELECT 
                wagonTwo.formID,
                wagonTwo.formName,
                wagonTwo.arm,
                wagonTwo.plate,
                wagonTwo.mincool,
                wagonTwo.minOven,
                productionInfo.kg,
                productionInfo.yellow,
                productionInfo.grey,
                wagonTwo.series
        
        FROM wagonTwo
        JOIN productionInfo ON wagonTwo.formID = productionInfo.formID
        WHERE series LIKE '%Prebouy%'

        UNION ALL

        SELECT
                wagonThree.formID,
                wagonThree.formName,
                wagonThree.arm,
                wagonThree.plate,
                wagonThree.mincool,
                wagonThree.minOven,
                productionInfo.kg,
                productionInfo.yellow,
                productionInfo.grey,
                wagonThree.series

        FROM wagonThree
        JOIN productionInfo ON wagonThree.formID = productionInfo.formID
        WHERE series LIKE '%Prebouy%';
/**************************************************************************/

/******************************** Sbh - Series ******************************/
CREATE OR REPLACE VIEW sbhView AS
        SELECT
                wagonOne.formID AS 'Form ID',
                wagonOne.formName As 'Form Name',
                wagonOne.arm AS 'Arm Rotation',
                wagonOne.plate As 'Plate Rotation',
                wagonOne.mincool AS 'Cooling Time',
                wagonOne.minOven AS 'Oven Time',
                productionInfo.kg AS 'kg Gram',
                productionInfo.blue AS 'Blue',
                wagonOne.series AS 'Series'

        FROM wagonOne
        JOIN productionInfo ON wagonOne.formID = productionInfo.formID
        WHERE series LIKE '%SBH%'

        UNION ALL

        SELECT
                wagonTwo.formID,
                wagonTwo.formName,
                wagonTwo.arm,
                wagonTwo.plate,
                wagonTwo.mincool,
                wagonTwo.minOven,
                productionInfo.kg,
                productionInfo.blue,
                wagonTwo.series

        FROM wagonTwo
        JOIN productionInfo ON wagonTwo.formID = productionInfo.formID
        WHERE series LIKE '%SBH%'

        UNION ALL

        SELECT
                wagonThree.formID,
                wagonThree.formName,
                wagonThree.arm,
                wagonThree.plate,
                wagonThree.mincool,
                wagonThree.minOven,
                productionInfo.kg,
                productionInfo.blue,
                wagonThree.series
        FROM wagonThree
        JOIN productionInfo ON wagonThree.formID = productionInfo.formID
        WHERE series LIKE '%SBH%';

/****************************************************************************/