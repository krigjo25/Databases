/*****************************functions for patients***********************************/

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
        SET partThree = SUBSTRING(vssn, 5, 4);

        -- Assigning the new values to the variables, using concat to merge the string
        SET vssn = CONCAT(partOne, '-', partTwo, '-', partThree);
        RETURN vssn;

    END x


CREATE OR REPLACE FUNCTION convertPhone(vPhone VARCHAR(255)) RETURNS VARCHAR(255) NOT DETERMINISTIC
    BEGIN

        /************ convertPhone ********************
            The function adds the "-" between the digits
            using SUBSTRING to get a part of the digits,
            using CONCAT to add, '-'.

        *****************************************************************/

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

CREATE OR REPLACE FUNCTION generateTableName (vName VARCHAR(255), vssn  VARCHAR(255)) RETURNS VARCHAR(7) NOT DETERMINISTIC
    BEGIN

        /************ generateTableName ********************
            The function Trimming the patientName (threeFirst letters 
            and Three Last letters), vssn(four last digits), 
            and creating a tablename with the
            using SUBSTRING to get a part of the digits,
            using CONCAT to add, '-'.

        *****************************************************************/

        --  Declare variables

        DECLARE vTableName VARCHAR(255);
        

        --  Trimming the Phone Number 123456789
        SET vssn = SUBSTRING(vssn, 5, 4);
        SET vName = SUBSTRING(vName, 1, 3);

        SET vTableName = CONCAT(vName, vssn);

    RETURN vTableName;

    END x

/*****************************************************************/

