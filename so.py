#!/usr/bin/env python3
"""
	Stickney Observatory DB-final project for DBMS
	Author: Amanda Bacon (amandabacon@bennington.edu)
	Date: 2017/11/27
"""
import time
import web

render = web.template.render('templates/')

web.config.debug = False

urls = (
	'/objectinfo/(.*)', 'info',
	'/object_by_name/(.*)', 'object'

)

app = web.application(urls, globals(), True)

class info:
	def GET(self,id):
		db = web.database(dbn = 'postgres', user='amandabacon', db = 'stickney_db')
		info = db.select('object', where = "id='{0}'".format(id))
		return render.stickneyinfo(info)
		if not id:
			id = 'no id'
		return None

class objects:
	def POST(self):
		db = web.database(dbn = 'postgres', user='amandabacon', db = 'stickney_db')
		name = web.input().name
		objects = db.select('object', where = "name='{0}'".format(name))
		return render.name(objects)
		item = web.input()
		item1 = item.name
		print item1
		return item1


if __name__ == "__main__":
	app.run()
