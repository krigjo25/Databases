## Billing system (reminder) - Send email

This system should fetch necsessary columns from the different tables, to calculate the bill, Then create a invoice for send using Yagmail (in this case)


The invoice should be able to fetch every room visited by the user, and calculate the hours or minutes been in the room.

fetch the hourly price, and calculate how many hours, minutes spent in the room after it has passed a certian time (30 min ).

by using Python / SQL for so if its less than 30 min, the name of te room should appear, but not the charge amount.

We should create a table called billing, in a new Database which is called billing.
In this database we will use patient id to identify patient name
table Billing

| patientID | invoiceID | price | status |
|---	|---	|---	|---	|

**procedures**

    #   Insert necsessary values to create the pdf file
    CALL newBilling (vpID)                 

    #   Updates the values, if wrongly added
    CALL updateBilling (vColumn, vpID)

**Triggers**
    #   After overdue, trigger an insert into credited table

**Events**
    #   When the invoice is overdue, trigger a new date,

    #   Triggers an insert and pdf creation when patient has been recovered

## Invoice

    FirmName
    Address                                 logo
    city, postalcode

    To                                     invoice info
    Jhon Doe                               invoice (id)
    address                                invoice sent (through)
    city, postalcode                       Due date

    -----------------------------------------------------
    Sourgy | Room Name | Date visited |(hours + min)| $      |
    -----------------------------------------------------
    x     Room Name    dd.mm-yy        1.5        000000,00

    -----------------------------------------------------
                            tax rate       =        25%  -> Amount
                    insurance discount      =        100%
                                total       =      $ 30.25
    -----------------------------------------------------

    (invoice text)