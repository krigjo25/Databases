##Employee

**Description**

Employee related information should be in a own database, to have a clean database.

The employee table consist of personal and work related information for<br>
employees to calculate the salary.

**Table**

| eID | EmployeeName | birthDate | street | zipCode | email | Phone | eStatus | occupation | hourlyRate | department | hired |
|--- |--- |--- |---	|--- |--- |--- |---	|--- |--- |--- |---	|

**Procedures**

    #   Create a new record of employees
    CALL newEmployee(eName, vDate, vStreet, vEmail, vPhone, veStatus, IN vTitle, vDep)

    #   Modify employee Information
    CALL modifyEmployee (vColumn, vValue, veID,)

**Events**

    -   Archive employee The record are kept in another database

**Triggers**

    - Terminate Employee The records is keept in another database, 