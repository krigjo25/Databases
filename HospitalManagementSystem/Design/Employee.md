##Employee

**Description**

Employee related information should be in a own database, to have a clean database.

There has to be two tables, one where the title and hourlyRate is registered<br>
another table which consistof personal and work related information for<br>
employees to calculate the salary.

So we need two tables where a title is registered, and hourlyRent for employee


**Table**

| Occupation | hourlyRate | x
|--- |--- |

| eID | EmployeeName | birthDate | street | zipCode | email | Phone | eStatus | occupation | hourlyRate | department | hired |
|--- |--- |--- |---	|--- |--- |--- |---	|--- |--- |--- |---	|
0
**Procedures**

    #   Create a new record of employees
    CALL newEmployee(eName, vDate, vStreet, vEmail, vPhone, veStatus, IN vTitle, vDep)

    #   Modify employee Information
    CALL modifyEmployee (vColumn, vValue, veID,)

**Events**

    -   Archive employee The record are kept in another database

**Triggers**

    - Terminate Employee The records is keept in another database, 