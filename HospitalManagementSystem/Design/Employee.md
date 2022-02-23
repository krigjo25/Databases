##Employee

**Description**

The employee table consist of personal and work related information for employees to calculate the salary, and for emergencies.

**Database**

new Database for employees

**Table**
    
        Column              Comment

    personal information

    -   Full name,
    -   date of birth,
    -   street,
    -   provice,
    -   zipCode,
    -   email,
    -   phone,
    .   mobile,

    Work information

    -   eStatus,
    -   occupation,
    -   hourlyRate
    -   department
    -   hired

| EmployeeName | birthDate | street | zipCode | email | Phone | eStatus | occupation | hourlyRate | department | hired |
|---	|---	|---	|---	|---	|---	|---	|---	|---	|---	|---	|

**Procedures**

    #   Create a new record of employees
    CALL newEmployee(eName, vDate, vStreet, vEmail, vPhone, veStatus, IN vTitle, vDep)

    #   Modify employee Information
    CALL modifyEmployee (vColumn, vValue, veID,)

**Events**

    -   Archive employee The record are kept in another database

**Triggers**

    - Terminate Employee The records is keept in another database, 