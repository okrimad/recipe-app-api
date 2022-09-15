#!/bin/sh

# If any command in the script fails
# then the script is going to fail
set -e

# Wait for the DB is available
python manage.py wait_for_db
# Collect all static files and put them
# into the configured static files dir
python manage.py collectstatic --noinput
# Run any DB migration automatically
python manage.py migrate

# --socket :9000    => uWSGI server runs on a TCP socket at port 9000,
#     to which Nginx reverse proxy is going to connect to.
# --workers 4       => uWSGI runs 4 workers/agents.
# --master          => uWSGI running app set up as master thread.
# --enable-threads  => use multi threads capabilities.
# --module app.wsgi => specify that we want to run app/app/wsgi.py module
#     (wsgi.py is the entrypoint).
uwsgi --socket :9000 --workers 4 --master --enable-threads --module app.wsgi
