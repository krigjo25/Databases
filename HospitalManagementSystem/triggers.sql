/***************************************************************

This file contains the triggers which is used in the project

***************************************************************/

/*************************** Patient **********************/
CREATE TRIGGER Patient AFTER INSERT ON patient
    FOR EACH ROW
    BEGIN
    SET Query = sys_exec('/usr/bin/codes/python/createPDF.pyy');
    END ??
/*********************************************************/