
/********************************** Wagon One ***********************/
--      CALL NewOne(vName, vPlate, vArm, vSeries)
CALL newOne ('APB 1500 end',  14.39, 31.84, 'APB-Series');
CALL newOne ('APB 2200 end',  14.39, 31.84, 'APB-Series');
CALL newOne ('APB 2200 middle',  14.39, 31.84, 'APB-Series');
CALL newOne ('APB 1500 end LIGHT',  14.39, 31.84, 'APB-Series');
CALL newOne ('APB 2200 end LIGHT',  14.39, 31.84, 'APB-Series');

/*******************************************************************/
--ALTER TABLE wagonTwo MODIFY COLUMN formID2 BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, AUTO_INCREMENT=2000;
/********************************** Wagon Two ***********************/
        --      CALL newTwo(vName, vSeries, vPlate, vArm, vMinOven, vNotes)
        CALL newTwo('Sotra', 'FS-Series', 30.33,27.30, '');

        CALL newTwo('Aqua 600', 'Aqua-Series', 30.33,27.30, '');

        CALL newTwo('Aqua 600 pre', 'Prebouy-Series', 30.33, 27.30,'');
        CALL newTwo('Prebouy 850', 'Prebouy-Series', 30.33, 27.30, '');
        CALL newTwo('Prebouy 1100', 'Prebouy-Series', 30.33, 27.30, '');

        CALL newTwo('MB-40', 'MB Series', 30.33, 27.30, '');
        CALL newTwo('Mb-100', 'MB Series', 30.33, 27.30, '');
        CALL newTwo('MB-250','MB Series', 30.33, 27.30, '');

        CALL newTwo('SBH', 'SBH Series', 30.33, 27.30, '');

        CALL newTwo('Kopas 9', 'Kopas Series', 30.33, 27.30, '');
        CALL newTwo('Kopas 10', 'Kopas Series', 30.33, 27.30, '');
        CALL newTwo('Kopas 11', 'Kopas Series', 30.33, 27.30, '');
        CALL newTwo('Kopas 12', 'Kopas Series', 30.33, 27.30, '');

        CALL newTwo('Silkasse', 'Liftup Series', 30.33, 27.30, '');
        CALL newTwo('Stuss', 'Liftup Series', 30.33, 27.30, ' Stuss to SilKasse (3 buckets)');

        CALL newTwo('Aqualine Finger', 'Pontoon Series', 30.33, 27.30, '');
        CALL newTwo('MP 1100', 'Pontoon Series', 31.90, 24.30, 'Square module');
        CALL newTwo('Aqualine Wide Finger ', 'Pontoon Series', 30.33, 27.30, '');
        CALL newTwo('Aqualine Finger end piece', 'Pontoon Series', 30.33, 27.30, 'Waffle iron');
        CALL newTwo('Aqualine Wide Finger end piece', 'Pontoon Series', 30.33, 27.30, 'Hammer');

        CALL newTwo('APB 1000 FO', 'APB Series', 27.44, 14.86, '');
        CALL newTwo('APB 500', 'APB Series', 53.19, 27.71, 'small middlepice');

/********************************** Wagon Three ***********************/
--      CALL newThree(vName, vSeries, vPlate, vArm, vMinOven, vNotes, vBracer)
        CALL newThree('Prebouy 1600', 'Prebouy Series', 9.33, 27.17, 28.5,  '', 'ON bottom');

        CALL newThree('MP 1100', 'Pontoon Series', 31.90, 24.30, 20 'Square module', '');
        CALL newThree('Pontoon 2700', 'Pontoon Series', 29.44, 40.00, 31,'Timer : 4700', 'marked'); -- Bracer 10 cm below 1350

        CALL newThree('Kopas 30', 'Kopas Series', 05.05, 27.00, 25, '', 'Marked');

        CALL newThree('APB 1000 FO', 'APB Series', 13.36, 20.00, 23.5, '', 'ON TOP');

        CALL newThree('Aqua 2000', 'Aqua Series', 13.36, 22.24, 28.5, '', 'ON bottom');
        CALL newThree('Aqua 2500', 'Aqua Series', 5.00, 25.10, 30, 'add isolation', 'On Top');
        CALL newThree('Aqua 4000', 'Aqua Series', 11.16, 20.35, 37.5, '', 'On Top');
        CALL newThree('Protoon 420l', 'Pontoon Series', 14.15, 35.92, 'long middlepiece', 'On Top')

        CALL newThree('Lodd Sotra 1200l', 'Sotra Series', 13.36, 20.00, 20.00, 35, 'loong middlepiece', 'On top')
/*******************************************************************/

/********************************** productionInfo ***********************/
        -- CALL proInfo(vID, kg)

CALL proInfo(1000,100);
CALL proInfo(1001, 90;
CALL proInfo(1002, 140);
CALL proInfo(1003, 110);
CALL proInfo(1004, 140);

CALL proInfo(2000, 6);
CALL proInfo(2001, 30);
CALL proInfo(2002, 27.5);
CALL proInfo(2003, 27);
CALL proInfo(2004, 30);
CALL proInfo(2005, 2.5);
CALL proInfo(2006, 6);
CALL proInfo(2007, 12);
CALL proInfo(2008, 6);
CALL proInfo(2009, 11);
CALL proInfo(2010, 17.5);
CALL proInfo(2011, 20);
CALL proInfo(2012, 30);
CALL proInfo(2013, 20);
CALL proInfo(2014, 5);
--CALL proInfo(2015, 20);
--CALL proInfo(2016, 5);
CALL proInfo(2017, 4.5);
CALL proInfo(2018, 1.5);
CALL proInfo(2019, 40);
CALL proInfo(2020, 30);
CALL proInfo(2021, 50);

CALL proInfo(3000, 67.5);
CALL proInfo(3001, 100);
CALL proInfo(3002, 67.5);
CALL proInfo(3003, 85);
CALL proInfo(3004, 85);
CALL proInfo(3005, 90);
CALL proInfo(3006, 140);

CALL proInfo(3007, 20);
CALL proinfo(3008, 40);