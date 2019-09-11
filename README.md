# Final for DBMS Fall 2017

This is a web.py framework managed by Python using psql as a back-end database.

The program, website, and database are geared toward being used by Stickney Observatory users as a means of taking inventory.

Web.py allows the user to search through the database without the need of querying psql on the command line.

The user has the ability to fill out forms, seach through the database via item names, and view and download csv files of all items in the database. 

This site can only be accessed on the Bennington College campus. 

# Installation

In order to use this application, you must first download/install postgresql. Information can be found here: https://www.postgresql.org/docs/9.6/static/tutorial-install.html

This model was run and tested on the Linux Ubuntu operating system.

# Static Pages

http://0.0.0.0:8080/static/so_search.html

http://0.0.0.0:8080/static/form.html

http://0.0.0.0:8080/static/login.html

# Next Steps:

Would like to:

-be able to edit on HTML page, and these edits update the db

-login using Bton credentials to Bennington.works or observatory.bennington.edu

-prevent repetition in database--on conflict do update how in web.py?

-$if id.logger_name is "": not working

-download csv (HTML button)
