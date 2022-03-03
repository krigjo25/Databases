#   Employee - Patient Relation table

Creating a list of patients which is assigned to doctors, will make the it easier to remember which patient the doctor has, This table will be a cross over table

**relation Information**


| id | pID | patientName | eID | employeeName |
|--- |--- |--- |--- |--- |

| Constraints | Comment |
|--- |--- |
| Unique | CONSTRAINT | 
| pID |  The patient has to be registered and only one Primary doctor each patient|
| INDEX | KEY |
| eID | The doctor can be assigned to multiple patients |
| employeeName | Doctors can have the same name |
| patientName | Patients can have the same name |
| PRIMARY KEY| KEY |
| id | Row Counter ||

**Procedures**

###   Assigning new patient to a doctor
-   CALL newRelation(eID, pID);

###   Removing the relation upon recovery
-   CALL delRelation(eID. pID);

###   MODIFY the Doctor assignment
-   CALL modifyRelation(vcolumn, veID, vpID);

**Events**

Creating an event to terminate a relation when the<br>
patient has been recovered. So the doctor can get new<br>
patients if limit is reached.