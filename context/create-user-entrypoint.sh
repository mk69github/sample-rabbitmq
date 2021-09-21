#!/bin/bash

set -e

# Set a .erlang.cookie
cp -p /tmp/.erlang.cookie /var/lib/rabbitmq/
ls -al /var/lib/rabbitmq/
rabbitmq-diagnostics erlang_cookie_sources

# Wait a while for rabbitmq1 to start
sleep 90s

rabbitmqctl -n rabbit@rabbitmq-1 add_user ${RABBITMQ_DEFAULT_USER} ${RABBITMQ_DEFAULT_PASS}
rabbitmqctl -n rabbit@rabbitmq-1 set_user_tags ${RABBITMQ_DEFAULT_USER} administrator
rabbitmqctl -n rabbit@rabbitmq-1 set_permissions -p / ${RABBITMQ_DEFAULT_USER} ".*" ".*" ".*"
