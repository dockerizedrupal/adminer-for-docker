#!/usr/bin/env bash

MYSQLD_PORT="$(echo "${MYSQLD_PORT}" | sed 's/tcp:\/\///')"

export FACTER_MYSQLD_HOST="$(echo "${MYSQLD_PORT}" | cut -d ":" -f1)"
export FACTER_MYSQLD_PORT="$(echo "${MYSQLD_PORT}" | cut -d ":" -f2)"

export FACTER_MYSQLD_USERNAME="${MYSQLD_USERNAME}"
export FACTER_MYSQLD_PASSWORD="${MYSQLD_PASSWORD}"

if [ -z "${SERVER_NAME}" ]; then
  SERVER_NAME="localhost"
fi

export FACTER_SERVER_NAME="${SERVER_NAME}"

puppet apply --modulepath=/src/run/modules /src/run/run.pp

/usr/bin/supervisord
