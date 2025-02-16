import mysql.connector

mydb = mysql.connector.connect(
    host = "localhost",
    user = "rafa",
    password = "clavet100",
    database = "exampleDB"
    )
#print(mydb)

mycursor = mydb.cursor()

mycursor.execute("SHOW DATABASES")

for x in mycursor:
    print(x)

