/*

        Author
                Krigjo25

*/
/******************************* OverView ******************************/

/******************************** Aqua - Series ******************************/
CREATE OR REPLACE VIEW aquaView AS
        SELECT
                wagonOne.id AS 'Form ID',
                wagonOne.formName AS 'Form Name',
                wagonOne.arm AS 'Arm Rotation',
                wagonOne.plate AS 'Plate Rotation',
                wagonOne.mincool AS 'Cooling Time',
                wagonOne.minOven AS 'Oven Time',
                productionInfo.kilo AS 'Kilo Gram',
                productionInfo.yellow AS 'Yellow',
                productionInfo.grey AS 'Grey',
                wagonOne.pSeries AS 'Series'

        FROM wagonOne
        JOIN productionInfo ON wagonOne.id = productionInfo.formID
        WHERE pSeries LIKE '%Aqua%'

        UNION ALL

        SELECT
                wagonTwo.id,
                wagonTwo.formName,
                wagonTwo.arm,
                wagonTwo.plate,
                wagonTwo.mincool,
                wagonTwo.minOven,
                productionInfo.kilo,
                productionInfo.yellow,
                productionInfo.grey,
                wagonTwo.pSeries
        
        FROM wagonTwo
        JOIN productionInfo ON wagonTwo.id = productionInfo.formID
        WHERE pSeries like '%Aqua%'

        UNION ALL
        
        SELECT 
                wagonThree.id,
                wagonThree.formName,
                wagonThree.arm,
                wagonThree.plate,
                wagonThree.mincool,
                wagonThree.minOven,
                productionInfo.kilo,
                productionInfo.yellow,
                productionInfo.grey,
                wagonThree.pSeries

        FROM wagonThree
        JOIN productionInfo ON wagonThree.id = productionInfo.formID
        WHERE pSeries LIKE '%Aqua%';
/****************************************************************************/

/******************************* Apb-Series ******************************/
CREATE OR REPLACE VIEW apbView AS
        SELECT
                wagonOne.id AS 'Form ID',
                wagonOne.formName AS 'Form Name',
                wagonOne.arm AS 'Arm Rotation',
                wagonOne.plate AS 'Plate Rotation',
                wagonOne.mincool AS ' Cooling Time',
                wagonOne.minOven AS 'Oven Time',
                productionInfo.kilo AS 'Kilo Gram',
                productionInfo.yellow AS 'Yellow',
                productionInfo.grey AS 'Grey',
                productionInfo.black AS 'Black',
                wagonOne.pSeries AS 'Series'

        FROM wagonOne
        JOIN productionInfo ON wagonOne.id = productionInfo.formID
        WHERE pSeries LIKE '%APB%'

        UNION ALL
        
        SELECT 
                wagonTwo.id,
                wagonTwo.formName,
                wagonTwo.arm,
                wagonTwo.plate,
                wagonTwo.mincool,
                wagonTwo.minOven,
                productionInfo.kilo,
                productionInfo.yellow,
                productionInfo.grey,
                productionInfo.black,
                wagonTwo.pSeries
        
        FROM wagonTwo
        JOIN productionInfo ON wagonTwo.id = productionInfo.formID
        WHERE pSeries LIKE '%APB%'

        UNION ALL
        
        SELECT
                wagonThree.id,
                wagonThree.formName,
                wagonThree.arm,
                wagonThree.plate,
                wagonThree.mincool,
                wagonThree.minOven,
                productionInfo.kilo,
                productionInfo.yellow,
                productionInfo.grey,
                productionInfo.black,
                wagonThree.pSeries
        
        FROM wagonThree
        JOIN productionInfo ON wagonThree.id = productionInfo.formID
        WHERE pSeries LIKE '%APB%';
/****************************************************************************/


/******************************* Kopas-Series ******************************/
    CREATE OR REPLACE VIEW kopasView AS
        SELECT
                wagonOne.id  AS 'Form ID',
                wagonOne.formName AS 'Form Name',
                wagonOne.arm AS 'Arm Rotation',
                wagonOne.plate AS 'Plate Rotation',
                wagonOne.mincool AS 'Cooling Time',
                wagonOne.minOven AS 'Oven Time',
                productionInfo.kilo AS 'Kilo Gram',
                productionInfo.grey as 'Grey',
                wagonOne.pSeries AS 'Series'

        FROM wagonOne
        JOIN productionInfo ON wagonOne.id = productionInfo.formID
        WHERE pSeries LIKE '%Kopas%'
        
        UNION ALL
        SELECT
                wagonTwo.id,
                wagonTwo.formName,
                wagonTwo.arm,
                wagonTwo.plate,
                wagonTwo.mincool,
                wagonTwo.minOven,
                productionInfo.kilo,
                productionInfo.grey,
                wagonTwo.pSeries

        FROM wagonTwo
        JOIN productionInfo ON wagonTwo.id = productionInfo.formID
        WHERE pSeries LIKE '%Kopas%'
        
        UNION ALL

        SELECT 
                wagonThree.id,
                wagonThree.formName,
                wagonThree.arm,
                wagonThree.plate,
                wagonThree.mincool,
                wagonThree.minOven,
                productionInfo.kilo,
                productionInfo.grey,
                wagonThree.pSeries
        
        FROM wagonThree
        JOIN productionInfo ON wagonThree.id = productionInfo.formID
        WHERE pSeries LIKE '%Kopas%';

        
/****************************************************************************/

/******************************** LLB - Series ******************************/
CREATE OR REPLACE VIEW lbView AS
        SELECT
                wagonOne.id AS 'Form ID',
                wagonOne.formName As 'Form Name',
                wagonOne.arm AS 'Arm Rotation',
                wagonOne.plate As 'Plate Rotation',
                wagonOne.mincool AS 'Cooling Time',
                wagonOne.minOven AS 'Oven Time',
                productionInfo.kilo AS 'Kilo Gram',
                productionInfo.yellow AS 'Yelloq',
                wagonOne.pSeries AS 'Series'

        FROM wagonOne
        JOIN productionInfo ON wagonOne.id = productionInfo.formID
        WHERE pSeries LIKE '%LB%'

        UNION ALL

        SELECT
                wagonTwo.id,
                wagonTwo.formName,
                wagonTwo.arm,
                wagonTwo.plate,
                wagonTwo.mincool,
                wagonTwo.minOven,
                productionInfo.kilo,
                productionInfo.yellow,
                wagonTwo.pSeries

        FROM wagonTwo
        JOIN productionInfo ON wagonTwo.id = productionInfo.formID
        WHERE pSeries LIKE '%LB%'

        UNION ALL

        SELECT
                wagonThree.id,
                wagonThree.formName,
                wagonThree.arm,
                wagonThree.plate,
                wagonThree.mincool,
                wagonThree.minOven,
                productionInfo.kilo,
                productionInfo.yellow,
                wagonThree.pSeries
        FROM wagonThree
        JOIN productionInfo ON wagonThree.id = productionInfo.formID
        WHERE pSeries LIKE '%lb%';

/****************************************************************************/

/******************************** LiftUp - Series ******************************/
CREATE OR REPLACE VIEW liftupView AS
        SELECT
                wagonOne.id AS 'Form ID',
                wagonOne.formName As 'Form Name',
                wagonOne.arm AS 'Arm Rotation',
                wagonOne.plate As 'Plate Rotation',
                wagonOne.mincool AS 'Cooling Time',
                wagonOne.minOven AS 'Oven Time',
                productionInfo.kilo AS 'Kilo Gram',
                productionInfo.blue AS 'Blue',
                wagonOne.pSeries AS 'Series'

        FROM wagonOne
        JOIN productionInfo ON wagonOne.id = productionInfo.formID
        WHERE pSeries LIKE '%Liftup%'

        UNION ALL

        SELECT
                wagonTwo.id,
                wagonTwo.formName,
                wagonTwo.arm,
                wagonTwo.plate,
                wagonTwo.mincool,
                wagonTwo.minOven,
                productionInfo.kilo,
                productionInfo.blue,
                wagonTwo.pSeries

        FROM wagonTwo
        JOIN productionInfo ON wagonTwo.id = productionInfo.formID
        WHERE pSeries LIKE '%Liftup%'

        UNION ALL

        SELECT
                wagonThree.id,
                wagonThree.formName,
                wagonThree.arm,
                wagonThree.plate,
                wagonThree.mincool,
                wagonThree.minOven,
                productionInfo.kilo,
                productionInfo.blue,
                wagonThree.pSeries
        FROM wagonThree
        JOIN productionInfo ON wagonThree.id = productionInfo.formID
        WHERE pSeries LIKE '%Liftup%';

/****************************************************************************/

/******************************* Kopas-Series ******************************/
    CREATE OR REPLACE VIEW mbView AS
        SELECT
                wagonOne.id  AS 'Form ID',
                wagonOne.formName AS 'Form Name',
                wagonOne.arm AS 'Arm Rotation',
                wagonOne.plate AS 'Plate Rotation',
                wagonOne.mincool AS 'Cooling Time',
                wagonOne.minOven AS 'Oven Time',
                productionInfo.kilo AS 'Kilo Gram',
                productionInfo.orange as 'Orange',
                wagonOne.pSeries AS 'Series'

        FROM wagonOne
        JOIN productionInfo ON wagonOne.id = productionInfo.formID
        WHERE pSeries LIKE '%mb%'
        
        UNION ALL
        SELECT
                wagonTwo.id,
                wagonTwo.formName,
                wagonTwo.arm,
                wagonTwo.plate,
                wagonTwo.mincool,
                wagonTwo.minOven,
                productionInfo.kilo,
                productionInfo.orange,
                wagonTwo.pSeries

        FROM wagonTwo
        JOIN productionInfo ON wagonTwo.id = productionInfo.formID
        WHERE pSeries LIKE '%mb%'
        
        UNION ALL

        SELECT 
                wagonThree.id,
                wagonThree.formName,
                wagonThree.arm,
                wagonThree.plate,
                wagonThree.mincool,
                wagonThree.minOven,
                productionInfo.kilo,
                productionInfo.orange,
                wagonThree.pSeries
        
        FROM wagonThree
        JOIN productionInfo ON wagonThree.id = productionInfo.formID
        WHERE pSeries LIKE '%mb%';

        
/****************************************************************************/

/******************************** Pontoon - Series ******************************/
CREATE OR REPLACE VIEW pontoonView AS
        SELECT
                wagonOne.id AS 'Form ID',
                wagonOne.formName As 'Form Name',
                wagonOne.arm AS 'Arm Rotation',
                wagonOne.plate As 'Plate Rotation',
                wagonOne.mincool AS 'Cooling Time',
                wagonOne.minOven AS 'Oven Time',
                productionInfo.kilo AS 'Kilo Gram',
                productionInfo.black AS 'Black',
                wagonOne.pSeries AS 'Series'

        FROM wagonOne
        JOIN productionInfo ON wagonOne.id = productionInfo.formID
        WHERE pSeries LIKE '%Pontoon%'

        UNION ALL

        SELECT
                wagonTwo.id,
                wagonTwo.formName,
                wagonTwo.arm,
                wagonTwo.plate,
                wagonTwo.mincool,
                wagonTwo.minOven,
                productionInfo.kilo,
                productionInfo.black,
                wagonTwo.pSeries

        FROM wagonTwo
        JOIN productionInfo ON wagonTwo.id = productionInfo.formID
        WHERE pSeries LIKE '%Pontoon%'

        UNION ALL

        SELECT
                wagonThree.id,
                wagonThree.formName,
                wagonThree.arm,
                wagonThree.plate,
                wagonThree.mincool,
                wagonThree.minOven,
                productionInfo.kilo,
                productionInfo.black,
                wagonThree.pSeries
        FROM wagonThree
        JOIN productionInfo ON wagonThree.id = productionInfo.formID
        WHERE pSeries LIKE '%Pontoon%';

/****************************************************************************/
/******************************* Prebouy - Series ****************************/
CREATE OR REPLACE VIEW prebouyView AS 
        SELECT
                wagonOne.ID AS 'Form ID',
                wagonOne.formName AS 'Form Name',
                wagonOne.arm AS 'Arm Rotation',
                wagonOne.plate AS 'Plate Rotation',
                wagonOne.mincool AS 'Cooling Time',
                wagonOne.minOven AS ' Oven Time',
                productionInfo.kilo AS 'Kilo Gram',
                productionInfo.yellow AS 'Yellow',
                productionInfo.grey AS 'Grey',
                wagonOne.pSeries AS 'Series'

        FROM wagonOne
        JOIN productionInfo ON wagonOne.id = productionInfo.formID
        WHERE pSeries LIKE '%Prebouy%'

        UNION ALL
        
        SELECT 
                wagonTwo.id,
                wagonTwo.formName,
                wagonTwo.arm,
                wagonTwo.plate,
                wagonTwo.mincool,
                wagonTwo.minOven,
                productionInfo.kilo,
                productionInfo.yellow,
                productionInfo.grey,
                wagonTwo.pSeries
        
        FROM wagonTwo
        JOIN productionInfo ON wagonTwo.id = productionInfo.formID
        WHERE pSeries LIKE '%Prebouy%'

        UNION ALL

        SELECT
                wagonThree.id,
                wagonThree.formName,
                wagonThree.arm,
                wagonThree.plate,
                wagonThree.mincool,
                wagonThree.minOven,
                productionInfo.kilo,
                productionInfo.yellow,
                productionInfo.grey,
                wagonThree.pSeries

        FROM wagonThree
        JOIN productionInfo ON wagonThree.id = productionInfo.formID
        WHERE pSeries LIKE '%Prebouy%';
/**************************************************************************/

/******************************** Sbh - Series ******************************/
CREATE OR REPLACE VIEW sbhView AS
        SELECT
                wagonOne.id AS 'Form ID',
                wagonOne.formName As 'Form Name',
                wagonOne.arm AS 'Arm Rotation',
                wagonOne.plate As 'Plate Rotation',
                wagonOne.mincool AS 'Cooling Time',
                wagonOne.minOven AS 'Oven Time',
                productionInfo.kilo AS 'Kilo Gram',
                productionInfo.blue AS 'Blue',
                wagonOne.pSeries AS 'Series'

        FROM wagonOne
        JOIN productionInfo ON wagonOne.id = productionInfo.formID
        WHERE pSeries LIKE '%SBH%'

        UNION ALL

        SELECT
                wagonTwo.id,
                wagonTwo.formName,
                wagonTwo.arm,
                wagonTwo.plate,
                wagonTwo.mincool,
                wagonTwo.minOven,
                productionInfo.kilo,
                productionInfo.blue,
                wagonTwo.pSeries

        FROM wagonTwo
        JOIN productionInfo ON wagonTwo.id = productionInfo.formID
        WHERE pSeries LIKE '%SBH%'

        UNION ALL

        SELECT
                wagonThree.id,
                wagonThree.formName,
                wagonThree.arm,
                wagonThree.plate,
                wagonThree.mincool,
                wagonThree.minOven,
                productionInfo.kilo,
                productionInfo.blue,
                wagonThree.pSeries
        FROM wagonThree
        JOIN productionInfo ON wagonThree.id = productionInfo.formID
        WHERE pSeries LIKE '%SBH%';

/****************************************************************************/