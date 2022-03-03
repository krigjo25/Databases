##  RoomBooking

Creating a table for the hospital staff to book a room for surgery / Ward, during the patient's stay.
This table should include the following information


| bookID | patientID | patientName | roomID | roomName | eID | employeeName | Date | timeInn | timeOut | surgeryType |
|---	|---	|---	|---	|---	|---	|---	|---	|---	|---	|---	|

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
