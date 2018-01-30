#!/usr/bin/env python3
"""
	Stickney Observatory DB-final project for DBMS
	Used to take inventory of items in Stickney Observatory
	Author: Amanda Bacon (amandabacon@bennington.edu)
	Date: 2017/11/27
"""
import web
import hashlib
import csv
import psycopg2
import requests

render = web.template.render('templates/')

web.config.debug = False

urls = (
	'/login', 'login', # login page
	'/objectinfo/(.*)', 'info', # click name--info
	'/object_by_name', 'objects', # search by name
	'/logout', 'logout', # logout page
	'/formsub', 'form', # form page
	'/home', 'home', # choose form or search page
	'/all_items', 'all_items' # display all db inputs
)

app = web.application(urls, globals(), True)
store = web.session.DiskStore('sessions')
sessions = web.session.Session(app, store, initializer = {'login': 0, 'privilege': 0})

def logged():
	if session.login == 1:
		return True
	else:
		return False

def create_render(privilege):
	if logged():
		if privilege == 0:
			render = web.template.render('templates/reader')
		elif privilege == 1:
			render = web.template.render('templates/user')
		elif privilege == 2:
			render = web.template.render('templates/admin')
		else:
			render = web.template.render('templates/communs')
	else:
		render = web.template.render('templates/communs')
	return render

class login:
	def GET(self):
		if logged():
			render = create_render(session.get('privilege'))
			return '%s' % render.login_double()
		else:
			render = create_render(session.get('privilege'))
			return '%s' % render.login()

	def POST(self):
		db = web.database(dbn = 'postgres', user = 'amandabacon', db = 'stickney_db')
		user_name, password = web.input().user_name, web.input().password
		ident = db.select('user_table', where = "user_name=$user_name='{0}'".format(ident))
		try:
			if hashlib.shal("sAlT754-"+password).hexdigest() == ident['pass']:
				session.login = 1
				session.privilege = ident['privilege']
				render = create_render(session.get('privilege'))
				return render.login_ok()
			else:
				session.login = 0
				session.privilege = 0
				render = create_render(session.get('privilege'))
				return render.login_error()
		except:
			session.login = 0
			session.privilege = 0
			render = create_render(session.get('privilege'))
			return render.login_error()

class logout:
	def GET(self):
		session.login = 0
		session.kill()
		render = create_render(session.get('privilege'))
		return render.logout()

# /objectinfo/(.*) -- click name for info

class info:
	def GET(self,id):
		db = web.database(dbn = 'postgres', user = 'amandabacon', db = 'stickney_db')
		info = db.select('sobset', where = "id='{0}'".format(id))
		return render.objectinfo(info)
		if not id:
			id = 'no id'
		return None

# /object_by_name -- search name

class objects:
	def POST(self):
		db = web.database(dbn = 'postgres', user = 'amandabacon', db = 'stickney_db')
		item_name = web.input().item_name
		objects = db.select('sobset', where = "lower(item_name)='{0}'".format(item_name))
		return render.sobset(objects)
		item = web.input()
		item1 = item.item_name
		print(item1)
		return item1

# /all_items -- lists all db items

class all_items:
	def POST(self):
		db = web.database(dbn = 'postgres', user = 'amandabacon', db = 'stickney_db')
		all_items = db.select('sobset')
		return render.all(all_items)

# download csv of db to computer

def sobset_csv(filename="sobset.csv"):
		with open('sobset_csv.csv', 'w') as file:
			try:
				connection = psycopg2.connect("dbname = 'stickney_db' user = 'amandabacon'")
				cursor = connection.cursor()
				cursor.execute("""SELECT * FROM sobset""")
				rows = cursor.fetchall()
				for row in rows:
					writer = csv.writer(file, delimiter = ',')
					writer.writerow(row)
			
			except Exception, e:
				print("Unable to connect to database: {0}".format(e.message))

# /formsub -- form document

class form:
	def POST(self):
		db = web.database(dbn = 'postgres', user = 'amandabacon', db = 'stickney_db')
		try:
			item_name = web.input().item_name
			model = web.input().model
			serial_num = web.input().serial_num
			logger_name = web.input().logger_name
			description = web.input().description
			form = db.insert('sobset', item_name = item_name, model = model, serial_num = serial_num, logger_name = logger_name, description = description)
			return render.formsub(form)
			first = web.input()
			first1 = first.item_name
			print(first1)
			return first1

			return render.formsub(form)
			second = web.input()
			second2 = second.model
			print(second2)
			return second2

			return render.formsub(form)
			third = web.input()
			third3 = third.serial_num
			print(third3)
			return third3

			return render.formsub(form)
			fourth = web.input()
			fourth4 = fourth.logger_name
			print(fourth4)
			return fourth4
		
			return render.formsub(form)
			fifth = web.input()
			fifth5 = fifth.description
			print(fifth5)
			return fifth5
			
			if item_name == "":
				print("Cannot be NULL")
			if model == "":
				print("Cannot be NULL")

			if serial_num == "":
				print("Cannot be NULL")

			form.commit()

		except Exception as e:
			print("Error in inserting into table: {0}".format(e.message))

if __name__ == "__main__":
	app.run()
	sobset_csv()

# sudo -u postgres createdb -O amandabacon stickney_db
# stickney_db=# \copy sobset TO '~/final/sobset.csv' DELIMITER ',' CSV HEADER;
