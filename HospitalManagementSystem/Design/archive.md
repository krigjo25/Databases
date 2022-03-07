# Archive

This database should be an archive for "paid billings",<br>
 "billingCredit" and terminated employees.

When a bill gets paid a trigger will trigger a new row in<br>
"paidBillings"<br>
table but If the bill does not get paid, the bill will be triggered<br>
to move from "billing" into 'billCredited', There will be a fine.<br>
When the credit collectors has retrieved the payment the payment<br>
will be moved into paidBillings.

When a employee resigns the employee will be registered in the terminatedEmployee table.


** Tables **

######  paidBillings

| id | invoiceID | pID | discount | incTax | status |
|--- |--- |--- |--- |--- |--- |

#####   credited

| id | invoiceID | pID | discount | incTax | status |
|--- |--- |--- |--- |--- |--- |

#####   terminatedEmployees 
| id | eID | eName | birthDate | street | zipCode | email | phone | occupation | department | terminated |
|--- |--- |--- |--- |--- |--- |--- |--- |--- |--- |--- |

**Events**
