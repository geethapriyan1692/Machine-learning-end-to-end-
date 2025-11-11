#!/bin/bash

NAME="galaxyml"                                   # Name of the application
DJANGODIR=/AIML/galaxyml               # Django project directory
#SOCKFILE=/home/appadmin/century_aiml/django_virtual_env/run/gunicorn.sock  # we will communicte using this unix socket
USER=root                                         # the user to run as
GROUP=root                                        # the group to run as
NUM_WORKERS=3                                 # how many worker processes should Gunicorn spawn
TIMEOUT=1800
DJANGO_SETTINGS_MODULE=centuryai.settings.web_settings      # which settings file should Django use
DJANGO_WSGI_MODULE=centuryai.wsgi             # WSGI module name
echo "Starting $NAME as `whoami`"

# Start your Django Unicorn
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)

exec gunicorn ${DJANGO_WSGI_MODULE}:application \
  --name $NAME \
  --workers $NUM_WORKERS \
  --timeout $TIMEOUT \
  --worker-class gevent \
  --user=$USER --group=$GROUP \
  --bind=0.0.0.0:8003 \
  --log-level=debug \
  --log-file=/AIML/galaxyml/ui_server_log.out \
  &

NAME="galaxyml"                                   # Name of the application
DJANGODIR=/AIML/galaxyml               # Django project directory
#SOCKFILE=/home/appadmin/century_aiml/django_virtual_env/run/gunicorn.sock  # we will communicte using this unix socket
USER=root                                         # the user to run as
GROUP=root                                        # the group to run as
NUM_WORKERS=1                                   # how many worker processes should Gunicorn spawn
TIMEOUT=1800
DJANGO_SETTINGS_MODULE=centuryai.settings.service_settings      # which settings file should Django use
DJANGO_WSGI_MODULE=centuryai.wsgi             # WSGI module name
echo "Starting $NAME as `whoami`"

# Activate the virtual environment

exec gunicorn ${DJANGO_WSGI_MODULE}:application \
  --name $NAME \
  --workers $NUM_WORKERS \
  --timeout $TIMEOUT \
  --worker-class gevent \
  --user=$USER --group=$GROUP \
  --bind=0.0.0.0:8004 \
  --log-level=debug \
  --log-file=/AIML/galaxyml/service_server_log.out \
  &
