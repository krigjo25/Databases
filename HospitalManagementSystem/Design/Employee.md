##Employee

**Description**


Employee related information should have a own database, to have a clean database.

The design includes two tables, for information about employees.

We would like to have a static table where values such as salary and titles are<br>
the main table employee should consist of personal and work related information<br>

**Tables**

| Occupation | hourlyRate |
|--- |--- |

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