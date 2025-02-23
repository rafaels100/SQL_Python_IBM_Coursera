import psycopg2
from dotenv import load_dotenv
import os
load_dotenv()

psw_root = os.getenv("PSQL_PSW")

conn = psycopg2.connect(database="company_db",
                        host="127.0.0.1",
                        user="root",
                        password=psw_root,
                        port="5432")

cursor = conn.cursor()
cursor.execute("SELECT * FROM employees")

print(cursor.fetchall())
