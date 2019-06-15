#!/bin/bash
# import.sh - (AJB 12/11/2017)
# Sets up psql schema (assumes stickney_db exists and is owned by user running this script), then imports the data to specified tables, and alters schema to add appropriate constraints upon completion.

echo "==============================================================="
echo "* BEGINNING DATA IMPORT PROCESS                               *"
echo "---------------------------------------------------------------"
echo "* >> Ensure stickney_db exists and is owned by `whoami` <<    *"

echo "---------------------------------------------------------------"
echo "* DOWNLOADING ARCHIVE                                         *"
echo "---------------------------------------------------------------"
curl http://

echo "---------------------------------------------------------------"
echo "* CREATING SCHEMA                                             *"
echo "---------------------------------------------------------------"
psql stickney_db < stickney_schema.sql

echo "---------------------------------------------------------------"
echo "* IMPORTING SOBSET TABLE                                      *"
echo "---------------------------------------------------------------"
psql stickney_db < sobset.sql

echo "---------------------------------------------------------------"
echo "* IMPORTING USER_TABLE TABLE*"
echo "---------------------------------------------------------------"
psql stickney_db < user.sql

echo "---------------------------------------------------------------"
echo "* IMPORT PROCESS COMPLETE stickney_db IS READY FOR USE!       *"
echo "==============================================================="
