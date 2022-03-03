

INSERT INTO wagonOne (formName, pSeries, plate, arm, mincool, minOven, sutableWith, notes) VALUES
        ('APB 1500', 'APB-Series', 14.39, 31.84, 35, 32, 'APB SERIES 2200 + LIGHT', ''),
        ('APB 2200', 'APB-Series', 14.39, 31.84, 35, 32, 'APB SERIES 1500 + LIGHT', ''),
        ('APB 1500 LIGHT', 'APB-Series', 14.39, 31.84, 35, 32, 'APB SERIES 2200 + LIGHT', ''),
        ('APB 2200 LIGHT', 'APB-Series',14.39, 31.84, 35, 32, 'APB SERIES 1500 + LIGHT',  '');

INSERT INTO wagonTwo (formName, pSeries, plate, arm, notes) VALUES
        ('SFS-100', 'SFS-Series', 30.33,27.30, '')
        ('Aqua 600', 'Aqua-Series', 30.33,27.30,''),
        ('Aqua 600 pre', 'Prebouy-Series', 30.33, 27.30,''),
        ('Prebouy 850', 'Prebouy-Series', 30.33, 27.30, ''), 
        ('Prebouy 1100', 'Prebouy-Series', 30.33, 27.30, ''),
        ('MB-40', 'MB-Series', 30.33, 27.30, ''),
        ('Mb-100', 'MB-Series', 30.33, 27.30, ''),
        ('MB-250','MB-Series', 30.33, 27.30, ''),
        ('LB-40', 'LB-Series', 30.33, 27.30, ''),
        ('LB-100', 'LB-Series', 30.33, 27.30, ''),
        ('LB-250', 'LB-Series', 30.33, 27.30, ''),
        ('SBH', 'SBH-Series', 30.33, 27.30, ''),
        ('Kopas 9', 'Kopas-Series', 30.33, 27.30, ''),
        ('Kopas 10', 'Kopas-Series', 30.33, 27.30, ''),
        ('Kopas 11', 'Kopas-Series', 30.33, 27.30, ''),
        ('Kopas 12', 'Kopas-Series',30.33, 27.30, ''),
        ('Silkasse', 'Liftup-Series', 30.33, 27.30, ''),
        ('Stuss', 'Liftup-Series', 30.33, 27.30, ' Stuss to SilKasse (3 buckets)'),
        ('Aqualine Finger', 'Pontoon-Series', 30.33, 27.30, ''),
        ('Aqualine Wide Finger ', 'Pontoon-Series', 30.33, 27.30, ''),
        ('Aqualine Finger end piece', 'Pontoon-Series', 30.33, 27.30, 'Waffle iron'),
        ('Aqualine Wide Finger end piece', 'Pontoon-Series', 30.33, 27.30, 'Hammer'),
        ('APB 1000 FO', 'APB-Series', 27.44, 14.86, ''),
        ('APB 500', 'APB-Series', 53.19, 27.71, 'small middlepice'),
        ('Sotra', 'FS-Series', 30.33, 27.30, '');

INSERT INTO wagonThree (formName, pSeries, plate, arm, mincool, minOven, middlePice, bracer,notes) VALUES
        ('Prebouy 1600',  'Prebouy Series', 9.33, 27.17, 35, 28.5,  '', 'ON bottom',''),
        ('Pontoon 2700', 'Pontoon Series', 29.44, 40.00, 40, 31, '','marked', 'Timer : 4700'), -- Bracer 10 cm below 1350
        ('Aqua 4000', 'Aqua Series', 11.16, 20.35, 35, 37.5, '', 'On Top', '' ),
        ('Aqua 2000', 'Aqua Series', 13.36, 22.24, 35, 28, '', 'ON bottom', ''),
        ('Kopas 30', 'Kopas Series', 05.05, 27.00, 28, 25, '', 'Marked', ''),
        ('Aqua 2500', 'Aqua Series', 5.00, 25.10, 35, 30, '', 'On Top', 'add isolation');

INSERT INTO productionInfo(formID, formName, kg) VALUES

        (2022, 'APB 500', 30),
        (2021, 'APB 1000', 40),
        (1000, 'APB 1500', 100),
        (1001, 'APB 2200', 140),
        (1002, 'APB 1500 LIGHT', 90),
        (1003, 'APB 2200 LIGHT', 120),
        (2000, 'Prebouy 600', 30),
        (2001, 'Prebouy 850', 30),
        (2003, 'Prebouy 1100',45),
        (3000, 'Prebouy 1600', 67.5),
        (2004, 'MB-40', 2.5),
        (2005, 'MB-100', 6),
        (2006, 'MB-250', 12),
        (2007, 'LB-40', 2.5),
        (2008, 'LB-100', 6),
        (2009, 'LB-250', 12),
        (2010, 'SBH-100', 6),
        (2011, 'Kopas 9', 11),
        (2012, 'Kopas 10', 17.5),
        (2013, 'Kopas 11', 20),
        (2014, 'Kopas 12', 30),
        (3003, 'Kopas 30', 85),
        (3001, 'Pontoon 2700',100),
        (2015, 'Silkasse', 20),
        (2016, 'Stuss', 5),
        (3002, 'Aqua 4000',140), 
        (2017, 'Aqualine Wide Finger ', 30),
        (2018, 'Aqualine Finger', 17),
        (2019, 'Aqualine end piece finger ', 1.5),
        (2020, 'Aqualine Wide Finger end piece', 5),
        (2021, 'SOTRA', 6);