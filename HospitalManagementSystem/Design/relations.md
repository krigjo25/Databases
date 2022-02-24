#   Employe - Patient Relation table

Creating a list of patients which is assigned to doctors, will make the it easier to remember which patient the doctor has, This table will be a cross over table

**relation Information**


| id | pID | patientName | eID | employeeName |
|--- |--- |--- |--- |--- |

| Constraints | Comment |
|--- |--- |
| Unique | CONSTRAINT | 
| pID|  |
| INDEX| KEY |
| eID | | The doctor can be assigned to multiple patients |
| FOREIGN KEY | CONSTRAINT |
| eID | | The doctor has to be an employee at the hospital |
| pID | | The patient has to be registered in the database |
| PRIMARY KEY | KEY |
| id | | Row Counter|

**Procedures**

    #   Assigning new patient to a doctor
-   CALL newRelation(eID, pID);

    #   Removing the relation upon recovery
-   CALL delRelation(eID. pID);

    #   Updating the Doctor assignment
-   CALL updateRelation(vcolumn, veID, vpID);

**Events**

Creating an event to terminate a relation when the<br>
patient has been recovered. So the doctor can get new patients