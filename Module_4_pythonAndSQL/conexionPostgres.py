import psycopg2

conn = psycopg2.connect(database="company_db",
                        host="127.0.0.1",
                        user="root",
                        password="toor",
                        port="5432")

cursor = conn.cursor()
cursor.execute("SELECT * FROM employees")

print(cursor.fetchall())
