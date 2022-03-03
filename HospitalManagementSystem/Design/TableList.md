# Listed Tables

In the given tables below is a list of deseases, alergies and medecines
Its a dynamic list where the doctor can find given desease, alergy or medecine  to retrieve in other cases such as sickpapers or other documents.

###diagnosis ( List of Diagnosis )

| id | doc | diagonsisName | symptoms | mID |
|---	|---	|---	|---	|---	|



###Alergy (List of Alergies)

| id | alergyID | alergyName | symptoms | mID |
|---	|---	|---	|---	|---	|

**availableMedecine (List of available medecines)**
| id | mID | medecineName | symptoms |
|---	|---	|---	|---	|

##Rooms

    -   100 - 199 First Floor 
    -   200 - 299 Second Floor
    -   300 - 399 Third Floor

**Tables**

Creating a table which contains how many rooms and floors the<br>
hospital has
each floor Table should include
| roomID | roomName |
|--- |--- |
| 100 | Library |
| 101 | Pharamacy |
| 102 | EquipmentRoom |
| 104 | Cafeteria |
| 105 | Emergency Services |
| 106 | Reception |
| 107 | Observation Room |
| 108 | Recovery Room |
| 200 | Equipments |
| 201 | Operation Theaters |
| 202 | Ward |
| 300 | Cancer Department |

**Procedures**

    ### Assign a name and a id to a room
*   CALL newRoom (vrID, rName);

    ###   modify room information 
*    CALL modifyRoom (vColumn, vValue);