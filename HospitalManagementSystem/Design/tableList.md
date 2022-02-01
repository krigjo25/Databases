## Listed Tables

In the given tables below is a list of deseases, alergies and medecines
Its a dynamic list where the doctor can find given desease, alergy or medecine  to retrieve in other cases such as sickpapers or other documents.

**doc ( List of Disases )**
    
    Column                          Comment

    -   id                          not null autoIncrement
    -   deseaseID                  A ID which contain just letters e.g "NNNND"
    -   Disease Name                The name for the disease 
    -   Symptoms                    Some main symptoms
    -   mID                 the medecine's id

**Alergy**

    Column                          Comment

    -   id                          not null autoIncrement
    -   Disease ID                  A ID which contain letters e.g 'NNNNA'
    -   Disease Name                The name for the disease 
    -   Symptoms                    Some main symptoms
    -   mID                 the medecine's id

**Medecine**

    Column                          Comment

    -   id                          not null autoIncrement
    -   mID                         the medecine's id eg. 'NNNNM'
    -   Disease Name                The name for the disease
    -   Symptoms                    Some main symptoms

**Rooms**
    -   100 - 199 First Floor 
    -   200 - 299 Second Floor
    -   300 - 399 Third Floor

**Tables**

    each floor Table should include
        
    Column                  Comment 

    -   roomID
    -   roomName
    -   hourlyRate
    --------------------

        ICU,
        Library,
        Pharmacy,
        Reseption,
        cafeteria,
        EquipmentRoom,
        observation room,
        Emergency Services,

    Second Floor
    
        Ward
        Equipments
        operation Theaters
        EquipmentRoom

    Third Floor


**Procedures**
    -   Update information
    -   Insert a newRoom