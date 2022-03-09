##  RoomBooking

Creating a table for the hospital staff to book a room for surgery / Ward, during the patient's stay.
This table should include the following information.

We would need another table called operation procedures, where the price is listed

**Tables**
| bookID | patientID | patientName | roomID | roomName | procedureName | procedureRate |eID | employeeName | Date | timeInn | timeOut | |
|---	|---	|---	|---	|---	|---	|---	|---	|---	|---	|---	|--- |--- |--- |--- |

**Procedures**

    The table should have following procedure

    ###   Searching for available rooms 
    CALL searchRoom ()
    
   ###    Book a room
    CALL bookRoom ()
    
    ###   Cancel a booking
    CALL cancelBook ()
    
**Triggers**

**Events**
