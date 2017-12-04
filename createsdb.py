#!/usr/bin/env python3
"""
	Create Stickney Observatory DB
	Author: Amanda Bacon (amandabacon@bennington.edu)
	Date: 2017/11/27
"""
import time
import psycopg2
import psycopg2.extras
import csv

# Create db-- sudo -u postgres createdb -O amandabacon stickney_db

def create_table():
	try:
		connection = psycopg2.connect("dbname = 'stickney_db' user = 'amandabacon'")
		cursor = connection.cursor(cursor_factory = psycopg2.extras.RealDictCursor)
		cursor.execute("""DROP TABLE IF EXISTS SObSet""")
		cursor.execute("""CREATE TABLE SObSet (id NUMERIC NOT NULL PRIMARY KEY, item_name VARCHAR(50) NOT NULL, model VARCHAR(50) NOT NULL, serial_num VARCHAR(25) NOT NULL, date TIMESTAMP, logger_name VARCHAR(20) NULL, description TEXT NULL);""")

		try:
			cursor.execute("""SELECT tables.table_schema, table_name FROM information_schema.tables WHERE table_name = 'sobset' ORDER BY table_schema, table_name;""")
			for table in cursor.fetchall():
				print(table)

		except Exception as e:
			print("Error in fetching table: {0}".format(e.message))

		try:
			cursor.execute("INSERT INTO SObSet (id, item_name, model, serial_num, date, logger_name, description) VALUES(1,'Test','Test','Test','2017-11-29 00:00:00','A','Test')")
			cursor.execute("INSERT INTO SObSet (id, item_name, model, serial_num, date, logger_name, description) VALUES(2,'TEST','TEST','TEST','2017-12-03 02:00:00','A','TEST')")
                	cursor.execute("INSERT INTO SObSet (id, item_name, model, serial_num, date, logger_name, description) VALUES(3,'TEST','TEST','TEST','2017/12/03 02:10:20','A','TEST')")
			print("Insertion complete")

		except:
			print("Cannot insert into table")
	
		try:
			cursor.execute("""SELECT * FROM SObSet""")
			inserts = cursor.fetchall()
			print(inserts)

		except:
			print("Error: Cannot select from table")

		connection.commit()
		cursor.close()
		connection.close()

	except Exception as e:
		print("Unable to connect to database: {0}".format(e.message))

if __name__ == '__main__':
	create_table()

print(time.time(), time.clock())
