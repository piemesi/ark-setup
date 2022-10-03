#!/bin/bash

# Collect static files
#echo "Collect static files"
#python manage.py collectstatic --noinput

# Apply database migrations
######echo "Apply database migrations"
######python /code/manage.py migrate

# Start server
#echo "Starting server"
#python manage.py runserver 0.0.0.0:8000

#tail -f /dev/null

######cd /code && gunicorn admin.wsgi -b :8000 --env DJANGO_SETTINGS_MODULE=admin.debug_settings --threads 4 --timeout 300




if [ "$DJANGO_SUPERUSER_USERNAME" ]
then
    python manage.py createsuperuser \
        --noinput \
        --username $DJANGO_SUPERUSER_USERNAME \
        --email $DJANGO_SUPERUSER_USERNAME
fi

$@

