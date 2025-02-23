import mysql.connector
import os
# Load environment variables from .env file
from dotenv import load_dotenv
load_dotenv()

psw_rafa = os.getenv("MYSQL_PSW_RAFA")

mydb = mysql.connector.connect(
    host = "localhost",
    user = "rafa",
    password = psw_rafa,
    database = "exampleDB"
    )
#print(mydb)

mycursor = mydb.cursor()

mycursor.execute("SHOW DATABASES")

for x in mycursor:
    print(x)

