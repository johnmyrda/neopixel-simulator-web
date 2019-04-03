#!/usr/bin/env bash

# make the logs directory and ignore the error if it already exists
mkdir logs 2> /dev/null
printf "\nprocess logs can be found in the 'logs' directory\n"

# start rabbitmq & flask
rabbitmq-server &> logs/rabbitmq.log &
printf "rabbitmq-server started\n"
pipenv run celery worker -A app -l INFO &> logs/celery.log &
printf "celery worker instance started\n"

# set environment variables for flask
export FLASK_ENV=development
pipenv run flask run &> logs/flask.log &
printf "flask started\n"

printf "Run ./kill_em_all.sh to shut everything down.\n"
