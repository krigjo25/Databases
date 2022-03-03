## Turnus
a table called turnus to generate a turnus for the doctors, it selects necsessary information
from the employees table.

The table generates a turnus for 3 months at the time, 

**Turnus**
| eID| eName | dato | timeInn | out | comment | sickDays |
|---	|---	|---	|---	|---	|--- |--- |

**Procedures**

###   Add a new Turnus
-   CALL newTurnus(veID, vDate, vTimeInn, hh, mm, vai);

###   Decrease sickDays ammount
-   CALL sickDays(veID);

**Events**


**Trigger**