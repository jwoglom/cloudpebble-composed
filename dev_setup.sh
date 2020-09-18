#!/bin/bash
# Run the general build.
docker-compose build
# Do this in the mounted directory, since the Dockerfile did it in a folder we
# mask by mounting over it.
docker-compose run web sh -c "rm -rf bower_components && cd /tmp && python /code/manage.py bower install && python /code/manage.py collectstatic --noinput && mv bower_components /code/ && python /code/manage.py migrate"
# Stop everything again.
docker-compose stop

echo "To start cloudpebble, run: docker-compose up"
