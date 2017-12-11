#!/usr/bin/env python3
"""
	Create Stickney Observatory DB
	Author: Amanda Bacon (amandabacon@bennington.edu)
	Date: 2017/11/27
"""
import time
import psycopg2
import psycopg2.extras

# Create db-- sudo -u postgres createdb -O amandabacon stickney_db

def create_table():
	try:
		connection = psycopg2.connect("dbname = 'stickney_db' user = 'amandabacon'")
		cursor = connection.cursor(cursor_factory = psycopg2.extras.RealDictCursor)
		cursor.execute("""DROP TABLE IF EXISTS SObSet""")
		cursor.execute("""CREATE TABLE SObSet (id SERIAL NOT NULL PRIMARY KEY, item_name VARCHAR(50) NOT NULL, model VARCHAR(50) NOT NULL, serial_num VARCHAR(25) NOT NULL, date TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(), logger_name VARCHAR(20) NULL, description TEXT NULL);""")

		try:
			cursor.execute("""SELECT tables.table_schema, table_name FROM information_schema.tables WHERE table_name = 'sobset' ORDER BY table_schema, table_name;""")
			for table in cursor.fetchall():
				print(table)

		except Exception as e:
			print("Error in fetching table: {0}".format(e.message))

		try:
			cursor.execute("INSERT INTO SObSet (item_name, model, serial_num, logger_name, description) VALUES('Test','Test','Test','A','Test')")
			cursor.execute("INSERT INTO SObSet (item_name, model, serial_num, logger_name, description) VALUES('TEST','TEST','TEST','A','TEST')")
                	cursor.execute("INSERT INTO SObSet (item_name, model, serial_num, logger_name, description) VALUES('TEST','TEST','TEST','A','TEST')")
                        cursor.execute("INSERT INTO SObSet (item_name, model, serial_num, logger_name, description) VALUES('Meade','TEST','TEST','A','TEST')")
                        cursor.execute("INSERT INTO SObSet (item_name, model, serial_num, logger_name, description) VALUES('Meade Test','TEST','TEST','A','TEST')")
                        cursor.execute("INSERT INTO SObSet (item_name, model, serial_num, logger_name, description) VALUES('MEADE','TEST','TEST','A','TEST')")
                        cursor.execute("INSERT INTO SObSet (item_name, model, serial_num, logger_name, description) VALUES('MEADE','TEST','TEST','A','TEST')")
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

def user_table():
        try:
                connection = psycopg2.connect("dbname = 'stickney_db' user = 'amandabacon'")
                cursor = connection.cursor(cursor_factory = psycopg2.extras.RealDictCursor)
                cursor.execute("""DROP TABLE IF EXISTS user_table""")
                cursor.execute("""CREATE TABLE user_table (id SERIAL NOT NULL PRIMARY KEY, user_name VARCHAR(50) NOT NULL, password VARCHAR(50) NOT NULL, email VARCHAR(25) NOT NULL, privilege INT NOT NULL DEFAULT 0);""")

                try:
                        cursor.execute("""SELECT tables.table_schema, table_name FROM information_schema.tables WHERE table_name = 'user_table' ORDER BY table_schema, table_name;""")
                        for table in cursor.fetchall():
                                print(table)

                except Exception as e:
                        print("Error in fetching table: {0}".format(e.message))

                try:
                        cursor.execute("INSERT INTO user_table (user_name, password, email) VALUES('Test','Test','Test')")
                        print("Insertion complete")

                except:
                        print("Cannot insert into table")

                try:
                        cursor.execute("""SELECT * FROM user_table""")
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
	user_table()

print(time.time(), time.clock())

# Create trigger function on date to update row when item updated (to view type \df or \df+)
# CREATE OR REPLACE FUNCTION update_date() RETURNS TRIGGER AS $$ BEGIN NEW.date = now(); RETURN NEW; END; $$ language 'plpgsql';
# CREATE TRIGGER update_sobset_date BEFORE UPDATE ON sobset FOR EACH ROW EXECUTE PROCEDURE update_date();
# found here: https://stackoverflow.com/questions/1035980/update-timestamp-when-row-is-updated-in-postgresql
