/*****************************functions for patients***********************************/
CREATE OR REPLACE FUNCTION calculatebmi(vheight DECIMAL(3.2), vWeight DECIMAL (5.2)) RETURNS DECIMAL(4.1) NOT DETERMINISTIC
    BEGIN
        /************ calculatebmi ********************
            The function calculates a patient's bmi using
            the mathmatic formula
            (m2 x m2) / kg 
        *****************************************************************/
        
        --  Declare variables
        DECLARE vBMI DECIMAL(5.2);

        --  Coverting cm into meetrs
        SET vHeight = vHeight * vHeight / 100;

        --  Divide the weight with the height BMI = vWeight / Height
        SET vBMI = vWeight / vHeight;

        RETURN vBMI;

    END x

--  Converting ssn 
CREATE OR REPLACE FUNCTION convertssn(vssn VARCHAR(255)) RETURNS VARCHAR(12) NOT DETERMINISTIC
    BEGIN
        /************ convertssn ********************
            The function adds the "-" between the digits
            using SUBSTRING to get a part of the digits,
            using CONCAT to add, '-'.

        *****************************************************************/--   Calculating bmi

        --  Gathering Social Security variables
        DECLARE partOne TYPE OF patient.ssn;
        DECLARE partTwo TYPE OF patient.ssn;
        DECLARE partThree TYPE OF patient.ssn;

        -- Trimming the Social Security Number
        SET partOne = SUBSTRING(vssn, 1,3);
        SET partTwo = SUBSTRING(vssn, 3,2);
        SET partThree = SUBSTRING(vssn,5,4);

        -- Assigning the new values to the variables, using concat to merge the string
        SET vssn = CONCAT(partOne, '-', partTwo, '-', partThree);
        RETURN vssn;

    END x

--  Converting Phone numbers
CREATE OR REPLACE FUNCTION convertPhone(vPhone VARCHAR(255)) RETURNS VARCHAR(255) NOT DETERMINISTIC
    BEGIN

        /************ convertPhone ********************
            The function adds the "-" between the digits
            using SUBSTRING to get a part of the digits,
            using CONCAT to add, '-'.

        *****************************************************************/--   Calculating bmi

        --  Gathering phonenumber
        DECLARE areaCode TYPE OF patient.phoneNumber;
        DECLARE lastDigit TYPE OF patient.phoneNumber;
        DECLARE threeDigit TYPE OF patient.phoneNumber;

        --  Trimming the Phone Number
        SET areaCode = SUBSTRING(vPhone, 1,3);
        SET lastDigit = SUBSTRING(vPhone, 7,4);
        SET threeDigit = SUBSTRING(vPhone, 4,3);

        SET vPhone = CONCAT ('(', areaCode, ')- ', threeDigit, '-', lastDigit);
    RETURN vPhone;
    END x

/*****************************************************************/--   Calculating bmi
