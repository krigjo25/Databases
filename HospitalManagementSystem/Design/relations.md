#   Employe - Patient Relation table

Creating a list of patients which is assigned to doctors, will make the it easier to remember which patient the doctor has, This table will be a cross over table

**relation Information**


| ID | pID | patientName | eID | employeeName |

>   ID                      Unique row id
>   pID                     Unique patient ID
>   patientName             Name of the patient
>   eID                     Unique employee ID
>   employeeID              Name of the assigned doctor
>
>   CONSTRAINT 
>
>   eID                     ForeignKey the given doctor has to be an employee at the hospital
>
>   patientID               ForeignKey, UNIQUE the patient has to be registered in the database and cannot be assigned to other doctors


**Procedures**

>   CALL newRelation(eID, pID);     -   Assigning new patient to a doctor
>   CALL delRelation(eID. pID);     -   Removing the relation upon recovery
>   CALL updateRelation(vcolumn, veID, vpID);  -   Updating the Doctor assignment

**Events**
Creating an event to terminate a relation when the  patient has been<br> recovered. So the doctor can get new patients