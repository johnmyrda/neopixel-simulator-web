#!/usr/bin/env bash

rabbitmqctl stop

printf "Killing all celery workers\n"
ps auxww | grep 'celery worker' | awk '{print $2}' | xargs kill -9

printf "Killing all flask server instances\n"
ps auxww | grep 'flask run' | awk '{print $2}' | xargs kill
